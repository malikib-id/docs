# Metode Modular Fixture
Fixture sangat penting untuk membantu proses Testing, fixture akan di jalankan di tahap pertama sebelum test di mulai, dan juga bisa jalan di tahap akhir setelah test selesai di jalankan, tidak peduli hasilnya gagal (failed) maupun berhasil (pass). 

## Kenapa butuh Fixture? kapan butuh Fixture?
Skenario Pengetesan itu seringnya beragam dan berbeda beda, misal dalam skenario kita ingin mengubah data produk, kita harus tau produk spesifik mana yang ingin kita ubah, contohnya data produk pisang, namun masalahnya kondisi website atau aplikasi seringnya tidak stabil, bagaimana cara nya agar produk pisang tersebut selalu ada di dalam website itu? bisa saja ada pembersihan data yang menyebabkan test gagal karena produk pisang sudah tidak ada di database.

Dalam Kondisi seperti itu kita membutuhkan Fixture, kita ingin ada kondisi pasti, misalnya data produk pisang akan selalu di sediakan sebelum test skenario merubah tersebut di jalankan. Dengan begitu test akan bisa berjalan dengan lancar walau data produk pisang suatu hari di hapus oleh database. Fixture bisa membuat data produk pisang itu dan menghapus nya setelah selesai di pakai oleh test agar data tidak menumpuk di database. (yang kemungkinan bisa memperlambat proses testing)

## Bagaimana Alur Kerja nya?
Fixture akan di jalankan sebelum satu tahap test di mulai, dan juga bisa di atur menunggu test selesai di jalankan dan menjalankan tugas terakhir nya.

Contoh nya membuat data produk A, setelah itu Fixture akan Mengembalikan/Melempar data nya untuk di pakai Test, dia akan menunggu sampai test selesai gak peduli hasilnya gagal atau berhasil, lalu melanjutkan baris kode selanjutnya
