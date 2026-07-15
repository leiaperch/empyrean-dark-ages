import { Story } from "../vendor/ink.js";

// Lecteur Ink minimal. Standards : module IIFE, dépendances injectées via init(),
// rendu par <template> + textContent (aucun innerHTML / document.write).
const EmpyreanPlayer = (() => {
  const SAVE_KEY = "empyrean.save.aire";

  let story = null;
  let els = null;
  let tpl = null;

  function init(config) {
    story = new config.Story(config.storyData);
    els = config.els;
    tpl = config.templates;

    els.restart.addEventListener("click", onRestart);
    document.addEventListener("mousemove", onParallax, { passive: true });

    resume();
    render();
  }

  function render() {
    els.passage.replaceChildren();
    els.choices.replaceChildren();

    while (story.canContinue) {
      const line = story.Continue().trim();
      applyTags(story.currentTags);
      if (line.length > 0) addParagraph(line);
    }
    renderChoices();
    save();
    els.game.scrollTo({ top: els.game.scrollHeight, behavior: "smooth" });
  }

  function renderChoices() {
    if (story.currentChoices.length === 0) {
      addParagraph("— fin de la tranche jouable —", "para--end");
      return;
    }
    story.currentChoices.forEach((choice) => {
      const node = tpl.choice.content.cloneNode(true);
      const btn = node.querySelector(".choice__btn");
      btn.textContent = choice.text;
      btn.addEventListener("click", () => choose(choice.index));
      els.choices.appendChild(node);
    });
  }

  function choose(index) {
    story.ChooseChoiceIndex(index);
    render();
  }

  function addParagraph(text, extraClass) {
    const node = tpl.paragraph.content.cloneNode(true);
    const p = node.querySelector(".para");
    p.textContent = text;
    if (extraClass) p.classList.add(extraClass);
    els.passage.appendChild(node);
  }

  // --- tags # bg: / # music: / # portrait: ---
  function applyTags(tags) {
    tags.forEach((raw) => {
      const idx = raw.indexOf(":");
      if (idx === -1) return;
      const key = raw.slice(0, idx).trim();
      const value = raw.slice(idx + 1).trim();
      if (key === "bg") setScene(value);
      if (key === "music") setMusic(value);
    });
  }

  function setScene(value) {
    els.scene.dataset.bg = value;
    els.scene.dataset.current = value;
  }

  function setMusic(value) {
    els.scene.dataset.music = value;
    els.hudTags.textContent = "♪ " + value;
    // Hook audio réel plus tard : new Audio(`assets/music/${value}.mp3`).play()
  }

  // --- parallaxe : décalage des calques selon la souris ---
  function onParallax(event) {
    const dx = (event.clientX / window.innerWidth - 0.5) * 2;
    const dy = (event.clientY / window.innerHeight - 0.5) * 2;
    const layers = els.scene.querySelectorAll(".layer");
    const depths = [6, 12, 20];
    layers.forEach((layer, i) => {
      const d = depths[i] || 8;
      layer.style.transform = `translate(${dx * d}px, ${dy * d}px)`;
    });
  }

  // --- sauvegarde ---
  function save() {
    try { localStorage.setItem(SAVE_KEY, story.state.ToJson()); }
    catch (e) { /* localStorage indisponible : on ignore */ }
  }

  function resume() {
    const saved = localStorage.getItem(SAVE_KEY);
    if (!saved) return;
    try { story.state.LoadJson(saved); }
    catch (e) { /* sauvegarde incompatible : nouvelle partie */ }
  }

  function onRestart() {
    try { localStorage.removeItem(SAVE_KEY); } catch (e) { /* ignore */ }
    story.ResetState();
    render();
  }

  return { init };
})();

// --- bootstrap (injection des dépendances) ---
const els = {
  game: document.getElementById("game"),
  passage: document.getElementById("passage"),
  choices: document.getElementById("choices"),
  scene: document.getElementById("scene"),
  hudTags: document.getElementById("hud-tags"),
  restart: document.getElementById("restart"),
};
const templates = {
  paragraph: document.getElementById("tpl-paragraph"),
  choice: document.getElementById("tpl-choice"),
};

try {
  const response = await fetch("./story/aire.json");
  const storyData = await response.text();
  EmpyreanPlayer.init({ Story, storyData, els, templates });
} catch (error) {
  const p = document.createElement("p");
  p.className = "para para--end";
  p.textContent = "Erreur de chargement : " + error.message;
  els.passage.appendChild(p);
}
