#!/usr/bin/env bash
# lint-agents.sh — Quality validation for civil-engineering-agents
# Adapted from healthcare-agents lint conventions by ajhcs
# Inspired by agency-agents by Michael Sitarzewski

set -euo pipefail

AGENTS_DIR="${1:-agents}"
ERRORS=0
WARNINGS=0

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m'

error() { echo -e "${RED}ERROR${NC}: $1"; ERRORS=$((ERRORS + 1)); }
warn()  { echo -e "${YELLOW}WARN${NC}: $1";  WARNINGS=$((WARNINGS + 1)); }
ok()    { echo -e "${GREEN}OK${NC}: $1"; }

echo "=== Civil Engineering Agents Lint ==="
echo "Scanning: $AGENTS_DIR/"
echo ""

FILE_COUNT=0

for file in "$AGENTS_DIR"/*.md; do
    [ -f "$file" ] || continue
    FILE_COUNT=$((FILE_COUNT + 1))
    basename=$(basename "$file")

    # Frontmatter check
    if ! head -1 "$file" | grep -q "^---$"; then
        error "$basename: Missing frontmatter opening ---"
        continue
    fi

    frontmatter=$(awk 'NR>1{if(/^---$/){exit}; print}' "$file")

    # Required frontmatter fields
    for field in name description color emoji vibe; do
        if ! echo "$frontmatter" | grep -q "^${field}:"; then
            error "$basename: Missing required frontmatter field '${field}'"
        fi
    done

    content=$(cat "$file")

    # Required sections
    for section in "Identity & Memory" "Core Mission" "Critical Rules" "Technical Deliverables" "Workflow Process" "Communication Style" "Success Metrics"; do
        if ! echo "$content" | grep -q "$section"; then
            warn "$basename: Missing section '${section}'"
        fi
    done

    # Emoji section headers
    for emoji_header in "## 🧠" "## 🎯" "## 🚨" "## 📋" "## 🔄" "## 💭"; do
        if ! echo "$content" | grep -q "$emoji_header"; then
            warn "$basename: Missing emoji header '${emoji_header}'"
        fi
    done

    # Standards citation check
    if ! echo "$content" | grep -qE "(EN [0-9]|AISC|ACI [0-9]|ASCE [0-9]|ASTM [A-Z][0-9]|ISO [0-9]|DIN [0-9]|BS [0-9EN]|AS [0-9]|GB [0-9]|IS [0-9]|UIC [0-9]|AASHTO|FHWA|NFPA|IBC|NEC4|FIDIC|RICS NRM|CIRIA|HCM 7|PMBOK|CSA [A-Z]|NZS [0-9]|IRC [0-9]|JTG|CWCT|CIBSE)"; then
        warn "$basename: No recognized standards citations found"
    fi

    # Code block / calculation check
    if ! echo "$content" | grep -q '```'; then
        warn "$basename: No code blocks found — Technical Deliverables should have real calculation templates"
    fi

    # Line count
    body_lines=$(wc -l < "$file")
    if [ "$body_lines" -lt 100 ]; then
        error "$basename: Only ${body_lines} lines — minimum 100 required"
    elif [ "$body_lines" -lt 300 ]; then
        warn "$basename: ${body_lines} lines — target is 300+ for full domain coverage"
    fi

    ok "$basename (${body_lines} lines)"
done

echo ""
echo "=== Summary ==="
printf "Files scanned:  %d\n" "$FILE_COUNT"
echo -e "Errors:         ${RED}${ERRORS}${NC}"
echo -e "Warnings:       ${YELLOW}${WARNINGS}${NC}"
echo ""

if [ "$ERRORS" -gt 0 ]; then
    echo -e "${RED}FAILED${NC} — fix errors before merging"
    exit 1
elif [ "$WARNINGS" -gt 0 ]; then
    echo -e "${YELLOW}PASSED with warnings${NC}"
    exit 0
else
    echo -e "${GREEN}ALL CHECKS PASSED${NC}"
    exit 0
fi
