# Alias

Terkadang Perintah yang ada di terminal itu panjang, seperti `npx playwright tests  tests/dan-seterusnya`, namun apa jadinya jika kita perpendek menjadi `pwtest`, lebih enak bukan? fitur singkatan tersebut biasa di sebut alias.

ada satu file yang bisa mengatur alias, kalau bash bawaan di file **`~/.bashrc`**, kalau pakai zash ada di file  **`~/.zshrc`**. 




## Membuat Alias Baru

1. buka file nya sesuai text editor masing-masing.

2. gunakan kode seperti ini.

```bash
alias singkatan='bash/perintah-nya'

#contoh
alias gs='git status'
```

3. simpan dan keluar, ketik:

```bash
# untuk bash
source ~/.bashrc

# untuk zash
source ~./zshrc
```


