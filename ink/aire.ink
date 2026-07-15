// ============================================================
//  THE EMPYREAN, THE DARK AGES  ·  côté POROMIEL
//  aire.ink · "L'Aire des Sœurs Géantes" (v0.2, conflit 100% humain)
//  Tu joues un·e griffonier de Poromiel. Clan + province + motivation
//  se choisissent et teintent tout. Conflit : la guerre contre Navarre.
//  Contraintes : lore wiki · PAS de Vénins · pas de particules · prose soignée.
//  Autonome, testable dans Inky.
// ============================================================

LIST Clan       = Skeldyrn, Draeyrn, Varnyss, Aelyrrn, MaisonNouvelle
LIST Province   = Krovla, Braevick, Cygnisen
LIST Motivation = Vengeance, Honneur, Ambition, Liberte, Protection

VAR nom        = "Sans-nom"
VAR clan       = MaisonNouvelle
VAR province   = Braevick
VAR griffon    = "Sans-nom"
VAR motivation = Honneur
VAR fierte     = 0
VAR maitrise   = 0    // ton emprise sur ton griffon
VAR lecture    = 0    // ton oreille pour le vent
VAR haine_navarre = 0

// --- chapitre 1 ---
VAR sang_verse        = false
VAR aldric_vivant     = true
VAR captif            = false
VAR crus_aldric       = false
VAR avertissement_recu = false
VAR chasse_derriere   = false
VAR jeune_mort        = false
VAR pitie_jeune       = false
VAR sait_nombre       = false
VAR connait_aldric    = false
VAR entend_vaerholt   = false

// --- chapitre 2 ---
LIST Plan = Prevenir, Fortifier, PorterASkjalfyrn
VAR plan              = Fortifier
VAR rel_ingrith       = 0
VAR aldric_livre      = false
VAR korvhal_ecoute    = false
VAR princesse_rencontree = false
VAR princesse_alliee  = false
VAR sait_princesse    = false
VAR parle_aldric      = false
VAR rumeur_princesse  = false

// --- chapitres 3 à 5 ---
VAR succes_militaire  = 0
VAR atrocite          = false
VAR sacrifice         = false
VAR villages_sauves   = false
VAR brise_clan        = false
VAR griffon_vivant    = true
VAR reine_faveur      = 0
VAR sait_captifs      = false

-> creation

// ============================================================
//  CRÉATION
// ============================================================
=== creation ===
# music: theme_vent
Avant que le nom te revienne, c'est le vent que tu entends. Il ne se tait jamais, ici, aux Sœurs Géantes ; il t'a bercé·e enfant et il te bercera mort·e. Les anciens l'appellent les Larmes de Skara. Toi, tu l'appelles comme on appelle un parent : sans y penser.
Tu es griffonier de Poromiel. Reste à savoir de quel sang.
-> choix_clan

= choix_clan
Quand tu inclines la tête, le vent trouve la marque de ton clan et la fait chanter.
+ [Skeldyrn, les sœurs que Navarre nomme la Mort Blanche]
    ~ clan = Skeldyrn
    ~ haine_navarre = haine_navarre + 2
    ~ fierte = fierte + 1
    Tu es née dans l'Arène, parmi les femmes qui frappent du ciel et disparaissent. On ne t'a pas appris à haïr Navarre : on te l'a versé dans le sang à la naissance, comme un vin noir.
    -> choix_province
+ [Draeyrn, les fils des falaises de Krovla]
    ~ clan = Draeyrn
    ~ fierte = fierte + 1
    Tu as grandi suspendu·e au vide, harpon au poing, à rire d'une chute que tu savais rattraper. Chez les Draeyrn, la peur est une chose qu'on laisse aux autres.
    -> choix_province
+ [Varnyss, le bouclier qui tient la ligne]
    ~ clan = Varnyss
    Tu n'as pas appris à tuer d'abord, mais à protéger. Les Varnyss meurent souvent à genoux, écu levé, sur le corps d'un camarade. Tu hais l'injustice ; Navarre n'en est qu'un visage parmi d'autres.
    -> choix_province
+ [Aelyrrn, ceux qui traduisent ce que hurle le vent]
    ~ clan = Aelyrrn
    ~ lecture = lecture + 2
    On te croit doux·ce, rêveur·se, un peu ailleurs. Puis tu te mets à écouter le ciel, et même les Skeldyrn baissent la voix. Tu ne commandes pas la bataille : tu l'entends venir.
    -> choix_province
+ [Aucun clan, une Maison-Nouvelle, un nom qu'il faut mériter]
    ~ clan = MaisonNouvelle
    Pas de bannière ancienne dans ton dos, pas de chant vieux de mille ans. Juste toi, ton griffon, et le mépris tranquille de la Vieille Échine qu'il te faudra faire taire, envol après envol.
    -> choix_province

= choix_province
Le vent qui t'a faite ne souffle pas partout de la même façon. De quelle terre es-tu ?
+ [Krovla, les falaises du sud, la mer qui mord]
    ~ province = Krovla
    ~ maitrise = maitrise + 1
    Tu as appris à t'accrocher avant de savoir marcher. Le sel, la roche, les tempêtes : ta patience est celle des gens qui comptent le temps en battements de vagues.
    -> choix_griffon
+ [Braevick, les steppes dorées, le cœur du royaume]
    ~ province = Braevick
    ~ fierte = fierte + 1
    Tu viens de la terre riche, celle qui nourrit Poromiel et croit, pour cette raison, avoir voix au chapitre partout. On dit les Braeviens habiles en paroles. On le dit rarement en compliment.
    -> choix_griffon
+ [Cygnisen, les plateaux du nord, où le vent parle]
    ~ province = Cygnisen
    ~ lecture = lecture + 1
    Chez toi, on écoute plus qu'on ne parle, et le vent porte des voix que les autres provinces prennent pour du silence. Tu as grandi à demi tournée vers ce que les vivants n'entendent pas.
    -> choix_griffon

= choix_griffon
On ne choisit pas un griffon. On survit à celui qui vous choisit. Le tien t'attend au bord de l'aire, et son regard jaune ne cède jamais le premier.
+ [Krav, un mâle noir, vieux, couturé de cicatrices]
    ~ griffon = "Krav"
    ~ maitrise = maitrise + 1
    -> choix_motivation
+ [Yrsa, une femelle pâle, nerveuse, plus tempête que bête]
    ~ griffon = "Yrsa"
    ~ lecture = lecture + 1
    -> choix_motivation
+ [Skoll, un jeune fauve, trop grand pour son âge, à demi sauvage]
    ~ griffon = "Skoll"
    ~ fierte = fierte + 1
    -> choix_motivation

= choix_motivation
Quand tu montes, ce n'est pas la Reine que tu sers d'abord. C'est quoi ?
+ [Venger les tiens]
    ~ motivation = Vengeance
    ~ haine_navarre = haine_navarre + 1
    -> choix_nom
+ [Tenir ton honneur, quoi qu'il en coûte]
    ~ motivation = Honneur
    -> choix_nom
+ [Te faire un nom que le vent portera après toi]
    ~ motivation = Ambition
    ~ fierte = fierte + 1
    -> choix_nom
+ [Être libre, ne rien devoir qu'au ciel]
    ~ motivation = Liberte
    -> choix_nom
+ [Protéger ce qui ne peut pas se défendre]
    ~ motivation = Protection
    -> choix_nom

= choix_nom
Et toi, quel nom le vent porte-t-il quand les tiens t'appellent d'une crête à l'autre ?
+ [« Ash »]
    ~ nom = "Ash"
    -> laire
+ [« Sef »]
    ~ nom = "Sef"
    -> laire
+ [« Nyr »]
    ~ nom = "Nyr"
    -> laire

// ============================================================
//  L'AIRE, une plateforme de pierre au bord du monde
// ============================================================
=== laire ===
# bg: aire_soeurs_geantes
# music: theme_aube_froide
L'aire n'est qu'un disque de pierre nue arraché au flanc des Sœurs Géantes, sans parapet, sans pitié. D'un côté, la montagne noire. De l'autre, mille pieds de rien. Au fond, quand l'aube écarte la brume, on devine l'ennemi : les crêtes de Navarre, et quelque part derrière, ses forteresses où dorment ses dragons.
{griffon} déploie ses ailes sans quitter cet horizon des yeux. Les griffons savent, avant les hommes, de quel côté vient la mort.

Le capitaine Vaskr traverse l'aire vers toi, sa vieille jambe raide sur la pierre gelée. Trente ans de vent lui ont mangé la moitié du visage ; l'autre moitié n'a jamais souri.
« {nom}. » Il ne perd pas de mots. « Le guet de Braeholm a allumé les feux cette nuit. Trois dragons ont passé le col de la Sœur Cadette, avant l'aube. Chez nous. »
-> laire_ordre

= laire_ordre
{clan == Skeldyrn:
    Il te regarde comme on regarde une lame qu'on va lancer. Les Skeldyrn ne reçoivent d'ordres que de la Reine, mais loin de Skjalfyrn, sur une aire perdue, c'est Vaskr qui parle en son nom, et vous le savez tous les deux.
}
{clan == MaisonNouvelle:
    Il te jauge une seconde de trop, le regard que la Vieille Échine réserve à ceux qui n'ont pas d'ancêtres à invoquer. « Voyons ce que ton mérite vaut en l'air, sans-clan. »
}
« Trois dragons, et personne pour les cueillir avant qu'ils voient nos aires. » Il crache par-dessus le vide. « Tu montes. Tu regardes. Et si tu peux mordre sans te faire mordre, tu mords. »
-> laire_choix

= laire_choix
Le vent forcit. {griffon} gratte la pierre, impatient de l'abîme, et sous toi la question n'est déjà plus si, mais comment.
+ [« Trois dragons pour un griffon. Vous m'envoyez mourir joliment. »]
    ~ fierte = fierte + 1
    « Je t'envoie voir. » La demi-bouche de Vaskr se tord. « Mourir, c'est un choix que tu prendras là-haut, tout·e seul·e, comme nous tous. »
    -> avant_vol
+ [Ne rien dire, et vérifier une dernière fois les sangles de {griffon}]
    ~ maitrise = maitrise + 1
    Vaskr approuve du menton. Les bavards, il en a enterré trop.
    -> avant_vol
+ {clan == Varnyss} [« Et les hameaux du col ? S'ils descendent, ce sont eux d'abord. »]
    ~ lecture = lecture + 1
    Un éclair, dans son œil valide. « Voilà pourquoi j'envoie une Varnyss. Va. Mets-toi entre eux et les nôtres. »
    -> avant_vol

=== avant_vol ===
Tu poses la main sur l'encolure de {griffon}. Sous les plumes, le muscle roule, chaud, tendu comme une corde d'arc. La bête tourne vers toi son œil jaune, et pour un instant, ce n'est pas une monture que tu tiens, mais une volonté qui pèse la tienne.
Le vent bascule. Tu le sens changer de main.

{lecture >= 2:
    Ton oreille le déchiffre aussitôt : un courant montant, propre, qui court le long de la Sœur Cadette jusqu'aux crêtes ennemies. Un chemin offert. Presque trop.
- else:
    Tu le sens tourner sans savoir le lire tout à fait, montant, peut-être traître, l'un ou l'autre. Là-haut, tu apprendras lequel. Trop tard, sans doute.
}

+ [Lancer {griffon} dans le courant, et laisser le vent décider]
    ~ fierte = fierte + 1
    -> envol
+ {lecture >= 2} [Refuser ce courant trop facile, et prendre par le travers de la montagne]
    ~ maitrise = maitrise + 1
    Un courant offert par le vent des Sœurs, c'est souvent un piège qu'il te tend. Tu montes par le dur, plus lent, plus sûr.
    -> envol

=== envol ===
# bg: ciel_soeurs_geantes
# music: theme_envol
{griffon} tombe dans le vide avant d'ouvrir les ailes, cette seconde de chute pure où le cœur remonte dans la gorge, où l'on n'est plus qu'une chose lâchée par la montagne. Puis les ailes claquent, le monde bascule à l'horizontale, et vous grimpez.
En dessous, l'aire n'est plus qu'une pièce d'ardoise. Devant, les crêtes de Navarre s'ouvrent comme une mâchoire.
Et là, contre le premier soleil : trois formes ailées, trop grandes pour être des oiseaux. Des dragons. Ils n'ont pas encore vu le point que tu fais dans leur ciel.

{haine_navarre >= 2:
    Toute ta vie on t'a dit leur nom comme une malédiction. Les voilà. Plus petits que dans les récits, et pourtant ton sang cogne à t'en rompre les tempes.
- else:
    On t'a appris qu'ils étaient l'ennemi. De si loin, dans la lumière, ils ont surtout l'air de trois cavaliers épuisés qui ne savent pas encore que tu existes.
}

Quelque chose, pourtant, ne va pas. Ils ne volent pas comme des envahisseurs qui fondent sur une proie. Ils volent le dos rond, l'aile lourde, en jetant sans cesse un regard derrière eux, non pas vers ton ciel, mais vers le leur. Vers ce qu'ils fuient.
-> ch1_approche

// ============================================================
//  CHAPITRE 1, La Prise
// ============================================================
=== ch1_approche ===
Le vent te pousse dans le dos, ce qui veut dire qu'ils ne t'entendront pas venir. Les trois dragons peinent. Le dernier traîne l'aile gauche, une entaille noire lui barre le flanc, et son cavalier, à peine plus qu'un gamin, se tient penché comme on se tient quand on a déjà décidé de ne pas tomber. Ce ne sont pas des chasseurs. Ce sont des gens qui ont saigné et qui volent quand même.
Tu as l'avantage du ciel. Ce que tu en fais ne regarde que toi.
+ [Fondre sur le traînard avant qu'aucun ne te voie]
    -> app_fondre
+ [Te glisser dans leur angle mort et les observer]
    ~ maitrise = maitrise + 1
    -> app_observer
+ {clan == Varnyss} [Te porter à leur hauteur, la lame au fourreau]
    ~ lecture = lecture + 1
    -> app_montrer
+ {lecture >= 2 or clan == Aelyrrn} [Fermer les yeux et demander au vent ce qui les suit]
    ~ lecture = lecture + 1
    ~ chasse_derriere = true
    -> app_vent

= app_fondre
{griffon} replie les ailes et tombe. La distance se mange en un souffle. Le gamin sur le dragon blessé se retourne au dernier instant, le temps de lire sa propre mort dans ton ombre. Ta lame est déjà levée.
* [L'achever, net]
    ~ jeune_mort = true
    ~ sang_verse = true
    Ton fer trouve la gorge sous le heaume. Le gamin bascule sans un cri, et son dragon, soudain sans cavalier, part en chute folle vers les rochers. Devant, les deux autres se retournent enfin, et ce que tu lis sur leurs visages n'est pas de la colère. C'est de l'horreur.
    -> ch1_contact
* [Retenir ton coup à un cheveu de sa gorge]
    ~ maitrise = maitrise + 1
    ~ pitie_jeune = true
    Tu arrêtes ta lame si près de sa peau qu'il en sent le froid. Il ne bouge plus, attend le coup qui ne vient pas. Puis tu remontes, et dans ses yeux passe quelque chose que tu ne voulais pas y voir, de la gratitude. On tue plus facilement ce qui ne vous remercie pas.
    -> ch1_contact

= app_observer
Tu te ranges dans le creux d'air où leurs propres ailes les aveuglent, et tu attends. On apprend plus d'un ennemi en le regardant qu'en le tuant.
* [Compter, jauger ce qu'ils valent encore au combat]
    ~ sait_nombre = true
    Trois cavaliers, trois dragons, et pas un qui tienne vraiment debout. L'un saigne, l'autre dort à moitié en selle, le troisième ne fait que se retourner vers l'arrière. S'il fallait les abattre, ce serait moins un combat qu'un abattage.
    -> app_observer
* [Tendre l'oreille à ce qu'ils se crient d'un dragon à l'autre]
    Le vent t'apporte des bribes. Le plus vieux hurle qu'il faut continuer, le gamin veut faire demi-tour, et le troisième répète un nom, encore et encore, comme une prière. Vaerholt. Vaerholt.
    ~ entend_vaerholt = true
    -> app_observer
* [Assez vu. Sortir de l'ombre.]
    -> ch1_contact

= app_montrer
Tu montes à découvert, à leur flanc, les mains loin de tes armes. C'est une folie, ou une promesse. Le cavalier de tête choisit d'y croire et lève une main ouverte.
* [Lui rendre son geste, paume nue]
    Tu ouvres la main à ton tour. Entre deux ennemis, au-dessus d'un gouffre, ce petit rien vaut tous les serments du monde. Ses épaules se dénouent d'un pouce.
    -> ch1_contact
* [Rester de marbre, la main près du fer]
    ~ fierte = fierte + 1
    Tu ne lui offres rien. Il peut parler, mais il parlera sous ton ombre, et il le sait.
    -> ch1_contact

= app_vent
Tu poses ton souffle sur celui des Sœurs et tu écoutes. Derrière les trois dragons, loin encore, le vent porte d'autres ailes, beaucoup d'autres, et celles-là ne fuient pas. Elles poursuivent.
* [Descendre les prévenir qu'on les traque]
    ~ crus_aldric = true
    Tu fonds vers eux et tu cries ce que le vent t'a dit. Le cavalier de tête te dévisage, ahuri qu'un ennemi le prévienne, puis hoche la tête. Vous voilà, l'espace d'un instant, du même côté d'une même peur.
    -> ch1_contact
* [Garder l'avantage pour toi, et t'approcher sans un mot]
    Tu sais ce qu'ils ignorent encore, et cela te laisse le temps de décider à froid. Tu descends vers eux, muette comme le vent avant l'orage.
    -> ch1_contact

=== ch1_contact ===
{jeune_mort:
    Le cavalier de tête ne te quitte plus des yeux, et sous la suie son visage est gris. « Il avait seize ans », dit-il d'abord, comme si ça pouvait encore changer quoi que ce soit. Puis il ravale sa rage. « Mais tu vas m'écouter quand même, parce que ce que je sais vaut plus que sa vie et que la mienne. »
- else:
    Le cavalier de tête te fait signe, paumes ouvertes, et le désespoir tranquille de son geste retient ton bras mieux qu'une prière.
}
« Je m'appelle Aldric. Nous ne sommes pas venus pour vos aires. » Sa Langue Commune est rocailleuse, mais claire. « Navarre masse ses ailes derrière le col de la Sœur Aînée. Trois légions. Ils frappent avant la prochaine lune, sur vos plateaux, sur vos villages. Tue-moi si tu veux, mais préviens les tiens. »
~ avertissement_recu = true
{haine_navarre >= 2:
    Toute ta vie on t'a appris qu'un Navarrien qui parle est un Navarrien qui ment. Ton sang réclame encore sa mort. Et pourtant sa voix ne tremble pas de la peur de mourir, mais d'autre chose.
}
-> ch1_questions

=== ch1_questions ===
Le vent vous tient tous les deux en suspens au-dessus du vide. Tu as quelques instants avant que le ciel ne décide à ta place. Autant t'en servir.
* [« Pourquoi trahir ton propre roi ? »]
    « Parce que mon roi m'a demandé de brûler des gens qui dormaient. » Aldric ne détourne pas les yeux. « À Vaerholt. Un hameau à vous, pas un soldat dedans. On appelait ça un exercice. J'ai jeté ma torche dans la rivière au lieu du toit, et depuis je suis un homme mort qui vole encore. »
    ~ connait_aldric = true
    ~ entend_vaerholt = true
    -> ch1_questions
* [« Et ces deux-là, derrière toi ? »]
    {jeune_mort:
        « Il ne m'en reste qu'un. » Sa voix se casse. « L'autre, tu l'as déjà mis dans les rochers. »
    - else:
        « Deux qui ont refusé de brûler avec moi. Le vieux, c'est mon sergent, il me suit par habitude plus que par foi. Le gamin ne devrait même pas être là. Aucun de nous ne devrait. »
    }
    -> ch1_questions
* [« Pourquoi te croirais-je, toi, l'ennemi de toujours ? »]
    « Parce qu'un menteur inventerait mieux. » Un rictus sans joie. « Si je voulais te piéger, je te promettrais une victoire, pas une invasion. Je te donne de quoi me tuer et sauver les tiens du même souffle. Cherche le piège, griffonière. Il n'y en a pas. »
    -> ch1_questions
* {chasse_derriere or sait_nombre} [« Combien vous poursuivent ? »]
    « Une aile entière. Peut-être deux. » Il jette un regard par-dessus son épaule. « Les déserteurs, chez nous, on ne les juge pas, on les efface. Ils seront sur nous avant le plein jour. »
    ~ chasse_derriere = true
    -> ch1_questions
+ [Tu en as assez entendu.]
    -> ch1_pursuers

=== ch1_pursuers ===
Comme pour lui donner raison, la crête derrière eux s'assombrit. Des ailes, une rangée, puis une autre, qui montent du côté navarrien sans se cacher. La meute d'Aldric a retrouvé sa trace, et elle, elle ne fuit pas. Le temps des questions est fini. Il te reste celui d'un seul geste.
~ chasse_derriere = true
-> ch1_decision

=== ch1_decision ===
Trois fuyards, ou ce qu'il en reste, une meute qui monte, et un avertissement qui, s'il dit vrai, décide du sort d'une province. Le vent attend ta réponse comme tout le reste.
+ [Les abattre toi-même, avant que la meute ne t'en prive]
    -> dec_abattre
+ [Les capturer et les ramener à ton aire]
    -> dec_capturer
+ [Les laisser filer vers l'intérieur, et te taire]
    Tu t'écartes de leur cap. Ils s'enfoncent dans les terres de Poromiel vers on ne sait quel refuge, la meute à leurs trousses, et tu emportes leur secret sans témoin. Ce que tu en feras ne regardera que toi.
    -> ch1_retour
+ {clan == Varnyss or motivation == Protection or crus_aldric} [Te dresser entre eux et la meute, et couvrir leur fuite]
    ~ crus_aldric = true
    S'il dit vrai, ce sont les tiens qu'il tente de sauver, et tu ne laisseras pas une meute déchirer le gibier blessé sous tes yeux. Tu vires vers les ailes qui grossissent, seul point de Poromiel entre trois fuyards et ce qui les traque. Ce que ça te coûtera, tu le paieras plus tard.
    -> ch1_retour

= dec_abattre
La meute les prendra de toute façon. Autant que ce soit ta main, et non la leur.
* [Tous, jusqu'au dernier]
    ~ aldric_vivant = false
    ~ sang_verse = true
    Tu ne réponds pas avec des mots. Quand tu remontes, les dragons navarriens basculent derrière toi vers les rochers, et l'avertissement d'Aldric tombe avec eux. Tu n'auras plus que ta parole pour prévenir les tiens.
    -> ch1_retour
* {not jeune_mort} [Aldric et son sergent, mais chasser le plus jeune vers l'intérieur]
    ~ aldric_vivant = false
    ~ sang_verse = true
    ~ pitie_jeune = true
    Tu fais tomber Aldric et le vieux, mais tu laisses filer le gamin, une flèche vivante lancée vers les terres. Peut-être vivra-t-il. Peut-être racontera-t-il qu'une griffonière ennemie l'a épargné. Les légendes naissent de moins que ça.
    -> ch1_retour

= dec_capturer
Un mort ne répond plus aux questions, et tu en as encore.
* [Les ramener tous]
    ~ captif = true
    Tu leur montres l'aire du bout de ta lame, ton griffon collé à leur queue. Ils obéissent sans discuter. Les gens qui ont déjà tout perdu ont une docilité qui fait froid dans le dos.
    -> ch1_retour
* [Ne prendre qu'Aldric, et lâcher les autres]
    ~ captif = true
    Tu désignes Aldric, et lui seul. Ses compagnons hésitent, puis plongent vers l'intérieur pendant que tu peux encore les laisser partir. « Ils ne savent rien », dit Aldric. « Moi, je sais tout. C'est moi qu'il te faut. » Un homme qui se rend pour couvrir les siens, ça non plus, tu ne l'oublieras pas.
    -> ch1_retour

=== ch1_retour ===
# bg: aire_soeurs_geantes
# music: theme_aube_froide
Quand {griffon} repose ses serres sur la pierre de l'aire, le jour s'est levé pour de bon, et Vaskr t'attend au bord du vide, là où tu l'as laissé.
{captif:
    Derrière toi descendent tes prisonniers navarriens, tête basse, encadrés par ta lame. Sur l'aire, les mains vont aux armes et un griffonier crache par terre. Vaskr, lui, ne bouge pas. « Tu m'as ramené des prisonniers, ou tu m'as ramené une peste. On verra bien lequel. »
- else:
    Tu redescends seule. Les dragons navarriens ont disparu dans les terres, ou dans la mort, et cela ne regarde plus que toi. Vaskr lit ton silence mieux que n'importe quels mots. « J'espère pour toi que ce que tu rapportes vaut ce que tu as lâché. »
}
-> ch1_conseil

= ch1_conseil
Tu rapportes ce que tu as entendu là-haut. Trois légions derrière la Sœur Aînée, une offensive avant la lune, Vaerholt brûlé pour l'exemple. Le mot tombe sur l'aire comme une pierre au fond d'un puits.
« La parole d'un déserteur navarrien », gronde un vieux griffonier. « Autant écouter le vent nous mentir. »
Tous les regards se tournent vers toi.
+ [Défendre la parole d'Aldric devant l'aire entière]
    ~ crus_aldric = true
    Tu prends sa défense, toi, une des leurs, devant des visages qui voudraient cracher. Le vieux se tait, pas convaincu, mais tu as planté un doute, et un doute, en temps de guerre, pèse déjà lourd.
    -> ch1_vaskr
+ [Rapporter les faits sans les habiller de ta conviction]
    Tu poses les mots comme des pierres, nus. Qu'ils en fassent ce qu'ils voudront. Toi, tu as fait ta part.
    -> ch1_vaskr
+ {connait_aldric} [Raconter Vaerholt, ce qu'il a refusé de brûler]
    ~ crus_aldric = true
    Tu racontes le hameau endormi, la torche jetée dans la rivière, l'homme qui s'est condamné pour n'avoir pas tué. Le silence qui suit n'est plus tout à fait le même. On ne crache pas sur un ennemi qui a désobéi pour épargner les vôtres.
    -> ch1_vaskr

= ch1_vaskr
Vaskr lève une main et le silence se fait. « Vraie ou fausse, cette parole ne peut pas mourir ici. Korvhal doit l'entendre, et Korvhal n'écoutera pas un vieux capitaine à la jambe morte. » Il te regarde longtemps. « Il t'écoutera, toi. »
-> ch1_fin

=== ch1_fin ===
# fin_chapitre: la_prise
Voilà où commence la vraie histoire, pas dans le fracas d'un duel de dragons, mais dans le poids d'une parole que tu es désormais seule à pouvoir porter jusqu'au cœur de Poromiel.
{captif: Aldric descendra avec toi vers Korvhal, entravé, précieux et dangereux à la fois. }
{aldric_vivant == false: Aldric ne descendra nulle part, et son avertissement ne pèsera que ce que ta parole pèsera. }
Derrière la Sœur Aînée, dans le col, trois légions attendent la lune. Il ne te reste qu'elle pour arriver à temps.
-> ch2_arrivee

// ============================================================
//  CHAPITRE 2, Korvhal
// ============================================================
=== ch2_arrivee ===
# bg: korvhal
# music: theme_route
Korvhal se lève de la plaine comme un poing fermé. Ce n'est pas une ville, c'est une garnison qui a fini par laisser des marchands s'installer contre ses murs. Toutes les routes du centre passent par elle, et par les temps qui courent elles charrient toutes la même chose, des vivres, des lances, et la rumeur d'une guerre qui n'attend plus que son prétexte.
{captif:
    Derrière toi, {griffon} tire au bout d'une longe le dragon blessé d'Aldric, et Aldric dessus, les poignets liés, la tête haute quand même. Un Navarrien vivant qu'on mène au cœur de Poromiel, cela ne passe pas inaperçu, et sur la route les regards se plantent en lui comme des couteaux.
- else:
    Tu viens seule, sans autre preuve qu'un pressentiment et le souvenir d'une voix. Sur une route aussi passante, un pressentiment pèse moins qu'une plume.
}
Le nom de Vaskr et la marque de son aire t'ouvrent la porte de la garnison.
+ [Entrer par la grande porte, ton nom lancé devant toi]
    ~ fierte = fierte + 1
    Tu te fais annoncer, et la garnison te regarde passer comme on regarde une lame qu'on ne connaît pas encore. Autant qu'on sache tout de suite à qui on a affaire.
    -> ch2_audience
+ [Te poser à l'écart, et prendre le pouls de la ville avant de parler]
    ~ lecture = lecture + 1
    Tu traînes un moment dans les cours, l'oreille ouverte. Korvhal a peur, ça se sent à mille détails, aux corbeaux qui partent trop nombreux, aux forges qui ne s'éteignent plus, aux soldats qui regardent trop souvent vers l'est. Ici, on n'attend plus la guerre, on l'écoute venir.
    -> ch2_audience

=== ch2_audience ===
# bg: korvhal_salle
# music: theme_tension
La commandante Ingrith tient Korvhal comme on tient une lame dégainée depuis trop longtemps. Elle ne sourit pas, ne s'assoit pas, et te laisse parler sans t'interrompre, ce qui intimide plus que n'importe quelle question. Tu rapportes ce que tu sais. Trois légions massées derrière la Sœur Aînée, une offensive avant la lune, le hameau de Vaerholt brûlé pour l'exercice.
« Un déserteur navarrien t'a raconté tout ça, et tu l'as cru. » Ce n'est pas une question, c'est un verdict qu'elle t'offre de contredire. « Donne-moi une raison de vider mes cols sur la parole d'un traître à son propre roi. »
-> audience_hub

= audience_hub
* [« Vaerholt. On ne brûle pas ses propres villages pour rien. »]
    ~ rel_ingrith = rel_ingrith + 1
    « Vaerholt a brûlé, c'est vrai. » Quelque chose bouge sous la pierre de son visage. « Mes éclaireurs m'ont rapporté la fumée il y a six jours. J'ai cru à un raid. Si c'était une répétition... » Elle ne finit pas.
    -> audience_hub
* {captif} [« Demandez-lui vous-même. Il n'a plus rien à perdre. »]
    ~ rel_ingrith = rel_ingrith + 1
    Ingrith pose à Aldric trois questions sèches sur les effectifs, les cols, les jours. Il récite sans une hésitation. « Un menteur brode. Lui, il récite. C'est pire. »
    -> audience_hub
* {lecture >= 3 or clan == Aelyrrn} [Décrire la meute que le vent t'a montrée derrière eux]
    ~ rel_ingrith = rel_ingrith + 1
    Tu lui dis les ailes nombreuses lancées après trois fuyards. « Si Navarre jette une meute sur trois hommes, c'est qu'ils emportaient quelque chose qu'elle ne veut pas voir sortir. Ta parole, par exemple. »
    -> audience_hub
* {connait_aldric} [Raconter pourquoi il a déserté, la torche jetée dans la rivière]
    ~ rel_ingrith = rel_ingrith + 1
    Tu racontes le hameau endormi et l'homme qui s'est condamné pour n'avoir pas tué. Ingrith t'écoute jusqu'au bout. « Les héros ennemis sont les plus dangereux. On est tenté de les croire. »
    -> audience_hub
* [« Vous pouvez ne rien faire. La lune vous dira si j'avais raison. »]
    ~ rel_ingrith = rel_ingrith - 1
    « Ne me menace pas avec l'avenir, petite. J'en ai enterré plus que toi. » Mais le trait porte, tu le vois à sa mâchoire qui se serre.
    -> audience_hub
+ [« J'ai dit ce que j'avais à dire. »]
    -> ch2_sigrun

=== ch2_sigrun ===
Une porte claque au fond de la salle. La femme qui entre n'a pas frappé, et personne ne songe à le lui reprocher. Manteau blanc constellé de sel, deux plumes d'orfraie à la ceinture, cette façon de fendre l'air qui ne trompe pas. Une Skeldyrn. Sigrún, à en croire les murmures qui s'éteignent aussitôt.
{captif:
    Son regard trouve Aldric et s'y arrête comme une lame trouve le défaut d'une armure. « On m'a dit qu'une griffonière ramenait un Navarrien vivant. Je ne l'ai pas cru. » Elle te toise. « Donne-le-moi. L'Arène a soif, et un dragonnier de Navarre se rend aux Sœurs comme on rend une dette. »
    -> ch2_sigrun_captif
- else:
    { aldric_vivant == false:
        Elle apprend que tu as fait tomber les fuyards dans les rochers, et pour la première fois quelque chose dans son visage te ressemble. « On ne parlemente pas avec la Mort Blanche, on la sert. » Dans la bouche d'une Skeldyrn, c'est presque de la tendresse.
        -> ch2_entretemps
    - else:
        Elle apprend que tu les as laissés filer, et son mépris est si calme qu'il te glace plus qu'un cri. « Tu tenais des ennemis et tu as ouvert la main. Chez nous, on t'aurait retiré tes plumes. » Elle te tourne le dos. « Prie pour que ta parole vaille mieux que ton bras. »
        -> ch2_entretemps
    }
}

= ch2_sigrun_captif
Aldric ne baisse pas les yeux. Il sait ce que l'Arène veut dire.
+ [« Il vaut plus vivant. Sa bouche sauvera plus des nôtres que sa mort. »]
    ~ rel_ingrith = rel_ingrith + 1
    Sigrún te fixe, un instant tu crois qu'elle va frapper, puis elle recule d'un pas. « Garde ton traître. Mais quand sa langue aura menti et que le sang coulera, souviens-toi que tu l'avais dans la main. »
    -> ch2_entretemps
+ {clan == Skeldyrn} [« Il est à moi. Une sœur ne prend pas la proie d'une sœur. »]
    ~ fierte = fierte + 1
    Sigrún incline la tête, à contrecœur, devant la seule loi qui la fasse plier, celle du sang partagé. « Soit. Mais tu réponds de lui devant l'Arène, ma sœur. Devant toutes. »
    -> ch2_entretemps
+ {rel_ingrith >= 2} [Laisser Ingrith trancher, c'est sa garnison, pas l'Arène]
    Tu te tournes vers la commandante. Ingrith soutient le regard de Sigrún un long moment, deux pouvoirs qui se mesurent, puis tranche en ta faveur. « Le prisonnier reste ici tant qu'il m'est utile. L'Arène attendra. » Sigrún s'incline devant le grade, pas devant toi.
    -> ch2_entretemps
+ [Le lui livrer, et te laver les mains de la suite]
    ~ aldric_livre = true
    ~ aldric_vivant = false
    ~ rel_ingrith = rel_ingrith - 1
    Tu recules. Sigrún prend Aldric par le col sans effort, et lorsqu'elle l'emmène, il ne te regarde même pas. Pas de reproche dans son silence, seulement la fatigue de celui qui n'attendait rien d'autre. La salle, elle, te regarde autrement à présent.
    -> ch2_entretemps

=== ch2_entretemps ===
# bg: korvhal
# music: theme_aube_froide
La nuit tombe sur Korvhal et le conseil ne se tiendra qu'à la relève. On te trouve un coin, du pain, du vin coupé d'eau. Le temps, rare, de regarder autour de toi.
-> entretemps_hub

= entretemps_hub
* {captif and not aldric_livre} [Descendre voir Aldric dans sa cellule]
    ~ parle_aldric = true
    Il est assis dos au mur, les fers aux poignets, et il ne lève pas la tête tout de suite. « Tu es venue voir à quoi ressemble un traître de près. » Vous parlez longtemps, de Vaerholt, de la femme qu'il ne reverra pas, du roi qu'il servait sans y croire. Quand tu remontes, il n'est plus tout à fait un ennemi, et c'est exactement ce que tu craignais.
    -> entretemps_hub
* [Marcher les remparts et regarder vers l'est]
    Du chemin de ronde, on voit les Sœurs Géantes se découper sur la nuit, et derrière elles, quelque part, trois légions. Un vieux factionnaire te tend sa gourde sans un mot. « On la sent venir, hein », dit-il seulement. « Comme l'orage dans les dents. »
    -> entretemps_hub
* [Boire avec les griffoniers, écouter ce qui se dit]
    On parle bas, à la table du fond. De Sigrún, qu'on craint plus qu'on n'aime. De la guerre qui vient. Et d'une voyageuse arrivée la veille, sans blason, à qui la commandante elle-même a cédé sa meilleure chambre. « Personne ne sait qui c'est », souffle une griffonière. « Mais Ingrith, elle, elle sait. Et ça la rend polie. Ça devrait te faire peur. »
    ~ rumeur_princesse = true
    -> entretemps_hub
* [Rester avec {griffon}, loin des hommes et de leurs peurs]
    Tu montes aux perchoirs, où {griffon} somnole, une aile repliée sur toi comme un toit. Pas de mots, pas de conseil, pas de guerre. Juste sa chaleur et le vent. C'est peut-être la dernière nuit calme avant longtemps, et tu la passes bien.
    ~ maitrise = maitrise + 1
    -> entretemps_hub
+ [Assez. Le conseil t'attend.]
    -> ch2_princesse

=== ch2_princesse ===
{rumeur_princesse:
    C'est elle, tu le sais avant même qu'elle parle. La voyageuse sans blason dont toute la garnison murmure le nom qu'elle n'a pas. Elle t'attendait, tu le comprends à la façon dont elle ne lève pas les yeux tout de suite.
- else:
    Dans un angle de la salle du conseil, une femme que tu n'avais pas remarquée repose son gobelet. Manteau de voyage sans blason, mains calleuses de cavalière, un âge impossible à fixer.
}
« Une question, griffonière. » Sa voix est basse, posée, habituée à ce qu'on se taise autour d'elle. « Oublie les légions, les cols, la lune. Si tu te trompes, Korvhal se découvre pour rien. Si tu dis vrai et qu'on ne bouge pas, une province brûle. Toi qui as vu l'homme et senti le vent, toi, tu y crois ? »
Ce n'est pas Ingrith qu'elle regarde. C'est toi.
-> princesse_hub

= princesse_hub
* [« Qui es-tu, pour me juger depuis ton coin de table ? »]
    ~ fierte = fierte + 1
    Elle ne se vexe pas, au contraire, quelque chose s'allume dans son œil, l'amusement de qui aime qu'on lui tienne tête. « Quelqu'un qui pose les questions que les autres n'osent plus. Tu le sauras bien assez tôt. »
    -> princesse_hub
* [« Pourquoi ça te tient tant, une affaire de garnison ? »]
    « Parce qu'une garnison est un royaume en petit. Ce qui s'y décide mal se décide mal partout. » Elle te regarde. « J'ai passé ma vie à apprendre où le royaume est fort et où il ment. Korvhal, ce soir, me dira lequel. »
    -> princesse_hub
* {parle_aldric} [« J'ai parlé à Aldric, longuement. Ce n'est pas un menteur. »]
    ~ crus_aldric = true
    « Tu es descendue le voir dans sa cellule. » Elle hoche la tête, lentement. « Peu de gens vont regarder en face ce qu'ils pourraient avoir à tuer. Ça se retient. »
    -> princesse_hub
+ [« J'y crois. J'ai vu la peur d'Aldric, et ce n'était pas la peur de mourir. »]
    ~ crus_aldric = true
    ~ princesse_alliee = true
    Elle range ta réponse comme on range une carte qui servira. « La peur de ce qu'on a fait pèse plus lourd que celle de ce qu'on subit. Tu sais lire ça. C'est rare. »
    -> ch2_princesse_reveal
+ [« Je ne sais pas. Mais je sais ce qu'il en coûte de n'avoir rien fait, après. »]
    ~ princesse_alliee = true
    « La prudence de qui a déjà enterré des morts qu'elle aurait pu sauver. Meilleure raison que la certitude. La certitude ment. »
    -> ch2_princesse_reveal

= ch2_princesse_reveal
~ princesse_rencontree = true
La femme se lève pour partir, et c'est alors que tu le remarques. Quand elle passe devant Ingrith, la dure Ingrith qui ne plie devant rien, la commandante baisse les yeux d'un pouce. Un rien. Le genre de rien qu'on ne concède qu'au sang des Valskyrn.
{lecture >= 2 or clan == Aelyrrn:
    Et le vent, en la suivant vers la porte, te souffle ce que la salle n'ose pas dire. L'Épreuve des Trois Provinces. L'héritière qui court le royaume sous un faux nom, de terre en terre, pour éprouver ce qu'elle briguera. Tu viens de plaider ta cause devant la future Reine sans le savoir.
    ~ sait_princesse = true
- else:
    Tu ignores encore qui elle est. Mais tu sais désormais que cette salle comptait une personne de trop pour une simple affaire de garnison.
}
-> ch2_decision

=== ch2_decision ===
Ingrith reprend la salle en main, mais quelque chose a glissé. Que la voyageuse ait parlé, et Korvhal t'écoute autrement.
« Admettons. » La commandante abat ses deux poings sur la carte. « Trois légions derrière la Sœur Aînée. Reste à décider ce qu'on en fait, et vite, parce que la lune ne nous attendra pas. »
{princesse_alliee:
    Depuis le seuil, la voyageuse s'est arrêtée. Elle ne dira plus rien, mais elle écoute, et tu sais que ce qui se tranchera ici lui reviendra.
}
Trois voies s'ouvrent, et ton sang te tire vers l'une d'elles avant même que tu réfléchisses.
+ [Frapper les premiers, passer le col et briser leur rassemblement avant la lune]
    ~ plan = Prevenir
    ~ korvhal_ecoute = true
    « L'audace des Skeldyrn », grommelle Ingrith. « Jeter ce que j'ai contre trois légions à découvert, c'est miser le royaume sur un coup de dés. Mais un coup de dés vaut mieux que d'attendre la lame sur la nuque. »
    -> ch2_fin
+ [Fortifier, vider les hameaux exposés, tenir les cols et faire payer chaque pas]
    ~ plan = Fortifier
    ~ korvhal_ecoute = true
    « La patience d'un bouclier », dit Ingrith. « On ne gagne pas une guerre en reculant. Mais on évite de la perdre en un seul matin. »
    -> ch2_fin
+ [Porter l'avertissement à Skjalfyrn, parce que ceci dépasse une garnison]
    ~ plan = PorterASkjalfyrn
    ~ korvhal_ecoute = true
    « Et perdre trois jours pendant que la couronne délibère. » Ingrith secoue la tête, puis se ravise. « Ou bien tu as raison. Une aile de plus au col n'y changera rien. La volonté de la Reine, si. »
    -> ch2_fin

=== ch2_fin ===
# fin_chapitre: korvhal
{plan == Prevenir: On sonnera le rassemblement avant l'aube. Ce que Korvhal peut lancer de griffoniers passera le col pour frapper ce qui s'y masse, et tu voleras en tête. }
{plan == Fortifier: Les corbeaux partent déjà vers les hameaux exposés. On vide, on mure, on aiguise. Korvhal se prépare à saigner l'ennemi pas à pas. }
{plan == PorterASkjalfyrn: Tu repartiras dès demain vers la capitale, l'avertissement en bouche, pour le poser devant le Trône de Pierre lui-même. }
{captif: Aldric reste à Korvhal sous bonne garde, ni tout à fait prisonnier ni tout à fait allié, sa vie suspendue à la véracité de ce qu'il a dit. }
{sait_princesse: Et quelque part sur les routes du royaume, une femme sans blason emporte le souvenir de ton visage vers un trône qu'elle n'a pas encore gagné. }
La lune monte, un peu plus pleine chaque nuit. De l'autre côté des Sœurs Géantes, trois légions comptent les mêmes nuits que toi.
-> ch3_menace

// ============================================================
//  CHAPITRE 3, La Menace se lève
// ============================================================
=== ch3_menace ===
# music: theme_menace
La lune est presque pleine, et ce que tu as décidé à Korvhal cesse d'être un mot pour devenir un ciel qu'il faut voler.
{plan == Prevenir: -> ch3_prevenir}
{plan == Fortifier: -> ch3_fortifier}
{plan == PorterASkjalfyrn: -> ch3_skjalfyrn}

=== ch3_prevenir ===
# bg: col_soeur_ainee
# music: theme_combat
Vous montez vers le col dans le noir d'avant l'aube, une poignée de griffoniers de Korvhal collés à ton sillage, le vent glacé plein la gorge. En bas, dans la cuvette, les feux de trois légions rougeoient encore. Des tentes à perte de vue, des dragons piquetés qui dorment, et au centre, prise comme un caillou dans un poing, ce qui reste d'un hameau poroméen que Navarre a fait sien pour y camper. Des vôtres, entre leurs mains.
Ils ne t'ont pas encore vue. Avant de fondre, il te reste le temps d'un seul choix de vol.
+ [Prendre de la hauteur et laisser le vent te cacher jusqu'au dernier instant]
    ~ maitrise = maitrise + 1
    Tu montes jusqu'à n'être qu'une étoile de plus, là où nul guetteur ne pense à lever les yeux. Quand tu tomberas, ce sera du ciel lui-même.
    -> prevenir_climax
+ [Raser la cuvette pour repérer où l'on retient les tiens]
    ~ sait_captifs = true
    Tu frôles les tentes, le cœur au bord des dents, et tu les vois, tes compatriotes, parqués contre la falaise sous une double garde. Maintenant tu sais où frapper sans les tuer. Si tu le veux.
    -> prevenir_climax
+ [Disperser tes griffoniers pour fondre de tous les côtés à la fois]
    ~ succes_militaire = succes_militaire + 1
    D'un geste, tu ouvres ton aile en éventail. Ils frapperont de partout, et le camp croira un instant qu'une armée lui tombe dessus. Le désordre est une arme, quand on est trop peu.
    -> prevenir_climax

= prevenir_climax
Le vent bascule. C'est l'instant d'avant.
+ [Tout embraser, ne rien laisser derrière vous que de la cendre]
    ~ atrocite = true
    ~ succes_militaire = succes_militaire + 2
    { clan == Varnyss or motivation == Protection:
        ~ brise_clan = true
    }
    Le feu de tes griffoniers tombe sur la cuvette comme une seconde nuit. Les légions se brisent, oui, mais le hameau brûle avec elles, et les vôtres dedans. Au petit matin tu as gagné, et tu es devenue exactement ce qu'Aldric fuyait.
    -> resoudre_destin
+ {maitrise >= 3 or lecture >= 3} [Fondre droit sur le pavillon de commandement, et disparaître]
    ~ succes_militaire = succes_militaire + 1
    Tu lis le vent, tu choisis ton angle, et {griffon} tombe comme une pierre sur la tente du général navarrien. Le temps qu'ils comprennent, la tête de leur offensive gît dans la boue et vous êtes déjà repassés de l'autre côté du col. Sans chef, un rassemblement n'est plus qu'une foule.
    -> resoudre_destin
+ [Ne frapper que ce qui porte les armes, et libérer le hameau]
    ~ villages_sauves = true
    { clan == Skeldyrn:
        ~ brise_clan = true
    }
    Tu retiens tes griffoniers, tu vises les soldats et pas les cabanes, tu arraches les vôtres à leurs geôliers avant que la panique ne gagne. La razzia est moins totale, et Sigrún, si elle vit encore, ne te le pardonnera pas. Une Skeldyrn qui épargne a déjà à demi trahi son sang.
    -> resoudre_destin
+ {crus_aldric} [Viser le point faible qu'Aldric t'a décrit, pour un coup net]
    ~ succes_militaire = succes_militaire + 1
    ~ villages_sauves = true
    Tu frappes là où il te l'a dit, les réserves, les cages à dragons, le nerf de leur élan. L'offensive s'effondre sur elle-même sans que la cuvette entière ait à brûler. Aldric ne t'a pas menti, et cette vérité-là vaut plus que la victoire.
    -> resoudre_destin
+ {sait_captifs} [Foncer d'abord délivrer les tiens, puis frapper]
    ~ villages_sauves = true
    ~ succes_militaire = succes_militaire + 1
    Tu sais où ils sont. Tu tombes sur leurs gardes avant de toucher aux légions, tu tranches les liens, tu ouvres un couloir de ciel vers l'arrière. Les tiens fuient pendant que le camp s'éveille dans la panique. La razzia sera moins nette, mais tu remontes avec des vivants au lieu d'une simple victoire.
    -> resoudre_destin
+ [Plonger seule au cœur du camp, quitte à ne pas en revenir]
    ~ griffon_vivant = false
    ~ succes_militaire = succes_militaire - 1
    Tu ne les laisses pas décider de l'heure. Tu plonges, seule, et pendant un souffle tu sèmes la terreur au milieu d'eux. Puis une lance trouve {griffon}, et le ciel se retourne. Tu vis, on ne sait comment. Lui, non.
    -> resoudre_destin

=== ch3_fortifier ===
# bg: col_soeur_ainee
# music: theme_combat
Ils viennent la nuit de la pleine lune, comme Aldric l'avait dit. Toi, tu es déjà là, sur la crête au-dessus du dernier hameau qu'on n'a pas fini d'évacuer, entre les ailes navarriennes qui descendent et les charrettes qui fuient encore sur la route en contrebas.
Il te reste quelques battements de cœur avant le premier choc, et un ordre à jeter dans la nuit.
+ [Faire passer les blessés et les vieux en tête du convoi]
    ~ villages_sauves = true
    Tu cries l'ordre en bas. On se bouscule, on jure, mais les plus faibles roulent les premiers vers l'abri. S'il faut sauver, autant sauver ceux qui ne peuvent pas courir.
    -> fortifier_climax
+ [Faire abattre le pont derrière le convoi pour couper l'infanterie]
    ~ succes_militaire = succes_militaire + 1
    Deux haches, quelques instants, et le vieux pont de bois s'effondre dans le torrent. Les dragons passeront, mais pas leurs fantassins, et chaque minute gagnée vaut une charrette de plus.
    -> fortifier_climax
+ [Garder tes griffoniers serrés autour de toi, ne rien éparpiller]
    ~ maitrise = maitrise + 1
    Tu les rassembles en un poing. Vous serez moins partout, mais là où vous frapperez, vous frapperez fort. On ne défend pas un ciel en le semant de soi.
    -> fortifier_climax

= fortifier_climax
Le premier dragon crache sur la palissade. La suite ne dépend plus que de toi.
+ [Tenir la ligne, ne pas céder un pouce tant qu'une charrette roule encore]
    ~ sacrifice = true
    ~ villages_sauves = true
    ~ succes_militaire = succes_militaire + 1
    Tu te plantes dans leur ciel comme un clou et tu ne bouges plus. Chaque passe te coûte du sang, à toi, à {griffon}, mais en bas la route se vide, charrette après charrette, vie après vie. Quand l'aube arrive, le hameau est en cendres et son peuple est vivant. C'est un échange que tu referais.
    -> resoudre_destin
+ [Te replier pour sauver ton aile, et laisser le hameau à son sort]
    ~ succes_militaire = succes_militaire + 0
    { clan == Varnyss or motivation == Protection:
        ~ brise_clan = true
    }
    Tu sonnes le repli. Tes griffoniers vivent, et c'est ce qui compte, te répètes-tu, tandis que derrière vous le hameau disparaît sous les ailes. Un bouclier qui recule n'est plus un bouclier. Tu le sais, et tu voleras longtemps avec ce savoir-là.
    -> resoudre_destin
+ [Jeter {griffon} dans la brèche, un dernier vol pour couvrir la fuite des tiens]
    ~ griffon_vivant = false
    ~ sacrifice = true
    ~ villages_sauves = true
    ~ succes_militaire = succes_militaire + 1
    Tu demandes à {griffon} la seule chose qu'on ne devrait jamais demander, et il te la donne sans hésiter, parce que c'est ça, le lien. Vous fondez ensemble dans la trouée, une fois, une seule, et la brèche se referme sur son cri. La route, en bas, achève de se vider. Tu survis. Une moitié de toi, seulement.
    -> resoudre_destin
+ {crus_aldric and aldric_vivant} [Tenter la trêve qu'Aldric espérait, crier par-dessus le fer]
    ~ succes_militaire = succes_militaire + 0
    { princesse_alliee:
        ~ villages_sauves = true
    }
    Tu hurles le nom d'Aldric, tu cries ce qu'il t'a dit, tu demandes lequel d'entre eux préfère aussi ne pas brûler de villages. C'est une folie. Presque tous te répondent par le feu. Presque. Deux ailes navarriennes hésitent, décrochent, s'écartent du carnage, et cette fissure minuscule dans le mur de la guerre, tu ne l'oublieras jamais.
    -> resoudre_destin

=== ch3_skjalfyrn ===
# bg: skjalfyrn
# music: theme_capitale
Skjalfyrn ne ressemble à aucune cour. Pas d'or, pas de marbre, seulement de la pierre sombre battue par le vent et les bannières de tous les clans enroulées autour des tours. On t'introduit dans la Halle du Vent, devant le Conseil des Clans et devant elle, la Reine Eirlys Valskyrn, qui ne s'assoit pas plus que ses ancêtres n'ont plié.
{princesse_alliee:
    Près du trône se tient la voyageuse de Korvhal, sans son manteau de route désormais. Elle ne dit rien, mais quand ton regard croise le sien, elle incline la tête d'un rien. Tu n'es pas seule dans cette salle.
}
« Parle, griffonière. » La voix d'Eirlys ne s'élève pas, et pourtant la Halle entière se tait. « Et choisis bien, car ce que tu diras, le royaume le fera. »
Avant d'ouvrir la bouche, tu prends la mesure de la salle, et tu choisis à qui, vraiment, tu vas parler.
+ [À la Reine seule, d'égale à souveraine]
    ~ fierte = fierte + 1
    Tu ne regardes qu'elle, comme si le Conseil n'était qu'un décor. Peu osent, et Eirlys, qui a tout vu, remarque toujours qui ose.
    -> skjalfyrn_climax
+ [Aux clans, pour flatter leur fierté et les rallier]
    Tu balaies la Halle du regard, tu nommes leurs bannières, tu parles à leur mémoire de guerre. Un murmure d'approbation court sur les bancs. On t'écoutera mieux si l'on se sent écouté.
    -> skjalfyrn_climax
+ {princesse_alliee} [Chercher d'abord le regard de la voyageuse près du trône]
    ~ reine_faveur = reine_faveur + 1
    Tu croises son regard, une fraction de seconde, et elle te répond d'un cillement. Sans un mot, l'héritière vient de te dire que tu n'es pas seule dans cette salle. Ça change la voix qu'on trouve pour parler.
    -> skjalfyrn_climax

= skjalfyrn_climax
+ [Exiger qu'on frappe les premiers, avant que la lune ne tourne]
    ~ reine_faveur = reine_faveur + 1
    ~ succes_militaire = succes_militaire + 1
    « L'audace. » Eirlys te jauge. « Skara aurait aimé. » Le Conseil gronde, se divise, mais la Reine tranche, et des ailes partent vers le col cette nuit-là parce que tu l'as demandé.
    -> resoudre_destin
+ [Plaider pour les provinces, pour qu'on protège les hameaux avant tout]
    ~ villages_sauves = true
    { princesse_alliee:
        ~ reine_faveur = reine_faveur + 1
    }
    « Un royaume n'est pas ses murs, c'est son peuple. » Eirlys pèse tes mots. « Peu de guerrières se souviennent de ça au moment de choisir. » On dépêche des corbeaux vers toutes les terres exposées, et des vies que tu ne connaîtras jamais te devront de n'avoir pas brûlé.
    -> resoudre_destin
+ {captif} [Produire Aldric devant le Conseil, et le laisser dire la vérité en face]
    ~ reine_faveur = reine_faveur + 1
    ~ crus_aldric = true
    ~ succes_militaire = succes_militaire + 1
    On amène Aldric enchaîné au centre de la Halle. Il parle, et sa voix ne tremble pas devant une Reine ennemie plus qu'elle n'a tremblé devant toi. Quand il se tait, le silence d'Eirlys vaut tous les serments. « Un traître à son roi peut être un homme d'honneur au nôtre. Rare. Utile. »
    -> resoudre_destin
+ [Défier les Skeldyrn qui, dans la salle, réclament le sang plutôt que la stratégie]
    { clan == Skeldyrn:
        ~ brise_clan = true
    }
    { clan != Skeldyrn:
        ~ reine_faveur = reine_faveur + 1
    }
    Tu te dresses contre les orfraies, contre leur soif, contre l'idée qu'une guerre se gagne à la rage. Si tu es des leurs, ton propre sang te reniera pour ce que tu viens de dire. Si tu ne l'es pas, la Reine, elle, retient qu'une griffonière a osé.
    -> resoudre_destin

// ============================================================
//  RÉSOLUTION DES DESTINS
// ============================================================
=== resoudre_destin ===
{
    - griffon_vivant == false and villages_sauves == false:
        -> fin_bucher
    - succes_militaire <= -2:
        -> fin_bucher
    - brise_clan and not villages_sauves:
        -> fin_renegate
    - atrocite and (clan == Skeldyrn or haine_navarre >= 3) and not brise_clan:
        -> fin_mortblanche
    - villages_sauves and sacrifice:
        -> fin_bouclier
    - reine_faveur >= 1 and succes_militaire >= 1:
        -> fin_lamereine
    - clan == MaisonNouvelle and succes_militaire >= 1:
        -> fin_nomquivole
    - crus_aldric and aldric_vivant and not atrocite:
        -> fin_paiximpossible
    - else:
        -> fin_ventseul
}

= fin_mortblanche
# titre: La Mort Blanche
Tu es allée au bout de ce que Navarre redoutait. Là-bas, on ne prononcera plus ton nom, on le crachera pour conjurer le sort. Les Sœurs t'ont trouvé une place dans leurs chants, et le vent qui les porte sent la cendre. Tu as gagné la guerre d'une nuit, et perdu quelque chose que tu ne sauras nommer que bien plus tard.
-> epilogue

= fin_bouclier
# titre: Le Bouclier de Poromiel
On ne chantera pas ta victoire, parce qu'il n'y en a pas eu. On chantera les vivants. Les charrettes vidées, les enfants passés de l'autre côté de la crête, les vieux qu'on croyait perdus. Un bouclier ne brille jamais, il encaisse, et le tien a tenu quand il fallait. C'est la seule gloire qui ne se paie pas du sang des faibles.
-> epilogue

= fin_lamereine
# titre: La Lame de la Reine
Eirlys Valskyrn n'oublie ni ses dettes ni ses armes, et tu es devenue les deux. On te verra désormais aux endroits où le royaume se décide, une aile de la couronne, redoutée chez les tiens autant que chez l'ennemi. Le pouvoir est un vent porteur. Reste à savoir vers quel gouffre il te porte.
-> epilogue

= fin_nomquivole
# titre: Le Nom qui Vole
Tu n'avais pas de bannière, pas d'ancêtres, rien qu'un griffon et du cran. Tu as maintenant un nom, et la Vieille Échine, qui te méprisait, apprend à le dire sans grimacer. Une Maison-Nouvelle vient de naître dans le vent, la tienne, et les vieux clans savent qu'un jour elle les vaudra tous.
-> epilogue

= fin_renegate
# titre: La Renégate
Tu as fait ce que ton clan t'interdisait, et un clan ne pardonne pas. On t'a retiré tes plumes, ton chant, ta place autour du feu. Tu voles seule désormais, sans les tiens, avec la seule certitude d'avoir eu raison contre eux. C'est une compagnie mince par les nuits froides des Sœurs Géantes.
-> epilogue

= fin_paiximpossible
# titre: La Paix Impossible
Tu as cru un ennemi, et tu ne l'as pas regretté. Ça ne suffira pas à arrêter la guerre, une guerre ne s'arrête pas sur la parole d'une griffonière et d'un déserteur. Mais tu as prouvé qu'entre Poromiel et Navarre il pouvait passer autre chose que du feu, et cette fissure minuscule, d'autres, après toi, sauront peut-être l'élargir.
-> epilogue

= fin_ventseul
# titre: Le Vent Seul
Tu n'as choisi ni la Reine, ni ton clan, ni le camp d'en face. Tu as choisi le ciel, et {griffon}, et de ne rien devoir à personne. On te chassera des deux bords des Sœurs Géantes, et tant mieux. Le vent, lui, ne demande jamais à qui tu appartiens.
-> epilogue

= fin_bucher
# titre: Le Bûcher
Tu as trop demandé, à toi, au ciel, à ta monture. {griffon_vivant == false: {griffon} est tombé, et une moitié de toi avec lui.} {griffon_vivant: Ce qui restait de ton aile s'est brisé sur le col, et rien de ce que tu as sauvé ne pèse contre ce que tu as perdu.} La guerre continuera sans toi. Elle continue toujours.
-> epilogue

// ============================================================
//  ÉPILOGUE PERSONNALISÉ, les cartes qui se déclenchent selon ton parcours
// ============================================================
=== epilogue ===
Et dans les saisons qui suivent, le vent porte ce qu'il advint de chacun.
{aldric_livre: Aldric est mort dans l'Arène des Skeldyrn, sous les cris, et son avertissement avec lui. Tu te demandes parfois s'il disait vrai. Le doute, tu le garderas.}
{captif and not aldric_livre: Aldric vit toujours, prisonnier utile, à demi des tiens désormais. Il ne sera jamais poroméen, mais il ne sera plus jamais navarrien non plus. Tu lui as fait ça.}
{aldric_vivant == false and not aldric_livre and not captif: Aldric est tombé de ta main dans les rochers du col. Tu ne sauras jamais s'il portait ton salut ou ta perte.}
{crus_aldric and aldric_vivant: Le nom d'Aldric court désormais dans les deux royaumes, murmuré comme celui d'un fou, ou d'un premier juste.}
{sait_princesse: L'héritière que tu as croisée à Korvhal ceindra un jour le Trône de Pierre, et elle se souviendra de ton visage. Une reine qui se souvient est une chance, ou une menace, on ne sait jamais laquelle jusqu'au bout.}
{princesse_alliee and not sait_princesse: La voyageuse sans blason veille sur toi de loin, pour des raisons que tu ne comprends pas encore.}
{villages_sauves: Dans les hameaux de la frontière, des enfants portent des noms qu'on ne t'a pas demandé la permission de leur donner. Le tien, parfois.}
{atrocite: La cuvette où tu as fait pleuvoir le feu ne reverdira pas de ton vivant. Certaines terres se souviennent plus longtemps que les hommes.}
{brise_clan: Les tiens ne chantent plus ton nom autour du feu. Il y a des silences qui durent plus que des vies.}
{griffon_vivant: {griffon} vole encore avec toi, plus vieux, plus lent, plus cher que jamais. Vous avez survécu l'un à l'autre, ce qui est la seule victoire qu'un griffonier espère vraiment.}
{motivation == Vengeance and atrocite: La dette de sang qui te tenait debout, tu l'as payée jusqu'au dernier feu. Reste à savoir ce qui te tiendra debout maintenant qu'elle est soldée.}
{motivation == Liberte and reine_faveur <= 0 and not brise_clan: Tu n'as plié devant personne, ni Reine ni clan. Le vent seul t'a eue, et c'est tout ce que tu voulais.}
{motivation == Protection and villages_sauves: Tu voulais protéger ce qui ne pouvait pas se défendre. Cette nuit-là, tu l'as fait. Peu de gens peuvent en dire autant.}
-> fin_jeu

=== fin_jeu ===
# fin
Fin de la tranche jouable, « L'Aire des Sœurs Géantes ».
Clan {clan} · Motivation {motivation} · Vent {lecture} · Poigne {maitrise} · Faveur de la Reine {reine_faveur}
-> END
