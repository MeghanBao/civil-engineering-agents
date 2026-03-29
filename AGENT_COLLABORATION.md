# Agent Collaboration Guide

These agents are designed as independent specialists, but real civil engineering projects require multi-discipline coordination. This guide shows how to combine agents for common project workflows.

## Multi-Agent Workflows

### Building Design — Full Coordination

A typical building project engages 6–10 agents in sequence. The order matters because each agent's output feeds the next.

```
Phase 1 — Site and Ground
  ┌─ Geotechnical Engineer → GIR, characteristic parameters, foundation recommendation
  └─ Environmental Engineer → EIA screening, contamination assessment, planning conditions

Phase 2 — Structural Concept
  ┌─ Structural Engineer → framing system, lateral system, foundation loads
  ├─ Seismic Engineer → SDC/ductility class, q/R factor, drift limits (seismic zones only)
  └─ Wind Engineer → MWFRS pressures, C&C pressures, occupant comfort assessment

Phase 3 — Building Systems
  ┌─ MEP Coordinator → HVAC loads, electrical load schedule, sprinkler classification
  ├─ Facade Engineer → curtain wall system, U-value, anchor bracket loads → feeds back to Structural
  └─ Building Code Reviewer → egress, occupancy, fire rating, accessibility compliance

Phase 4 — Construction
  ┌─ Construction Manager → procurement route, programme, risk register
  ├─ Cost Estimator → elemental cost plan, BOQ, life cycle costing
  ├─ Project Scheduler → CPM programme, delay analysis baseline
  ├─ Construction Safety Engineer → CDM/OSHA plan, RAMS, lifting plans
  └─ BIM Coordinator → BEP, clash detection, COBie handover
```

**Example prompt sequence:**

> 1. *"Use the Geotechnical Engineer to interpret this borehole log and recommend foundation type for a 12-storey building on soft clay, EN 1997 DA1"*
> 2. *"Use the Structural Engineer to design the RC frame for the building, using the geotechnical parameters from step 1, EN 1992/1993"*
> 3. *"Use the Wind Engineer to compute MWFRS and C&C pressures for the structural engineer and facade engineer"*
> 4. *"Use the Facade Engineer to design the curtain wall mullions and anchor brackets using the C&C pressures from step 3"*

### Bridge Design — Waterway Crossing

Bridge projects require tight coordination between structural, geotechnical, and hydraulic disciplines.

```
Phase 1 — Site Characterisation
  ┌─ Geotechnical Engineer → foundation parameters, pile design recommendations
  ├─ Hydraulic Engineer → design flood, hydraulic clearance, scour depth (HEC-18)
  └─ Seismic Engineer → seismic hazard, SDC, design response spectrum

Phase 2 — Bridge Design
  ┌─ Bridge Engineer → type selection, superstructure, substructure, bearings
  ├─ Seismic Engineer → seismic detailing, isolation (if applicable)
  └─ Highway Engineer → approach alignment, pavement tie-in, guardrail

Phase 3 — Construction
  ┌─ Construction Manager → staging, temporary works, programme
  └─ Structural Inspector → inspection plan, condition rating baseline
```

**Example prompt sequence:**

> 1. *"Use the Hydraulic Engineer to determine the 100-year design flood for the river crossing at [location], and compute HEC-18 scour depth"*
> 2. *"Use the Bridge Engineer to select the bridge type for a 45m span crossing with the scour depth from step 1, AASHTO LRFD"*
> 3. *"Use the Seismic Engineer to verify the bridge seismic design for SDC D, ASCE 7-22 + AASHTO Guide Spec"*

### Infrastructure Development — Road and Drainage

Highway and drainage engineering are inseparable. The road alignment drives the drainage design, and the drainage constraints feed back to the alignment.

```
Phase 1 — Route and Ground
  ┌─ Highway Engineer → route corridor, geometric alignment, earthworks
  ├─ Geotechnical Engineer → subgrade CBR, cut slope stability, embankment design
  └─ Environmental Engineer → EIA, noise assessment, ecological constraints

Phase 2 — Pavement and Drainage
  ┌─ Highway Engineer → pavement design (MEPDG/AASHTO 1993)
  ├─ Drainage Engineer → SUDS strategy, pipe network, attenuation
  └─ Traffic Engineer → signal design, intersection capacity, safety audit support

Phase 3 — Construction and Safety
  ┌─ Construction Manager → earthworks programme, subcontractor coordination
  ├─ Construction Safety Engineer → TMP, RAMS for earthworks, confined space
  └─ Materials Testing Engineer → compaction QC, asphalt mix verification
```

### Tunnel Project — Urban Metro

Tunneling projects are risk-driven. The ground characterisation feeds everything.

```
Phase 1 — Ground and Risk
  ┌─ Geotechnical Engineer → GIR, ground model, characteristic parameters
  ├─ Tunnel Engineer → method selection, lining design, settlement prediction
  └─ Ground Improvement Engineer → ground treatment for launch/reception shafts

Phase 2 — Design
  ┌─ Tunnel Engineer → detailed lining design, TBM specification
  ├─ Structural Engineer → station box, cross passages
  └─ Seismic Engineer → seismic design of underground structures

Phase 3 — Construction
  ┌─ Tunnel Engineer → monitoring scheme, trigger levels
  ├─ Structural Inspector → pre-construction surveys, damage assessment
  └─ Construction Safety Engineer → confined space, ventilation, emergency plan
```

### Coastal / Marine Structure

```
Phase 1 — Environmental and Ground
  ┌─ Hydraulic Engineer → wave climate, tidal levels, coastal processes
  ├─ Geotechnical Engineer → seabed characterisation, scour assessment
  └─ Environmental Engineer → marine EIA, habitat assessment

Phase 2 — Structural Design
  ┌─ Structural Engineer → quay wall, jetty, breakwater structural design
  ├─ Geotechnical Engineer → pile design in marine soils, liquefaction
  └─ Materials Testing Engineer → concrete durability (chloride exposure), cathodic protection
```

## Agent Information Handoff

When using agents in sequence, pass the critical outputs from one agent as inputs to the next.

### Key Handoff Parameters

| From → To | What to Pass |
|-----------|-------------|
| **Geotechnical → Structural** | Characteristic bearing capacity, pile capacity, settlement limits, foundation type |
| **Wind → Structural** | MWFRS base shear, overturning moment, floor pressures by height |
| **Wind → Facade** | C&C pressures by zone (positive and negative), effective wind area |
| **Structural → Facade** | Inter-story drift ratio, slab edge detail, anchor bracket locations |
| **Structural → MEP** | Floor-to-floor height, penetration approval status, plant room structural loads |
| **Hydraulic → Bridge** | Design flood Q100/Q500, scour depth, hydraulic clearance requirement |
| **Seismic → Structural** | SDC, Ss/S1/SDS/SD1, R/q factor, drift limits, analysis method required |
| **Highway → Drainage** | Catchment areas, road gradients, inlet locations, receiving watercourse |
| **Geotechnical → Tunnel** | Ground model, characteristic parameters, groundwater profile |
| **MEP → Structural** | Plant room equipment loads, penetration schedule, fire stopping requirements |
| **Facade → Structural** | Anchor bracket reactions (wind + gravity + thermal) |
| **Facade → MEP** | Ucw values, ψ-values for energy model, air leakage classification |

## Unit System Coordination

When multiple agents work on the same project, establish the unit system at the start:

- **SI (kN, MPa, m, °C):** Used by Eurocode, BS, AS, NZS, IS, GB standards
- **US Customary (kips, psi, ft, °F):** Used by ASCE 7, ACI, AISC, AASHTO standards
- **Mixed:** Some codes (e.g., Canadian CSA) use SI with imperial reinforcement sizes

State the unit system in the first prompt and maintain it throughout the workflow. If agents produce results in different unit systems, convert before handoff. Common conversions:

| Conversion | Factor |
|-----------|--------|
| 1 kN | 0.2248 kips |
| 1 MPa | 145.0 psi |
| 1 m | 3.281 ft |
| 1 kN/m² | 20.89 psf |
| 1 kN·m | 0.7376 kip·ft |

## Tips for Effective Multi-Agent Use

1. **State the governing code at the start.** All agents need to know which code family applies. "EN 1992" and "ACI 318" produce different results for the same beam — using both on the same project without coordination is a design error.

2. **Pass numerical results, not summaries.** "The geotechnical engineer recommended piles" is not useful input for the structural engineer. "Bored piles, D = 600mm, Rc,d = 1,292 kN (EN 1997 DA1 C2), maximum settlement 15mm" is useful input.

3. **Identify the interface early.** The most common coordination failures are at the interface between disciplines: anchor bracket loads between facade and structure, penetration sizes between MEP and structure, scour depth between hydraulic and bridge. Ask for interface values explicitly.

4. **Use the same load combinations.** EN 1990 and ASCE 7 define different load combinations. All agents on the same project must use the same set. Confirm the load combination set in the first structural prompt.

5. **Track assumptions across agents.** If the wind engineer assumes Exposure B, the structural engineer must use the same assumption. If the geotechnical engineer derives Su = 45 kPa as the characteristic value, the structural engineer must use that value — not a different estimate.
