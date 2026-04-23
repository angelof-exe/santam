# World Map — Territorio di Santam

> Documento di design della mappa di gioco. Si basa sulla geografia reale di **Sant'Angelo Muxaro** (AG) e sulla Sicilia centro-meridionale anni '50-'60, reinterpretata in chiave **steampunk mediterraneo**. Vincoli di progetto in `01_lore_bible.md` §12.

---

## 0. Nota di scala e uso

Santam è un **piccolo comune di collina**, ~2.400 abitanti, circondato da un territorio agricolo-minerario di raggio ~10 km. In gioco sarà reso come:

- **Overworld macro** (map screen stilizzata): territorio di Santam + accenni al mondo oltre (Girgenti, il Nord)
- **Overworld micro** (visita a piedi): il paese è attraversabile in pochi minuti reali; la valle richiede viaggi con carretto a vapore o funicolare
- **Interni** (scene dedicate): case, botteghe, miniere, dungeon

Le distanze reali non sono rispettate 1:1 — usiamo la realtà come **vocabolario**, non come vincolo topografico.

---

## 1. Geografia di fondo (dalla realtà)

Sant'Angelo Muxaro siede su una **collina di gesso** a forma di piramide tronca, 335 m sul livello del mare, sulla riva sinistra del **fiume Platani** (antico *Halykos*). La zona appartiene alla **serie gessoso-solfifera** siciliana: rocce evaporitiche del Messiniano (~6 milioni di anni fa), da cui si estraeva lo zolfo per tutto l'Ottocento e parte del Novecento. I pendii argillosi si modellano in **calanchi** — solchi e creste scavati dall'acqua, nudi di vegetazione.

Nella nostra finzione:

| Elemento reale | Nome in-game | Note |
|---|---|---|
| Fiume Platani (*Halykos*) | **U Pàtanu** | Scorre a nord del paese, ovest→est |
| Valle Gracella (affluente ovest) | **U Vadduni du Gràcciu** | Strada vecchia dei mulattieri |
| Valle Porcospino (affluente est) | **U Vadduni du Purcuspinu** | Terra dei cinghiali, poco battuta |
| Monte Castello (sito archeol.) | **Munti Casteddu** | Collina con castello normanno in rovina sopra acropoli sicana |
| Monte M. Pisu (sito archeol.) | **Munti Pisu** | Seconda collina, necropoli minore |
| Grotta di Sant'Angelo / Ciàvuli | **A Rutta du Ciàvulu** | Grotta naturale (≠ Nicrò artificiale) |
| Collina di gesso del paese | **A Rocca** | Lo sperone su cui sorge Santam |

### La geologia come motore narrativo

Il gesso è **bianco** e traslucido. Lo zolfo è **giallo** e puzza di uova marce quando brucia. Sono i due colori-chiave del territorio di superficie. Sotto terra, le camere di cristallizzazione del gesso creano **stanze naturali** che i Sicani ampliarono scavando: i **Ddieri**, da cui A Nicrò e, più giù, Kàmikos.

**Steampunk-hook:** lo zolfo della serie gessoso-solfifera è, letteralmente, il carburante di Kàmikos. Il fatto che le zolfare stiano chiudendo (vero, 1950-1970) non è casuale nel lore: *qualcosa sottoterra sta finendo di consumare il giacimento*.

---

## 2. Mappa d'insieme (ASCII, concettuale)

```
                              ▲ NORD
                              │
                   ┌──────────┴───────────┐
                   │   U PÀTANU (fiume)   │
                   └────────┬─────────────┘
                            │
        ╔═══════════════════╪════════════════════╗
        ║                   │                    ║
        ║   MUNTI PISU      │      MUNTI         ║
        ║   ░░░░░ (calanchi)│      CASTEDDU      ║
        ║   (necropoli      │      ▲▲▲           ║
        ║    minore)        │      (castello     ║
        ║                   │       in rovina)   ║
        ║                   │                    ║
        ║            ┌──────┴──────┐             ║
        ║  U VADDUNI │  SANTAM     │ U VADDUNI   ║
        ║  DU        │  ▓▓▓▓▓▓▓▓▓  │ DU          ║
        ║  GRÀCCIU   │  A Rocca    │ PURCUSPINU  ║
        ║   (ovest)  │  ▓▓▓▓▓▓▓▓▓  │  (est)      ║
        ║            └──────┬──────┘             ║
        ║                   │                    ║
        ║   A ZURFARA       │    U CAMPUSANTU    ║
        ║   VECCHIA         │    ANTICU          ║
        ║   (miniera        │    (tholos         ║
        ║    chiusa ′55)    │     sicane)        ║
        ║                   │                    ║
        ║                   │                    ║
        ║   I MASSERIE DA   │   I CALANCHI       ║
        ║   RIFORMA         │   (badlands)       ║
        ║   (sud-ovest)     │                    ║
        ║                   │                    ║
        ╚═══════════════════╪════════════════════╝
                            │
                            ▼  verso GIRGENTI (20 km)
```

Sotto il paese, in verticale:

```
     ═══════════ Santam (superficie, 335 m) ═══════════
             │
             │  cantine, cisterne, ddieri-magazzino
             │
     ─────── A NICRÒ (livello 1, -20 m) ─────────
             │
             │  tombe a tholos sicane, primi ingranaggi
             │
     ─────── I DDIERI FUNNUTI (livello 2, -60 m) ─────
             │
             │  geometria impossibile, architettura dedalica
             │
     ─────── U LABIRINTU (livello 3, -? m) ────────
             │
             ▼
     ═══════ U CORI DI KÀMIKOS (la macchina) ══════
```

---

## 3. Il paese — cinque quartieri

Santam è piccola ma stratificata. Cinque aree, ognuna con carattere e funzione diversa.

### 3.1 A Rocca Àuta (il borgo alto)
La cima dello sperone. Case medievali addossate, vicoli strettissimi. Qui vivono le famiglie più antiche (i **Patanè**, i **Favara**, gli **Sciacca** — la famiglia di Turi). Poche finestre sul vuoto dei calanchi, molte cantine scavate nel gesso che scendono nella Nicrò.
**Steampunk:** quasi assente in superficie — ma sotto ogni casa una cantina con condotti d'ottone che tubano vapore "da sempre", senza che nessuno chieda da dove.

### 3.2 A Chiazza Granni (piazza grande)
Il cuore civile. Torre civica con orologio, fontana pubblica, bar **"U Tempu"** (ritrovo di Turi e Rusidda), Municipio, **stazione della posta pneumatica**, lavatoio coperto.
**Steampunk:** il sistema di **posta pneumatica a vapore** collega il Municipio alla Caserma, al Castello e al mulino — tubi d'ottone che corrono sui muri sopra i portici. Era l'orgoglio modernista del sindaco negli anni '30; ora metà dei tubi fischiano e perdono pressione.

### 3.3 U Stratali (il corso principale)
La via che sale dalla piazza al Castello. Botteghe a entrambi i lati:
- **Barberia Carusu** — di Don Nicola, centro del pettegolezzo; TV in bianco e nero dal 1955
- **Ferramenta & Riparazioni Sciacca** — bottega della famiglia di Turi (punto di salvataggio + crafting)
- **Sartoria "A Gugghia"** — sarta Nittuccia, acquista stoffe e vende equipaggiamento leggero
- **Drogheria Patanè** — farmacia/droghiere, oggetti curativi
- **Edicola-cartoleria "U Giurnali"** — posto frequentato da Rusidda, quest-giver informativa
- **Fondaco du Vinu** — bottiglie, taverna serale, rumori e risse

**Steampunk:** ogni bottega ha **un cartello d'ottone con contatore a vapore** (fittizio o funzionante) — retaggio di una regolamentazione comunale degli anni '20 che voleva standardizzare gli esercizi. In bottega Sciacca, il contatore è reale e si usa come punto di crafting.

### 3.4 A Vinedda Arbareska (il vicolo albanese)
Vestigio storico reale: Sant'Angelo Muxaro fu rifondata nel **1506 da rifugiati albanesi** in fuga dall'invasione ottomana. Nella nostra finzione, un piccolo reticolo di vicoli nella parte est del paese conserva:
- Architettura diversa (balconi in legno scuro, portali ogivali)
- Cognomi arbëreshë ormai sicilianizzati (**Mandalà**, **Skanderbegu**, **Gjonci**)
- Vecchi che infilano parole arbëreshë nel siciliano (niente di comprensibile per Turi, ma tradotto a beneficio del giocatore)
- **NON** c'è componente religiosa/rituale (vincolo di progetto)

**Ruolo narrativo:** un personaggio secondario arbëreshë conosce storie antiche sui "**custodi**" — una tradizione orale parallela a quella sicana che finisce per incrociare i Figghi di Kòkalos.

**Steampunk:** nel vicolo c'è una vecchia **fonderia d'ottone** del primo Novecento (chiusa da 20 anni), il cui proprietario albanese fabbricava orologi da torre in tutta la Sicilia. Dungeon secondario opzionale.

### 3.5 I Finaiti (i bordi)
Le case povere che si sfarinano sui calanchi. Qui vive la gente spostata dalla miniera chiusa. Tetti rattoppati, galline, muri a secco. Contadini, minatori senza miniera, una vedova del crollo '53. È la zona più "reale" del paese — dove si tocca l'emigrazione, la fame, la Riforma Agraria non mantenuta.

**Steampunk:** nei Finaiti quasi nessuna tecnologia — fatta eccezione per **una caldaia comunale** installata nel 1949 per scaldare l'acqua di un paio di cortili, che funziona ancora e raduna donne e bambini alla sera.

---

## 4. Luoghi chiave (punti di interesse + ruolo di gameplay)

### Dentro le mura

| Luogo | Sicil. / descrizione | Ruolo gameplay | Elemento steampunk |
|---|---|---|---|
| **Casa Sciacca** | *Ferramenta e bottega di famiglia*, piazzetta sotto la Rocca Àuta | Hub iniziale. Save point, crafting, letto per dormire. | Officina con torni a pedale, contatore a vapore e una "pila" di nonno Peppe che ronza |
| **Torre Civica** | *A Turri* — orologio, sala riunioni comunali | Quest narrativi, accesso tetto (scorciatoia) | L'orologio si rimette da solo dal '43. Prima spia che la macchina è sveglia. |
| **Bar "U Tempu"** | Tavolini in marmo, flipper rotto, giradischi | Ritrovo, quest sociali | Macchina del caffè **a doppia caldaia** enorme, soprannominata "*A Beddra*" |
| **Caserma Carabinieri** | Piccolo presidio, 3 uomini | Quest legali, talvolta ostacolo | Centrale della posta pneumatica civile |
| **Scuola Elementare** | Ex-palazzotto ottocentesco | Quest secondaria con i bambini del paese | Lavagna **scorrevole a vapore** (dono fascista mai rimosso, inutilizzata) |
| **Fondaco du Vinu** | Taverna + locanda | Informazioni, risse, mini-gioco carte | Mescitore automatico a ottone rotto metà del tempo |
| **Fonderia Arbareska** | Abbandonata dal 1938 | Dungeon opzionale, 1-2 ore | Automi incompiuti ancora attivi, memorie del fonditore |
| **Mulino du Pàtanu** | A valle, sul fiume | Hub produttivo, quest sulla madre di Turi | Mulino **ibrido ad acqua + vapore**, ruote e pistoni |

### Intorno al paese

| Luogo | Descrizione | Ruolo gameplay | Nota steampunk |
|---|---|---|---|
| **A Zurfara Vecchia** | Miniera di zolfo chiusa nel 1955. Cantieri rugginosi, argani in ferro, baracche dei carusi. | **Dungeon iniziale** (Atto 0/1). Memoria di Don Vicè. | Macchinari d'estrazione d'epoca, alcuni ancora animati da fantasmi-vapore |
| **A Zurfara Nova** | Miniera tentata nel 1952, mai entrata in produzione. Il padrone si suicidò. | Quest sidequest "Il padrone" | Pozzo trivellatore a vapore arrugginito, valvola che urla |
| **U Campusantu Anticu** | Necropoli sicana, 200+ tombe rupestri e a tholos, inclusa la **Tomba du Principi Kòkalos**. | **Set-piece narrativo**, accesso segreto a Kàmikos | Nelle tholos più profonde, gli ingranaggi di Kàmikos si intravvedono dietro le pareti |
| **Munti Casteddu** | Collina con castello normanno in rovina sopra acropoli sicana. Residenza attuale dell'Ingegnere Hoss. | **Dungeon di fine Atto 3** | L'Ingegnere ha installato un **laboratorio a vapore e elettricità** negli ambienti normanni — contraddizione visiva voluta |
| **Munti Pisu** | Collina minore a nord. Poche tombe, pascoli. | Quest di raccolta, scontri easy | Un pastore ha un meccanismo a vapore per mungere le pecore (miserabile, pittoresco) |
| **A Rutta du Ciàvulu** | Grotta naturale di 1.760 m, due rami con acqua. **≠ Nicrò** (artificiale). | Dungeon acquatico di metà gioco | Niente macchine: solo natura. Contrasto voluto col sotto-paese. |
| **I Calanchi** | Badlands di argilla. Distese bianco-ocra erose. | Aree-battaglia e traversata | Nessuno steampunk: sono il "deserto" del gioco |
| **I Masserie da Riforma** | Piccole fattorie assegnate post-1950 a famiglie povere. 4-5 nuclei sparsi a sud-ovest. | Quest agrarie, informazioni | Alcune famiglie usano trattori a vapore surplus della II Guerra |
| **A Stazione du Trenu** | Stazione ferroviaria dismessa della linea secolare Aragona-Lercara (linea reale). | Hub per il "resto del mondo" | Una locomotiva a vapore abbandonata è **il mezzo per arrivare a Girgenti** se il giocatore la ripara (quest lunga) |

---

## 5. Territorio fuori dal paese (extra-hex)

Santam non è isolata. Il giocatore sente il resto del mondo attraverso:

- **Girgenti** (Agrigento), 20 km a sud. Centro provinciale. Visitabile in un capitolo medio — vero shock urbano per Turi che non è mai uscito dal paese.
- **Cianciana, Aragona, Raffadali** — paesi vicini della stessa vallata. Accenni tramite NPC, giornali, lettere.
- **Palermo, Roma, Milano, Monaco, New York** — il mondo oltre. Presenti solo come **lettere dei parenti emigrati** e giornali dell'edicola. Turi li legge sognando.

Il contrasto fondativo di Santam è proprio questo: **un paese che sta fermo mentre il mondo corre**. Il vapore, sotto, aspetta dall'età del bronzo.

---

## 6. Underworld — Kàmikos (sintesi per la mappa)

Dettaglio completo in un futuro `04_dungeons_kamikos.md`. Per la mappa serve sapere:

- **Accessi noti** (in superficie): (1) crepa della piazza — si apre nell'Atto 0; (2) pozzo della Zurfara Vecchia; (3) tomba del Principe al Campusantu Anticu; (4) cantina di Casa Favara (solo per i Figghi di Kòkalos). Un quinto accesso è segreto e va scoperto.
- **Estensione**: Kàmikos si estende **ben oltre i confini del paese in superficie**. Il Labirinto ha camere sotto Munti Casteddu, sotto il Pàtanu, persino sotto Girgenti.
- **Navigazione**: non lineare. Dopo il primo ingresso, il party può uscire e rientrare da punti diversi — mappa sotterranea separata, sbloccabile a pezzi.

---

## 7. Sistemi di mappa e viaggio

### 7.0 Modello di navigazione (decisione di design)

Il gioco usa **navigazione laterale 2D in vista laterale** (side-view), **non top-down**. Il giocatore si muove solo orizzontalmente (sinistra/destra). Ai **bivi** — punti specifici dove più percorsi si incontrano — si ferma sopra una *Exit Zone* e preme **↑** (analogico in su o freccia su) per prendere il ramo alternativo; **↓** per scendere. Modello ispirato a JRPG come *Odin Sphere*, *Valkyrie Profile*, *Muramasa*.

**Implicazioni visive e di design:**
- Mappe pensate con **parallax**: foreground (gameplay), midground (edifici), background (cielo/calanchi)
- NPC ed edifici disegnati **in vista laterale**, non dall'alto
- Transizioni tra corridoi = "porte invisibili" ai bivi con feedback UI (prompt "↑" visibile quando il player è nella zona)
- Il paese (cinque quartieri, §3) si traduce in una **catena di corridoi laterali** collegati da bivi verticali (salite/scalinate) e orizzontali (porte/archi)
- Kàmikos sotterranea si presta naturalmente al side-view: camere-corridoio con ingranaggi giganti sullo sfondo, vapore in alto, pozzi in basso

### 7.1 Traversata e fast travel

- **Viaggio a piedi** dentro il paese: real-time esplorazione
- **Carretto a vapore** per le masserie / zolfare / Munti: fast travel sbloccabile a metà Atto 1
- **Funicolare della Rocca**: scorciatoia verticale dentro il paese, funziona a gettoni di zolfo
- **Locomotiva della Stazione**: fast travel verso Girgenti e oltre, richiede quest di riparazione (Atto 2)
- **Mappa sotterranea**: separata, si sblocca a tessere scoperte
- **Giorno/notte**: ciclo semplice — alcune quest e negozi cambiano di disponibilità
- **Meteo**: scirocco (gialla la luce, -acc alla party), tramontana (rinfresca, +vapore caldaia), pioggia rara (riattiva i calanchi come pericolo di frana)

---

## 8. Tone & rendering per l'artista

Note pratiche per il pixel artist che farà i tileset:

- **Palette "superficie giorno"**: ocra 1/2/3, giallo zolfo, bianco calce, marrone calanchi, verde oliva sporco, azzurro cielo Sicilia (molto chiaro, quasi slavato)
- **Palette "superficie notte"**: blu di Prussia, nero caldo, arancio lampione a olio, giallo uovo delle finestre illuminate
- **Palette "sottosuolo"**: nero compatto, rame ossidato, verde-rame, magenta (luci della macchina), giallo-verde (zolfo fluorescente), bianco gesso cristallino
- **Dettagli ricorrenti di tileset**: muretti a secco, tegole di canale, portali in pietra gialla di Sabucina, balconi in ferro battuto, catuli (carretti a mano), tubature d'ottone che spuntano dai muri senza logica apparente
- **Scala personaggi**: ~24–32 px, mondo a tile 16 px (scelta finale da validare dopo prototipo)
- **Nessun pixel art verde brillante**. Il verde di Santam è grigio, arso, polveroso.

---

## 9. Riferimenti reali usati per questo documento

- [Area archeologica di Sant'Angelo Muxaro — Parco Valle dei Templi](https://parchiarcheologici.regione.sicilia.it/valle-templi/en/siti-archeologici/area-archeologica-e-museo-santangelo-muxaro/)
- [Sant'Angelo Muxaro — Wikipedia](https://en.wikipedia.org/wiki/Sant'Angelo_Muxaro)
- [Sant'Angelo Muxaro — Treccani](https://www.treccani.it/enciclopedia/sant-angelo-muxaro/)
- [Breve storia di Sant'Angelo Muxaro — Rifugio di Dedalo](https://www.agriturismorifugiodidedalo.it/breve-storia-sant-angelo-muxaro/)
- [Grotte di Sant'Angelo Muxaro — Legambiente Riserve](https://www.legambienteriserve.it/s-angelo-muxaro-cave/)
- [Il regno di Kokalos — Archeosicilia](https://archeosicilia.blogspot.com/2015/12/santangelo-muxaro-e-il-regno-di-kokalos.html)
- [I Sicani di Kokalos rivivono a Sant'Angelo Muxaro — Le Vie dei Tesori](https://magazine.leviedeitesori.com/leggendari-sicani-di-kokalos-rivivono-a-santangelo-muxaro/)
- [Zolfo di Sicilia — Wikipedia](https://it.wikipedia.org/wiki/Zolfo_di_Sicilia)
- [I Carusi delle miniere di zolfo — Terzo Millennio UIL](https://terzomillennio.uil.it/blog/i-carusi-delle-miniere-di-zolfo/)
- [Carusi, piccoli schiavi nelle miniere — Storica NG](https://www.storicang.it/a/carusi-piccoli-schiavi-nelle-miniere-di-zolfo-di-sicilia_15279)

### Fatti reali incorporati
- Collina di gesso a piramide tronca, 335 m, sul Platani (Halykos)
- Serie gessoso-solfifera messiniana (~6 Ma)
- Calanchi argillosi
- 200+ tombe rupestri e tholos sul versante sud, XIII-VI sec. a.C.
- Grotta Ciàvuli di 1.760 m con due rami
- Mito di Kokalos, Dedalo, Minosse e le figlie del re
- Rifondazione albanese del 1506 (post-invasione ottomana)
- Tomba del Principe, patera d'oro al British Museum, anello con vacca e vitello
- Chiusura delle zolfare siciliane tra anni '50 e '70 per competizione americana
- Carusi, "soccorso morto", storia del lavoro minorile
- Riforma Agraria 1950

### Nomi dichiaratamente fittizi / fuori dalla realtà storica
- **Santam**, **Kàmikos**, **Nicrò** (come macchina senziente), **Figghi di Kòkalos**, tutti gli NPC, posta pneumatica del 1930 a Santam, funicolare e locomotiva ripristinabili, fonderia arbareska.

---

*Prossimo doc consigliato:* `03_characters.md` (schede cast dettagliate) o `04_dungeons_kamikos.md` (struttura del sottosuolo).
