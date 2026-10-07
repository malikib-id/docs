# Metode Modular Fixture
Fixture sangat penting untuk membantu proses Testing, kita akan selalu membutuhkan nya untuk menyediakan kondisi test yang pasti. Namun ada cara pembuatan atau pembagian test yang di rekomendasikan sesuai pengalaman Malikib.

## Apa itu Modular Fixture?
Modular Fixture adalah metode memisahkan tanggung jawab pada file yang terpisah. Bayangkan Fixture harus membuat data seperti data produk, data pelangga, ada supplier, data addon dan sebagai nya. Jika kita hanya menaruh pada 1 file fixture aja, tentu itu bisa tetapi tidak di sarankan, metode Modular Fixture membagi nya terpisah ke beberapa file masing-masing.

## Apa tujuan nya?
beberapa tujuan nya tentu agar kita bisa terus merawatnya di kemudian hari secara mudah, apalagi jika kedepannya system nya akan semakin membesar dan semakin banyak jenis jenis skenario berbeda yang harus di jalankan. 

## Gimana Cara Menerapkannya?
Sebenernya mudah, kita membutuhkan 1 file utama yang akan jadi Fixture Composition, kita membuat file baru dengan tugas yang spesifik, contoh file `product.fixture.ts` membuat data produk di dalam export function arrow, setelah selesai kita import file tersebut di dalam file Fixture composition, misal `base.fixture.ts` lalu kita extend ke dalam base.extend<> dan siap memakai fixture tersebut. 
