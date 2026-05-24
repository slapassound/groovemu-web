# AGENTS.md - GROOVEMU veebiplokkide tööprotokoll

## Trigger
- Koodimuudatusi tehakse ainult siis, kui kasutaja sõnumis on `qq`.

## Veebiplokkide Mapping Lock
- Esimene FULL CAPS lause plokis -> `H1`
- Järgmised FULL CAPS laused -> `subheadline`
- Mitte-FULL-CAPS laused -> `body`
- `*` algavad read -> oranž bullet list
- Ainult lause alguse CAPS sõna (nt `GROOVEMU`, `REAPER`) EI tee reast subheadline'i; see jääb `body`

## A/B Layout Lock
- `systeme_A_PIC_LEFT` ja `systeme_B_PIC_RIGHT` määravad layouti, mõõdud, värvid ja spacingu
- Vaikimisi muudetakse plokifailides ainult:
  - pildilink (`--hero-image`)
  - tekstisisu (H1/subheadline/body/bullets)
  - CTA read, kui kasutaja need annab
- Kõigis veebiplokkide failides peavad olema alles default-failide CSS kommentaar-seletused:
  - `/* ===== Siin saad tekste sättida ===== */`
  - `/* Fondi üldseaded (kõik tekstid) */`
  - `/* Rõhutused (2 eri accent värvi) */`
  - `/* Tekstivärvid */`
  - `/* Pealkiri (H1) */`
  - `/* Subheadline (kui kasutad) */`
  - `/* Tavaline tekst */`
  - `/* Bullet tekst */`
  - `/* Kogu tekstiploki asend */`
  - `/* Tekstirea maksimaalne pikkus (wrap kontroll) */`
  - `/* Vahed tekstiploki sees */`
  - `/* Bullet-ploki horisontaalne nihe */`
  - `/* Desktop kõrvuti vaade: teksti ja pildi suhe */`
  - `/* Stack-vaade (kui pilt hüppab teksti alla) */`
  - `/* Taust */`

## Subheadline stiilireegel
- Subheadline kasutatakse ainult FULL CAPS ridadel
- Non-CAPS rida ei tohi minna subheadline klassi

## Failinime reegel
- Veebiplokid salvestatakse numeratsiooni järgi:
  - `01_...` kuni `14_...`
- Soovituslik muster:
  - `NN_gmA_slug.txt` või `NN_gmB_slug.txt`

## Enne salvestust kontroll
- Kas FULL CAPS mapping on korrektne?
- Kas non-CAPS read on `body` klassis?
- Kas bullet read on ainult `*` ridadest?
- Kas ploki number ja failinimi klapivad?

## Värviloogika (kohustuslik)
- Kõigis plokifailides kasutatakse teksti rõhuvärve ainult utility-klassidega:
  - `...-accent-orange`
  - `...-accent-white`
- Need klassid peavad viitama ainult muutujatele:
  - `color: var(--accent-orange)`
  - `color: var(--accent-white)`
- Kohandatud klassid (nt listi või numbri klassid) tohivad hallata ainult paigutust/spacingut/suurust, mitte kõvakodeeritud värviloogikat.
- Kui on vaja kiirelt värvi muuta, muudetakse väärtusi ainult muutujates:
  - `--accent-orange`
  - `--accent-white`

## H1 märksõna valik (kohustuslik)
- Kui H1-s on juba `...accent-orange` span olemas, kasutatakse seda muutmata kujul.
- Kui H1-s span puudub, valib Codex H1-st kõige kandvama sõna ja märgib selle `...accent-orange` klassiga.
- Stop-sõnu (`THE`, `AND`, `TO`, `OF`, `IN`, `IS` jne) ei valita rõhusõnaks, kui on olemas sisuliselt tugevam sõna.
- H1 rõhusõna värv kasutab alati H1 accent-shadingut (mitte lamedat `color` väärtust).

## Git push reegel
- Kui kasutaja annab triggeri `qq`, siis Codex teeb kinnitatud muudatuse j�rel alati kohe:
  - `git add -A`
  - `git commit -m "..."`
  - `git push origin main`
