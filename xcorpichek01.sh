#!/bin/bash
# ═══════════════════════════════════════════════
#  XcorpiChek01 v2.0 - By XioNiV ID
#  Stalker & Security Tools for Termux
# ═══════════════════════════════════════════════

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/color.sh"
source "$SCRIPT_DIR/lib/banner.sh"
source "$SCRIPT_DIR/lib/utils.sh"

check_deps() {
    local missing=0
    local deps=("curl" "jq" "dig" "openssl")
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &>/dev/null; then
            error "Missing: $dep → pkg install $dep"
            missing=1
        fi
    done
    [ "$missing" -eq 1 ] && { warn "Jalankan install.sh dulu!"; exit 1; }
}

show_menu() {
    clear
    show_banner
    echo -e "${CYAN}╭━━━〔 STALKER 〕━━━━━━━━━━━━━━━━━━━━╮${RESET}"
    echo -e "${CYAN}┃${RESET}  ${GREEN}[01]${RESET} Stalker Telegram"
    echo -e "${CYAN}┃${RESET}  ${GREEN}[02]${RESET} Stalker YouTube"
    echo -e "${CYAN}┃${RESET}  ${GREEN}[03]${RESET} Stalker Instagram"
    echo -e "${CYAN}┃${RESET}  ${GREEN}[04]${RESET} Stalker Twitter / X"
    echo -e "${CYAN}┃${RESET}  ${GREEN}[05]${RESET} Stalker Spotify"
    echo -e "${CYAN}┃${RESET}  ${GREEN}[06]${RESET} Stalker Facebook"
    echo -e "${CYAN}┃${RESET}  ${GREEN}[07]${RESET} Stalker Patreon"
    echo -e "${CYAN}┃${RESET}  ${GREEN}[08]${RESET} Stalker Roblox"
    echo -e "${CYAN}┃${RESET}  ${GREEN}[09]${RESET} Stalker Discord"
    echo -e "${CYAN}┃${RESET}  ${GREEN}[10]${RESET} Stalker GitHub"
    echo -e "${CYAN}┃${RESET}  ${GREEN}[11]${RESET} Stalker GitLab"
    echo -e "${CYAN}├━━━〔 TOOLS 〕━━━━━━━━━━━━━━━━━━━━━━┤${RESET}"
    echo -e "${CYAN}┃${RESET}  ${YELLOW}[12]${RESET} Pin Search"
    echo -e "${CYAN}┃${RESET}  ${YELLOW}[13]${RESET} IP Lookup"
    echo -e "${CYAN}┃${RESET}  ${YELLOW}[14]${RESET} Cek IP Detail"
    echo -e "${CYAN}┃${RESET}  ${YELLOW}[15]${RESET} Cek Security Website"
    echo -e "${CYAN}┃${RESET}  ${YELLOW}[16]${RESET} Screenshot Web"
    echo -e "${CYAN}┃${RESET}  ${YELLOW}[17]${RESET} Screenrecord Web"
    echo -e "${CYAN}├━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┤${RESET}"
    echo -e "${CYAN}┃${RESET}  ${RED}[00]${RESET} Keluar"
    echo -e "${CYAN}╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯${RESET}"
    echo ""
    echo -ne "${CYAN}┃${RESET} Pilih menu ${GREEN}»${RESET} "
}

main() {
    check_deps
    while true; do
        show_menu
        read -r choice
        case "$choice" in
            01|1)  bash "$SCRIPT_DIR/modules/stalker_telegram.sh" ;;
            02|2)  bash "$SCRIPT_DIR/modules/stalker_youtube.sh" ;;
            03|3)  bash "$SCRIPT_DIR/modules/stalker_instagram.sh" ;;
            04|4)  bash "$SCRIPT_DIR/modules/stalker_twitter.sh" ;;
            05|5)  bash "$SCRIPT_DIR/modules/stalker_spotify.sh" ;;
            06|6)  bash "$SCRIPT_DIR/modules/stalker_facebook.sh" ;;
            07|7)  bash "$SCRIPT_DIR/modules/stalker_patreon.sh" ;;
            08|8)  bash "$SCRIPT_DIR/modules/stalker_roblox.sh" ;;
            09|9)  bash "$SCRIPT_DIR/modules/stalker_discord.sh" ;;
            10)    bash "$SCRIPT_DIR/modules/stalker_github.sh" ;;
            11)    bash "$SCRIPT_DIR/modules/stalker_gitlab.sh" ;;
            12)    bash "$SCRIPT_DIR/modules/pin_search.sh" ;;
            13)    bash "$SCRIPT_DIR/modules/ip_lookup.sh" ;;
            14)    bash "$SCRIPT_DIR/modules/cek_ip.sh" ;;
            15)    bash "$SCRIPT_DIR/modules/cek_security.sh" ;;
            16)    bash "$SCRIPT_DIR/modules/screenshot_web.sh" ;;
            17)    bash "$SCRIPT_DIR/modules/screenrecord_web.sh" ;;
            00|0)  echo -e "\n${RED}[*] Keluar dari XcorpiChek01...${RESET}\n"; exit 0 ;;
            *)     error "Pilihan tidak valid!"; sleep 1 ;;
        esac
        echo -e "\n${YELLOW}[*] Tekan ENTER untuk kembali ke menu...${RESET}"
        read -r
    done
}

main
