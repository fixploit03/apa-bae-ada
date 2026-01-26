# Tools-Tools yang Dipake Buat Wireless Hacking

Sebelum kita masuk ke praktek wireless hacking, lu kudu tau dulu apa aja tools-tools yang dipake buat wireless hacking. Tools ini penting banget buat lu kuasain, karena kalo lu kaga ngerti tools itu fungsinya buat apa dan cara makenya gimana, ntar lu bakal bingung sendiri pas prakteknya sama hasilnya juga kaga maksimal.

## Tools Buat WEP & WPA/WPA2-PSK

### 1. Aircrack-NG Suite

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/aircrack.jpg" />
</div>

Aircrack-NG Suite adalah sekumpulan tools CLI yang dipake buat ngecrack kunci (password) Wi-Fi WEP sama WPA/WPA2-PSK. Teknik yang dipake sama Aircrack-NG buat ngecracknya, dia pake Dictionry attack (wordlist).

Tools yang wajib lu kuasai:
- **Airmon-NG:** Buat ngaktifin sama nonaktifin mode monitor
- **Airodump-NG:** Buat scanning sama capture trafik (IVs sama handshake)
- **Aireplay-NG:** Buat jalanin serangan kaya deauth, ARP request replay, fake auth, dll
- **Aircrack-NG:** Buat ngecrack kunci Wi-Fi (WEP sama WPA/WPA2-PSK)

> [!NOTE]
> Lu kaga harus nguasain semua tools yang ada di Aircrack-NG Suite. Cukup yang penting-penting aja. Kalo emang lu mau nguasain semuanya, itu bisa jadi nilai ples.

### 2. Cowpatty

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/cowpatty.jpg" />
</div>

Cowpatty adalah tool CLI yang dipake buat ngecrack kunci Wi-Fi (WPA/WPA2-PSK).

Cowpatty punya 2 teknik buat ngecracknya:
1. Dictionary Attack (realtime)
2. Pre-Computed PMK

#### 1. Dictionary Attack (realtime)

Teknik ini make wordlist yang isinya kandidat password target, terus setiap password itu digabungin sama nama SSID target buat ngitung PMK (Pairwise Master Key). Proses ini lumayan berat sama makan waktu, soalnya buat setiap satu password yang dicoba, sistem harus ngelakuin 4.096 iterasi (pengulangan). Kalo wordlistnya isi 10.000.000 password terus lu ngecracknya ngandelin CPU tanpa make GPU kapan kelarnya?

#### 2. Pre-Computed PMK

Pre-computed PMK adalah teknik di mana kita ngitung PMK dari awal dan hasilnya disimpen dalam bentuk tabel hash PMK. Tabel ini nantinya dipake buat ngecrack kunci Wi-Fi WPA/WPA2-PSK, jadi proses crackingnya jauh lebih cepet dibanding dictionary attack biasa. Soalnya PMK nya udah diitung duluan, Cowpatty ninggal ngebandingin hash dari handshake sama hash yang ada di tabel, dia kaga perlu ngelakuin proses hashing berat PBKDF2 yang butuh 4096 iterasi buat tiap password. Tapi perlu diinget, tabel PMK ini cuma kepake buat satu SSID doang, jadi kalo nama Wi-Fi target beda, tabelnya harus dibikin ulang dari awal.

> [!NOTE]
> Cowpatty punya tool buat ngitung tabel hash PMK, namanya `genpmk`.

### 3. Hcxdumptool

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/hcxdumptool.png" />
</div>

Hcxdumptool adalah tool CLI yang dipake buat capture PMKID. Biasanya tool ini sepaket sama Hcxtools sama Hashcat, jadi abis PMKID nya dapet, bisa langsung lanjut ke proses cracking.

### 4. Hcxtools

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/hcxtools.png" />
</div>

Hcxtools adalah tools CLI yang di pake buat ngubah handshake kalo kaga PMKID ke format hash yang bisa dicrack sama tool Hashcat kalo kaga sama John the Ripper.

### 5. Bettercap

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/bettercap.png" />
</div>

Bettercap adalah tool framework CLI yang dipake khusus buat serangan MITM. Bettercap juga ada modul Wi-Fi yang bisa dipake buat nyerang Wi-Fi.

Yang bisa dilakuin sama Bettercap:
- Scan Wi-Fi
- Capture handsahke
- Capture PMKID
- Bikin Rogue AP

### 6. Airgorah

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/airgorah.png" />
</div>

Airgorah adalah tool GUI yang fungsinya kurang lebih sama kaya Aircrack-NG, buat ngecrack kunci Wi-Fi (WPA/WPA2-PSK). Cuma bedanya di tampilannya aja. Kalo Aircrack-NG kan full CLI, kalo Airgorah dia pake GUI.

> [!NOTE]
> Airgorah itu sebenarnya Aircrack-NG yang dibungkus pake GUI.

## Tools Buat WPA/WPA2-Enterprise

### 1. Hostapd-WPE

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/hostapdwpe.png" />
</div>

Hostapd-WPE adalah versi modifnya dari Hostapd yang dipake buat ngejalanin Evil Twin Attack di jaringan WPA/WPA2-Enterprise. Tool ini bikin AP palsu (Rogue AP) yang nyamar jadi jaringan asli, terus nangkep kredensial korban pas korban nyoba konek.

### 2. Hostapd-Mana

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/hostapdmana.png" />
</div>

Hostapd-Mana itu versi Hostapd yang lebih lanjut dibandingin yang versi WPE. Tool ini punya fitur tambahan buat manipulasi EAP, downgrade authentication, sama bypass konfigurasi tertentu.

### 3. Asleap

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/asleap.jpeg" />
</div>

Asleap adalah tool CLI yang dipake buat ngecrack LEAP authentication (Cisco LEAP). Ini protokol lama yang udah deprecated (kaga kepake), tapi kadang masih kepake di jaringan enterprise jadul.

### 4. EAPMD5pass

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/eapmd5pass.png" />
</div>

EAPMD5pass adalah tool CLI yang dipake buat ngecrack EAP-MD5.

### 5. EAPHammer

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/eaphammer.png" />
</div>

EAPHammer adalah tool framework CLI yang dipake buat ngetes jaringan Wi-Fi WPA/WPA2-Enterprise. Tool ini jadi favorit pentester enterprise karena otomatis, powerful, sama support banyak skenario serangan.

## Tools Buat WPS

### 1. Reaver

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/reaver.jpeg" />
</div>

Reaver adalah tool CLI yang dipake buat ngebrute force PIN WPS, tujuan buat ngecrack kunci Wi-Fi. Tool ini sering dipake kalo WPS AP target nyala.

### 2. Bully

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/bully.jpg" />
</div>

Bully adalah tool CLI yang fungsinya kurang lebih sama kaya tool Reaver.

### 3. PixieWPS

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/pixiewps.png" />
</div>

PixieWPS adalah tool CLI yang dipake buat ngejalanin Pixie Dust Attack, yaitu serangan ke WPS yang manfaatin kelemahan implementasi PIN di sisi AP. Biasanya serangan ini kepake ke AP yang udah tua atau firmware nya kaga diupdate, apalagi yang make chipset `Ralink` kalo kaga `Broadcom`. Tujuannya buat nebak PIN WPS AP target.

## Tools Buat Evil Twin (Khusus WPA/WPA2-PSK)

### 1. Hostapd

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/hostapd.png" />
</div>

Hostapd adalah tool CLI paling dasar yang dipake buat ngebikin AP palsu (Rogue AP). Biasanya tool ini dikombinasiin sama Evil Twin Attack buat dapetin kredensial korban.

### 2. Wifiphisher

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/wifiphisher.png" />
</div>

Wifiphisher adalah tool CLI yang dipake buat ngejalanin Evil Twin Attack, di mana tujuannya buat dapetin data korban lewat teknik soceng (social engineering ). Data yang ditargetin bisa macem-macem, kaya password Wi-Fi sampe akun sosmed. Intinya, tool ini dipake buat mancing korban supaya masukin data penting ke halaman palsu (captive portal), dan dari situ penyerang bisa ngedapetin semua data yang korban masukin.

### 3. Fluxion

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/fluxion.jpg" />
</div>

Fluxion adalah tool CLI yang fungsinya kurang lebih sama kaya tool Wifiphisher, cuma beda di cara makenya sama tampilannya aja. Kalo buat tujuannya, tetep sama.

## Tools All in One

Tools All in One tools apaan bang? jadi tools All in One itu tools yang ngegampangin kita buat ngetes jaringan Wi-Fi. Kalo Aircrack-NG Suite kan dia manual satu-satu. Kalo lu make tools ini prosesnya bakal otomatis.

### 1. Fern Wi-Fi Cracker

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/fern.jpg" />
</div>

Fern Wi-Fi Cracker adalah tool GUI yang dipake buat ngecrack kunci Wi-Fi WEP sama WPA/WPA2-PSK.

Teknik yang dipake:
- Capture IVs (buat WEP)
- Capture handshake (buat WPA/WPA2-PSK)
- Deauth attack (buat mancing client reconnect)
- Dictionary attack (buat ngecrack kuncinya)
- WPS attack (nyerang lewat WPS)

Tool ini cocok buat lu yang kaga terlalu ini sama terminal.

### 2. Wifite

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/wifite.png" />
</div>

Wifite adalah tool CLI otomatis yang dipake dipake buat ngecrack kunci Wi-Fi WEP sama WPA/WPA2-PSK. Teknik yang dipake kurang lebih sama kaya yang ada di tool Fern Wi-Fi Cracker.

### 3. Airgeddon

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/airgeddon.png" />
</div>

Airgeddon adalah rajanya tool framework CLI buat ngecrack kunci Wi-Fi. dia ngedukung macem-macem jenis Wi-Fi, mulai dari WEP, WPA/WPA-PSK, WPA/WPA-Enterprise bahkan sampe WPA3. Airgeddon juga ada fitur buat ngejalanin serangan Evil Twin, rata-rata orang lebih suka make Airgeddon ketimbang pake tool Aircrack murni. Soalnya lebih gampang buat dipakenya dari pada harus ngetik satu-satu perintah secara manual.

> [!NOTE]
> Airgeddon itu dia ngebungkus tools-tools kaya Aircrack-NG, Reaver, Bully, dll jadi satu.

## Kesimpulan

Jadi intinya, tools-tools yang udah dibahas tadi itu adalah senjata utama lu dalam wireless hacking. Lu kaga harus langsung jago semua, yang penting paham fungsi, alur, sama kapan tools itu dipake. Mulai aja dari yang dasar, kuasain satu-satu, baru ke tools berikutnya. Inget, wireless hacking itu bukan soal banyak-banyakan tools, tapi seberapa paham lu make tools itu dengan bener dan bertanggung jawab. Kalo fondasinya udah kuat, praktek ke depannya bakal jauh lebih gampang dan hasilnya juga bakalan maksimal.
