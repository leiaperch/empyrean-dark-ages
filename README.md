# Empyrean, The Dark Ages

Jeu narratif à choix. Tu incarnes un griffonier de Poromiel pris dans la guerre contre Navarre. Ton clan, ta province et ta motivation teintent toute l'histoire, jusqu'à huit destins différents et plusieurs milliers de conclusions distinctes.

Écrit en Ink (inkle), joué dans le navigateur via inkjs. Aucun serveur nécessaire, le jeu est un site statique.

## Structure

- `ink/aire.ink`, la source narrative complète (création, chapitres, destins, épilogues)
- `build/compile.js`, compile l'ink en JSON jouable
- `web/`, le jeu jouable et déployable tel quel (page, styles, script, runtime inkjs embarqué, histoire compilée)
- `docs/`, la bible du monde et la carte des choix et des destins

## Développer

```
npm install
npm run build     # régénère web/story/aire.json depuis ink/aire.ink
npm run serve     # sert web/ sur http://localhost:8123
```

Pour éditer l'histoire, modifie `ink/aire.ink` puis relance `npm run build`. L'ink se teste aussi directement dans l'éditeur Inky.

## Déployer

Le dossier `web/` est un site statique autonome. Un workflow GitHub Actions (`.github/workflows/deploy.yml`) recompile l'ink et publie `web/` sur GitHub Pages à chaque push sur `main`. Le jeu se déploie aussi tel quel sur Vercel ou Netlify en indiquant `web` comme dossier de publication.

## Univers et communauté

Le jeu puise dans l'univers du serveur de jeu de rôle The Empyrean, The Dark Ages, d'après Fourth Wing de Rebecca Yarros.

- Le wiki du serveur : https://the-empyrean-the-dark-ages.fandom.com/fr
- Le Discord, dont je suis l'administrateur : https://discord.gg/Rey5uxN2F7

Projet personnel de fiction interactive, non commercial.
