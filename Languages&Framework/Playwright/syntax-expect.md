[Kembali ke Daftar Isi](Daftar-isi.md)

# Expect Syntax

Docs resmi: [https://playwright.dev/docs/test-assertions](https://playwright.dev/docs/test-assertions)

Setelah menulis sebuah aksi, kita mengharapkan tindakan itu di lakukan dengan benar oleh Plawright, dan kita harus membuat sebuah patokan/tanda bahwa action itu berhasil di lakukan atau berhasil berubah sesuai keinginan.

jika kita hanya menyuruh Playwright melakukan action tanpa validasi, maka itu tidak bisa di sebut sebagai test.

![](/home/malikib/Documents/Docs/Languages&Framework/Playwright/images/getbyText.png)

Contoh nya saat selesai login, kita bisa tahu login itu berhasil atau gagal dengan patokan notif pop up yang muncul.

Kita bisa menjadikan Notif Pop up tersebut menjadi patokan kalau login itu berhasil di lakukan.

jangan lupa import seperti ini

```typescript
import { test, expect } from '@playwright/test'
               ^^^
```

### Expect

simple saja, kita pakai `expect(value)` untuk memvalidasi keadaan yang kita harapkan.

jika tidak sesuai harapan, maka test tersebut akan otomatis di anggap gagal dan akan lanjut ke skenario berikutnya.

```typescript
test('login valid', async({ page }) => {
    await page.goto("https://malikib.my.id")
    await page.getByRole('textbox', { name: 'Email' }).fill('user@gmail')
    await page.getByRole('textbox', { name: 'Password' }).fill('password123')

    const loginSuccess = page.getByText('login successful', exact: false)
    await expect(loginSuccess).toBeVisible()
})
```

strukturnya simple, seperti ini:

```typescript
await expect(page).toBe()
```

setelah syntax `expect(page)` kita harus menyesuaikan validasi nya dengan kebutuhan, banyak contoh nya seperti `.toBeVisible()` yang bermaksud sebuah validasi element terlihat di layar.

## Otomatis mengulang

Unggul nya Playwright adalah ketika sebuah element belum muncul, maka playwright tidak akan terburu buru menggagal kan test tersebut, dia akan mengulang lagi beberapa kali sampai timeout.

tapi hanya syntax tertentu.
syntax ini bersifat Asynchronus, artinya ada action yang butuh waktu. maka kita wajib memakai `await` sebelum `expect`.

| Assertion                                             | Deskripsi                                                                                         |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `await expect(locator).toBeAttached()`                | validasi Element tersebut ada                                                                     |
| `await expect(locator).toBeChecked()`                 | validasi chekcbox telah di centang                                                                |
| `await expect(locator).toBeEnabled()`                 | validasi element bisa di akses                                                                    |
| `await expect(locator).toBeDisabled()`                | validasi element tidak bisa di akses                                                              |
| `await expect(locator).toBeEmpty()`                   | validasi element tidak memiliki konten                                                            |
| `await expect(locator).toBeEditable()`                | validasi element tersebut bisa di ubah                                                            |
| `await expect(locator).toBeFocused()`                 | validasi kursor berada di element tersebut                                                        |
| `await expect(locator).toBeHidden()`                  | validasi element tersembunyi di layar                                                             |
| `await expect(locator).toBeInViewport()`              | Validasi elemen masuk dalam area layar yang sedang dilihat pengguna.                              |
| `await expect(locator).toBeVisible()`                 | Validasi elemen muncul dan terlihat jelas di layar web.                                           |
| `await expect(locator).toContainText()`               | Validasi elemen mengandung sebagian potongan teks tertentu.                                       |
| `await expect(locator).toContainClass()`              | Validasi elemen memiliki salah satu nama Class CSS tertentu.                                      |
| `await expect(locator).toHaveAccessibleDescription()` | Validasi elemen memiliki deskripsi aksesibilitas tambahan untuk pembaca layar disabilitas.        |
| `await expect(locator).toHaveAccessibleName()`        | Validasi elemen memiliki nama aksesibilitas resmi yang ramah disabilitas.                         |
| `await expect(locator).toHaveAttribute()`             | Validasi elemen HTML tersebut memiliki atribut DOM tertentu beserta nilainya.                     |
| `await expect(locator).toHaveClass()`                 | Validasi elemen memiliki daftar properti Class CSS yang sama persis.                              |
| `await expect(locator).toHaveCount()`                 | Validasi sebuah daftar memiliki jumlah anak elemen yang pas dan tepat nilainya.                   |
| `await expect(locator).toHaveCSS()`                   | Validasi elemen memiliki properti gaya tampilan gaya (CSS style) tertentu.                        |
| `await expect(locator).toHaveId()`                    | Validasi elemen tersebut memiliki atribut id yang spesifik pada kode HTML-nya.                    |
| `await expect(locator).toHaveJSProperty()`            | Validasi elemen memiliki properti JavaScript tertentu di sisi internal browser object.            |
| `await expect(locator).toHaveRole()`                  | Validasi elemen memiliki fungsi/peran (ARIA role) yang spesifik.                                  |
| `await expect(locator).toHaveText()`                  | Validasi elemen memiliki teks yang sama persis 100% (saklek).                                     |
| `await expect(locator).toHaveValue()`                 | Validasi sebuah kolom input formulir sedang menampung nilai teks atau angka tertentu.             |
| `await expect(locator).toHaveValues()`                | Validasi elemen pilihan (Select Dropdown) memiliki daftar opsi pilihan ganda yang sedang dipilih. |
| `await expect(locator).toMatchAriaSnapshot()`         | Validasi struktur aksesibilitas elemen cocok dengan cetak biru dokumen snapshot ARIA.             |
| `await expect(page).toMatchAriaSnapshot()`            | Validasi seluruh struktur aksesibilitas satu halaman penuh cocok dengan cetak biru ARIA.          |
| `await expect(page).toHaveScreenshot()`               | Validasi visual tampilan satu halaman penuh sama persis tanpa ada perubahan tata letak.           |
| `await expect(page).toHaveTitle()`                    | Validasi judul tab browser (Browser Title) sesuai dengan nama yang diharapkan.                    |
| `await expect(page).toHaveURL()`                      | Validasi alamat web browser saat ini berada di URL yang tepat.                                    |
| `await expect(response).toBeOK()`                     | Validasi status respon API dari server bernilai sukses/berhasil (HTTP 200-299).                   |

ada beberapa yang sering di pakai, di antara nya adalah:

- `await expect(locator).toBeVisible()`

- `await expect(response).toBeOK()`

- `await expect(locator).toContainText()`

contoh pemakaian:

```typescript
await expect(page.getByText('login successful')).toBeVisible()
```

## Langsung validasi

ada validasi tertentu yang tidak membutuhkan waktu, artinya action tersebut akan di lakukan dan akan gagal seketika jika tidak sesuai harapan. syntax ini tidak memakai `await` sebelum `expect`.

| Assertion                                | Penjelasan Deskripsi                                                             |
| ---------------------------------------- | -------------------------------------------------------------------------------- |
| `expect(value).toBe()`                   | Validasi nilai data sama persis (identik).                                       |
| `expect(value).toBeCloseTo()`            | Validasi nilai angka mendekati atau hampir sama (untuk angka desimal).           |
| `expect(value).toBeDefined()`            | Validasi nilai variabel sudah terdefinisi (bukan undefined).                     |
| `expect(value).toBeFalsy()`              | Validasi nilai dianggap salah/negatif (seperti false, 0, null, kosong).          |
| `expect(value).toBeGreaterThan()`        | Validasi nilai angka lebih besar dari batas tertentu.                            |
| `expect(value).toBeGreaterThanOrEqual()` | Validasi nilai angka lebih besar atau sama dengan batas tertentu.                |
| `expect(value).toBeInstanceOf()`         | Validasi sebuah objek merupakan turunan (*instance*) dari Class tertentu.        |
| `expect(value).toBeLessThan()`           | Validasi nilai angka lebih kecil dari batas tertentu.                            |
| `expect(value).toBeLessThanOrEqual()`    | Validasi nilai angka lebih kecil atau sama dengan batas tertentu.                |
| `expect(value).toBeNaN()`                | Validasi nilai data adalah *Not-a-Number* (bukan angka yang valid).              |
| `expect(value).toBeNull()`               | Validasi nilai data bernilai kosong/nol telak (*null*).                          |
| `expect(value).toBeTruthy()`             | Validasi nilai dianggap benar/positif (bukan false, bukan 0, bukan null).        |
| `expect(value).toBeUndefined()`          | Validasi nilai variabel memang belum terdefinisi (*undefined*).                  |
| `expect(value).toContain()`              | Validasi sebuah teks mengandung potongan kata/karakter tertentu.                 |
| `expect(value).toContain()`              | Validasi sebuah Array atau Kumpulan Data (*Set*) mengandung item tertentu.       |
| `expect(value).toContainEqual()`         | Validasi sebuah Array mengandung objek data yang strukturnya mirip.              |
| `expect(value).toEqual()`                | Validasi nilai data mirip secara mendalam (*deep equality* atau pola cocok).     |
| `expect(value).toHaveLength()`           | Validasi jumlah panjang karakter teks atau jumlah total isi Array.               |
| `expect(value).toHaveProperty()`         | Validasi sebuah Objek memiliki karakteristik/properti internal tertentu.         |
| `expect(value).toMatch()`                | Validasi teks cocok dengan pola ekspresi reguler (*Regular Expression / Regex*). |
| `expect(value).toMatchObject()`          | Validasi sebuah Objek mengandung karakteristik data spesifik yang dicari.        |
| `expect(value).toStrictEqual()`          | Validasi nilai data sama persis, termasuk tipe datanya (*strict equality*).      |
| `expect(value).toThrow()`                | Validasi sebuah fungsi sengaja memicu atau mengeluarkan pesan eror.              |

beberapa yang sering di pakai:

- `expect(value).toBe()`

- `expect(value).toBeTruthy()`

contoh pemakaian:

```typescript
const res = await context.get('/api/login'); // API Request

expect(res.status()).toBe(200) // exkpektasi status respon nya 200
```

## Mencocokan tapi tidak simetris

ada fitur Playwright yang canggih yang memungkinkan kita bisa validasi sebuah data tapi tidak harus 100% sama persis. ini di namakan **Asymmetric matchers**

| Matcher                     | Penjelasan Deskripsi                                                                                            |
| --------------------------- | --------------------------------------------------------------------------------------------------------------- |
| `expect.any()`              | Validasi data yang penting berupa jenis kelas/tipe data primitif tertentu (seperti Number, String, Boolean).    |
| `expect.anything()`         | Validasi data berupa apa saja, asalkan datanya ada (tidak boleh null atau undefined).                           |
| `expect.arrayContaining()`  | Validasi sebuah Array mengandung item-item spesifik yang kita tentukan (urutan item tidak dipermasalahkan).     |
| `expect.arrayOf()`          | Validasi semua isi di dalam Array harus memiliki tipe data yang spesifik (misal: harus angka semua).            |
| `expect.closeTo()`          | Validasi nilai angka mendekati atau hampir sama (berguna untuk mencocokkan angka desimal/float).                |
| `expect.objectContaining()` | Validasi sebuah Objek mengandung karakteristik/properti spesifik yang kita cari (mengabaikan properti lainnya). |
| `expect.stringContaining()` | Validasi sebuah teks mengandung potongan kata atau karakter tertentu.                                           |
| `expect.stringMatching()`   | Validasi teks cocok dengan pola tertentu menggunakan ekspresi reguler (Regex).                                  |

anggap ada data seperti ini:

```typescript
const dataUser = {
  id: 9482,                           // Angka acak dari database
  username: "malikib",               // Input dari user
  diatur_pada: "2026-08-23T08:54:00Z" // Waktu saat tombol diklik
};
```

jika kita pakai `toEqual()`

```typescript
expect(dataUser).toEqual({
  id: 9482,
  username: "malikib",
  diatur_pada: "2026-08-23T08:54:00Z"
});
```

maka harus sama persis, tapi jika kita pakai salah satu Asymmetric matchers yaitu `expect.any()`

```typescript
expect(dataUser).toEqual({
  id: expect.any(Number),             // Yang penting ID-nya berupa ANGKA bebas berapa saja
  username: "malikib",                // Ini wajib persis "malikib"
  diatur_pada: expect.any(String)     // Yang penting tipenya teks/string waktu
});
```

anggap ada 20 properti dalam sebuah data, tapi kita hanya ingin validasi 2 data saja, maka bisa seperti ini

```typescript
// Mengabaikan 18 properti lainnya, hanya fokus pada 2 data ini
expect(dataUserBesar).toEqual(
  expect.objectContaining({
    status: "aktif",
    role: "admin"
  })
);
```

## Kebalikan

secara umum, jika kita mengharapkan sesuatu tidak terjadi, maka kita bisa tambahkan `.not` sebelum validasi, jadi nya seperti

```typescript
await expect(page.getByText('login failed')).not.toBeVisible()
```

artinya kita ingin memastikan bahwa tidak ada notif seperti ini yang menandakan login itu gagal

## Validasi Lembut

perlu kita ketahui bahwa jika expect tidak mendapati kondisi yang sesuai, maka test akan di anggap gagal dan lanjut ke skenario berikutnya. artinya syntax setelah expect yang gagal tidak akan di lanjutkan.

```typescript
await expect(page.getByTestId('status')).toHaveText('Success');
await expect(page.getByTestId('eta')).toHaveText('1 day');

// jika expect gagal, maka syntax di bawah ini tidak akan di jalankan
await page.getByRole('link', { name: 'next page' }).click();
await expect.soft(page.getByRole('heading', { name: 'Make another order' })).toBeVisible();
```

Tapi berbeda dengan `expect.soft()`, jika gagal, maka syntax di bawah masih akan di jalankan seperti biasa.

```typescript
// Jika ini gagal, tes TIDAK berhenti.
await expect.soft(page.getByTestId('status')).toHaveText('Success');
await expect.soft(page.getByTestId('eta')).toHaveText('1 day');

// Tes tetap lanjut meskipun pengecekan di atas ada yang gagal.
await page.getByRole('link', { name: 'next page' }).click();
await expect.soft(page.getByRole('heading', { name: 'Make another order' })).toBeVisible();
```

kapan pakai `expect.soft()`?

sepengalamanku ini jarang di pakai, karna 80% expect biasa sudah cukup, tapi ini bisa di pakai jika ada kondisi error yang di wajarkan, atau masih ingin menjalankan test selanjutnya.

## Atur Message sendiri

jika expect error maka dia akan menampilkan pesan error yang panjang dan lebih sulit di baca seperti ini:

```
Error: expect(received).toBeVisible()

Call log:
  - expect.toBeVisible with timeout 5000ms
  - waiting for getByText('Selamat Datang, Admin')
  - locator resolved to 0 elements. Actual value: hidden
  - <html lang="id">...</html> (HTML Code terpotong panjang ke bawah...)
```

tapi kita bisa tambahkan message sendiri:

```typescript
const locator = page.getByText('Selamat Datang, Admin')
await expect(locator, 'akan muncul notif').toBeVisible();
```

jika expect pass, akan terlihat seperti ini di terminal:

```typescript
akan muncul notif  @example.spec.ts:18
```

jika expect gagal, akan muncul seperti ini:

```typescript
    Error: akan muncul notif

    Call log:
      - expect.toBeVisible with timeout 5000ms
      - waiting for "getByText('Name')"


      2 |
      3 | test('example test', async({ page }) => {
    > 4 |   await expect(page.getByText('Name'), 'should be logged in').toBeVisible();
        |                                                                  ^
      5 | });
      6 |
```

## Expect lainnya

masih ada expect lain seperti:

- `expect.configure()`

- `expect.poll()`

- `expect.toPass()`

- `expect.extend()` untuk menambahkan custom expect sesuai keinginan

bisa di baca di sini [https://playwright.dev/docs/test-assertions](https://playwright.dev/docs/test-assertions)

## Selanjutnya..

oke kita berhasil mempelajari expect, kita bisa save file skrip nya dan jalankan `npx playwright test skrip.example.spec.ts`

**Ingat!** jika saat test jalan di terminal dan tidak ada error, berarti expect susuai apa yang kita harapkan.

mungkin selanjutnya kita akan melanjutkan pembahasan tentang organizir test

[Kembali ke Daftar Isi](Daftar-isi.md)
