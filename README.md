# XcorpiChek01 v2.0
**By XioNiV ID** | Pure Bash — No Python

Tools stalker & security checker untuk Termux.

---

## Fitur

### Stalker
| No | Platform |
|----|----------|
| 01 | Telegram |
| 02 | YouTube |
| 03 | Instagram |
| 04 | Twitter / X |
| 05 | Spotify |
| 06 | Facebook |
| 07 | Patreon |
| 08 | Roblox |
| 09 | Discord (User ID & Server Invite) |
| 10 | GitHub |
| 11 | GitLab |

Semua stalker otomatis **download foto profil** ke `~/XcorpiChek01_output/`

### Tools
| No | Fitur |
|----|-------|
| 12 | Pin Search (Kode Pos Indonesia) |
| 13 | IP Lookup (detail lengkap + VPN/Proxy/Tor detect) |
| 14 | Cek IP Detail (ringkas) |
| 15 | Cek Security Website (SSL, Headers, DNS, WHOIS) |
| 16 | Screenshot Web |
| 17 | Screenrecord Web |

---

## Cara Install

```bash
pkg update && pkg upgrade
pkg install figlet
pip install playwright pillow
playwright install chromium
pkg install git -y
git clone https://github.com/orythor/XcorpiChek01.git
cd XcorpiChek01
bash install.sh
```

## Cara Jalankan

```bash
bash xcorpichek01.sh
# atau setelah restart terminal:
xcorpi
```

---

## Dependensi

Auto install via `install.sh`:
- `curl` `jq` `dnsutils` `openssl-tool` `whois`

Optional (ditanya saat install):
- `wkhtmltopdf` — untuk Screenshot & Screenrecord
- `ffmpeg` — untuk export rekaman ke MP4

---

## Output

Semua hasil disimpan di:
```
~/XcorpiChek01_output/
├── telegram/
├── youtube/
├── instagram/
├── twitter/
├── spotify/
├── facebook/
├── patreon/
├── roblox/
├── discord/
├── github/
├── gitlab/
├── screenshots/
└── records/
```

---

**XioNiV ID** | XcorpiChek01 v2.0
