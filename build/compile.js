// Compile les sources Ink -> JSON jouable par le lecteur web.
//   node build/compile.js
// Ajoute d'autres entrées dans ENTRIES au fur et à mesure des chapitres.
const fs = require("fs");
const path = require("path");
const { Compiler } = require("inkjs/full");

const ENTRIES = ["aire.ink"];

const inkDir = path.join(__dirname, "..", "ink");
const outDir = path.join(__dirname, "..", "web", "story");
fs.mkdirSync(outDir, { recursive: true });

let failed = false;
for (const file of ENTRIES) {
  const src = fs.readFileSync(path.join(inkDir, file), "utf8");
  const errors = [];
  const story = new Compiler(src, { errorHandler: (m, t) => errors.push(`${t}: ${m}`) }).Compile();
  if (errors.length > 0) {
    console.error(`✗ ${file}\n  ${errors.join("\n  ")}`);
    failed = true;
    continue;
  }
  const out = file.replace(/\.ink$/, ".json");
  fs.writeFileSync(path.join(outDir, out), story.ToJson());
  console.log(`✓ ${file} → web/story/${out}`);
}
process.exitCode = failed ? 1 : 0;
