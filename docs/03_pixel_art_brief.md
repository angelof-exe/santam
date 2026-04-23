# Pixel Art Brief — Santam

> Documento **self-contained**. Da copiare/incollare in AI (Gemini, Claude, ChatGPT, Midjourney, Retro Diffusion, Stable Diffusion, PixelLab) per generare pixel art o prompt per modelli immagine. Tutto il contesto essenziale è qui dentro — non serve leggere altri doc.

---

## 1. Il progetto in 150 parole

*Santam* è un **JRPG pixel art 2D a navigazione laterale** (side-view, come *Odin Sphere* / *Valkyrie Profile*) ambientato nell'**entroterra agrigentino siciliano, 1955-1962**. Il paese fittizio di Santam — ispirato a Sant'Angelo Muxaro — è arroccato su una collina di gesso sopra il fiume Pàtanu. La zona è dominata da **zolfare in chiusura**, **calanchi** (badlands bianco-ocra), **necropoli sicane** con tombe a tholos, e **grotte** naturali e artificiali.

Sotto il paese si estende **Kàmikos**, una **città-macchina** di tremila anni — opera leggendaria di Dedalo — che si è risvegliata nel 1943. L'estetica è **steampunk mediterraneo**: vapore, ottone, zolfo, ingranaggi innestati su architettura contadina siciliana (muretti a secco, case di calce, balconi in ferro battuto, fichi d'India).

Il protagonista **Turi Sciacca** è un meccanico autodidatta di 22 anni, nato e cresciuto a Santam, mai uscito dal paese, che scende nel Labirinto cercando il nonno scomparso.

**Vincoli narrativi fissati**: no religione, no mafia, no anime/chibi, no neon/cyberpunk.

---

## 2. Direzione artistica

- **Stile**: pixel art 16-bit moderno, "HD-pixel JRPG"
- **Riferimenti diretti**: *Sea of Stars* (2023), *Eastward*, *Chrono Trigger*, *Terranigma*, *CrossCode*, *Blasphemous* (solo per densità di pixel)
- **Vista**: laterale (side-view), NON top-down
- **Palette**: limitata, terrosa, calda — vedi §4
- **Mood**: malinconico ma caldo, tempo che si ferma, polvere di sole. Tra *Il Gattopardo* (Visconti) e *Castle in the Sky* (Miyazaki)

**Regole ferree:**
- ✅ Pixel perfetti, bordi netti, palette consistente
- ✅ Dithering misurato per transizioni tono
- ✅ Silhouette leggibile (test: ombra solo nera ancora riconoscibile)
- ❌ Antialiasing / blur / gradient continui
- ❌ Anime / chibi / manga style
- ❌ Iconografia religiosa (no croci, preti, madonne, santi)
- ❌ Iconografia mafiosa stereotipica (no lupare, coppola con bastone in pose minacciose)
- ❌ Verde fantasy brillante — il nostro verde è grigio, arso
- ❌ Elementi futuristici oltre il 1962 (niente neon, LED, cyberpunk)

---

## 3. Specifiche tecniche

| Asset | Dimensioni (px) | Note |
|---|---|---|
| Tile base TileMap | 16×16 | terreno, pareti, oggetti piccoli |
| Tile grande | 32×32 | edifici, elementi monumentali |
| Sprite NPC | 24×32 | idle + 4-8 frame walk |
| Sprite protagonisti | 32×48 | più frame, più dettaglio |
| Sprite boss / chiave | 48×64 o 64×96 | massimo dettaglio |
| Icona oggetto / inventario | 16×16 o 24×24 | |
| UI cornice seamless | 8×8 ripetibile | dialog box espandibili |
| Font pixel | 8×8 | monospace stile *Chrono Trigger* |

**Output obbligatorio:**
- **PNG con canale alpha trasparente**
- **NO antialiasing** (pixel duri, bordi netti, zero colori intermedi semitrasparenti)
- Massimo **16-24 colori per sprite**, tutti dalla palette master
- Scala **1:1** (nessun upscaling prima della consegna)
- Sprite sheet: layout orizzontale, spacing 0 px, allineamento cella costante

---

## 4. Palette master (hex codes — usare SOLO questi)

### Terra e paesaggio (dominanti)
```
#F2EAD3  Bianco calce (muri)
#E8D4A2  Bianco gesso (rocce)
#C9A227  Giallo zolfo scuro
#C08040  Ocra bruciata
#8B5A3C  Terra siena
#6B4423  Marrone scuro
#3D2817  Bruno terra profondo
```

### Verde arido (mai brillante)
```
#7A8450  Verde oliva grigio
#6B8E4E  Verde fico d'India
#4F5D3A  Verde oliva scuro
```

### Cielo e acqua
```
#A8C4D4  Azzurro polvere
#6F8CA8  Azzurro medio
#2B4458  Blu notte
```

### Metallo e steampunk
```
#B08D57  Ottone
#8B6F3C  Ottone ossidato
#8C3A2A  Rosso ruggine
#C9566B  Rosa rame
#6E4A2E  Bronzo scuro
#2B2A28  Nero carbone
```

### Accenti speciali (uso parsimonioso, solo per elementi "attivi")
```
#E8C547  Oro zolfo acceso (macchine attive)
#D64550  Magenta vapore (luci Kàmikos)
#4FA890  Verde acido (fluorescenza zolfo)
#F4E8C1  Luce lampada a olio
#FFCF7A  Arancio lampione
```

---

## 5. Personaggi principali

Per ciascun personaggio: descrizione fisica + prompt pronto all'uso (in inglese, più efficace con i modelli immagine).

### 5.1 Turi Sciacca — protagonista

**Fisico**: 22 anni, siciliano, capelli castano scuri mossi, occhi scuri, carnagione olivastra abbronzata. Corporatura asciutta ma braccia forti da lavoro manuale.

**Abbigliamento**:
- **Coppola** di fustagno marrone scuro o nero
- **Camicia** di lino grezzo écru, maniche arrotolate sopra il gomito
- **Gilet** di velluto a costine marrone terra, sbottonato
- **Pantaloni** di velluto a costine ocra, leggermente corti
- **Bretelle** di cuoio scuro
- **Tracolla con strumenti** (cacciavite, chiave inglese, cordino) a sinistra
- **Scarponi** di cuoio nero consumato
- Macchia di grasso sulla camicia all'anca sinistra (dettaglio identificativo)

**Sprite specs**: 32×48 px. Serve: 4 direzioni (idle), walk cycle laterale 4-8 frame, pose con chiave inglese in mano.

**Prompt (Midjourney / Gemini / DALL-E)**:
```
Pixel art sprite sheet of Turi Sciacca, 22-year-old Sicilian self-taught mechanic, rural Sicily 1958. Black fustian flat cap (coppola), écru rough linen shirt with sleeves rolled above elbow, dark brown corduroy unbuttoned vest, ochre corduroy trousers slightly short, dark leather suspenders, leather tool strap across chest with small screwdriver and wrench visible, worn black leather boots, grease stain on left hip of shirt. Olive tanned skin, dark wavy hair, dark eyes, lean strong build. 32x48 pixels per frame. 16-bit JRPG style inspired by Sea of Stars, Chrono Trigger, Eastward. Limited warm earth palette (ochre C08040, sienna 8B5A3C, linen F2EAD3, brass B08D57 for tools). No antialiasing, crisp pixel edges. Side view. Transparent PNG background. Include: 4 idle poses (facing left, right, up-back, down-front) and one walking cycle of 4 frames facing right.
```

### 5.2 Zia Gnura Càrmela — guaritrice

**Fisico**: 70+ anni, piccola, curva, sottile. Sguardo penetrante. Pelle scura segnata dal sole.

**Abbigliamento**:
- **Fazzoletto nero** sul capo (sempre)
- **Scialle nero** (*mantillina*) sulle spalle
- **Vestito lungo nero** su sottoveste grigia
- **Grembiule scuro** con tasca profonda (erbe e amuleti)
- Calze grigie di cotone pesante
- Scarpe di pezza nere
- **Cordoncino rosso al polso** (contro malocchio)
- Spesso tiene un mazzetto di erbe in mano

**Sprite specs**: 24×40 px.

**Prompt**:
```
Pixel art sprite of Zia Gnura Carmela, 70-year-old Sicilian village wise woman and folk healer, rural Sicily 1958. Small, slightly bent posture, dark weathered wrinkled skin, piercing eyes, fully dressed in mourning black. Black headscarf covering hair, black shoulder shawl (mantillina), long black widow's dress over grey undergarment, dark apron with deep side pocket, heavy grey cotton stockings, black cloth shoes, red thread wristband against evil eye, holding small bundle of dried herbs. 24x40 pixels. 16-bit JRPG style Sea of Stars inspired. Limited dark warm palette. Side view idle pose. No antialiasing, crisp pixels. Transparent background.
```

### 5.3 Rosaria "Rusidda" La Rocca — giornalista aspirante

**Fisico**: 20 anni, capelli castano chiari legati indietro in coda, carnagione mediterranea chiara. Sveglia, postura dritta, sempre in movimento.

**Abbigliamento**:
- **Camicetta bianca** con colletto
- **Gonna a ruota** blu navy al ginocchio
- Cintura stretta marrone
- **Scarpe basse** marroni
- **Kodak Retina** al collo con cinturino di cuoio
- **Blocnotes** in mano
- **Matita dietro l'orecchio**

**Sprite specs**: 24×40 px.

**Prompt**:
```
Pixel art sprite of Rusidda, 20-year-old aspiring Italian journalist in rural Sicily 1958, daughter of the local carabinieri marshal. Light brown hair tied back in ponytail, fair Mediterranean skin, bright eyes, sharp posture. White collared blouse, navy blue knee-length A-line skirt, narrow brown belt, brown flat shoes. Vintage Kodak Retina 35mm camera on brown leather strap around neck, small paper notepad in left hand, pencil tucked behind right ear. 24x40 pixels. 16-bit JRPG style, Chrono Trigger / Sea of Stars palette. Side view idle and walking facing right. No antialiasing, crisp pixels. Transparent background.
```

### 5.4 Don Vicè Patanè — ex-minatore con protesi

**Fisico**: 55 anni, massiccio, spalle larghe, faccia segnata. Capelli grigi sotto la coppola. Braccio destro è una **protesi d'ottone steampunk**.

**Abbigliamento**:
- Coppola nera
- Camicia grezza écru manica corta
- Gilet marrone scuro
- Pantaloni di velluto robusto marrone
- **Protesi d'ottone** al braccio destro (tubi, piccole valvole, ingranaggi visibili); termina in guanto di cuoio con dita funzionali
- Stivali da minatore neri

**Sprite specs**: 32×48 px.

**Prompt**:
```
Pixel art sprite of Don Vice Patane, 55-year-old former Sicilian sulfur miner in rural Sicily 1958. Massive broad-shouldered build, weathered lined face, grey hair under black flat cap. Écru rough short-sleeved shirt, dark brown vest, heavy brown corduroy trousers, black miner boots. CRITICAL DETAIL: right arm is a steampunk brass prosthetic from shoulder down, showing visible pipes, small valves, tiny gears, leather glove at the end of brass forearm. Brass color B08D57, rust accents 8C3A2A. 32x48 pixels. 16-bit JRPG style Sea of Stars inspired. Side view. No antialiasing, crisp pixels. Transparent background.
```

### 5.5 Nnà — automa-bambino

**Fisico**: alto quanto un bambino di 6 anni (~100 cm). Viso di porcellana con sottili linee di giuntura. Occhi con **luce magenta calda**. Tunica di lino grezzo che copre parte del corpo meccanico. Ticchetta.

**Prompt**:
```
Pixel art sprite of "Nna", mysterious child-sized steampunk automaton found in ancient Sicilian underground ruins. Approximately 100cm tall (like a 6-year-old). Simple hand-woven écru linen tunic that partially hides the mechanical body. Face like fine porcelain with visible hairline seams, eyes glowing soft magenta D64550, antique brass mechanical joints visible at wrists and ankles, small pendulum visible through small rectangular opening in chest, bare mechanical feet with small brass toes. Slightly eerie, elegant, melancholic. 24x40 pixels. 16-bit JRPG style. Limited palette (cream F2EAD3, linen, antique brass B08D57, magenta glow D64550). Side view idle. No antialiasing, crisp pixels. Transparent background.
```

### 5.6 Ingegnere Vàlter Hoss — antagonista del Nord

**Fisico**: 45 anni, tedesco o milanese, alto, magro, rigido. Capelli biondi cenere pettinati indietro. Occhi azzurro freddo. **Nessun elemento siciliano** — contrasto voluto.

**Abbigliamento**:
- **Completo tre pezzi** in tweed grigio-verde
- Camicia bianca, cravatta scura
- **Orologio da taschino** con catena visibile
- **Occhiali tondi** di tartaruga
- **Fedora grigio**
- Valigia di cuoio con strumenti tecnici

**Prompt**:
```
Pixel art sprite of Engineer Walter Hoss, 45-year-old northern European engineer visiting rural Sicily in 1958. Tall and lean, stern angular features, cold pale blue eyes, ash blonde hair combed back neatly. Small round tortoiseshell glasses. Grey-green three-piece tweed suit, white shirt with dark tie, visible pocket watch with brass chain, grey fedora hat, worn leather briefcase in hand full of technical instruments. NO Sicilian clothing elements — he is a visible foreigner. 32x48 pixels. 16-bit JRPG style. Cool grey-green palette in contrast to warm Sicilian surroundings. Side view. No antialiasing, crisp pixels. Transparent background.
```

### 5.7 Don Cola Favara — capo confraternita (antagonista)

**Fisico**: 65 anni, piccolo, secco, carismatico. Postura regale. Capelli bianco-grigi. Non è un boss mafioso — è un patriarca enigmatico.

**Abbigliamento**:
- **Coppola nera di lana buona** (non fustagno povero come Turi)
- **Camicia nera** abbottonata al collo
- **Giacca di velluto nero** lunga al ginocchio
- Pantaloni neri con piega stirata
- **Bastone da passeggio** di legno scuro con **pomo d'ottone** a forma di spirale sicana
- **Anello d'ottone** grande con spirale incisa (simbolo confraternita)
- Scarpe di cuoio lucide nere

**Prompt**:
```
Pixel art sprite of Don Cola Favara, 65-year-old Sicilian village elder and head of a secret guardian brotherhood in 1958. Small wiry build, dignified regal presence, sharp refined face, white-grey hair under black wool flat cap (quality, not peasant). Black shirt buttoned to the neck, long black velvet coat to the knee, pressed black trousers. Dark wooden walking cane with brass pommel shaped like an ancient sican spiral. Large brass ring on right hand with engraved spiral. Polished black leather shoes. Enigmatic, NOT a mafia boss — more like a village patriarch with secret knowledge. NO mafia iconography (no lupara shotgun, no aggressive pose). 32x48 pixels. 16-bit JRPG style. Dark palette with brass spiral accents. Side view, dignified still pose. No antialiasing, crisp pixels. Transparent background.
```

---

## 6. Ambienti (tileset e backgrounds)

### 6.1 Santam — esterno diurno (paese)

**Mood**: paese di calce e ocra al sole, calanchi bianchi sullo sfondo, cielo slavato dal caldo.

**Prompt tileset**:
```
Pixel art tileset 16x16 pixels, 1950s Sicilian hill village "Santam" in summer afternoon light, side view. Warm limestone architecture: white limewash walls slightly peeled, ochre curved roof tiles, yellow sandstone door frames, dark wooden doors with iron studs, faded green-grey shutters, rusted wrought-iron balconies, cobblestone street with irregular yellow stones, stone water fountain with brass spout, low dry-stone walls, prickly pear cactus, dry almond trees, scrub grass. Subtle steampunk additions: small brass pipes emerging from walls, analog pressure gauges next to shop entrances, rusted tin shop signs. Palette: ochre C08040, limewash F2EAD3, sandstone yellow E8D4A2, dark wood 6B4423, rust 8C3A2A, pale dusty sky A8C4D4. 16-bit JRPG style inspired by Sea of Stars, Eastward, Chrono Trigger. Seamless edges, crisp pixels, no antialiasing.
```

### 6.2 Calanchi (badlands)

**Mood**: paesaggio lunare bianco-ocra-argento, sole a picco, silenzio.

**Prompt**:
```
Pixel art tileset and background 16x16, Sicilian calanchi badlands landscape, side view with parallax layers. Eroded chalky clay hills in pale white and ochre stripes, vertical dry gullies, sparse asphodel stalks, cracked dry soil with wide fissures, occasional bleached bone fragment, faint goat footpath, mediterranean harsh sunlight atmosphere. Pale warm palette: limewash F2EAD3, sandstone E8D4A2, ochre C08040, dry olive green 7A8450 used sparingly. 16-bit JRPG style, Terranigma desert dungeon inspired. Crisp pixels, no antialiasing. Empty silent atmosphere.
```

### 6.3 Zolfara abbandonata (dungeon iniziale)

**Mood**: industrial-morto anni '50, zolfo residuo, macchinari arrugginiti, fantasmi di lavoratori.

**Prompt**:
```
Pixel art tileset 16x16 for an abandoned Sicilian sulfur mine circa 1955, side view. Rusted wooden mining headframe (castello), steam winch engine (argano a vapore) covered in rust and dust, narrow-gauge mining rail tracks (Decauville 600mm) with one tipped-over ore cart, peeling wooden worker shacks, abandoned brick Gill furnace (two connected chambers), black vertical pit openings in ground, yellow sulfur residue stains everywhere, rusted carbide lamps hanging from nails, old goat skulls, work clothes still hanging. Dead industrial decay atmosphere. Palette: rust 8C3A2A, sulfur yellow E8C547, dark weathered wood 6B4423, dust white F2EAD3, soot black 2B2A28. 16-bit JRPG style, SteamWorld Dig influence. Crisp pixels, no antialiasing. Melancholic, slightly haunted.
```

### 6.4 Nicrò (primo livello sotterraneo)

**Mood**: grotte artificiali-naturali, gesso bianco traslucido, torce, tombe a tholos nei muri.

**Prompt**:
```
Pixel art tileset 16x16 for "A Nicro", the first underground level of ancient Sicilian sican tombs beneath a village, side view. Chalk and gypsum walls with translucent selenite crystals glowing faintly, ancient sican tholos tomb entrances carved into walls (domed dark openings), wooden rope torches casting warm orange light, small water puddles, clay amphoras and pottery shards, faint bat silhouettes near ceiling. Cool ghostly palette: gypsum white E8D4A2, selenite sky A8C4D4, dark tomb entrance 2B2A28, warm torch F4E8C1, olive patina 7A8450. 16-bit JRPG style, first-level dungeon mood, slight otherworldly atmosphere. Crisp pixels, no antialiasing.
```

### 6.5 Kàmikos (macchina finale)

**Mood**: la Macchina — steampunk organico, vapore magenta, ingranaggi titanici antichi, geometria impossibile.

**Prompt**:
```
Pixel art tileset and background 16x16 for "Kamikos", an ancient sentient steampunk machine-city beneath a Sicilian village, dungeon side view. Massive antique brass gears embedded in gypsum walls slowly rotating, magenta glowing vapor vents, copper pipes intertwined like tree roots, ancient sican spiral engravings glowing gold on walls, rotating clockwork arms suspended from ceiling, architecture that feels impossible and alive. Dark main atmosphere punctuated by hot magenta D64550 and sulfur gold E8C547 glow, brass B08D57 and bronze 6E4A2E dominant. Mood: Howl's Moving Castle machine interior meets Laputa robot garden meets ancient Cretan labyrinth. 16-bit JRPG endgame dungeon. Crisp pixels, no antialiasing. Awe and dread.
```

### 6.6 Interno casa siciliana anni '50

**Mood**: cucina contadina povera ma calda, focolare, tavolo di legno.

**Prompt**:
```
Pixel art tileset 16x16 of the interior of a poor Sicilian peasant house in 1958, side view. Whitewashed walls slightly stained by smoke, stone floor, wooden beam ceiling, open brick fireplace (fucagna) with copper pot on tripod, heavy oak table with straw-bottomed chairs, wooden chest of drawers (cantaranu), iron bed frame in background, faded family photographs on wall, dried herb bundles hanging from beam, oil lamp on table, small Phonola bakelite radio on shelf, black cast-iron stove. Warm evening palette: limewash F2EAD3, dark wood 6B4423, terracotta C08040, soot black 2B2A28, warm oil lamp light F4E8C1. 16-bit JRPG interior, Eastward inspired. Crisp pixels no antialiasing.
```

---

## 7. Oggetti, icone, UI

### Oggetti chiave (16×16 o 24×24)
- **Chiave inglese di Turi** — ottone + manico di cuoio
- **Bicchiere di vino rosso** — vetro spesso
- **Radio Phonola 547** — bachelite caramello, manopole nere
- **Lampada ad acetilene** — ottone, fiamma bianca, alone giallo quando accesa
- **Ingranaggio** — vari tipi (piccolo/medio/grande dentato)
- **Pane cunzato** — pane dorato con oliva, acciuga, filo d'olio
- **Corda di canapa**
- **Chiave di ferro antica**
- **Coltello a serramanico**
- **Moneta da 100 lire** (argento, 1958)
- **Pacchetto di sigarette Nazionali** (blu)
- **Biglietto del treno** ferrovia Lercara-Magazzolo

### UI
- **Dialog box** — cornice seamless 8×8 con angoli leggermente arrotolati, stile vecchia carta di bottega
- **HP bar** — orizzontale, iconografia "caldaia a vapore" (con piccola valvola)
- **Vapore bar** (al posto di MP) — verticale, con fumo magenta che sale
- **Font** — pixel monospace stile *Chrono Trigger*, 8×8, con supporto accenti italiani (à è ì ò ù)
- **Inventario** — griglia 6×4 con cornici di ottone brunito
- **Mini-map** — non prioritaria (side-scroll la rende meno utile)

---

## 8. Esempi di prompt pronti all'uso

### 8.1 Gemini 2.5 Flash / Gemini 2.0 Flash (image generation diretta)

**Template:**
```
Create a pixel art sprite for our Sicilian steampunk JRPG "Santam". Setting: rural Sicily 1958, style is 16-bit Chrono Trigger / Sea of Stars inspired pixel art. Specifications: [SIZE] pixels, transparent PNG background, NO antialiasing or blur, limited warm earth palette (ochre, sienna, cream, brass, sulfur yellow), crisp hard pixel edges.

Subject: [DESCRIPTION]
View: side view, idle pose.

Output a single PNG file.
```

### 8.2 Midjourney v6

**Template:**
```
pixel art sprite, 16-bit JRPG, Chrono Trigger Sea of Stars style, [SUBJECT], [KEY DETAILS], side view idle, limited palette [NAME 3-4 DOMINANT COLORS], crisp pixels, no antialiasing, transparent background --ar 1:1 --stylize 100 --v 6
```

Nota: Midjourney non produce vero pixel art (immagini "pixel-simili" con gradient sottili). Ottimo per **concept e mood**, sempre **da ritoccare in Aseprite** per renderlo veramente pixel-perfect.

### 8.3 Retro Diffusion (specializzato pixel art)

**Template:**
```
[SUBJECT], [DETAILS], 16-bit style, JRPG, side view, limited warm earth palette, crisp pixels

Settings:
- Pixel size: 1
- Size: 64x96 (for 32x48 sprite, generate 2x and downsample)
- Samples: 25
- Guidance: 7-8
```

### 8.4 Stable Diffusion locale (con LoRA pixel art)

**Positive**:
```
<lora:PixelArtXL:1> pixel art, 16-bit JRPG, Sea of Stars style, [SUBJECT], [DETAILS], side view, limited warm palette (ochre, sienna, cream, brass), crisp pixels
```

**Negative**:
```
antialiasing, blur, gradient, smooth shading, 3d render, photorealistic, anime, cel shading, motion blur, high resolution, soft edges
```

### 8.5 ChatGPT / Claude (per generare prompt di qualità)

Incolla questo brief intero nella chat + chiedi:
> *"Basandoti su questo brief, scrivi un prompt ottimizzato per [Midjourney v6 / Retro Diffusion / DALL-E 3 / Stable Diffusion] per creare lo sprite di **[PERSONAGGIO / LUOGO / OGGETTO]**. Includi tutti i dettagli di palette e stile richiesti dal brief e rispetta i vincoli NO (religione, mafia, anime, futuristico)."*

---

## 9. Come valutare l'output (checklist qualità)

Per ogni asset ricevuto dall'AI, verifica **punto per punto**:

- [ ] **Palette compliance** — tutti i colori sono nella palette master (§4)? Apri in Aseprite → *File → Export → Indexed* → conta i colori. Massimo 16-24.
- [ ] **Pixel-perfect** — zoomare al 800%. Ogni pixel è netto? Nessun grigio intermedio che suggerisce antialiasing nascosto?
- [ ] **Silhouette leggibile** — stampa/visualizza lo sprite come nero su bianco pieno. Si riconosce ancora chi/cosa è?
- [ ] **Scala consistente** — il personaggio ha l'altezza corretta (32/48 px)? Se affiancato ad altri sprite del set, il rapporto è giusto?
- [ ] **Stile coerente** — livello di dettaglio, densità dithering e "sentire" del tratto sono allineati col resto del set?
- [ ] **Trasparenza** — sfondo è davvero trasparente? Nessun halo bianco/rosa ai bordi?
- [ ] **Posa viva** — bilanciata, leggibile, non rigida?
- [ ] **Vincoli rispettati** — nessuna croce, nessun santo, nessuna lupara, nessun cliché mafioso, nessun elemento futuristico?

Se qualcosa fallisce:
1. **Rigenera** con prompt più stringente, aggiungendo vincolo specifico al negative
2. **Oppure correggi in Aseprite** — per fix di palette e pixel è spesso più veloce che rigenerare

---

## 10. Workflow consigliato

1. **Concept** con Midjourney (molte varianti, cerca il mood giusto)
2. **Estrai palette** dalla variante migliore — [Coolors.co](https://coolors.co) o Aseprite → *Sprite → Palette → Load From Image*
3. **Unifica palette** — aggiungi/correggi colori per allineare alla **palette master (§4)**
4. **Rigenera asset specifici** con Retro Diffusion o PixelLab fornendo la palette
5. **Ritocca in Aseprite** — correggi pixel, pulisci alpha, esporta sprite sheet con spacing uniforme
6. **Testa in Godot** — drop del PNG nel progetto, import con filtro **Nearest**, verifica a schermo pieno (F5)
7. **Itera** se qualcosa stona (animazioni scattose = manca inbetween frame; colori stonano = ritorna a step 3)

---

## 11. Vincoli progetto (repetita iuvant)

Da non violare mai quando si chiede un'immagine all'AI:

- **NO religione** — niente preti, madonne, croci, messe, processioni, suore, santi
- **NO mafia** — niente lupara, coppola in pose aggressive, stereotipi da film anni '70
- **NO anime / chibi / manga** — JRPG occidentale-mediterraneo, non giapponese
- **NO neon, cyberpunk, elementi post-1962** — siamo in Sicilia 1955-1962
- **NO verde brillante fantasy** — il nostro verde è grigio, arso, polveroso
- **NO texture photorealistiche** — pixel art pura, non render 3D

---

*Documento vivo. Aggiornare quando aggiungiamo personaggi, luoghi, oggetti al gioco.*
