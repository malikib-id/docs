;; ======================================================
;; TAMPILAN EMACS 
;; ======================================================

;; ========== THEME & FONT ==========

(setq inhibit-startup-screen t)
(load-theme 'modus-vivendi t)

;; Theme dark yang ramah mata
(load-theme 'modus-vivendi t)  ;; Theme built-in high contrast, atau:
;; (load-theme 'dracula t)     ;; Jika install dari MELPA

;; Font yang lebih baik untuk mata di layar kecil
(set-frame-font "JetBrains Mono-10" nil t)

;; EWW DARK MODE - SINGKAT PASTI BEKERJA
(setq eww-data-color-scheme 'dark)
(setq eww-disable-colorize t)


;; ========== UI ==========
;; biar gak ada tombol
(menu-bar-mode -1)     ; Menghilangkan menu teks di bagian atas
(tool-bar-mode -1)     ; Menghilangkan ikon tombol (buka, simpan, dll)
(scroll-bar-mode -1)   ; Menghilangkan batang gulir di samping kanan

;; biar makin ringan (katanya)
(setq gc-cons-threshold 20000000)


(menu-bar-mode 0)

;; Line numbers untuk Emacs modern
(global-display-line-numbers-mode t)

;; Highlight matching parentheses
(show-paren-mode t)

(setq mode-line-position " %l:%c ")  ;; line:col tanpa -----
(setq mode-line-buffer-identification " %b ")  ;; buffer name tanpa -----


;; ========= WARNING BRACKET SEDERHANA =========
;; Warna ungu untuk bracket yang match
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((t (:background "blue" :foreground "white" :bold t))))
 ;; Warna merah untuk bracket tidak match
 '(show-paren-mismatch ((t (:background "red" :foreground "white" :bold t)))))

;; Always show matching paren
(setq show-paren-when-point-inside-paren t)
(setq show-paren-when-point-in-periphery t)

;; Delay 0 (langsung muncul)
(setq show-paren-delay 0)
(display-time-mode 1)

;; Line spacing (beri jarak antar baris)
(setq-default line-spacing 2)

;; Word wrap yang SMART untuk coding
(global-visual-line-mode t)  ;; atau (global-display-fill-column-indicator-mode t)

;; Column guide (garis batas vertikal)
(setq-default fill-column 80)  ;; atau 100
(global-display-fill-column-indicator-mode t)  ;; tampilkan garis di kolom ke-80


;; ======================================================
;; SETUP EMACS
;; ======================================================

;; ========== Package  ==========
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(aidermacs cmake-ide cmake-mode cmake-project company corfu csv-mode emmet-mode
	       flycheck flymd grip-mode impatient-mode magit markdown-mode
	       prettier-js vterm web-mode yaml-mode)))

;; ;; Disable backup files
;; (setq make-backup-files nil) ; Tidak buat backup file
;; (setq auto-save-default nil) ; Tidak buat auto-save file (#file#)

(global-company-mode 1)

;; ========== BACKUP ==========

;; 1. Definisikan jalur folder cadangan
(defvar my-backup-dir "~/.emacs.d/backups/")
(defvar my-auto-save-dir "~/.emacs.d/auto-save/")

;; 🔄 OTOMATISASI: Buat folder langsung jika belum ada di komputer
(unless (file-exists-p my-backup-dir)
  (make-directory my-backup-dir t))
(unless (file-exists-p my-auto-save-dir)
  (make-directory my-auto-save-dir t))

;; 2. Daftarkan folder ke sistem Emacs
(setq backup-directory-alist `(("." . ,my-backup-dir)))
(setq auto-save-file-name-transforms `((".*" ,my-auto-save-dir t)))

;; 3. Aktifkan fitur backup & auto-save
(setq make-backup-files t)    ; Aktifkan backup otomatis
(setq auto-save-default t)    ; Aktifkan auto-save otomatis

;; 4. Atur sistem nomor versi agar lebih pintar
(setq version-control t)      ; Pakai sistem nomor versi (file.txt.~1~)
(setq kept-old-versions 2)    ; Simpan 2 versi cadangan paling awal
(setq kept-new-versions 6)    ; Simpan 6 versi cadangan terbaru
(setq delete-old-versions t)  ; Otomatis hapus versi tengah yang tidak penting

;; ========== SHORTCUT ==========

;; 4. AUTO COMPLETE BUILT-IN (gak perlu install)
(setq tab-always-indent 'complete)  ; Tab untuk complete
(icomplete-mode t)                  ; Completion sederhana

;; Auto complete tanda kutip, kurung, dll
(electric-pair-mode t)  ; Ketik "会自动 muncul "
(setq electric-pair-pairs '(
    (?\" . ?\")
    (?\' . ?\')
    (?\( . ?\))
    (?\[ . ?\])
    (?\{ . ?\})
))

;; Undo/Redo yang intuitif
(global-set-key (kbd "C-z") 'undo)      ; Ctrl+Z untuk undo
(global-set-key (kbd "C-S-z") 'redo)    ; Ctrl+Shift+Z untuk redo

;; Copy, cut, paste dengan keyboard
(global-set-key (kbd "C-c") 'kill-ring-save)     ; Copy
(global-set-key (kbd "C-w") 'kill-region)        ; Cut
(global-set-key (kbd "C-v") 'yank)               ; Paste

;; Bikin shortcut baru: Ctrl + Backspace
(global-set-key (kbd "C-<backspace>") 'my/pure-delete-word-backward)

;; Jika kamu tetap ingin mencoba tombol Shift + Backspace, pasang juga di sini:
(global-set-key (kbd "S-<backspace>") 'my/pure-delete-word-backward)


;; Paste dari clipboard Termux
(defun paste-from-termux ()
  "Paste from Termux clipboard."
  (interactive)
(insert (shell-command-to-string "termux-clipboard-get")))
(global-set-key (kbd "C-S-v") 'paste-from-termux)


;;tambah opsi untuk switch buffer
(global-set-key (kbd "<f2>") 'switch-to-buffer)

;; Fungsi untuk langsung pindah ke terminal, jika belum ada maka otomatis dibuat
(defun my/go-to-terminal ()
  "Langsung lompat ke buffer terminal vterm."
  (interactive)
  (let ((term-buffer (get-buffer "*vterm*")))
    (if term-buffer
        (switch-to-buffer term-buffer)
      (vterm))))

;; Pasang fungsi di atas ke tombol <f3>
(global-set-key (kbd "<f3>") 'my/go-to-terminal)

;; Fungsi penghapusan kata murni (Zap) tanpa menyentuh clipboard atau kill-ring sama sekali
(defun my/pure-delete-word-backward ()
  "Hapus satu kata ke belakang secara permanen tanpa mengotori kill-ring atau clipboard."
  (interactive)
  (let ((p (point)))
    (save-excursion
      (backward-word 1)
      (delete-region (point) p))))

(global-set-key (kbd "C-/") 'comment-line)
;; Mengaktifkan navigasi pindah layar dengan Shift + Panah
(windmove-default-keybindings)



;; ========== ELDOC ==========
;; Saat kamu mengetik fungsi/class, parameternya muncul di echo area (bawah), bukan pop-up
(use-package eldoc
  :config
  (setq eldoc-idle-delay 0.1))

;; 1. Atur Flymake (Indikator Eror Merah/Kuning di Samping Kiri)
(use-package flymake
  :hook (typescript-ts-mode . flymake-mode)
  :config
  ;; Menampilkan tanda seru / indikator di kolom kiri (fringe)
  (setq flymake-fringe-indicator-position 'left-fringe))

;; 2. Matikan Pop-up Otomatis Company Mode
(use-package company
  :init
  (global-company-mode)
  :config
  (setq company-idle-delay nil           ; NIL = Matikan total pop-up otomatis saat mengetik
        company-minimum-prefix-length 99 ; Mencegah pemicu otomatis lainnya
        company-tooltip-limit 10)
  
  ;; TOMBOL PINTAS MANUAL: Tekan M-/ (Alt + /) untuk memunculkan autocomplete jika butuh
  (global-set-key (kbd "M-/") 'company-complete))
(use-package eglot
  :ensure t
  :hook
  ((python-mode-hook . eglot-ensure)
   (c-mode-hook . eglot-ensure)
   (go-mode-hook . eglot-ensure)
   (yaml-mode-hook . eglot-ensure))
  :config
  ;; SILENCER TOTAL: Matikan pycodestyle & linter kosmetik yang berisik
  (setq-default eglot-workspace-configuration
                '((:pylsp :plugins (;; Matikan pycodestyle (spasi/formatting PEP8)
                                    :pycodestyle (:enabled :json-false)
                                    ;; Matikan flake8
                                    :flake8 (:enabled :json-false)
                                    ;; Matikan mccabe (warning kompleksitas kode)
                                    :mccabe (:enabled :json-false)
                                    ;; Sisakan pylint/rope hanya untuk fungsi vital (autocompletion)
                                    :preload (:enabled t))))))


;;EGLOT
(with-eval-after-load 'eglot
  ;; Anda bisa menambahkan kustomisasi Eglot di sini jika diperlukan
  )

(setq eldoc-idle-delay 1) ; Default biasanya 0.1, bikin terasa "agresif"

;; Pastikan yaml-mode terinstal untuk mendeteksi file .yml
(use-package yaml-mode
  :ensure t)

;; Hubungkan yaml-mode dengan eglot
(add-hook 'yaml-mode-hook 'eglot-ensure)


;;; flymake mode
(add-hook 'python-mode-hook 'flymake-mode)
(global-set-key (kbd "<f12>") 'flymake-show-buffer-diagnostics)



;; ========== VTERM ==========
(use-package vterm
  :ensure t
  :config
  (define-key vterm-mode-map (kbd "<f2>") nil)
  (define-key vterm-mode-map (kbd "<f3>") nil)

  ;; Pintasan copas yang sebelumnya
  (define-key vterm-mode-map (kbd "C-v") 'vterm-yank)
  (define-key vterm-mode-map (kbd "M-w") 'vterm-copy-mode))


;; ======================================================
;; PYTHON
;; ======================================================

(add-hook 'python-mode-hook 'eglot-ensure) ;; aktifkan eglot
;; Auto indent Python
(add-hook 'python-mode-hook
  (lambda ()
    (setq python-indent-offset 4)
    (local-set-key (kbd "RET") 'newline-and-indent)))




;; ===================================================
;; CSS & HTML
;; ===================================================

(unless (package-installed-p 'emmet-mode)
  (package-refresh-contents)
  (package-install 'emmet-mode))
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Gunakan web-mode untuk file HTML dan CSS
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'"  . web-mode))

;; Auto-close tag secara otomatis saat ketik ">"
(setq web-mode-auto-close-style 2)  ;; 2 = auto-close tag
(setq web-mode-enable-auto-indentation t) ;; auto-indent
(setq web-mode-enable-auto-pairing t)      ;; auto-pair quotes, braces

(add-hook 'web-mode-hook 'emmet-mode)  ;; untuk HTML/CSS
(setq emmet-move-cursor-between-quotes t) ;; kursor otomatis di dalam quotes
;; Shortcut expand Emmet
(require 'emmet-mode) ;; pastikan mode ter-load dulu

;; Aktifkan emmet-mode di html/css
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)

;; Contoh keybinding: Ctrl+j
(define-key emmet-mode-keymap (kbd "C-j") 'emmet-expand-line)


;; ===================================================
;; TYPESCRIPT
;; ===================================================

;; Otomatis deteksi file .ts dan .tsx untuk menyalakan warna Tree-sitter
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `((typescript-mode typescript-ts-mode) . ("/home/malikib/.npm-global/bin/typescript-language-server" "--stdio"))))

;; Otomatis nyalakan Eglot setiap kali membuka file TypeScript
(add-hook 'typescript-mode-hook #'eglot-ensure)
(add-hook 'typescript-ts-mode-hook #'eglot-ensure)

;; Paksa Emacs mengenali tsconfig.json sebagai batas root projek utama
(with-eval-after-load 'project
  (add-to-list 'project-vc-extra-root-markers "tsconfig.json"))

;; Larang Emacs dan Eglot mengintip folder node_modules agar tidak freeze
(with-eval-after-load 'project
  (setq project-vc-ignores '("node_modules/" ".main/")))

;; Naikkan memori GC menjadi 100MB saat startup agar Emacs super cepat
(setq gc-cons-threshold 100000000)

;; Kembalikan ke angka aman (20MB) setelah Emacs selesai loading sepenuhnya
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold 20000000)))

;; Naikkan kapasitas baca data proses dari server LSP (1MB)
(setq read-process-output-max (* 1024 1024))


;; ======================================================
;; AI
;; ======================================================

;; AI Agent
;; 1. Set API Key OpenRouter agar terbaca oleh sistem
;; (setenv "OPENROUTER_API_KEY" "")
;; ;; 2. Konfigurasi Paket Aidermacs
;; (use-package aidermacs
;;   :ensure t
;;   :defer t
;;   :config
;;   (setq aidermacs-backend 'comint) 
;;   (setq aidermacs-args '(
;; 			 "--model" "openrouter/openrouter/free"
;; 			 "--chat-language" "Indonesian"
;;                          "--api-key" "openrouter="
;;                          "--no-auto-commits"
;;                          )))

;; ;; 3. Shortcut aman menggunakan tombol F9
;; ;; (global-set-key (kbd "<f9>") 'aidermacs-transient-menu)

;; LLMs 
(setq gptel-model  'google/gemini-2.5-flash
      gptel-max-tokens 4000
      gptel-backend
      (gptel-make-openai "OpenRouter" 
        :host "openrouter.ai"
        :endpoint "/api/v1/chat/completions"
        :stream t
        :key ''
        :models '(google/gemini-2.5-flash        
		  meta-llama/llama-3.3-70b-instruct)))
(global-set-key (kbd "<f7>") 'gptel-menu)
(global-set-key (kbd "<f8>") 'gptel-rewrite)  
(global-set-key (kbd "<f9>") 'gptel)

;; ======================================================
;; OTHER
;; ======================================================
;; Preview markdown
(use-package grip-mode
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'markdown-mode
    (define-key markdown-mode-map (kbd "C-c C-g") 'grip-mode)))

;; csv mode
(unless (package-installed-p 'csv-mode)
  (package-refresh-contents)
  (package-install 'csv-mode))

;; Install markdown-mode jika belum ada
(unless (package-installed-p 'markdown-mode)
  (package-refresh-contents)
  (package-install 'markdown-mode))

;; Mode untuk file .md
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

;; Contoh: Otomatis aktif saat membuka file Python, C/C++, atau Go
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'go-mode-hook 'eglot-ensure)  
