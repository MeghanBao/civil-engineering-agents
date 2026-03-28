# Contributing to Civil Engineering Agents

Thank you for helping expand this library. Civil engineering is a broad discipline — new agents, updated code editions, and additional standards coverage all make this resource more useful. This guide sets the quality bar for contributions.

## Agent Format Requirements

All agents must have YAML frontmatter with exactly these five fields:

```yaml
---
name: Agent Name
description: One-line summary of what this agent does.
color: "#HEXCODE"
emoji: 🔧
vibe: One punchy sentence that captures the agent's personality and approach.
---
```

All five fields are mandatory. The lint script will flag missing fields as errors.

### Required Sections

Every agent file must contain all seven sections with exact emoji headers in this order:

1. `## 🧠 Your Identity & Memory`
2. `## 🎯 Your Core Mission`
3. `## 🚨 Critical Rules You Must Follow`
4. `## 📋 Your Technical Deliverables`
5. `## 🔄 Your Workflow Process`
6. `## 💭 Your Communication Style`
7. `## 🎯 Your Success Metrics`

The Core Mission section should contain named subsections covering the agent's distinct functional areas.

### Length Requirements

- Minimum: 300 lines
- Target: 300-400+ lines
- No hard maximum, but every line should add domain value

Files below 300 lines will generate a lint warning. Files below 100 lines will generate an error.

## Standards Citation Requirements

Every agent must cite a minimum of five real standards with recognizable identifiers. Accepted citation formats include EN, AISC, ACI, ASCE, ASTM, ISO, DIN, BS, AS, GB, IS, UIC, AASHTO, FHWA, NFPA, IBC, NEC4, FIDIC, RICS NRM, CIRIA, HCM, CSA, NZS, and others recognized by the lint script.

Where possible, include clause or section numbers: "ACI 318-19 cl. 26.12.3" is more useful than "ACI 318-19." Include the edition year when it matters — "ASCE 7-22" and "ASCE 7-16" have different wind speed maps and seismic provisions.

Do not cite superseded standards as primary references without noting their status. If a calculation example uses BS 8110 for legacy comparison, note that it has been replaced by BS EN 1992 with UK NA.

## Technical Deliverables Quality Bar

The Technical Deliverables section is what separates these agents from generic AI assistants. The bar is high:

**Must have actual calculations with real numbers.** Not a description of what a calculation would look like. Not placeholder formulas. Actual numbers worked through to a result with units, followed by a pass/fail verdict.

**Fill-in templates must have functional placeholders.** Use `[Project Name]`, `[DD-MMM-YYYY]`, `[specify]` format — not lorem ipsum, not vague ellipses. Someone should be able to take the template and fill it in without guessing what goes in each field.

**At least one fenced code block per agent.** The code block format is used for calculation packages, checklists, and tabular deliverables because it preserves alignment and makes the content easy to copy.

**Calculations must be self-contained.** State the code, clause, input values, working, and result. A reader who has not seen the agent's earlier text should be able to follow the calculation from inputs to conclusion.

## Validation

Run the lint script before submitting a pull request:

```bash
bash scripts/lint-agents.sh
```

All agents must pass with zero errors. Warnings are acceptable but should be addressed where possible. Do not submit a PR with lint errors.

The lint script checks:
- Frontmatter presence and required fields
- All seven required sections
- All six required emoji headers
- Recognized standards citations
- Presence of code blocks
- Minimum line count

## PR Process

1. Fork the repository
2. Create a branch: `git checkout -b add-[agent-slug]`
3. Write your agent file to `agents/[slug].md`
4. Run `bash scripts/lint-agents.sh` and fix all errors
5. Open a pull request with the following in the description:
   - Agent specialty in one sentence
   - Standards it covers (list the 5+ primary citations)
   - Deliverables it produces (list the Technical Deliverables templates)
   - Why it does not overlap with existing agents (or how it complements them)

Pull requests that do not include this information will be returned for revision before review.

## Proposing New Agents

Open a GitHub issue before writing a new agent. The issue should include:

- Proposed agent name and file slug (e.g., `fire-protection-engineer.md`)
- Division it belongs to, or a proposal for a new division
- Three to five key standards it would cover (with edition years)
- What makes it distinct from existing agents — a new agent that duplicates 80% of an existing agent's content is not useful
- At least two example deliverables it would produce (describe the calculation or template, not just the topic)

Issues that lack this information will be labelled `needs-detail` and may be closed if not updated within 30 days.

## Updating Existing Agents

When a standard is updated and the agent needs to reflect the new edition:

- Cite the update explicitly: "Updated from ACI 318-19 to ACI 318-23"
- Include a before/after comparison in the PR description for any calculation that changed
- If an updated code edition changes a load factor, capacity reduction factor, or design equation in a way that affects a Technical Deliverables calculation, update the calculation to reflect the current edition
- If the old edition is still widely used in practice, consider retaining a brief note about the change rather than deleting the old approach entirely

## Code of Conduct

Engineering is a field where being wrong has real consequences. Critique calculations, question assumptions, and challenge standards citations — but do so constructively and with evidence.

When a contribution contains an error in a calculation or a mis-citation of a standard, the reviewer will point it out with a specific reference. This is not a personal criticism. Correct the error, update the PR, and move on.

Be particularly careful with partial safety factors, load combinations, and capacity reduction factors. These vary between code families and between editions of the same code. A factor from ACI 318-14 pasted into an EN 1992 calculation without conversion is a meaningful error, not a formatting issue.

If you are not confident about a specific code provision, say so in the PR description. It is better to flag uncertainty than to publish a confidently wrong calculation.
