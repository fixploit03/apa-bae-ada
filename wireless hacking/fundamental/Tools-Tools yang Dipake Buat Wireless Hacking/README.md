Di materi ini, gw bakal ngebahas tools-tools yang dipake buat wireless hacking, mulai dari penjelasannya sampe jenis-jenisnya.

# Tools-Tools yang Dipake Buat Wireless Hacking

## Tools Buat WEP & WPA/WPA2-PSK

### 1. Aircrack-NG Suite

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/aircrack.jpg" />
</div>

Aircrack-NG Suite adalah tools lejen di dunia wireless hacking yang isinya sekumpulan tools CLI yang dipake buat ngetes keamanan Wi-Fi WEP sama WPA/WPA2-PSK.

Tools yang ada di Aircrack-NG Suite:
- `airbase-ng`: Tool buat ngebikin Rogue AP (AP palsu).
- `aircrack-ng`: Tool buat ngecrack kunci (password) Wi-Fi WEP sama WPA/WPA-PSK.
- `airdecap-ng`: Tool buat ngedecrypt hasil capture, kalo kuncinya udah ketauan.
- `airdecloak-ng`: Tool buat ngebuang frame WEP yang cloaked (frame yang disembunyiin) dari file capture.
- `aireplay-ng`: Tool buat ngejalanin macem-macem jenis serangan Wi-Fi.
- `airmon-ng`: Tool buat ngontrol interface wireless (enable/disable monitor mode).
- `airodump-ng`: Tool buat nyecan sama nangkep paket (kaya IVs sama handshake).
- `airodump-ng-oui-update`: Tool buat ngeupdate list IEEE OUI (vendor MAC address) yang dipake sama tool `airodump-ng`.
- `airolib-ng`: Tool buat ngebikin sama ngelola tabel PMK.
- `airserv-ng`: Tool buat ngeshare (bagi) interface wireless ke perangkat yang lain make jaringan.
- `airtun-ng`:  Tool buat ngebikin virtual tunnel interface wireless buat dipake sama tool `aircrack-ng`.
- `airventriloquist-ng`: Tool buat nginject paket ke jaringan Wi-Fi yang keenkripsi.
- `besside-ng`: Tool buat ngotomatisin proses nangkep IVs WEP sama handshake WPA/WPA2-PSK.
- `besside-ng-crawler`: Tool buat nyari sama ngefilter file capture yang ada EAPOL frame nya.
- `buddy-ng`: Tool yang dipake buat dijadiin server yang tugasnya buat nerima koneksi. Tool ini dipake barengan sama tool `easside-ng`.
- `dcrack`: Tool buat distributed cracking (ngecrack barengan di beberapa mesin).
- `easside-ng`: Tool buat nyusup ke jaringan WEP tanpa kudu lu tau kunci WEP nya.
- `ivstools`: Tool buat ngotak-ngatik file IVs (merge, split, convert).
- `kstats`: Tool buat ngeliat statistik voting algoritma FMS dari file IVs make kunci WEP yang udah didapet.
- `makeivs-ng`: Tool buat ngebikin IVs dummy (boongan), dipake buat latihan doang.
- `packetforge-ng`: Tool buat ngebikin paket custom (kaya ARP, UDP, ICMP, dll).
- `tkiptun-ng`: Tool buat nginject beberapa frame ke jaringan WPA TKIP yang pake QoS.
- `wesside-ng`: Tool buat ngotomatisin proses nyerang WEP.
- `wpaclean`: Tool buat ngebersihin file capture.
- `airgraph-ng`: Tool buat bikin visualisasi (gambaran) dari file capture.
- `airodump-join`: Tool pendukung tool `airgraph-ng` yang dipake buat ngegabungin beberapa file output dari tool `airodump-ng` jadi satu file.

Tools yang kudu wajib lu kuasai:
- `airmon-ng`
- `airodump-ng`
- `aireplay-ng`
- `aircrack-ng`

> [!NOTE]
> Lu kaga harus nguasain semua tools yang ada di Aircrack-NG Suite. Cukup yang penting-penting aja. Kalo emang lu mau nguasain semuanya, itu bisa jadi nilai ples buat lu.

### 2. Cowpatty

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/cowpatty.jpg" />
</div>

Cowpatty adalah tool CLI yang dipake buat ngecrack kunci Wi-Fi (WPA/WPA2-PSK).

Teknik yang dipake:
1. Dictionary Attack
2. Pre-Computed PMK

Tools yang ada di Cowpatty:
- `cowpatty`: Tool inti yang dipake buat ngecrack kunci Wi-Fi (WPA/WPA2-PSK).
- `genpmk`: Tool pendukung yang dipake buat ngebikin tabel PMK.

### 3. Hcxdumptool

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/hcxdumptool.png" />
</div>

Hcxdumptool adalah tool CLI yang dipake buat nangkep PMKID.

### 4. Hcxtools

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/hcxtools.png" />
</div>

Hcxtools adalah tool CLI yang di pake buat ngubah hasil capture dari tool Hcxdumptool ke format yang bisa dipake sama tool Hashcat kalo kaga John the Ripper.

### 5. Bettercap

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/bettercap.png" />
</div>

Bettercap adalah tool framework CLI yang dipake khusus buat serangan MITM. Bettercap juga punya modul Wi-Fi yang bisa dipake buat ngetes keamanan Wi-Fi.

Yang bisa dilakuin sama Bettercap:
- Nyecan Wi-Fi
- Nangkep handshake
- Nangkep PMKID
- Ngebikin Rogue AP

### 6. Airgorah

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/airgorah.png" />
</div>

Airgorah adalah tool GUI yang fungsinya kurang lebih sama kaya tool Aircrack-NG Suite, fungsinya dipake buat ngetes keamanan Wi-Fi (WPA/WPA2-PSK). Cuma bedanya di segi tampilannya aja. Kalo tool Aircrack-NG Suite kan dia full CLI, nah kalo Airgorah dia pake GUI.

> [!NOTE]
> Airgorah itu sebenarnya Aircrack-NG Suite yang dibungkus pake GUI.

## Tools Buat WPA/WPA2-Enterprise

### 1. Hostapd-WPE

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/hostapdwpe.png" />
</div>

Hostapd-WPE adalah tool CLI versi modipannya dari tool Hostapd yang dipake buat ngejalanin Evil Twin Attack di Wi-Fi WPA/WPA2-Enterprise.

### 2. Hostapd-Mana

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/hostapdmana.png" />
</div>

Hostapd-Mana adalah tool CLI versi modipannya dari Hostapd yang dipake buat ngejalanin Evil Twin Attack di Wi-Fi WPA/WPA2-Enterprise. Tool ini dilengkapin sama fitur KARMA Attack.

### 3. Asleap

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/asleap.jpeg" />
</div>

Asleap adalah tool CLI yang dipake buat ngecrack autentikasi EAP-LEAP. 

### 4. EAPMD5pass

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/eapmd5pass.png" />
</div>

EAPMD5pass adalah tool CLI yang dipake buat ngecrack autentikasi EAP-MD5.

### 5. EAPHammer

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/eaphammer.png" />
</div>

EAPHammer adalah tool framework CLI yang dipake buat ngetes keamanan Wi-Fi WPA/WPA2-Enterprise.

## Tools Buat WPS

### 1. Reaver

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/reaver.jpeg" />
</div>

Reaver adalah tool CLI yang dipake buat ngetes keamanan Wi-Fi yang ngaktifin fitur WPS.

### 2. Bully

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/bully.jpg" />
</div>

Bully adalah tool CLI yang fungsinya kurang lebih sama aja kaya tool Reaver.

### 3. PixieWPS

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/pixiewps.png" />
</div>

PixieWPS adalah tool CLI yang dipake buat ngetes keamanan Wi-Fi yang ngaktifin fitur WPS. Cuma dia make Pixie Dust Attack buat ngetesnya.

## Tools Buat Evil Twin (Khusus WPA/WPA2-PSK)

### 1. Hostapd

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/hostapd.png" />
</div>

Hostapd adalah tool CLI paling basic yang dipake buat ngebikin Rogue AP (AP palsu). Tool ini dipake buat ngejalanin Evil Twin Attack.

### 2. Wifiphisher

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/wifiphisher.png" />
</div>

Wifiphisher adalah tool CLI yang fungsinya buat ngejalanin Evil Twin Attack. Tool ini lebih gampang dipake daripada tool Hostapd karena cara makenya tinggal milih aja opsi yang udah dia disediain.

### 3. Fluxion

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/fluxion.jpg" />
</div>

Fluxion adalah tool CLI yang fungsinya kurang lebih sama aja kaya tool Wifiphisher, cuma beda di cara makenya sama tampilannya aja. Kalo buat tujuannya tetep sama.

## Tools All in One

Tools All in One tools apaan bang?

> Jadi, tools All in One itu tools yang ngegampangin kita buat ngetes jaringan Wi-Fi. Kalo Aircrack-NG Suite kan dia manual satu-satu, kalo lu make tools ini prosesnya bakalan otomatis.

### 1. Fern Wi-Fi Cracker

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/fern.jpg" />
</div>

Fern Wi-Fi Cracker adalah tool GUI yang dipake buat ngetes keamanan Wi-Fi WEP sama WPA/WPA2-PSK.

Teknik yang dipake:
- Nangkep IVs (buat WEP)
- Nangkep handshake (buat WPA/WPA2-PSK)
- Deauth attack (buat mancing client reconnect)
- Dictionary attack (buat ngecrack kuncinya)
- WPS attack (nyerang lewat WPS)

Tool ini cocok buat lu yang kaga terlalu anu sama terminal.

### 2. Wifite

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/wifite.png" />
</div>

Wifite adalah tool CLI otomatis yang dipake buat ngetes keamanan Wi-Fi WEP sama WPA/WPA2-PSK.

Teknik yang dipake:
- Nangkep IVs (buat WEP)
- Nangkep handshake (buat WPA/WPA2-PSK)
- Nangkep PMKID (buat WPA/WPA2-PSK)
- Deauth attack (buat mancing client reconnect)
- Dictionary attack (buat ngecrack kuncinya)
- WPS attack (nyerang lewat WPS)

### 3. Airgeddon

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/airgeddon.png" />
</div>

Airgeddon adalah rajanya tool framework CLI yang dipake buat ngetes keamanan Wi-Fi. Dia ngedukung macem-macem jenis Wi-Fi, mulai dari WEP, WPA/WPA2-PSK, WPA/WPA2-Enterprise, bahkan sampe WPA3.

> [!NOTE]
> Airgeddon itu dia ngebungkus tools-tools kaya Aircrack-NG, Reaver, Bully, dll jadi satu. Tujuannya biar ngegampangin kita.

## Tools Pendukung

### 1. iw

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/iw.jpg" />
</div>

iw adalah tool CLI bawaan Linux yang dipake buat ngatur sama ngecek interface wireless.

### 2. macchanger

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/macchanger.png" />
</div>

macchanger adalah tool CLI yang dipake buat spoof (ngubah) MAC address.

### 3. MDK3

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/mdk3.png" />
</div>

MDK3 adalah tool CLI yang dipake buat ngejalanin macem-macem jenis serangan Wi-Fi.

### 4. MDK4

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/mdk4.png" />
</div>

MDK4 adalah kelanjutan dari tool MDK3. Fungsinya kurang lebih sama aja, tapi ada fitur-fitur baru yang kaga ada di tool MDK3.

### 5. Hashcat

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/hashcat.jpg" />
</div>

Hashcat adalah tool CLI yang dipake buat ngecrack macem-macem jenis format hash.

### 6. John the Ripper

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/john.png" />
</div>

John the Ripper adalah tool yang fungsinya kurang lebih sama aja kaya tool Hashcat.

### 7. Kismet

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Tools-Tools%20yang%20Dipake%20Buat%20Wireless%20Hacking/img/kismet.png" />
</div>

Kismet adalah tool CLI yang dipake buat mantau jaringan Wi-Fi. Bahasa kerennya, tool ini dipake sebagai WIDS (Wireless Intrusion Detection System). Tugasnya buat ngescan jaringan, ngecek ada yang nyerang apa kaga.

> [!NOTE]
> Kismet juga bisa dipake lewat UI (web).

## Kesimpulan

Intinya, kalo lu mau ngetes Wi-Fi A lu harus make tool A. Lu kaga boleh ngetes Wi-Fi A tapi lu make tool B.
