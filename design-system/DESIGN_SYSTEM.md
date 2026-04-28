# Luna — Design System v1.0

> Soft & Playful · Lavender & Warm Tones · iOS-first PWA

---

## 1. Design Philosophy

Luna is a **baby monitor app for parents**, not for babies. Every design decision optimizes for:

- **One-handed use** — mama/tata holds the baby with one hand
- **3-second logging** — any event recorded in ≤3 taps
- **Glanceable info** — dashboard readable in 2 seconds
- **Calm & warm** — not clinical, not childish — *cozy nursery* vibe
- **Multi-baby** — baby switcher always accessible, never blocking

**Style**: Soft playful (Huckleberry-inspired) with claymorphic touches
**NOT**: Material Design, clinical health app, or toy-like children's app

---

## 2. Color Palette

### Primary Colors

| Token             | Hex       | Usage                                      |
|-------------------|-----------|-------------------------------------------|
| `lavender-600`    | `#8B5CF6` | Primary accent, active states, CTAs        |
| `lavender-500`    | `#A78BFA` | Secondary accent, icons, links             |
| `lavender-100`    | `#EDE9FE` | Light accent backgrounds                   |
| `lavender-50`     | `#F5F3FF` | Subtle tints                               |

### Warm Accents

| Token             | Hex       | Usage                                      |
|-------------------|-----------|-------------------------------------------|
| `peach-500`       | `#FB923C` | Feeding events, warm CTA alternative       |
| `peach-100`       | `#FFEDD5` | Feeding background                         |
| `coral-500`       | `#F87171` | Alerts, medication, important notices      |
| `coral-100`       | `#FEE2E2` | Alert backgrounds                          |

### Event Colors (semantic)

| Event        | Main        | Background  | Icon fill   |
|-------------|-------------|-------------|-------------|
| Feeding     | `#F97316`   | `#FFF7ED`   | `#EA580C`   |
| Sleep       | `#8B5CF6`   | `#F5F3FF`   | `#7C3AED`   |
| Diaper      | `#14B8A6`   | `#F0FDFA`   | `#0D9488`   |
| Growth      | `#3B82F6`   | `#EFF6FF`   | `#2563EB`   |
| Medication  | `#F43F5E`   | `#FFF1F2`   | `#E11D48`   |

### Neutrals

| Token          | Hex       | Usage                                   |
|----------------|-----------|----------------------------------------|
| `warm-50`      | `#FEFCFB` | Page background (NOT pure white)        |
| `warm-100`     | `#FFF8F5` | Card background                         |
| `warm-200`     | `#F5E6DE` | Borders, dividers                       |
| `warm-400`     | `#C4A99A` | Placeholder text                        |
| `warm-600`     | `#8B7263` | Secondary text                          |
| `warm-900`     | `#3B2E26` | Primary text (NOT pure black)           |

### Baby Identity Colors

| Baby    | Bubble Bg   | Text        |
|---------|-------------|-------------|
| Baby 1  | `#F3E8FF`   | `#7C3AED`   |
| Baby 2  | `#FEF3C7`   | `#D97706`   |
| Baby 3  | `#DBEAFE`   | `#2563EB`   |
| Baby 4  | `#D1FAE5`   | `#059669`   |

---

## 3. Typography

### Font Stack

**Headings**: Nunito (rounded, friendly, warm)
**Body**: Nunito Sans (clean, readable, pairs perfectly)

```css
@import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700;800&family=Nunito+Sans:wght@300;400;500;600;700&display=swap');
```

### Scale

| Level      | Font       | Weight | Size   | Line Height | Usage                  |
|-----------|------------|--------|--------|-------------|------------------------|
| Display    | Nunito     | 800    | 28px   | 1.2         | Baby name on dashboard |
| H1         | Nunito     | 700    | 22px   | 1.3         | Page titles            |
| H2         | Nunito     | 700    | 18px   | 1.3         | Section headers        |
| H3         | Nunito     | 600    | 16px   | 1.4         | Card titles            |
| Body       | Nunito Sans| 400    | 15px   | 1.5         | General text           |
| Body Bold  | Nunito Sans| 600    | 15px   | 1.5         | Emphasized text        |
| Caption    | Nunito Sans| 400    | 13px   | 1.4         | Timestamps, labels     |
| Tiny       | Nunito Sans| 500    | 11px   | 1.3         | Tab labels, badges     |

---

## 4. Spacing & Layout

### Grid

- **Max content width**: 428px (iPhone 14 Pro Max)
- **Side padding**: 20px (more generous than 16px)
- **Card gap**: 12px
- **Section gap**: 24px

### Border Radius

| Element      | Radius |
|-------------|--------|
| Cards       | 20px   |
| Buttons     | 16px   |
| Input fields| 14px   |
| Badges      | 100px  |
| Bottom sheet| 24px top |
| Tab bar     | 0 (flush) |

### Shadows (Claymorphic soft)

```css
/* Card shadow — warm, not gray */
--shadow-card: 0 2px 8px rgba(139, 92, 246, 0.06),
               0 1px 3px rgba(0, 0, 0, 0.04);

/* Elevated (modals, bottom sheets) */
--shadow-elevated: 0 8px 32px rgba(139, 92, 246, 0.1),
                   0 2px 8px rgba(0, 0, 0, 0.06);

/* Pressed/inset (active buttons) */
--shadow-inset: inset 0 2px 4px rgba(0, 0, 0, 0.06);

/* Soft glow (active tab, selected item) */
--shadow-glow: 0 0 0 3px rgba(139, 92, 246, 0.2);
```

---

## 5. Page Structure & Navigation

### Tab Bar (5 tabs, bottom)

```
┌─────────────────────────────────────┐
│  🏠        📝       📅       📊    ⚙  │
│ Acasă     Log    Istoric  Grafice  Set │
└─────────────────────────────────────┘
```

- Height: 83px (49px content + 34px safe area bottom)
- Background: warm-100 with blur
- Active: lavender-600 fill + label
- Inactive: warm-400 outline only
- Icons: Lucide icons, 24x24, stroke-width 2

### Header

- **Persistent top bar**: Baby switcher + title
- Height: 44px content + safe area top
- Background: warm-50/85 + backdrop-filter blur
- Baby switcher: horizontal pill strip (swipeable if 3+ babies)

### Page Layout Template

```
┌────────────────────────────────┐
│ ▲ safe area top                │
│ ┌────────────────────────────┐ │
│ │ Baby switcher pills        │ │
│ │ [Sofia ●] [Andrei]         │ │
│ └────────────────────────────┘ │
│                                │
│ ┌────────────────────────────┐ │
│ │                            │ │
│ │    Scrollable Content      │ │
│ │                            │ │
│ │                            │ │
│ └────────────────────────────┘ │
│                                │
│ ┌────────────────────────────┐ │
│ │ Tab Bar (5 tabs)           │ │
│ └────────────────────────────┘ │
│ ▼ safe area bottom             │
└────────────────────────────────┘
```

---

## 6. Pages — Wireframes & Content

### 6.1 Acasă (Dashboard)

The home screen — glanceable summary of the active baby's day.

```
┌─────────────────────────────────┐
│ [Sofia ●] [Andrei]    ← pills  │
├─────────────────────────────────┤
│                                 │
│ ┌─────────────────────────────┐ │
│ │  👶 Sofia          9 luni   │ │
│ │  Născută: 26 iul 2025       │ │
│ └─────────────────────────────┘ │
│                                 │
│   ── Rezumat azi ──             │
│ ┌───────┐ ┌───────┐ ┌───────┐  │
│ │ 🍼 5x │ │ 💤12h │ │ 🧷 4x │  │
│ │Hrăniri│ │ Somn  │ │Scutece│  │
│ └───────┘ └───────┘ └───────┘  │
│                                 │
│   ── Activitate recentă ──     │
│ ┌─────────────────────────────┐ │
│ │ 🟠 Hrănire   14:30  Sân Dr │ │
│ ├─────────────────────────────┤ │
│ │ 🟣 Somn      13:00-14:15   │ │
│ ├─────────────────────────────┤ │
│ │ 🟢 Scutec    12:45  Mixt   │ │
│ └─────────────────────────────┘ │
│                                 │
│   ── Timer activ ──             │
│ ┌─────────────────────────────┐ │
│ │  💤 Somn în desfășurare     │ │
│ │     01:23:45  [⏹ Oprește]   │ │
│ └─────────────────────────────┘ │
│                                 │
│ ┌─────────────────────────────┐ │
│ │  Următoare (estimat):       │ │
│ │  Hrănire ~ în 45 min       │ │
│ └─────────────────────────────┘ │
└─────────────────────────────────┘
```

**Components**:
- Baby header card (avatar + name + age)
- Stats row (3 summary cards)
- Recent activity list (last 5 events)
- Active timer card (if sleep in progress)
- Next-expected card (based on averages)

### 6.2 Log (Înregistrare)

Quick access to all logging forms via bottom sheets.

```
┌─────────────────────────────────┐
│ [Sofia ●] [Andrei]              │
├─────────────────────────────────┤
│                                 │
│   Înregistrare rapidă           │
│                                 │
│ ┌──────────┐  ┌──────────┐      │
│ │   🍼     │  │   💤     │      │
│ │ Hrănire  │  │  Somn    │      │
│ │          │  │          │      │
│ └──────────┘  └──────────┘      │
│                                 │
│ ┌──────────┐  ┌──────────┐      │
│ │   🧷     │  │   📏     │      │
│ │ Scutec   │  │ Creștere │      │
│ │          │  │          │      │
│ └──────────┘  └──────────┘      │
│                                 │
│ ┌──────────┐  ┌──────────┐      │
│ │   💊     │  │   📝     │      │
│ │Medicament│  │  Notă    │      │
│ │          │  │          │      │
│ └──────────┘  └──────────┘      │
│                                 │
│   ── Ultimele înregistrări ──   │
│ ┌─────────────────────────────┐ │
│ │ 🟠 Hrănire  acum 2h   100ml│ │
│ │ 🟣 Somn     acum 3h   1h15 │ │
│ └─────────────────────────────┘ │
└─────────────────────────────────┘
```

**Tap pe orice buton → Bottom Sheet** cu formularul detaliat.

### 6.3 Bottom Sheets (Formulare)

#### Feeding Bottom Sheet

```
┌─────────────────────────────────┐
│ ═══ (grab handle)               │
│                                 │
│  Hrănire          ✕ (close)     │
│                                 │
│  Sursă:                         │
│  [Sân St] [Sân Dr] [Ambii]     │
│  [Biberon] [Formulă] [Solid]   │
│                                 │
│  Cantitate (ml):                │
│  ┌───────────────────────────┐  │
│  │ -    [  120  ]       +    │  │
│  └───────────────────────────┘  │
│                                 │
│  Durată (min):                  │
│  ┌───────────────────────────┐  │
│  │ -    [  15   ]       +    │  │
│  └───────────────────────────┘  │
│                                 │
│  Notă (opțional):               │
│  ┌───────────────────────────┐  │
│  │                           │  │
│  └───────────────────────────┘  │
│                                 │
│  ┌───────────────────────────┐  │
│  │       Salvează            │  │
│  └───────────────────────────┘  │
└─────────────────────────────────┘
```

#### Sleep Bottom Sheet

```
┌─────────────────────────────────┐
│ ═══                             │
│                                 │
│  Somn               ✕           │
│                                 │
│  ┌───────────────────────────┐  │
│  │                           │  │
│  │      ● 00:00:00           │  │
│  │    (timer live)           │  │
│  │                           │  │
│  │   [ ▶ Start somn ]       │  │
│  │   sau                     │  │
│  │   [ ⏹ Oprește ]          │  │
│  │                           │  │
│  └───────────────────────────┘  │
│                                 │
│  Locație:                       │
│  [Pătuț] [Cărucior] [Mașină]  │
│  [Pat] [Altul]                 │
│                                 │
│  Notă:                          │
│  ┌───────────────────────────┐  │
│  │                           │  │
│  └───────────────────────────┘  │
│                                 │
│  ┌───────────────────────────┐  │
│  │       Salvează            │  │
│  └───────────────────────────┘  │
└─────────────────────────────────┘
```

#### Diaper Bottom Sheet

```
┌─────────────────────────────────┐
│ ═══                             │
│                                 │
│  Scutec              ✕          │
│                                 │
│  Tip:                           │
│  ┌──────┐ ┌──────┐ ┌──────┐    │
│  │ 💧   │ │ 💩   │ │ 💧💩 │    │
│  │ Pipi │ │ Caca │ │ Mixt │    │
│  └──────┘ └──────┘ └──────┘    │
│           ┌──────┐              │
│           │ ✨   │              │
│           │ Uscat│              │
│           └──────┘              │
│                                 │
│  Notă:                          │
│  ┌───────────────────────────┐  │
│  │                           │  │
│  └───────────────────────────┘  │
│                                 │
│  ┌───────────────────────────┐  │
│  │       Salvează            │  │
│  └───────────────────────────┘  │
└─────────────────────────────────┘
```

### 6.4 Istoric (Timeline)

```
┌─────────────────────────────────┐
│ [Sofia ●] [Andrei]              │
├─────────────────────────────────┤
│                                 │
│  Filtru:                        │
│  [Toate ●][🍼][💤][🧷][📏][💊]│
│                                 │
│  ── Azi, 27 Apr ──              │
│ ┌─────────────────────────────┐ │
│ │ 🟠 14:30  Hrănire           │ │
│ │    Sân drept · 120ml · 15m  │ │
│ ├─────────────────────────────┤ │
│ │ 🟣 13:00  Somn              │ │
│ │    Pătuț · 1h 15min         │ │
│ ├─────────────────────────────┤ │
│ │ 🟢 12:45  Scutec            │ │
│ │    Mixt                     │ │
│ ├─────────────────────────────┤ │
│ │ 🟠 11:00  Hrănire           │ │
│ │    Biberon · 150ml · 20m    │ │
│ └─────────────────────────────┘ │
│                                 │
│  ── Ieri, 26 Apr ──            │
│ ┌─────────────────────────────┐ │
│ │ ...                         │ │
│ └─────────────────────────────┘ │
│                                 │
│  (infinite scroll ↓)            │
└─────────────────────────────────┘
```

### 6.5 Grafice (Charts)

```
┌─────────────────────────────────┐
│ [Sofia ●] [Andrei]              │
├─────────────────────────────────┤
│                                 │
│  Perioadă: [7 zile ▼]          │
│                                 │
│  ── Somn ──                     │
│ ┌─────────────────────────────┐ │
│ │  Bar chart: ore/zi          │ │
│ │  ████ ███ █████ ████ ██     │ │
│ │  L    M   Mi    J    V     │ │
│ │  Media: 14.2h/zi            │ │
│ └─────────────────────────────┘ │
│                                 │
│  ── Hrănire ──                  │
│ ┌─────────────────────────────┐ │
│ │  Line chart: ml/zi          │ │
│ │     ╱‾‾╲    ╱╲              │ │
│ │  ──╱────╲──╱──╲──           │ │
│ │  Media: 680ml/zi            │ │
│ └─────────────────────────────┘ │
│                                 │
│  ── Creștere ──                 │
│ ┌─────────────────────────────┐ │
│ │  WHO percentile overlay     │ │
│ │  Greutate: 8.2kg (P50)     │ │
│ └─────────────────────────────┘ │
└─────────────────────────────────┘
```

### 6.6 Setări

```
┌─────────────────────────────────┐
│  Setări                         │
├─────────────────────────────────┤
│                                 │
│  ── Cont ──                     │
│ ┌─────────────────────────────┐ │
│ │ Profil         Florin    >  │ │
│ ├─────────────────────────────┤ │
│ │ Email     florin@...     >  │ │
│ └─────────────────────────────┘ │
│                                 │
│  ── Bebeluși ──                 │
│ ┌─────────────────────────────┐ │
│ │ Sofia          Editează  >  │ │
│ ├─────────────────────────────┤ │
│ │ Andrei         Editează  >  │ │
│ ├─────────────────────────────┤ │
│ │ + Adaugă bebeluș            │ │
│ └─────────────────────────────┘ │
│                                 │
│  ── Preferințe ──               │
│ ┌─────────────────────────────┐ │
│ │ Unități        Metric    >  │ │
│ ├─────────────────────────────┤ │
│ │ Temă           Luminoasă > │ │
│ ├─────────────────────────────┤ │
│ │ Notificări               >  │ │
│ └─────────────────────────────┘ │
│                                 │
│  ── Date ──                     │
│ ┌─────────────────────────────┐ │
│ │ Export date                > │ │
│ ├─────────────────────────────┤ │
│ │ Import date                > │ │
│ └─────────────────────────────┘ │
│                                 │
│  Luna v1.0 · Self-hosted        │
│  github.com/florin2495           │
└─────────────────────────────────┘
```

### 6.7 Login / Register (viitor)

```
┌─────────────────────────────────┐
│                                 │
│          🌙 Luna                │
│    Baby Monitor                 │
│                                 │
│ ┌─────────────────────────────┐ │
│ │ Email                       │ │
│ └─────────────────────────────┘ │
│ ┌─────────────────────────────┐ │
│ │ Parolă                      │ │
│ └─────────────────────────────┘ │
│                                 │
│ ┌─────────────────────────────┐ │
│ │       Intră                 │ │
│ └─────────────────────────────┘ │
│                                 │
│  Nu ai cont? Înregistrează-te   │
│                                 │
└─────────────────────────────────┘
```

---

## 7. Components

### 7.1 Buttons

| Type       | Background         | Text        | Radius | Height | Usage           |
|------------|-------------------|-------------|--------|--------|-----------------|
| Primary    | lavender-600       | white       | 16px   | 52px   | Main CTAs       |
| Secondary  | lavender-100       | lavender-600| 16px   | 48px   | Secondary       |
| Ghost      | transparent        | lavender-600| 16px   | 44px   | Tertiary        |
| Danger     | coral-100          | coral-600   | 16px   | 48px   | Delete          |
| Log button | event-bg (peach etc)| event-color| 20px   | 80px   | Log grid items  |

**States**: Active = scale(0.96) + shadow-inset, 150ms ease.
**Min touch target**: 44×44px always.

### 7.2 Cards

```css
.card {
  background: var(--warm-100);        /* #FFF8F5 */
  border-radius: 20px;
  padding: 16px;
  box-shadow: var(--shadow-card);
  border: 1px solid rgba(139, 92, 246, 0.06);
}
```

### 7.3 Bottom Sheet

```css
.bottom-sheet {
  background: var(--warm-50);
  border-radius: 24px 24px 0 0;
  box-shadow: var(--shadow-elevated);
  max-height: 85vh;
  padding: 12px 20px env(safe-area-inset-bottom);
}
.grab-handle {
  width: 36px;
  height: 4px;
  background: var(--warm-200);
  border-radius: 100px;
  margin: 0 auto 16px;
}
```

### 7.4 Baby Switcher Pills

```css
.baby-pill {
  padding: 6px 16px;
  border-radius: 100px;
  font: 600 13px 'Nunito Sans';
  transition: all 200ms ease;
}
.baby-pill--active {
  background: var(--lavender-600);
  color: white;
  box-shadow: 0 2px 8px rgba(139, 92, 246, 0.3);
}
.baby-pill--inactive {
  background: var(--warm-100);
  color: var(--warm-600);
}
```

### 7.5 Stat Card (Dashboard)

```css
.stat-card {
  background: var(--warm-100);
  border-radius: 16px;
  padding: 12px;
  text-align: center;
  min-width: 100px;
  flex: 1;
}
.stat-card__value {
  font: 700 22px 'Nunito';
  color: var(--warm-900);
}
.stat-card__label {
  font: 400 12px 'Nunito Sans';
  color: var(--warm-600);
  margin-top: 2px;
}
```

### 7.6 Event Row (Timeline)

```css
.event-row {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 14px 16px;
  border-bottom: 1px solid var(--warm-200);
}
.event-dot {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  flex-shrink: 0;
}
.event-time {
  font: 600 14px 'Nunito Sans';
  color: var(--warm-900);
  min-width: 50px;
}
.event-detail {
  font: 400 14px 'Nunito Sans';
  color: var(--warm-600);
}
```

### 7.7 Filter Pills (Timeline)

```css
.filter-pill {
  padding: 8px 14px;
  border-radius: 100px;
  font: 500 13px 'Nunito Sans';
  border: 1.5px solid var(--warm-200);
  color: var(--warm-600);
  transition: all 200ms ease;
}
.filter-pill--active {
  background: var(--lavender-100);
  border-color: var(--lavender-600);
  color: var(--lavender-600);
}
```

### 7.8 Input Fields

```css
.input {
  background: var(--warm-50);
  border: 1.5px solid var(--warm-200);
  border-radius: 14px;
  padding: 14px 16px;
  font: 400 16px 'Nunito Sans';  /* 16px prevents iOS zoom */
  color: var(--warm-900);
  transition: border-color 200ms ease;
}
.input:focus {
  border-color: var(--lavender-500);
  box-shadow: var(--shadow-glow);
  outline: none;
}
```

### 7.9 Stepper (Amount, Duration)

```
┌──────────────────────────────┐
│  [ - ]     120 ml     [ + ] │
└──────────────────────────────┘
```

- Buttons: 44×44px, lavender-100 bg
- Value: centered, 20px Nunito bold
- Unit: 14px Nunito Sans, warm-400
- Step: ±10ml for quantity, ±5min for duration

---

## 8. User Flows

### 8.1 First Launch Flow

```
App Open → Login/Register → Add Baby (name, DOB, sex)
→ Dashboard (empty state with "Înregistrează prima hrănire!")
```

### 8.2 Quick Log Flow (Primary — 3 taps)

```
Dashboard/Log tab → Tap "Hrănire" → Bottom sheet opens
→ Tap "Sân Dr" → Tap "Salvează" → Done ✓ (sheet closes)
```

### 8.3 Detailed Log Flow

```
Log tab → Tap "Hrănire" → Bottom sheet
→ Select source → Adjust ml → Adjust duration → Add note
→ "Salvează" → Done ✓
```

### 8.4 Sleep Timer Flow

```
Log tab → Tap "Somn" → Bottom sheet → "Start somn"
→ Timer starts on dashboard (visible everywhere)
→ Later: Dashboard timer card → "Oprește" → Confirm → Done ✓
```

### 8.5 Baby Switching Flow

```
Any page → Tap baby pill in header → Instant switch
→ All data updates to selected baby
```

### 8.6 Timeline Review Flow

```
Istoric tab → Scroll through today's events
→ Tap filter pill (e.g., "Hrănire") → Filtered view
→ Scroll down → Auto-loads yesterday, etc.
```

---

## 9. Animation & Transitions

| Action             | Animation                     | Duration | Easing      |
|-------------------|-------------------------------|----------|-------------|
| Page transition    | Fade + slide up 12px          | 250ms    | ease-out    |
| Bottom sheet open  | Slide up from bottom          | 300ms    | ease-out    |
| Bottom sheet close | Slide down                    | 200ms    | ease-in     |
| Button press       | Scale 0.96 + inset shadow     | 150ms    | ease        |
| Tab switch         | Cross-fade content            | 200ms    | ease        |
| Baby pill switch   | Background color slide        | 200ms    | ease        |
| Timer tick         | No animation (number update)  | —        | —           |
| Event logged       | Checkmark pulse + fade green  | 400ms    | ease-out    |
| Card appear        | Fade in + translate Y 8px     | 300ms    | ease-out    |
| Pull to refresh    | Spinner rotate                | ∞        | linear      |

**prefers-reduced-motion**: Disable all transforms, keep opacity fades.

---

## 10. Iconography

**Icon set**: Lucide Icons (consistent, rounded, friendly)
**Size**: 24×24 (navigation), 20×20 (inline), 32×32 (log grid)
**Stroke width**: 2px (navigation), 1.75px (inline)
**Color**: Uses event semantic colors, NOT fixed gray

Key icons:
- Home: `house`
- Log: `plus-circle`
- Timeline: `clock`
- Charts: `bar-chart-3`
- Settings: `settings`
- Feeding: `baby-bottle` (custom) or `cup-soda`
- Sleep: `moon`
- Diaper: `droplets`
- Growth: `ruler`
- Medication: `pill`
- Back: `chevron-left`
- Close: `x`
- Add: `plus`

---

## 11. Accessibility

- **Contrast**: All text ≥ 4.5:1 against backgrounds
- **Touch targets**: Minimum 44×44px, 8px gap between
- **Font size**: Minimum 13px (11px only for badges)
- **Input font**: 16px minimum (prevents iOS zoom)
- **Focus rings**: 3px lavender-500 outline on all interactive elements
- **Aria labels**: On icon-only buttons
- **Reduced motion**: Respects `prefers-reduced-motion`
- **Color not sole indicator**: Icons + text accompany all color cues

---

## 12. Dark Mode (v2)

Reserve tokens — NOT priority for MVP but structure supports it:

| Token       | Light            | Dark             |
|------------|------------------|------------------|
| bg-page    | warm-50 (#FEFCFB)| #1A1625          |
| bg-card    | warm-100(#FFF8F5)| #2D2640          |
| text-primary| warm-900(#3B2E26)| #F5F0EB         |
| text-secondary| warm-600(#8B7263)| #A89B8E       |
| border     | warm-200(#F5E6DE)| #3D3550          |
| accent     | lavender-600     | lavender-400     |

