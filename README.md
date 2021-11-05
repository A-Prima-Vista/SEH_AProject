# Project Syariah Economic Hackathon 

## The Team
A Prima Vista
- Ara,
- Nisa,
- Esq,
- Hayi,

# Ide

## Permasalahan
- Petugas lembaga amil zakat terkadang lupa menempatkan kotak amal atau kenclengan kecil di mana
- Ketika kotak amal berpindah tempat, karena toko pindah atau orang yang diamanahkan membawanya pindah alamat, maka akansangat sulit untuk trace dimana lokasi kotak amal
- Ketika kotak amal mengalami kerusakan, sulit untuk masyarakat melaporkan kondisi kotak amal, dan sulit bagi petugas/pengelola untuk mengetahui kondisi kotak amal yang tersebar secara real time.
- 

## Fitur
Aplikasi ini terdiri dari 3 app yakni:
- Aplikasi Untuk Petugas LAZIS
- Aplikasi untuk admin pengelola lembaga LAZIS
- Aplikasi untuk User.

## State of the art Prototype

### Aplikasi untuk Petugas
- [DONE] Scan barcode kotak amal ketika menempatkan, secara otomatis lokasi penempatan kotak akan disimpan.
- [DONE] Map penyebaran kotak amal, sehingga tidak mepet-mepet dalam menyebarkan kotak amal.
- [N/A] Daftar/List kotak amal yang telah disebar oleh petugas
- [UNCOMPLETED] Profile petugas

### Aplikasi untuk Admin
- [UNCOMPLETED] Dashboard persebaran kotak amal
- [UNCOMPLETED] List/daftar petugas
- [UNCOMPLETED] Informasi Lembaga

### [N/A] Aplikasi untuk masyarakat Umum
Untuk aplikasi yang digunakan oleh masyarakat umum, sebenarnya ada fitur crushial yg perlu di implementasikan, namun karena keterbatasan waktu dan dana, kami tidak terkejar dalam penambahan fitur ini, yakni: Firebase Applink dan Instant App. dimana ketika user melakukan scaning barcode dengan smartphone nya, walaupun aplikasi tidak terinstall di smartphone, aplikasi instant dari akan secara otomatis dijalankan dari google play store. 


## Stack
- Firebase
- Flutter
- QRCode
- Google Map
- AppLink/Firebase AppLink
- Instant App.

## Demo Apk (Prototype)

[Download Apk](https://drive.google.com/file/d/1fJfEVCcQVDmetnGSj1afLrWchCisJA78/view?usp=sharing)

Instruksi untuk uji coba:
- Install Apk
- Buka Aplikasi, dengan launcher name nya: Jari Jariah
- User pertama kali akan diarahkan ke halaman scanner QR. 
- navigasi ke tab Home untuk Peta persebaran kotak amal, saat ini masih di patok ke sekitar kota Mataram, NTB. data masih dummy data, namun secara realtime dari Firebase.

Mencoba scan.
- Cari QRCode, apa saja asalkan QR, karena saat ini data QR kita force untuk update 1 kotak amal dulu.
- Ketika scan berhasil, user akan dibawa ke halaman Kotak Amal.
- Ambil gambar kotak amal, kemudian pilih status: Penuh, Rusak, Baru (khusus untuk petugas ketika menempatkan kotak amal).
- Tekan Kirim untuk mengirim gambar.
- Jika sudah selesai upload, navigasi ke Home, cari di map kotak amal yg kode nya tidak Null, click Bubble nya yg ada di marker untuk navigasi ke halaman detail kotak amal, dan berisi history scan kotak amal oleh user.


## Video and Demo:

[Video Demo](https://drive.google.com/file/d/17Fn_w1EEKHUFOV25IzdDNEgGIN3Jm9hW/view?usp=sharing)


# Rencana Pengembangan lebih lanjut

## Aplikasi Admin Lembaga/Command Center
- Login
- Dashboard Lembaga
- Peta persebaran kotak amal lembaga yang sedang login
- Peta persebaran pengumpulan ZISWAF dalam bentuk Heatmap, untuk mengetahui daerah-daerah mana yang ZISWAF nya tinggi dan rendah
- Daftar nama petugas beserta tugas/amah kotak/kenclengan yang menjadi tanggung jawabnya
- Daftar history pengumpulan ZISWAF
- Laporan tabular
- FITUR: Pendaftaran/Request pengumpulan dana (pembangunan masjid, rumah yatim, duafa, biaya pengobatan, dll)
- laporan distribusi ZISWAF.
- Pengelolaan Halaman/Beranda Lembaga.
- Pendaftaran Lembaga


## Aplikasi Petugas
- Login Petugas
- Peta/Heatmap persebaran ZISWAF
- Pelaporan penarikan/pengumpulan dana dari kotak2 amal.
- Laporan pengumpulan bulanan
- Profile management


## Aplikasi User umum
- Instant app
- Pelaporan status/kondisi kotak amal.
- Request penempatan kotak amal.
- Applink untuk redirect QR ke aplikasi.

