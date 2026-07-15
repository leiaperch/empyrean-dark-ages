# The Empyrean — The Dark Ages · côté POROMIEL · Bible

> Jeu narratif 2.5D à choix · Unity + Ink · tu joues un·e **griffonier de Poromiel**.
> Conflit **100% humain** (guerre contre Navarre), réfracté par la **vision des clans**.
> **Pas de Vénins, pas de Basgiath, pas de particules, pas de PNJ des grandes maisons navarriennes.**

---

## 1. Le pitch

La guerre entre **Poromiel** et **Navarre** s'éternise le long des **Sœurs Géantes** (les
montagnes Tage-Esben). Tu es griffonier à une aire de frontière, sous le capitaine **Vaskr**.
Une aube, **trois dragonniers navarriens franchissent le col — non pour razzier, mais pour
fuir.** Ce qu'ils fuient est humain. Ton choix, seule dans le vent, ouvre l'histoire — et rien
n'est vécu pareil selon ton **clan**.

## 2. Le cœur humain (ce que fuient les trois dragonniers)

Ce sont des **déserteurs navarriens**. L'un d'eux, un cavalier commun nommé **Aldric**, a
rompu avec Navarre après un massacre de civils poroméens à un hameau frontalier — un ordre
qu'on lui a donné, ou qu'il a vu donner. Ils passent la crête pour **monnayer leur vie contre
un renseignement** : Navarre masse ses ailes pour percer le col de la **Sœur Aînée** et frapper
une province de Poromiel.

Tout le drame naît de là, et **ton clan décide de ta lecture** :
- **Skeldyrn** : un Navarrien reste un Navarrien. Trois proies offertes, pas trois questions.
- **Varnyss** : qui ne se bat plus n'est plus une proie. On protège d'abord, on juge ensuite.
- **Draeyrn** : le jeu de la frontière — la curiosité, l'audace, le panache.
- **Aelyrrn** : trois fuyards, c'est une tempête derrière eux. Écoute avant de frapper.
- **Maison-Nouvelle** : un tel prix ramené vivant, c'est le nom que tu cherches.

Et ta **motivation** peut *contredire* ton clan (une Skeldyrn mue par la Protection, un Varnyss
par la Vengeance) — c'est là que naissent les meilleurs personnages.

## 3. La vision des clans = la colonne vertébrale thématique

La guerre a un visage humain, et le jeu pose une seule question sous mille formes : **qu'est-ce
que l'honneur, quand l'ennemi a un visage ?** Chaque clan incarne une réponse ; chaque choix
soit *suit* ton credo, soit le *brise* (coûteux, transformateur). Les autres provinces et clans
se disputent aussi la conduite de la guerre — Skjalfyrn n'est pas d'accord avec elle-même.

## 4. Structure (le retour au long format)

| # | Chapitre | Contenu | Cible |
|---|---|---|---|
| 0 | **L'Aire** (écrit ✓) | l'interception ; création intégrée ; premier choix en vol | ~2,5k |
| 1 | **La Prise** | l'affrontement aérien se résout ; tu ramènes un captif + l'avertissement ; l'aire se divise | ~7k |
| 2 | **Korvhal** | porter le renseignement vers l'intérieur ; politique clanique ; un clan rival veut le captif (exécution ou protection) ; une princesse Valskyrn en Épreuve | ~8k |
| 3 | **La Menace se lève** | l'offensive est réelle (ou une feinte) ; Poromiel doit choisir : prévenir, fortifier, décapiter — les clans s'affrontent sur le plan | ~8k |
| 4 | **Le Prix** | l'engagement ; le coût humain (civils, le captif, ton griffon) ; le dilemme de loyauté (Reine/clan vs conscience) | ~8k |
| 5 | **Destins** | résolution + reckoning personnel ; système de fins combinatoire (voir §7) | ~5k |

≈ 40k mots = un vrai jeu. Un épisode ; d'autres possibles (Skjalfyrn, la succession, Krovla…).

## 5. Casting (clans & communs — jamais de grandes maisons navarriennes)

- **Toi** — griffonier ; clan, province, griffon, motivation au choix (§6).
- **Ton griffon** — partenaire farouche, à demi sauvage ; pas un télépathe poli. On le gagne.
- **Capitaine Vaskr** — vétéran de l'aire, pragmatique, usé. Mentor et garde-fou.
- **Aldric** — le dragonnier navarrien déserteur ; commun, pas noble ; porte l'avertissement et
  le poids moral. Son dragon blessé.
- **Sigrún** — une Skeldyrn intransigeante ; veut le captif pour l'Arène. Antagoniste possible.
- **La princesse Valskyrn** (incognito, Épreuve des Trois Provinces) — alliée/complication ;
  relie l'intrigue à la succession.
- **La Reine Eirlys Valskyrn** — lointaine, redoutée ; sa volonté pèse au chapitre 3-4.

## 6. Création de personnage (le détail)

Cinq axes, tous teintants (déjà implémentés dans `ink/aire.ink`) :

1. **Clan** (vision de la guerre + options exclusives) : Skeldyrn *(féminin)* · Draeyrn · Varnyss
   · Aelyrrn · Maison-Nouvelle.
2. **Province natale** (saveur + petit bonus) : Krovla (mer, ténacité → Poigne) · Braevick
   (terre, aplomb → Renom) · Cygnisen (vent, écoute → Vent).
3. **Griffon** (nom + tempérament, texture du lien) : Krav (robuste → Poigne) · Yrsa (nerveuse →
   Vent) · Skoll (sauvage → fougue).
4. **Motivation** (moteur des dialogues et des fins ; peut contredire le clan) : Vengeance ·
   Honneur · Ambition · Liberté · Protection.
5. **Nom.** *(Unity : saisie libre ; Inky : présélection.)*

**Stats (modèle cible, 3)** — à substituer aux compteurs actuels :
- **Poigne** — maîtrise du griffon + combat rapproché (actuel `maitrise`).
- **Vent** — lecture des courants + instinct/perception (actuel `lecture`).
- **Renom** — autorité, influence sociale, poids clanique (dérivé de `fierte`).

À faire plus tard : genre/apparence (Skeldyrn = féminin ; défaut cyréen : peau olive, cheveux
sombres ondulés).

## 7. Les fins (réutilise le système combinatoire déjà bâti)

9 grands destins × cartes d'épilogue conditionnelles (clan, motivation, relations, actes). Pistes
de destins poroméens : *La Lame de la Reine* (Skeldyrn accomplie) · *Le Bouclier Brisé* (Varnyss
qui a tout donné) · *Le Nom qui Vole* (Maison-Nouvelle anoblie) · *La Renégate* (a brisé son
clan) · *La Paix Impossible* (a cru le déserteur) · *Le Vent Seul* (liberté, ni Reine ni clan) ·
*La Mort Blanche* (vengeance jusqu'au bout) · etc.

---

*Statut : v0.2 — ouverture écrite & testée. Prochaine passe : Chapitre 1 « La Prise ».*
