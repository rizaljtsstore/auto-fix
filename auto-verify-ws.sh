#!/bin/bash
# ==============================================
# Auto Verify WebSocket Status
# by rumahjitra / rizaljtsstore
# ==============================================

clear
echo -e "\e[1;36m=====================================\e[0m"
echo -e "\e[1;37m     VERIFY WEBSOCKET SERVICE        \e[0m"
echo -e "\e[1;36m=====================================\e[0m"

# --- Semak port aktif ---
echo -e "\n🧭 PORT YANG AKTIF:"
ss -tuln | grep -E '80|443|2082|2087|2095|2096' || echo "Tiada port WS aktif."

# --- Semak servis utama ---
echo -e "\n🧩 STATUS SERVIS:"
for s in nginx stunnel4 stunnel5 ws-stunnel ws-dropbear xray; do
    if systemctl is-active --quiet "$s"; then
        echo "✅ $s aktif"
    else
        echo "❌ $s tidak aktif"
    fi
done

# --- Semak domain SSL ---
echo -e "\n🔒 STATUS SSL (certbot/le) :"
if [ -d "/etc/letsencrypt/live" ]; then
    ls /etc/letsencrypt/live | head -n 1 | while read domain; do
        echo "Domain: $domain"
        openssl x509 -in /etc/letsencrypt/live/$domain/fullchain.pem -noout -dates
    done
else
    echo "Tiada sijil SSL dijumpai."
fi

echo -e "\n✅ Verifikasi selesai.\n"
