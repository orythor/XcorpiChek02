#!/bin/bash
source "$(dirname "${BASH_SOURCE[0]}")/color.sh"

show_banner() {
    echo -e "${CYAN}╭━━━〔 XcorpiChek01 〕━━━━━━━━━━━━${RESET}"
    echo -e "${CYAN}┃${RESET}"
    echo -e "${CYAN}┃${RESET}  ${MAGENTA}▓█▓▒░${RESET}  ██╗  ██╗ ██████╗ ██████╗ ██████╗ ██████╗ ██╗"
    echo -e "${CYAN}┃${RESET}  ${MAGENTA}░▒▓█${RESET}  ╚██╗██╔╝██╔════╝██╔═══██╗██╔══██╗██╔══██╗██║"
    echo -e "${CYAN}┃${RESET}  ${MAGENTA}▓█▓▒${RESET}   ╚███╔╝ ██║     ██║   ██║██████╔╝██████╔╝██║"
    echo -e "${CYAN}┃${RESET}  ${MAGENTA}▒▓█▓${RESET}   ██╔██╗ ██║     ██║   ██║██╔══██╗██╔═══╝ ██║"
    echo -e "${CYAN}┃${RESET}  ${MAGENTA}█▓▒░${RESET}  ██╔╝ ██╗╚██████╗╚██████╔╝██║  ██║██║     ██║"
    echo -e "${CYAN}┃${RESET}  ${MAGENTA}░░▒▒${RESET}  ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝"
    echo -e "${CYAN}┃${RESET}"
    echo -e "${CYAN}╰━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo -e "   ${DIM}By XioNiV ID${RESET}  ${GREEN}v2.0${RESET}"
    echo ""
}

show_sub_banner() {
    echo -e "${CYAN}╭━━━〔 XcorpiChek01 〕〔 $1 〕━━━━━━╮${RESET}"
    echo -e "${CYAN}┃${RESET}  ${DIM}By XioNiV ID${RESET}  ${GREEN}v2.0${RESET}"
    echo -e "${CYAN}╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯${RESET}"
    echo ""
}
