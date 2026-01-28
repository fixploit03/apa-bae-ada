Di materi ini, gw bakal ngebahas tentang tahapan-tahapan wireless hacking.

# Tahapan-Tahapan Wireless Hacking

## 1. Reconnaissance (Ngumpulin Info)
Ini tahapan yang paling awal di wireless hacking, lu harus ngumpulin informasi dulu sebanyak mungkin tentang target yang mau lu serang.

Yang dilakuin bisa:
- Ngescan Wi-Fi yang ada di sekitar lu
- Nyatet semua info penting kaya:
  - SSID
  - BSSID
  - Channel yang dipake
  - Jenis enkripsi yang dipake
- Nyari tau AP mana yang gampang buat dibobol (vulnerable)

## 2. Gaining Access (Dapetin Akses)
Ini tahapan yang paling penting di wireless hacking, ada beberapa cara yang bisa lu pake:

### 1. Buat Ngebobol WEP
- Tangkep IVs sebanyak mungkin (kira-kira `40000`-`80000` IVs)
- Crack kunci WEP make tool `aircrack-ng`

> [!NOTE]
> Berhubung WEP udah bapuk, jadi kalo IVs nya yang lu tangkep itu banyak, persentase buat dapetin passwordnya `95%` ke atas.

### 2. Buat Ngebobol WPA/WPA2-PSK
- Tangkep 4-Way Handshake
- Crack kunci WPA/WPA2-PSK make tool `aircrack-ng`

> [!NOTE]
> Kalo WPA/WPA2-PSK kaga boleh lu samain sama WEP, kalo WPA/WPA2-PSK itu tergantung dari password yang dipake sama Wi-Fi target, kalo password yang dipake rada susah. Kemungkinan buat dapet passwordnya ge rada-rada.

## 3. Verification (Ngecek)
Kalo lu udah berhasil ngedapetin itu password Wi-Fi, lu harus ngecek passwordnya itu bener apa kaga.

Yang dilakuin bisa:
- Ngetes koneksi ke Wi-Fi make password yang udah lu dapet
- Pastiin lu bisa ngakses internet kalo kaga jaringan internalnya
- Ngecek IP address yang lu dapet
- Ngetes akses ke gateway (router)

## 4.  Maintaining Access (Ngejaga Akses)
Kalo lu udah bisa masuk ke jaringan itu, lu kudu ngejaga akses lu biar nanti lu bisa konek lagi ke jaringan itu kapan aja.

Yang dilakuin bisa:
- Nginstal backdoor (pintu belakang)
- Ngubah setingan router

## Kesimpulan

Intinya, wireless hacking itu ada prosesnya, kaga ujug-ujug lu bisa masuk ke jaringan yang lu mau. Kalo urutannya kaga sesuai, hasilnya juga kaga bakal maksimal.
