# Tools-Tools yang Dipake Buat Wireless Hacking

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

Bettercap adalah tool framework yang dipake khusus buat serangan MITM. Bettercap juga ada modul Wi-Fi yang bisa dipake buat nyerang Wi-Fi.

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

### 1. Hostapd WPE

<img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/hostapdwpe.png" />

### 2. Hostapd Mana

<img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/hostapdmana.png" />

### 3. Asleap

<img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/asleap.jpeg" />

### 4. EAPMD5pass

<img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/eapmd5pass.png" />

### 5. EAPHammer

<img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/eaphammer.png" />

## Tools Buat WPS

### 1. Reaver

<img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/reaver.jpeg" />

### 2. Bully

<img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/bully.jpg" />

### 3. PixieWPS

<img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/pixiewps.png" />

## Tools Buat Evil Twin (Khusus WPA/WPA2-PSK)

### 1. Wifiphisher

<img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/wifiphisher.png" />

### 2. Fluxion

<img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/fluxion.jpg" />

## Tools All in One

### 1. Fern Wi-Fi Cracker

<img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/fern.jpg" />

### 2. Wifite

<img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/wifite.png" />

### 3. Airgeddon

<img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/tools/img/airgeddon.png" />
