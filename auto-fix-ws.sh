#!/bin/bash
# ==============================================
# Auto Fix WebSocket (Stunnel & Dropbear)
# by rumahjitra / rizaljtsstore
# ==============================================

clear
echo -e "\e[1;36m=====================================\e[0m"
echo -e "\e[1;37m     AUTO FIX WEBSOCKET SERVICE      \e[0m"
echo -e "\e[1;36m=====================================\e[0m"

# --- Semak servis ---
check_service() {
    local name=$1
    if systemctl is-active --quiet "$name"; then
        echo "✅ $name aktif dan berjalan"
    else
        echo "⚠️  $name tidak aktif, cuba perbaiki..."
        systemctl daemon-reload
        systemctl restart "$name"
        sleep 2
        if systemctl is-active --quiet "$name"; then
            echo "✅ $name berjaya dibaiki"
        else
            echo "❌ $name masih gagal, semak log manual"
        fi
    fi
}

# --- Senarai servis berkaitan WS ---
services=("nginx" "stunnel4" "stunnel5" "ws-stunnel" "ws-dropbear" "xray")

for s in "${services[@]}"; do
    check_service "$s"
done

echo ""
echo "✅ Selesai proses auto-fix."
echo ""
