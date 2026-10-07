# Tahap-Tahap dalam Automated Testing
Proses berjalan nya automated testing di bagi menjadi 3 tahap, **tahap persiapan**, **tahap testing** dan **tahap pembersihan**, lebih lengkapnya seperti ini:

## Tahap Persiapan (beforeEach)
tahap persiapan ini akan jalan otomatis saat sebelum setiap  1 test itu di mulai.
jika ada 3 test, maka tahap ini akan berjalan tiap sebelum test (sebelum test 1 di mulai, sebelum test 2 di mulai dan seterusnya). 
Contoh Fungsinya:
- membuka halaman browser
- membersihkan cookies
- membuat data baru untuk keperluan test

## Tahap Pengetesan (test)
Ini adalah panggung utama nya, di sini test akan di jalankan sesuai perintah seperti memasukan email dan password, klik tombol tambah, pilih menu dan sebagai nya. Tapi perlu di ingat bahwa tiap test berjalan secara independent. 

## Tahap Pembersihan (afterEach)
setelah satu test di jalankan, maka tahap ini akan di jalankan, sama seperti tahap persiapan, tahap ini akan menyesuikan jumlah test yang di jalankan tidak peduli hasil test gagal (failed) maupun berhasil (pass). 
Contoh Fungsinya:
- membersihkan data yang di buat.
- menyimpan screenshot atau video sebagai bahan bukti (tergantung setingan)
- logout akun dst.


> dengan 3 tahap ini adalah salah satu alasan kenapa tiap test itu berjalan independet atau masing masing.
