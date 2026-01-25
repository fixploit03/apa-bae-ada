# Tahapan-Tahapan Wireless Hacking

Sebelum kita masuk ke praktek wireless hacking, lu kudu tau dulu apa aja tahapan-tahapan wireless hacking. Kenapa ini dibahas? Biar lu ngerti urutan-urutanya, prosesnya gimana, step by step-nya apa aja. Jadi nanti pas praktek, lu kaga bingung, kaga planga-plongo sama asal pencet-pencet doang, sama udah punya bekel dasar buat ngejalanin tiap-tiap jenis serangannya.

## 1. Reconnaissance (Ngumpulin Info)
Ini proses paling awal di wireless hacking, lu harus ngumpulin informasi dulu sebanyak-banyaknya tentang target yang mau lu serang:

Yang dilakuin:
- Ngescan Wi-Fi yang ada di sekitar lu pake tools kaya Airodump-NG, Kismet, dll
- Nyatet semua info penting kaya SSID (nama Wi-Fi), MAC address, channel yang dipake, jenis enkripsi yang dipake (WEP, WPA, WPA2, WPA3)
- Nyari tau AP mana yang gampang dijebol (vulnerable)

## 2. Scanning (Ngintip)
Nah abis lu tau target mana yang mau lu diserang, lu kudu ngescan lebih dalem lagi:

Yang dilakuin:
- Mantau paket data yang dikirim sama yang diterima
- Nyari tau ada berapa banyak client yang konek sama AP
- Nganalisis pola traffic sama kelemahan yang ada. (kaya make Open kalo kaga WEP)

## 3. Gaining Access (Dapetin Akses)
Ini tahapan yang paling penting, ada beberapa cara yang biasanya dipake:

### 1. Buat bobol WEP
- Capture IVs sebanyak-banyaknya (kira-kira `40000`-`80000` IVs)
- Crack kunci WEP

Berhubung WEP udah bapuk, jadi kalo IVs nya yang dicapture banyak, persentase buat dapet passwordnya `95%` ke atas.

### 2. Buat Bobol WPA/WPA2-PSK
- Capture 4-way handshake antara client sama AP
- Bisa digabungin sama serangan deauth buat maksa client reconnect
- Crack kunci WPA/WPA2-PSK pake serangan brute force kalo kaga pake dictionary attack

Kalo WPA/WPA2-PSK kaga boleh disamain sama WEP, kalo WPA/WPA2-PSK itu tergantung password dari Wi-Fi target, kalo passwordnya rada susah. Kemungkinan buat dapet passwordnya ge rada-rada.

## 4. Verification (Ngecek Akses)
Kalo lu udah dapet passwordnya, lu harus ngecek passwordnya bener apa kaga.

Yang dilakuin:
- Ngetes koneksi ke Wi-Fi pake password yang udah lu dapet
- Pastiin lu bisa ngakses internet kalo kaga jaringan internal
- Ngecek IP address yang lu dapet
- Ngetes akses ke gateway (router)

## 5.  Maintaining Access (Jaga Akses)
Kalo lu udah bisa masuk, lu kudu jaga akesnya biar nanti lu bisa konek lagi kapan aja.

Yang dilakuin:
- Nginstal backdoor (pintu belakang)
- Ngubah setingan router

## Kesimpulan
Dari semua tahapan wireless hacking yang udah kita bahas, bisa ditarik kesimpulan kalo wireless hacking itu ada alurnya dan kaga bisa asal jalan gitu aja. Prosesnya mulai dari ngumpulin info, ngintip trafik, dapetin akses, ngecek hasil, sampe jaga akses. Semuanya saling nyambung dan kaga boleh dilewatin sembarangan.

Kalo lu udah paham sama tahapan ini, nanti pas praktek lu bakal lebih tenang, lebih terarah, dan tau persis apa yang lagi lu lakuin.
