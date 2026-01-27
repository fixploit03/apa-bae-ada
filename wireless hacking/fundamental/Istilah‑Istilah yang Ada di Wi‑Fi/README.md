# Istilah-Istilah yang Ada di Wi-Fi

## 1. Identifikasi Jaringan
- **SSID (Service Set Identifier)**: Nama jaringan Wi-Fi
- **ESSID (Extended Service Set Identifier)**: Nama jaringan Wi-Fi dalam mode infrastruktur
- **BSSID (Basic Service Set Identifier)**: MAC address AP
- **Hidden SSID**: SSID yang disembunyiin dari broadcast

## 2. Frekuensi & Channel
- **Channel**: Kanal frekuensi yang dipake
- **Frequency**: Frekuensi (2.4 GHz, 5 GHz, 6 GHz)
- **Bandwidth**: Lebar channel (20MHz, 40MHz, 80MHz, 160MHz)

## 3. Kekuatan Sinyal
- **RSSI (Received Signal Strength Indicator)**: Kekuatan sinyal yang diterima
- **dBm**: Satuan kekuatan sinyal (decibel-milliwatts)
- **Signal Strength**: Kekuatan sinyal
- **Noise Level**: Tingkat noise/gangguan
- **SNR (Signal-to-Noise Ratio)**: Rasio sinyal terhadap noise

## 4. Keamanan/Enkripsi
- **WEP (Wired Equivalent Privacy)**: Enkripsi generasi pertama (kaga aman)
- **WPA (Wi-Fi Protected Access)**: Enkripsi generasi kedua
- **WPA2**: Enkripsi standar jaman sekarang
- **WPA3**: Enkripsi paling baru dan paling aman
- **PSK (Pre-Shared Key)**: Password Wi-Fi yang dibagiin
- **Open**: Kaga pake enkripsi
- **Authentication**: Metode autentikasi
- **Cipher**: Algoritma enkripsi (TKIP, AES, CCMP)
- **WPS (Wi-Fi Protected Setup)**: Fitur buat client konek ke Wi-Fi secara cepet
- **PMK (Pairwise Master Key)**: Kunci utama yang dihasilin dari password Wi-Fi sama SSID
- **PTK (Pairwise Transient Key)**: Kunci sementara buat enkripsi data unicast antara client sama AP
- **GTK (Group Temporal Key)**: Kunci buat enkripsi data broadcast/multicast
- **KCK (Key Confirmation Key)**: Bagian dari PTK yang dipake buat ngitung MIC
- **KEK (Key Encryption Key)**: Bagian dari PTK yang dipake buat ngenkripsi GTK
- **TK (Temporal Key)**: Bagian dari PTK yang dipake buat enkripsi data
- **MIC (Message Integrity Check)**: Kode buat ngecek keaslian data di handshake
- **Nonce**: Angka acak yang dipake di 4-way handshake (ANonce dari AP, SNonce dari client)
- **IV (Initialization Vector)**: Nilai random buat enkripsi (penting di proses cracking WEP)
- **EAPOL (Extensible Authentication Protocol over LAN)**: Protokol yang dipake buat handshake
- **RADIUS**: Server autentikasi buat WPA Enterprise
- **EAP (Extensible Authentication Protocol)**: Protokol autentikasi buat enterprise

## 5. Hardware & Perangkat
- **AP (Access Point)**: Perangkat yang mancarin Wi-Fi
- **Router**: Perangkat buat routing sekaligus bisa juga jadi sebagai AP
- **Station/STA**: Perangkat client (laptop, HP)
- **NIC (Network Interface Card)**: Kartu jaringan
- **Wireless Adapter**: Adapter Wi-Fi
- **MAC Address (Media Access Control)**: Alamat fisik perangkat
  
## 6. Mode Operasi
- **Monitor Mode**: Mode buat monitoring/sniffing paket tanpa konek ke jaringan
- **Managed Mode**: Mode client normal buat konek ke AP
- **Master Mode**: Mode sebagai AP

## 7. Standar & Protokol
- **802.11**: Standar dasar Wi-Fi
- **802.11a/b/g/n/ac/ax**: Generasi standar Wi-Fi
- **Wi-Fi 4/5/6/6E**: Penamaan marketing buat standar 802.11n/ac/ax
- **Beacon**: Paket broadcast dari AP yang dipake buat ngumumin jaringan Wi-Fi
- **Probe Request/Response**: Paket yang dipake buat nyari sama ngejawab jaringan Wi-Fi
- **Association**: Proses client konek ke AP
- **Deauthentication**: Paket yang dipake buat mutusin koneksi client dari AP
- **Handshake**: Proses pertukaran kunci enkripsi (4-way handshake)
- **Management Frame**: Frame buat manajemen jaringan (beacon, probe request/response, authentication, deauthentication)
- **Control Frame**: Frame buat kontrol komunikasi (ACK, RTS, CTS)
- **Data Frame**: Frame yang bawa data user yang udah keenkripsi
- **EAPOL Frame**: Frame khusus yang dipake di proses 4-way handshake
- **ACK (Acknowledgment)**: Frame konfirmasi kalo paket udah diterima
- **RTS/CTS (Request to Send/Clear to Send)**: Mekanisme buat nyegah collision di jaringan yang rame

## 8. Kecepatan & Performa
- **Data Rate**: Seberapa cepet data dikirim sama diterima
- **Throughput**: Kecepatan asli yang bener-bener kecapai pas data lagi jalan/ditransfer
- **Mbps/Gbps**: Satuan kecepatan (Megabit/Gigabit per detik)
- **Latency**: Waktu nunggu sebelum data nyampe
- **QoS (Quality of Service)**: Prioritas traffic jaringan

## 9. Power & Transmisi
- **TX Power**: Kekuatan daya pancar sinyal
- **Power Save Mode**: Mode hemat daya
- **Beamforming**: Teknologi buat fokusin sinyal ke client
- **Coverage**: Jangkauan sinyal
- **MU-MIMO (Multi-User MIMO)**: Teknologi buat komunikasi ke banyak client sekaligus
- **OFDMA (Orthogonal Frequency Division Multiple Access)**: Teknologi buat bagi channel ke banyak client (ada di Wi-Fi 6)
- **Target Wake Time (TWT):** Fitur hemat daya di Wi-Fi 6 yang ngatur jadwal kapan client aktif buat kirim/terima data

## 10. Topologi & Arsitektur
- **BSS (Basic Service Set)**: Satu AP sama client-clientnya
- **ESS (Extended Service Set)**: Banyak AP yang make SSID yang sama
- **IBSS (Independent BSS)**: Jaringan ad-hoc (langsung antar perangkat, kaga pake AP)
- **WDS (Wireless Distribution System)**: Sistem buat nge-bridge antar AP pake wireless
- **Mesh Network**: Jaringan Wi-Fi yang saling konek tanpa kabel, tiap node bisa jadi repeater
- **Roaming**: Pindah antar AP dalam satu ESS tanpa putus koneksi

## 11. Fitur Keamanan & Management
- **Captive Portal**: Halaman login di Wi-Fi publik
- **MAC Filtering**: Nyaring perangkat boleh masuk apa kaga pake MAC address
- **Client Isolation**: Fitur yang bikin client kaga bisa komunikasi langsung satu sama lain
- **Band Steering**: Teknologi buat arahin client ke frekuensi yang lebih bagus (2.4 GHz atau 5 GHz)
- **DHCP**: Sistem yang ngasih IP secara otomatis ke client
- **Gateway**: Jalur keluar-masuk jaringan ke internet
