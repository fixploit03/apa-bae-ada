Di materi ini, gw bakal ngebahas tentang frekuensi sama channel, mulai dari penjelasannya sampe jenis-jenisnya.

# Frekuensi & Channel

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Frekuensi%20%26%20Channel/img/frekuensi.png" width="50%"/>
</div>

## 1. Apa Itu Frekuensi?
Frekuensi adalah jalan gelombang radio yang dipake sama Wi-Fi buat ngirim sekaligus nerima data lewat udara. Di Wi-Fi biasanya ada frekuensi 2.4 GHz, 5 GHz, sama 6 GHz, tiap frekuensi punya karakternya masing-masing, mulai dari jangkauan sinyalnya, speednya, sampe seberapa tahan dia sama interferensi (gangguan).

### Jenis-Jenis Frekuensi yang Dipake Wi-Fi
- **2.4 GHz**
  - **Kelebihan:** Sinyalnya jauh, tembok masih bisa ditembus
  - **Kekurangan:** Rame, banyak yang make, gangguan di mana-mana (kaya Bluetooth, microwave, Wi-Fi tetangga)
  - **Dipake:** Wi-Fi 4
- **5 GHz**
  - **Kelebihan:** Kenceng, sinyalnya lebih bersih, jarang kena gangguan
  - **Kekurangan:** Sinyalnya kaga jauh, susah buat nembus tembok
  - **Dipake:** Wi-Fi 5
- **6 GHz**
  - **Kelebihan:** Sipaling kenceng, masih sepi (belon banyak yang make), channelnya lebar
  - **Kekurangan:** Barangnya masih dikit, jaraknya paling pendek
  - **Dipake:** Wi-Fi 6E

## 2. Apa Itu Channel
Channel adalah jalan kecil di dalem satu frekuensi yang dipake buat misahin sinyal antar Wi-Fi biar kaga pada saling tubrukan, tiap channel punya nomornya masing-masing.

> Intinya, kalo frekuensi itu jalan tol, channel tuh nomor jalan tol, kaya jalan 1, jalan 2, sampe jalan-jalan.

## Jenis-Jenis Channel yang Dipake Wi-Fi

### 1. Channel 2.4 GHz
- Rentang: 2400-2483.5 MHz
- Total Channel: 14

> [!NOTE]
> Channel di 2.4 GHz, channelnya pada saling tubrukan, channel yang kaga tubrukan channel `1`, `6`, sama `11`.

### Tabel Channel 2.4 GHz

| Channel | Frekuensi (MHz) |
|:--:|:--:|
| 1	| 2412 |
| 2	| 2417 |
| 3	| 2422 |
| 4	| 2427 |
| 5	| 2432 |
| 6	| 2437 |
| 7 | 2442 |
| 8 | 2447 |
| 9 | 2452 |
| 10 | 2457 |
| 11 | 2462 |
| 12 | 2467 |
| 13 | 2472 |
| 14 | 2484 |

> [!NOTE]
> Di Indonesia, channel yang biasanya kepake cuma channel 1–13.

### 2. Channel 5 GHz
- Rentang: 5150-5850 MHz
- Total channel: Seabrek (banyak)

> [!NOTE]
> Channel di 5 GHz jarang pada tubrukan, soalnya jarak tiap channelnya lebih gede, jadi sinyalnya lebih sepi sama lebih stabil, tapi jangkauannya kaga sejauh kaya yang di channel 2.4 GHz.

### Tabel Channel 5 GHz

| Channel | Frekuensi (MHz) |
|:--:|:--:|
| 36 | 5180 |
| 40 | 5200 |
| 44 | 5220 |
| 48 | 5240 |
| 52 | 5260 |
| 56 | 5280 |
| 60 | 5300 |
| 64 | 5320 |
| 100 | 5500 |
| 104	| 5520 |
| 108	| 5540 |
| 112	| 5560 |
| 116	| 5580 |
| 120	| 5600 |
| 124	| 5620 |
| 128	| 5640 |
| 132 |	5660 |
| 136	| 5680 |
| 140	| 5700 |
| 149	| 5745 |
| 153	| 5765 |
| 157	| 5785 |
| 161	| 5805 |
| 165	| 5825 |

> [!NOTE]
> Channel DFS (dari channel 52-140) kadang suka dipake sama radar cuaca kalo kaga sama radar militer. Jadi kalo router lu ngedeteksi ada radar, dia bakal otomatis ngalah sama pindah channel ke channel yang lain (kaya channel 36–48).

## Kesimpulan

Intinya:
- Frekuensi: jalan
- Channel: nomer jalan
