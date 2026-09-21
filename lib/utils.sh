#!/bin/bash

# URL encode pure bash
urlencode() {
    local string="$1"
    local encoded=""
    local i char
    for (( i=0; i<${#string}; i++ )); do
        char="${string:$i:1}"
        case "$char" in
            [a-zA-Z0-9._~-]) encoded+="$char" ;;
            *) printf -v hex '%02X' "'$char"; encoded+="%$hex" ;;
        esac
    done
    echo "$encoded"
}

# Download foto profil
download_photo() {
    local url="$1"
    local outdir="$2"
    local filename="$3"
    local outpath="$outdir/$filename"
    mkdir -p "$outdir"
    if [ -n "$url" ] && [ "$url" != "null" ] && [ "$url" != "N/A" ]; then
        curl -sL "$url" -o "$outpath" --max-time 15 2>/dev/null
        if [ -s "$outpath" ]; then
            echo "$outpath"
            return 0
        fi
    fi
    echo ""
    return 1
}

# Box print
box_line() { echo -e "${CYAN}┃${RESET} $*"; }
box_top()  { echo -e "${CYAN}╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮${RESET}"; }
box_mid()  { echo -e "${CYAN}├━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┤${RESET}"; }
box_bot()  { echo -e "${CYAN}╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯${RESET}"; }

OUTDIR="$HOME/XcorpiChek01_output"
mkdir -p "$OUTDIR"
