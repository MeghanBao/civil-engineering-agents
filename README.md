<p align="center">
  <h1 align="center">Civil Engineering Agents</h1>
  <p align="center">
    <strong>A complete civil and structural engineering department for your AI assistant.</strong><br>
    24 specialized agents with PE/CEng-level expertise, real standards citations, and ready-to-use calculation templates.
  </p>
  <p align="center">
    <a href="#quick-start"><img src="https://img.shields.io/badge/agents-24-blue?style=flat-square" alt="24 Agents"></a>
    <a href="#compatible-tools"><img src="https://img.shields.io/badge/tools-12+-8A2BE2?style=flat-square" alt="12+ Tools"></a>
    <a href="https://github.com/MeghanBao/civil-engineering-agents/stargazers"><img src="https://img.shields.io/github/stars/MeghanBao/civil-engineering-agents?style=flat-square" alt="Stars"></a>
    <a href="LICENSE"><img src="https://img.shields.io/badge/license-Apache%202.0-green?style=flat-square" alt="License"></a>
  </p>
</p>

---

Civil engineering is full of standards, codes, and calculation methods that take years to internalize. These agents know the specific EN/AISC/AASHTO clauses, code edition differences, and deliverable formats so you don't start from scratch every time.

Not a chatbot with a civil engineering skin. Every agent cites real regulations, speaks in practitioner language, and produces actual deliverables — calculation packages, inspection checklists, cost plans, programme fragments, compliance matrices.

> Inspired by and built on the conventions of [The Agency](https://github.com/msitarzewski/agency-agents) by [Michael Sitarzewski](https://github.com/msitarzewski).

## Quick Start

```bash
git clone https://github.com/MeghanBao/civil-engineering-agents.git
cp civil-engineering-agents/agents/*.md ~/.claude/agents/
```

Then just ask:

> *"Activate the Structural Engineer and design a W-section steel beam for 6m span, 15kN/m dead + 25kN/m live, AISC 360 LRFD"*

> *"Use the Geotechnical Engineer to design a bored pile foundation for 2,500kN column load in medium dense sand, EN 1997 DA1"*

## What Makes These Agents Different

| | Generic AI | Civil Engineering Agents |
|---|---|---|
| **Structural design** | "Check the beam capacity" | AISC 360 LRFD: φMn calculation, Zx lookup, SLS deflection δLL vs L/360 |
| **Geotechnical** | "Check bearing capacity" | EN 1997-1 DA1: characteristic values per cl. 2.4.5.2, partial factors γb/γs, Rc,d vs Fc,d |
| **Codes** | "Follow the building code" | IBC 2021 cl. 1006.3.3: >500 occupants requires 3 exits; Table 1017.2 travel distance 76m (A-2 sprinklered) |
| **Bridge** | "Design for live load" | AASHTO LRFD HL-93: IM=33%, governing truck vs tandem vs lane, fatigue Category C ΔF_TH=69MPa |
| **Traffic** | "Analyze the intersection" | HCM 7 signalized: d1 uniform delay formula, V/C=0.75, LOS D threshold 35-55s |

**~10,000+ lines** of domain knowledge. **Average 350+ lines/agent** of real expertise.

## Example Output

Ask the Structural Engineer to design a steel beam:

```
Member: W24x55 A992 steel, simply supported, L = 6.1 m
Loading: wDL = 14.6 kN/m, wLL = 29.2 kN/m

Factored load (ASCE 7, LC2): wu = 1.2(14.6) + 1.6(29.2) = 64.2 kN/m
...
Deflection (SLS): δLL = 5wLL·L⁴ / (384·E·Ix) = 12.6 mm < L/360 = 16.9 mm ✓

GOVERNING SECTION: W24x55 — controlled by serviceability (deflection)
```

Every agent produces structured, actionable deliverables — not summaries of what a deliverable would look like.

## The 24 Agents

<details>
<summary><strong>Structural Design</strong> — 4 agents</summary>

| Agent | Specialty |
|-------|-----------|
| Structural Engineer | Multi-standard structural design: Eurocode/AISC/ACI/AS/GB/IS/AIJ, ULS+SLS, global code coverage |
| Seismic Engineer | PBSD, ASCE 7/EN 1998/NZS 1170.5, SDC determination, ELF/RSA/NLRHA, ductile detailing |
| Wind Engineer | MWFRS/C&C per ASCE 7/EN 1991-1-4/AS 1170.2, vortex shedding, wind tunnel, occupant comfort |
| Facade Engineer | Curtain wall (unitized/stick/SSG), EN 13830/CWCT/AAMA, thermal performance, seismic racking |

</details>

<details>
<summary><strong>Geotechnical</strong> — 3 agents</summary>

| Agent | Specialty |
|-------|-----------|
| Geotechnical Engineer | Site investigation, EN 1997 DA1/DA2/DA3, pile design, bearing capacity, retaining walls |
| Ground Improvement Engineer | Stone columns (Priebe), preloading/PVDs, jet grouting, dynamic compaction, EN 14731/14679 |
| Tunnel Engineer | NATM/TBM, Q-system, Muir Wood lining design, settlement prediction, ITA/AFTES/ÖVBB |

</details>

<details>
<summary><strong>Transportation</strong> — 4 agents</summary>

| Agent | Specialty |
|-------|-----------|
| Highway Engineer | AASHTO geometric design, MEPDG pavement, road safety audit, earthworks, sight distance |
| Bridge Engineer | AASHTO LRFD, HL-93 loading, prestress losses, scour (HEC-18), load rating, NBI inspection |
| Rail Engineer | UIC cant/speed design, CWR buckling, OLE geometry, AREMA/EN 13803, interoperability TSI |
| Traffic Engineer | HCM 7 capacity, ITE trip generation, Webster signal timing, roundabout capacity, RSA stages 1-4 |

</details>

<details>
<summary><strong>Water & Environment</strong> — 4 agents</summary>

| Agent | Specialty |
|-------|-----------|
| Hydraulic Engineer | HEC-RAS/HMS, culvert analysis, weir discharge, flood frequency (Log-Pearson III), ARR 2019 |
| Drainage Engineer | SUDS/LID (CIRIA C753), rational method, detention basin routing, infiltration design, EPA SWMM |
| Environmental Engineer | EIA (NEPA/EU Directive), Phase I/II ESA, ISO 9613-2 noise, EN 15978 embodied carbon, BNG |
| Water & Wastewater Treatment Engineer | Coagulation design, activated sludge SRT, MBR sizing, CT value (SWTR), ACI 350 structures |

</details>

<details>
<summary><strong>Construction & Project Delivery</strong> — 4 agents</summary>

| Agent | Specialty |
|-------|-----------|
| Construction Manager | NEC4/FIDIC/JCT, EVM (CPI/SPI), compensation events, risk register, programme management |
| Civil Cost Estimator | RICS NRM 1/2/3, elemental cost plans, BOQ, life cycle costing (ISO 15686), VE appraisal |
| Project Scheduler | CPM/Primavera P6, SCL Protocol TIA, delay analysis, EVM S-curves, resource loading |
| Construction Safety Engineer | CDM 2015, OSHA 29 CFR 1926, ISO 45001, RAMS, confined space permits, lifting plans |

</details>

<details>
<summary><strong>Building Systems Integration</strong> — 2 agents</summary>

| Agent | Specialty |
|-------|-----------|
| BIM Coordinator | ISO 19650, BEP/EIR, IFC 4.x, COBie, clash detection, 4D/5D BIM, digital twin handover |
| MEP Coordinator | CIBSE/ASHRAE, builder's work schedules, duct sizing, NFPA 13 sprinkler hydraulics, seismic bracing |

</details>

<details>
<summary><strong>Materials & Inspection</strong> — 2 agents</summary>

| Agent | Specialty |
|-------|-----------|
| Materials Testing Engineer | ACI 318 Ch. 26 mix design, ASTM C31/C39, statistical acceptance (fck = x̄ − 1.645s), compaction |
| Structural Inspector | EN 1504 repair, carbonation/chloride mapping, half-cell potential, ATC-20 post-disaster triage |

</details>

<details>
<summary><strong>Codes & Compliance</strong> — 1 agent</summary>

| Agent | Specialty |
|-------|-----------|
| Building Code Reviewer | IBC 2021 occupancy/egress, NFPA 101, ADA 2010 accessibility, multi-jurisdiction reconciliation |

</details>

## Compatible Tools

| Tool | Install Method |
|------|----------------|
| **Claude Code** | `cp agents/*.md ~/.claude/agents/` |
| **Cursor** | `cp agents/*.md .cursor/rules/` |
| **Windsurf** | `cp agents/*.md .windsurf/rules/` |
| **GitHub Copilot** | `cp agents/*.md .github/instructions/` |
| **Gemini CLI** | `cp agents/*.md ~/.gemini/agents/` |
| **Codex CLI** | `cp agents/*.md ~/.codex/agents/` |
| **Cline** | `cp agents/*.md .clinerules/` |
| **Amazon Q** | `cp agents/*.md .amazonq/rules/` |
| **Aider** | Add to `.aider.conf.yml` as `read:` entries |
| **Claude Desktop** | Paste into project instructions |
| **Claude Web** | Upload `.md` files as project knowledge |
| **Any tool** | Paste `.md` content into system prompt |

## Validation

```bash
bash scripts/lint-agents.sh
```

The lint script checks every agent for: required frontmatter fields, all seven required sections, emoji headers, recognized standards citations, presence of code blocks, and minimum line count. Run it before submitting any pull request.

## Contributing

New agents, updated code editions, additional standards coverage — all welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for the format requirements, quality bar for Technical Deliverables, and PR process.

## Disclaimer

These agents provide civil and structural engineering knowledge for informational and professional assistance purposes. They do not replace the judgment of a licensed Professional Engineer (PE), Chartered Engineer (CEng), or equivalent registered professional. All designs and calculations must be reviewed and stamped by a licensed engineer of record. Standards change — verify against primary sources.

## License

Apache 2.0 — see [LICENSE](LICENSE).
