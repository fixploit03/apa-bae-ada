# Frekuensi & Channel

Wi‑Fi itu kaga cuma soal sinyal sama password doang. Di balik sinyal yang keliatan sepele, ada frekuensi sama channel yang ngatur gimana data jalan di udara. Kalo dua hal ini kaga lu pahamin, mau secanggih apa pun tools yang lu pake, hasilnya lu tetep kaga bakalan dapet apa‑apa.

## 1. Frekuensi
Wi‑Fi itu jalan pake gelombang radio, bukan kabel. Nah gelombang ini jalan di frekuensi tertentu.

### Frekuensi yang dipake Wi‑Fi
| Frekuensi	| Enaknya | Kagaknya | Dipake di |
|:--:|:--:|:--:|:--:|
| 2.4 GHz	| Jangkauannya jauh, bisa nembus tembok	| Rame, banyak gangguan	| 802.11b/g/n |
| 5 GHz	| Cepet, jarang gangguan | Jangkauannya kaga jauh	| 802.11a/n/ac/ax |
| 6 GHz	| Super ngebut, bersih | Barangnya masih dikit | Wi‑Fi 6E |

## 2. Channel
Channel itu jalur di dalam frekuensi.

Ibarat jalan raya:
- Frekuensi = jalan tol
- Channel = nomer lajur

Biar AP satu sama lain kaga tabrakan sinyalnya.

### 1. Channel 2.4 GHz
- Rentangnya dari 2.400 sampe 2.4835 GHz
- Ada 14 channel (Indonesia umumnya 1–13)
- Channelnya saling tumpang tindih

> [!NOTE]
> **Channel yang kaga tabrakan:** 1, 6, 11

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

### 2. Channel 5 GHz
Nah kalo ini beda kelas.
- Channelnya banyak
- Hampir kaga pernah overlap
- Ngebutnya bukan maen

### Tabel Channel 5 GHz

| Channel | Frekuensi (MHz) |
|:--:|:--:|
| 36 | 5180 |
| 40 | 5200 |
| 44 | 5220 |
| 48 | 5240 |
| 149 | 5745 |
| 153 | 5765 |
| 157 | 5785 |
|161	|5805|

## Hubungan Frekuensi & Channel
- Frekuensi = wilayah sinyal
- Channel = jalur di wilayah itu
- AP itu cuma nongkrong di 1 channel doang
- Lu mau:
  - sniff paket, lu harus di channel yang sama
  - deauth, channel lu kudu bener
  - Evil Twin, channel lu kudu sama persis

Salah channel = lu kayak kerja rodi, capek iya, hasilnya kaga ada.

## Kesimpulan

Frekuensi sama channel itu pondasi di jaringan Wi‑Fi. Lu boleh jago make tools apa aja, tapi kalo kaga ngerti ini, lu cuma jadi tukang pencet-pencet keyboard doang.
