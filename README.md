# 🧰 Auto Fix & Setup Tools by rumahjitra

Koleksi skrip automatik untuk penyelenggaraan servis SSH, WebSocket, dan Blueblue.

## 📦 Senarai Skrip

| Skrip | Fungsi |
|-------|---------|
| **auto-setup-blueblue.sh** | Setup Blueblue (slim) + prompt domain |
| **auto-fix-ws.sh** | Auto repair WS-Stunnel & WS-Dropbear |
| **auto-verify-ws.sh** | Semak status servis WS & SSL |

## 🔧 Cara Guna

### 🌀 Setup Blueblue
```bash
wget -q https://raw.githubusercontent.com/rizaljtsstore/auto-fix/main/auto-setup-blueblue.sh -O auto-setup-blueblue.sh && chmod +x auto-setup-blueblue.sh && ./auto-setup-blueblue.sh
