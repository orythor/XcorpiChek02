#!/bin/bash
# ═══════════════════════════════════════════════
#  XcorpiChek01 v2.0 Installer - By XioNiV ID
# ═══════════════════════════════════════════════

RED="\e[31m"; GREEN="\e[32m"; YELLOW="\e[33m"
CYAN="\e[36m"; RESET="\e[0m"; BOLD="\e[1m"; DIM="\e[2m"

info()    { echo -e "${CYAN}[*]${RESET} $*"; }
success() { echo -e "${GREEN}[✓]${RESET} $*"; }
warn()    { echo -e "${YELLOW}[!]${RESET} $*"; }
error()   { echo -e "${RED}[✗]${RESET} $*"; }

clear
echo -e "${CYAN}╭━━━〔 XcorpiChek01 v2.0 - Installer 〕━━━╮${RESET}"
echo -e "${CYAN}┃${RESET}          ${BOLD}By XioNiV ID${RESET}"
echo -e "${CYAN}╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯${RESET}"
echo ""

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Update repo
info "Update packages..."
pkg update -y &>/dev/null
success "Done"

# Dependensi wajib
echo ""
info "Install dependensi utama..."
PKGS=("curl" "jq" "dnsutils" "openssl-tool" "whois")
for p in "${PKGS[@]}"; do
    pkg install -y "$p" &>/dev/null && success "  $p" || warn "  $p (gagal, lanjut...)"
done

# Optional: screenshot tool
echo ""
warn "Install wkhtmltopdf? (untuk Screenshot & Screenrecord)"
echo -e "  ${DIM}~70MB, direkomendasikan${RESET}"
echo -ne "${CYAN}┃${RESET} [y/n] ${GREEN}»${RESET} "
read -r ans_wk
if [ "$ans_wk" == "y" ] || [ "$ans_wk" == "Y" ]; then
    pkg install -y wkhtmltopdf &>/dev/null && success "wkhtmltopdf installed!" || warn "Gagal install wkhtmltopdf"
fi

# Optional: ffmpeg
echo ""
warn "Install ffmpeg? (untuk export rekaman ke MP4)"
echo -ne "${CYAN}┃${RESET} [y/n] ${GREEN}»${RESET} "
read -r ans_ff
if [ "$ans_ff" == "y" ] || [ "$ans_ff" == "Y" ]; then
    pkg install -y ffmpeg &>/dev/null && success "ffmpeg installed!" || warn "Gagal install ffmpeg"
fi

# Chmod semua script
echo ""
info "Setting permissions..."
chmod +x "$SCRIPT_DIR/xcorpichek01.sh"
chmod +x "$SCRIPT_DIR/modules/"*.sh
chmod +x "$SCRIPT_DIR/lib/"*.sh
success "Permissions OK"

# Buat alias
SHELL_RC="$HOME/.bashrc"
[ -f "$HOME/.zshrc" ] && SHELL_RC="$HOME/.zshrc"

if ! grep -q "xcorpichek01" "$SHELL_RC" 2>/dev/null; then
    echo "alias xcorpi='bash $SCRIPT_DIR/xcorpichek01.sh'" >> "$SHELL_RC"
    success "Alias 'xcorpi' ditambahkan ke $(basename $SHELL_RC)"
fi

# Buat output dir
mkdir -p "$HOME/XcorpiChek01_output"/{telegram,youtube,instagram,twitter,spotify,facebook,patreon,roblox,discord,github,gitlab,screenshots,records}
success "Output folder dibuat di ~/XcorpiChek01_output/"

echo ""
echo -e "${GREEN}╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮${RESET}"
echo -e "${GREEN}┃${RESET}     ${BOLD}Instalasi Selesai! v2.0${RESET}"
echo -e "${GREEN}├━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┤${RESET}"
echo -e "${GREEN}┃${RESET} Cara jalankan:"
echo -e "${GREEN}┃${RESET}   ${CYAN}bash xcorpichek01.sh${RESET}"
echo -e "${GREEN}┃${RESET}   ${CYAN}xcorpi${RESET}  ${DIM}(setelah restart terminal)${RESET}"
echo -e "${GREEN}╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯${RESET}"
