# Carte du récit, des choix et des destins

Tranche jouable « L'Aire des Sœurs Géantes ». Testée au fuzz sur 5000 parties, aucune
erreur, les 8 destins atteignables, environ 4500 conclusions distinctes.

## Ce que le jeu retient (les variables)

- **Identité** : `clan`, `province`, `griffon`, `motivation`, `nom`
- **Aptitudes** : `maitrise` (la Poigne, ton emprise sur le griffon et le combat), `lecture`
  (le Vent, ton oreille pour les courants), `fierte`
- **Chapitre 1** : `sang_verse`, `aldric_vivant`, `captif`, `crus_aldric`,
  `avertissement_recu`, `chasse_derriere`
- **Chapitre 2** : `plan`, `rel_ingrith`, `aldric_livre`, `korvhal_ecoute`,
  `princesse_alliee`, `sait_princesse`
- **Chapitres 3 à 5** : `succes_militaire`, `atrocite`, `sacrifice`, `villages_sauves`,
  `brise_clan`, `griffon_vivant`, `reine_faveur`

## Le fil des chapitres

**0. Création.** Clan (Skeldyrn, Draeyrn, Varnyss, Aelyrrn, Maison-Nouvelle) × province
(Krovla, Braevick, Cygnisen) × griffon (Krav, Yrsa, Skoll) × motivation (Vengeance, Honneur,
Ambition, Liberté, Protection) × nom. Chaque axe teinte la suite.

**1. La Prise.** Tu interceptes trois dragonniers navarriens en fuite. Approche au choix,
foncer sur le traînard, les suivre pour comprendre, te montrer la lame au fourreau (Varnyss),
ou écouter le vent qui les poursuit (Aelyrrn ou lecture élevée). Aldric livre son avertissement,
trois légions derrière la Sœur Aînée, Vaerholt brûlé. Puis tu tranches, les abattre, les
capturer, les laisser passer, ou couvrir leur fuite (Varnyss ou Protection).

**2. Korvhal.** Tu convaincs la commandante Ingrith, par Vaerholt, par le témoignage d'Aldric
si tu l'as capturé, par la meute que le vent t'a montrée, ou par la menace. La Skeldyrn Sigrún
réclame le captif pour l'Arène, tu le lui livres, tu le gardes par la raison, ou tu invoques la
loi du sang si tu es Skeldyrn. Une voyageuse sans blason te pèse, c'est l'héritière Valskyrn en
Épreuve, que tu reconnais ou non. Tu orientes la décision de Korvhal, **Prévenir**, **Fortifier**,
ou **Porter à Skjalfyrn**.

**3 à 5. La Menace se lève, puis le prix.** Le chapitre se déroule selon le plan choisi.

- **Prévenir** (le raid au col) : tout embraser (atrocité), décapiter le commandement
  (Poigne ou Vent), n'épargner que ce qui ne se bat pas (libère un hameau), viser le point
  faible qu'Aldric t'a donné (si tu l'as cru), ou plonger seule (tu perds ton griffon).
- **Fortifier** (la défense) : tenir la ligne (sacrifice, villages sauvés), te replier
  (un Varnyss se renie), jeter ton griffon dans la brèche (tu le perds, villages sauvés), ou
  tenter la trêve d'Aldric (si tu l'as cru).
- **Skjalfyrn** (la cour) : exiger la guerre, plaider pour les provinces, produire Aldric
  devant le Conseil (si captif), ou défier les Skeldyrn assoiffées.

## Les 8 destins (conditions, dans l'ordre où le jeu les teste)

1. **Le Bûcher** — griffon perdu sans avoir sauvé de villages, ou déroute militaire.
2. **La Renégate** — tu as brisé le credo de ton clan sans rien sauver en échange.
3. **La Mort Blanche** — atrocité assumée, sang skeldyrn ou haine profonde, sans t'être reniée.
4. **Le Bouclier de Poromiel** — des villages sauvés au prix d'un sacrifice.
5. **La Lame de la Reine** — la faveur d'Eirlys plus un succès (surtout par la voie de Skjalfyrn).
6. **Le Nom qui Vole** — une Maison-Nouvelle qui l'emporte et se fait un nom.
7. **La Paix Impossible** — tu as cru Aldric, il vit encore, et tu n'as pas versé dans l'atrocité.
8. **Le Vent Seul** — par défaut, quand tu n'appartiens ni à la Reine ni à ton clan.

## Les cartes d'épilogue (elles se cumulent selon tes actes)

Le sort d'Aldric (livré à l'Arène, prisonnier utile, mort de ta main, ou nom qui court les deux
royaumes), la princesse (future Reine qui se souvient de toi, ou qui veille de loin), les
villages sauvés (des enfants qui portent ton nom), l'atrocité (une terre qui ne reverdit pas),
le clan brisé (on ne chante plus ton nom au feu), ton griffon (encore en vol, ou tombé), et ta
motivation (la vengeance soldée, la liberté tenue, la protection accomplie).

C'est la combinaison destin × cartes qui donne les quelques milliers de fins distinctes.
