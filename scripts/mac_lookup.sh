#!/bin/bash
#
# MAC Address Vendor Lookup
# Dibuat oleh: Rofi (Fixploit03)

# Dadabase OUI
oui="oui.txt"

if [[ ! -f "${oui}" ]]; then
        echo "[-] File '${oui}' tidak ditemukan."
        echo "[*] Mendownload file '${oui}'..."
        if wget "https://github.com/fixploit03/apa-bae-ada/raw/refs/heads/main/etc/oui.txt"; then
                echo "[+] Berhasil mendownload file '${oui}'."
                exit 0
        else
                echo "[-] Gagal mendownload file '${oui}'."
                exit 1
        fi
fi

# Banner
echo ""
echo "MAC Address Vendor Lookup"
echo "Dibuat oleh: Rofi (Fixploit03)"
echo ""

# Input BSSID
read -p "[?] BSSID: " bssid

if [[ -z "${bssid}" ]]; then
        echo "[-] BSSID tidak boleh kosong."
        exit 1
fi

if [[ ! "${bssid}" =~ ^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$ ]]; then
        echo "[-] Format BSSID tidak valid."
        exit 1
fi

# Proses
clear_bssid=$(echo "${bssid}" | tr -d ":")
vendor_id=$(echo "${clear_bssid:0:6}")
device_id=$(echo "${clear_bssid:6:12}")
vendor=$(grep "${vendor_id}" "${oui}" | cut -d ')' -f 2 | xargs)

if [[ -z "${vendor}" ]]; then
        status="[-]"
        vendor="Tidak diketahui"
else
        status="[+]"
fi

# Hasil
echo "[+] BSSID asli: ${bssid}"
echo "[+] Clear BSSID: ${clear_bssid}"
echo "[+] Vendor ID: ${vendor_id}"
echo "[+] Device ID: ${device_id}"
echo "${status} Vendor: ${vendor}"

exit 0
