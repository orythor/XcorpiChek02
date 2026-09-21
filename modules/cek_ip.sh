#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$SCRIPT_DIR/lib/color.sh"
source "$SCRIPT_DIR/lib/banner.sh"
source "$SCRIPT_DIR/lib/utils.sh"

clear; show_sub_banner "CEK IP DETAIL"
echo -e "${DIM}Kosongkan = cek IP sendiri${RESET}"
echo -ne "${GREEN}┃${RESET} IP / Domain ${GREEN}»${RESET} "
read -r target

if [ -z "$target" ]; then
    target=$(curl -s --max-time 10 "https://api.ipify.org")
    info "IP Kamu: ${GREEN}$target${RESET}"
fi

if echo "$target" | grep -qP '[a-zA-Z]'; then
    DOMAIN="$target"
    TARGET_IP=$(dig +short "$DOMAIN" A | grep -oP '^\d+\.\d+\.\d+\.\d+$' | head -1)
    [ -z "$TARGET_IP" ] && { error "Gagal resolve domain!"; exit 1; }
else
    TARGET_IP="$target"; DOMAIN="-"
fi

echo ""
info "Fetching data ..."

DATA=$(curl -s "https://ipapi.co/$TARGET_IP/json/" --max-time 12)
DATA2=$(curl -s "https://ipwho.is/$TARGET_IP" --max-time 10)

IP_ADDR=$(echo "$DATA" | jq -r '.ip // "N/A"')
CITY=$(echo "$DATA" | jq -r '.city // "N/A"')
REGION=$(echo "$DATA" | jq -r '.region // "N/A"')
COUNTRY=$(echo "$DATA" | jq -r '.country_name // "N/A"')
LAT=$(echo "$DATA" | jq -r '.latitude // "N/A"')
LON=$(echo "$DATA" | jq -r '.longitude // "N/A"')
ISP=$(echo "$DATA2" | jq -r '.connection.isp // "N/A"')
ASN=$(echo "$DATA" | jq -r '.asn // "N/A"')
TIMEZONE=$(echo "$DATA" | jq -r '.timezone // "N/A"')
IS_VPN=$(echo "$DATA2" | jq -r '.security.vpn // false')
IS_PROXY=$(echo "$DATA2" | jq -r '.security.proxy // false')
IS_TOR=$(echo "$DATA2" | jq -r '.security.tor // false')

SEC=""
[ "$IS_VPN" == "true" ]   && SEC+="${RED}VPN ${RESET}"
[ "$IS_PROXY" == "true" ] && SEC+="${RED}PROXY ${RESET}"
[ "$IS_TOR" == "true" ]   && SEC+="${RED}TOR ${RESET}"
[ -z "$SEC" ]             && SEC="${GREEN}Bersih${RESET}"

box_top
echo -e "${CYAN}┃${RESET}      ${BOLD}Cek IP Detail${RESET}"
box_mid
box_line "IP       : ${GREEN}$IP_ADDR${RESET}"
box_line "Domain   : $DOMAIN"
box_line "Kota     : $CITY"
box_line "Provinsi : $REGION"
box_line "Negara   : ${YELLOW}$COUNTRY${RESET}"
box_line "Koordinat: $LAT, $LON"
box_line "ISP      : $ISP"
box_line "ASN      : $ASN"
box_line "Timezone : $TIMEZONE"
box_line "Security : $SEC"
box_line "Maps     : https://maps.google.com/?q=$LAT,$LON"
box_bot
success "Selesai!"
