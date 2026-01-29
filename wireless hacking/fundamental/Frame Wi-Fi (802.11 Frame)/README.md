# Frame Wi-Fi (802.11 Frame)

## Apa Itu Frame Wi-Fi?
Frame Wi-Fi adalah paket data yang lewat di jaringan Wi‑Fi. Tiap kali perangkat lu ngobrol sama perangkat yang lain lewat Wi-Fi, data yang dikirim itu bentukannya berbentuk frame. 

> [!NOTE]
> Kalo lu ngerti struktur frame Wi-Fi bisa dipake buat:
> - Nganalisis jaringan
> - Troubleshooting jaringan
> - Ngecek keamanan jaringan

## Jenis-jenis Frame 802.11

### 1. Management Frames
Management Frames adalah frame yang dipake buat ngatur dan ngelola koneksi Wi‑Fi.

#### Jenis-Jenis Management Frames

#### 1. Association Request
Frame yang dikirim sama client ke AP yang dipake buat konek ke jaringan Wi‑Fi.

#### 2. Association Response
Frame yang dikirim sama AP ke client yang dipake buat ngasih tau status Association Request (diterima apa ditolak).

#### 3. Reassociation Request
Frame yang dikirim sama client ke AP yang dipake buat minta konek ulang, biasanya dipake pas client pindah AP (roaming).

#### 4. Reassociation Response
Frame yang dikirim sama AP ke client yang dipake buat ngasih tau status Reassociation Request (diterima apa ditolak).

#### 5. Probe Request
Frame yang dikirim sama client yang dipake buat nyari tau AP apa aja yang ada di sekitar dia.

#### 6. Probe Response
Frame yang dikirim sama AP ke client yang dipake buat ngejawab Probe Request.

#### 7. Beacon
Frame yang dikirim sama AP secara terus-terusan yang dipake buat ngumumin keberadaan dia (kaya Nama SSID, channel, keamanan, dll).

#### 8. ATIM (Announcement Traffic Indication Message)
Frame yang dikirim di jaringan ad-hoc (IBSS) yang dipake buat ngasih tau perangkat lain kalo ada data yang lagi nunggu buat dikirim.

#### 9. Disasociation
Frame yang dikirim sama AP kalo kaga sama client yang dipake buat ngeluarin client secara lembut dari jaringan Wi‑Fi.

#### 10. Authentication
Frame yang dikirim sama client ke AP kalo kaga sebalinya yang dipake buat ngelakuin proses autentikasi sebelon koneksi Wi-Fi dijalanin.

#### 11. Deauthentication
Frame yang dikirim sama AP kalo kaga sama client yang dipake buat ngeluarin client secara paksa dari jaringan Wi‑Fi.

#### 12. Action
Frame yang dikirim sama AP kalo kaga sama client yang dipake buat ngirim perintah kalo kaga info tentang spek jaringan Wi-Fi.

#### 13. Action No ACK
Frame Action yang kaga butuh ACK (konfirmasi).

### 2. Control Frames
Control Frames adalah frame yang dipake buat ngatur sama ngejamin aliran data supaya komunikasi Wi‑Fi jadi lancar.

### 3. Data Frames
Data Frames adalah frame yang dipake buat nganterin data yang dikirim atau diterima sama client di jaringan Wi‑Fi.
