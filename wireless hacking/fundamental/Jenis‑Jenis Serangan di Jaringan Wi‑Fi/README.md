Di materi ini, gw bakal ngebahas tentang jenis-jenis serangan umum yang ada di jaringan Wi-Fi.

# Jenis-Jenis Serangan Umum di Jaringan Wi-Fi

## 1. Sniffing

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Jenis%E2%80%91Jenis%20Serangan%20di%20Jaringan%20Wi%E2%80%91Fi/img/sniff.jpg" width="50%"/>  
</div>

Sniffing itu ibaratnya lu lagi nguping orang yang lagi ngobrol, tapi versinya jaringan. Tujuannya buat ngumpulin info atau bahan yang dipake buat serangan selanjutnya.

Yang jadi target Sniffing:
- Informasi target
- Paket data
- IVs
- 4-Way Handshake

## 2. Deauthentication Attack

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Jenis%E2%80%91Jenis%20Serangan%20di%20Jaringan%20Wi%E2%80%91Fi/img/deauth.jpg" width="50%"/>  
</div>


Deauthentication Attack adalah jenis serangan yang dipake buat nendang client dari Wi-Fi. Caranya dia ngirim frame deauth palsu seolah-olah dari client. Biasanya serangan ini dipake buat mancing handshake.

## 3. Brute Force

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Jenis%E2%80%91Jenis%20Serangan%20di%20Jaringan%20Wi%E2%80%91Fi/img/brute.webp" width="50%"/>  
</div>

Brute Force adalah jenis serangan yang dipake buat ngecrack kunci Wi-Fi (WPA/WPA2-PSK). Caranya dia nebak-nebak make kombinasi tertentu (kaya huruf kecil, huruf besar, angka sama simbol).

## 4. Dictionary Attack

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Jenis%E2%80%91Jenis%20Serangan%20di%20Jaringan%20Wi%E2%80%91Fi/img/dictionary.png" width="50%"/>  
</div>

Dictionary Attack adalah jenis serangan yang dipake buat ngecrack kunci Wi-Fi (WPA/WPA2-PSK). Caranya dia ngeload wordlist (file `.txt` yang isinya sekumpulan password) yang mau dicoba.

## 5. Evil Twin Attack

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Jenis%E2%80%91Jenis%20Serangan%20di%20Jaringan%20Wi%E2%80%91Fi/img/evil%20twin.webp" width="50%"/>  
</div>

Evil Twin Attack adalah jenis serangan yang dipake buat ngebikin Rogue AP (AP palsu) yang namanya sama persis kaya AP asli. Tujuannya biar client salah konek ke AP palsu yang dibikin sama lu, jadi semua data yang dikirim sama client bisa lu liat.

## 6. Man-in-the-Middle (MITM)

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Jenis%E2%80%91Jenis%20Serangan%20di%20Jaringan%20Wi%E2%80%91Fi/img/mitm.jpg" width="50%"/>  
</div>

Man-in-the-Middle (MITM) adalah jenis serangan yang dipake buat nempatin perangkat lu di antara 2 perangkat. Tujuannya supaya target nganggep perangkat lu sebagai perangkat yang dia tuju, jadi semua data yang tadinya diarahin ke perangkat yang dia tuju malahan diarahin ke perangkat lu.

## 7. Denial of Service (DoS)

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Jenis%E2%80%91Jenis%20Serangan%20di%20Jaringan%20Wi%E2%80%91Fi/img/dos.png" width="50%"/>  
</div>

Denial of Service (DoS) adalah jenis serangan yang dipake buat ngebikin jaringan Wi-Fi jadi keos. Contohnya kaya sinyal jadi lemot, client kaga bisa konek ke AP. Intinya serangan ini tujuannya buat ngeganggu.

## Kesimpulan
Intinya, serangan-serangan di atas itu serangan yang paling sering dipake di wireless hacking. Lu kudu paham cara kerjanya biar bisa ngamanin jaringan Wi-Fi lu dari serangan-serangan modelan kaya gitu.
