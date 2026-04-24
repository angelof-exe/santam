# Setup — Ambiente di sviluppo Santam

Guida operativa per installare Godot, aprire il progetto, lanciare la scena di test e contribuire via git.

> Lore in [`01_lore_bible.md`](01_lore_bible.md) • mappa in [`02_world_map.md`](02_world_map.md) • ricerche di supporto in [`research/`](research/).

---

## 1. Prerequisiti

| Strumento | Versione | Note |
|---|---|---|
| **Godot** | 4.3 stable | 4.4 ok, progetto testato su 4.3 |
| **Git** | ≥ 2.30 | con chiave SSH GitHub configurata |
| **Aseprite** (opz.) | ultima | per pixel art — alternativa gratis: LibreSprite |
| **VSCode** (opz.) | ultima | con estensione `godot-tools` per autocomplete GDScript |

---

## 2. Installare Godot 4.3 su Linux

Download diretto ufficiale (consigliato):

```bash
cd ~/Scaricati
wget https://github.com/godotengine/godot/releases/download/4.3-stable/Godot_v4.3-stable_linux.x86_64.zip
unzip Godot_v4.3-stable_linux.x86_64.zip
sudo mv Godot_v4.3-stable_linux.x86_64 /usr/local/bin/godot
sudo chmod +x /usr/local/bin/godot
godot --version   # verifica
```

Alternative: `snap install godot-4`, Flatpak (`flatpak install flathub org.godotengine.Godot`), o dal sito [godotengine.org](https://godotengine.org/download/).

---

## 3. Aprire il progetto

1. Lancia Godot: `godot`
2. Project Manager → **Import**
3. Naviga a `/home/angelo-zorin/Scrivania/videogame`
4. Seleziona `project.godot` → **Open**
5. Godot crea la cartella `.godot/` (cache, già in `.gitignore`) e importa `icon.svg` generando `icon.svg.import` (da committare in git).

---

## 4. Struttura del progetto

```
videogame/
├── project.godot              config Godot
├── icon.svg                   icona placeholder
├── .gitignore                 ignora .godot/, build, OS files
├── addons/                    plugin (Dialogue Manager, Phantom Camera…)
├── assets/
│   ├── sprites/               sprite personaggi / oggetti
│   ├── tilesets/              tileset mappe
│   ├── ui/                    HUD, font, cornici
│   ├── music/                 .ogg
│   └── sfx/                   .wav
├── scenes/
│   ├── characters/            .tscn personaggi
│   │   └── player.tscn
│   ├── world/                 mappe/ambienti
│   │   └── test_room.tscn
│   ├── combat/                scena battaglia (futura)
│   ├── ui/                    menu, HUD, inventario
│   └── cutscenes/             sequenze narrative
├── scripts/
│   ├── autoload/              singleton globali
│   │   ├── game_state.gd
│   │   └── audio_manager.gd
│   ├── entities/              comportamento entità
│   │   └── player.gd
│   └── systems/               dialog, save, combat…
├── resources/                 .tres custom (item, nemici, skill)
└── docs/
    ├── 00_setup.md            questo file
    ├── 01_lore_bible.md
    ├── 02_world_map.md
    └── research/              dossier di ricerca
        ├── 01_archaeology_geography.md
        ├── 02_steampunk_tech.md
        └── 03_culture_folklore.md
```

---

## 5. File creati nel setup iniziale

### `project.godot`
Config principale. Settings chiave:
- **Viewport** 320×180 (base pixel), **window override** 1280×720 (scala ×4)
- **Stretch mode** `viewport` + **aspect** `keep` → scaling pixel-perfect
- **Texture filter** `Nearest` → niente blur su sprite ingranditi
- **Snap 2D transforms/vertices to pixel** → niente jitter sub-pixel
- **Renderer** `gl_compatibility` → leggero, ottimo per 2D
- **Autoload**: `GameState` e `AudioManager` come singleton

### `scripts/autoload/game_state.gd`
Singleton `GameState` accessibile ovunque. Contiene `party`, `inventory`, `flags`. Espandere con sistemi di save quando servirà.

### `scripts/autoload/audio_manager.gd`
Singleton `AudioManager`. Scheletro con `play_sfx()`, `play_music()` — da implementare.

### `scripts/entities/player.gd`
`CharacterBody2D` con movimento top-down 4 direzioni. Input: frecce (`ui_left/right/up/down`). Velocità `speed = 80.0` (export, modificabile in editor). Da evolvere: animazioni, interact, collision layers.

### `scenes/characters/player.tscn`
- **Player** (`CharacterBody2D`) con `player.gd`
- **Visual** (`Polygon2D`) quadrato 12×12 ocra (placeholder da sostituire con sprite)
- **CollisionShape2D** (`RectangleShape2D 12×12`)
- **Camera2D** figlio → segue il player

### `scenes/world/test_room.tscn`
- **Background** (`ColorRect`) marrone scuro 320×180
- **Player** istanziato

È la `main_scene` di `project.godot` — parte con F5.

---

## 6. Eseguire il test

Con il progetto aperto in Godot:

- **F5** → esegue la `main_scene` (`test_room.tscn`)
- Si apre una finestra 1280×720:
  - Sfondo marrone scuro
  - Quadratino ocra (Turi placeholder) al centro
- **Frecce** → si muove
- Output console:
  ```
  [GameState] ready
  [AudioManager] ready
  ```

Se Turi si muove, l'ambiente è operativo.

---

## 7. Git workflow

Repo: `git@github.com:angelof-exe/santam.git` — branch `main`.

```bash
git status                 # vedere stato
git add <file>             # stage
git commit -m "msg"        # commit
git push                   # spingere su GitHub
git pull                   # tirare aggiornamenti
```

**Cosa tracciare / non tracciare:**
- ✅ `assets/`, `scenes/`, `scripts/`, `resources/`, `docs/`
- ✅ `project.godot`, `.gitignore`, `icon.svg`, file `*.import` generati da Godot
- ❌ `.godot/` (cache, in gitignore)
- ❌ Export binari (`build/`, `.pck`, eseguibili compilati)

**Convenzione commit message:**
- `docs:` documentazione
- `feat:` nuove feature di gioco
- `fix:` bug fix
- `art:` asset grafici
- `chore:` manutenzione/tooling

---

## 8. Plugin consigliati (AssetLib dentro Godot)

Installabili quando serviranno:

| Plugin | Scopo | Quando |
|---|---|---|
| **Dialogue Manager** (Nathan Hoad) | Sistema di dialoghi branching | Ai primi NPC |
| **Phantom Camera 2D** | Camera 2D con shake / smoothing / zone | Cutscene e combat |
| **Aseprite Wizard** | Import automatico `.ase` con anim | Con sprite Aseprite |
| **GUT** | Unit testing GDScript | Quando il codice cresce |

Installazione: *AssetLib* → cerca → Download → abilita in *Project Settings → Plugins*.

---

## 9. Stato di implementazione e controlli

### 9.1 Sistemi implementati

- ✅ Movimento laterale del Player + flip sprite sulla direzione
- ✅ Collisioni ai bordi (muri StaticBody2D)
- ✅ Transizioni fra scene via **ExitZone** (↑/↓ configurabili)
- ✅ Sistema **dialoghi** (DialogueManager autoload + DialogueBox UI)
- ✅ **NPC** base class con prompt "!" e dialogo multi-linea
- ✅ **Interactable** / **Sign** con prompt "?"
- ✅ Sistema **flag** (GameState.set_flag / has_flag)
- ✅ Dialoghi **alternativi basati su flag** (NPC.dialogue_after_flag)
- ✅ **ItemPickup** + **inventario** (GameState.inventory)
- ✅ **Inventory UI** toggled con Tab
- ✅ **Combat skeleton** turn-based (scena `battle.tscn`, bottoni Attacca/Fuggi)
- ✅ **HP persistente** (GameState.player_hp), danno porta a Game Over
- ✅ **Game Over screen** con "Torna al menu"
- ✅ **Save/Load** JSON (`user://savegame.json`) + **SaveSpot** interactable, auto-load al boot, SaveSpot cura anche HP a full
- ✅ **Main menu** (Nuova partita / Continua / Esci) come scena d'ingresso
- ✅ **Pause menu** in-game (Esc) con Continua / Salva / Torna al menu / Esci
- ✅ **HP HUD** overlay persistente in overworld, auto-nascosto in menu/battle
- ⬜ Player animazioni (walk cycle, idle, attack)
- ⬜ Asset pixel art definitivi (vedi `03_pixel_art_brief.md`)
- ⬜ TileMap reale con tileset
- ⬜ AudioManager reale (musica, SFX)
- ⬜ Scene reali di Santam (sostituire test rooms)
- ⬜ Enemy variety, XP, leveling, skill
- ⬜ Item usage (potion in battle, equipment)

### 9.2 Controlli correnti

| Tasto | Azione |
|---|---|
| ← → | muovi Turi |
| ↵ Invio / Spazio | interagisci (NPC, Sign, ItemPickup, SaveSpot) • avanza dialogo • click pulsanti |
| ↑ | entra in Exit Zone (cambia stanza verso l'alto) |
| ↓ | entra in Exit Zone (torna al corridoio sotto) |
| Tab | apri / chiudi Inventario |
| Esc | in game → apre Pause Menu • in dialogo → avanza (alternativa a Invio) |

### 9.3 Quest chain di test (avvia con F5)

1. **Corridoio A** (spawn). A x=-240 c'è il **SaveSpot** (esagono oro). Opzionale: premi Invio per salvare.
2. A x=-120, il **Cartello**. Premi Invio → leggi 3 righe → flag `vapore_sentito` impostato.
3. A x=200, la **Vecchia di strada**. Premi Invio → dialogo *cambia* grazie al flag appena impostato.
4. Torna al centro (x=0) nell'**ExitZone**. Appare prompt "↑". Premi ↑.
5. **Corridoio B**. Vai a destra fino al **BattleTrigger** (x=180, rettangolo magenta). Al contatto, parte la battaglia.
6. Battaglia: premi **Attacca** ~3 volte finché il Custode va a 0 HP → flag `custode_sconfitto` → ritorno a Corridoio A.
7. Torna al centro, premi ↑ per rientrare in Corridoio B.
8. A x=180, dove cadeva il Custode, ora c'è un esagono bronzo: l'**Ingranaggio**. Premi Invio → raccolto.
9. Premi **Tab** → inventario mostra "Ingranaggio x1".
10. Torna al SaveSpot in Corridoio A e salva. Chiudi Godot, riaprilo: al boot, auto-load → flag + ingranaggio persistono.

---

## 10. Troubleshooting

**Godot non vede il progetto** → controlla che `project.godot` sia nella cartella selezionata.

**Sprite sfocati** → `Project Settings` → `Rendering/Textures/Canvas Textures/Default Texture Filter` = **Nearest**.

**Pixel che "ballano"** → abilita `Rendering/2D/Snap/Snap 2D Transforms to Pixel`.

**Main scene non parte** → `Project Settings` → `Application/Run/Main Scene` → seleziona `scenes/world/test_room.tscn`.

**Errore `ExtResource("1") not found`** → Apri la scena in editor, salva (Ctrl+S) — Godot rigenera gli UID.

**Autoload non trovato** → `Project Settings → Autoload` → verifica che `GameState` e `AudioManager` ci siano e siano abilitati.

---

*Documento vivo — aggiornare man mano che il progetto cresce.*
