# 🚀 Windows Dev Environment Dotfiles

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Alacritty](https://img.shields.io/badge/Alacritty-%23F46526.svg?&style=for-the-badge&logo=alacritty&logoColor=white)
![Zsh](https://img.shields.io/badge/Zsh-%23141E30.svg?&style=for-the-badge&logo=terminal&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)

Selamat datang di repositori dotfiles pribadi saya! Ini adalah konfigurasi lingkungan pengembangan (*development environment*) yang sangat dioptimalkan untuk **Windows**, menggunakan **Zsh (MSYS2)**, **Alacritty Terminal**, dan **Neovim (NvChad)**.

---

## ✨ Fitur Utama

- **Terminal Sangat Cepat (GPU-Accelerated)**: Konfigurasi Alacritty dengan tema **One Dark**, *dynamic padding*, dan *transparent background*.
- **Modern Shell**: Zsh terintegrasi dengan MSYS2 di Windows, dioptimalkan agar waktu *startup* instan (tanpa *lag* saat *load*).
- **IDE-Like Neovim**: Dibangun di atas [NvChad](https://nvchad.com/), dikonfigurasi khusus agar fitur CLI (seperti `!git`) berjalan mulus menggunakan POSIX shell, bebas dari error path Windows.
- **Tipografi Bersih**: Menggunakan [JetBrainsMono Nerd Font](https://www.nerdfonts.com/) dengan penyesuaian *line-height* (offset) agar logo terminal dan UI Neovim tidak terputus.

---

## 📦 Persyaratan Sistem (Prerequisites)

Sebelum memasang dotfiles ini, pastikan sistem Windows kamu sudah terinstal:

1. **[Alacritty](https://alacritty.org/)** - Terminal emulator.
2. **[Neovim](https://neovim.io/)** (Minimal v0.9.0+).
3. **[MSYS2](https://www.msys2.org/)** - Menyediakan Zsh dan *tools* Linux di Windows.
4. **[Git](https://git-scm.com/)** & **Git Credential Manager Core**.
5. **[JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)** (Wajib diinstal di OS Windows).

---

## 📂 Struktur Direktori

```text
mynvim-dotfiles/
├── alacritty/
│   └── alacritty.toml    # Tema One Dark, Font Offset, & Transparansi
├── nvim/
│   ├── init.lua          # Entry point NvChad
│   └── lua/
│       ├── options.lua   # Konfigurasi Shell (shellcmdflag = "-c")
│       ├── mappings.lua  # Shortcut / Keybinds kustom
│       └── plugins/      # NvimTree config (fs_watcher disabled) & Lazy setup
├── zsh/
│   └── .zshrc            # Alias, optimasi startup, fix bracketed paste Zsh
├── .gitignore            # Mengabaikan file temporary dan cache
└── README.md             # Dokumentasi Repositori
```

## 🚀 Panduan Instalasi (Installation)

1. Clone Repositori
Buka terminal dan clone repositori ini ke folder root kamu:

```Bash
git clone [https://github.com/hafistafrizal/mynvim-dotfiles.git](https://github.com/hafistafrizal/mynvim-dotfiles.git) ~/dotfiles
```

2. Terapkan Konfigurasi Alacritty
Salin file `alacritty.toml` ke `folder %APPDATA%` Windows:

```Bash
# Jalankan di PowerShell / CMD
mkdir %APPDATA%\alacritty
copy %USERPROFILE%\dotfiles\alacritty\alacritty.toml %APPDATA%\alacritty\alacritty.toml
```

3. Terapkan Konfigurasi Neovim
Backup konfigurasi Neovim lama kamu (jika ada), lalu tautkan/salin folder `nvim` ini:

```Bash
# Jalankan di PowerShell / CMD
Move-Item -Path $env:LOCALAPPDATA\nvim -Destination$env:LOCALAPPDATA\nvim.bak -ErrorAction SilentlyContinue
Copy-Item -Path "$env:USERPROFILE\dotfiles\nvim" -Destination "$env:LOCALAPPDATA\nvim" -Recurse
```
Catatan: Saat Neovim pertama kali dibuka, biarkan Lazy.nvim mengunduh seluruh plugin secara otomatis.

4. Terapkan Konfigurasi Zsh (MSYS2)
Buka file `~/.zshrc` di dalam home MSYS2 kamu, lalu panggil file dotfiles ini dengan menambahkan baris berikut di paling bawah:

```Bash
# Arahkan Zsh MSYS2 untuk membaca konfigurasi dari folder dotfiles
source /c/Users/LENOVO/dotfiles/zsh/.zshrc
```
Muat ulang Zsh dengan perintah: `source ~/.zshrc`

## 🛠️ Catatan Troubleshooting Khusus Windows

Konfigurasi ini sudah mengatasi beberapa bug umum saat menggunakan Neovim + Zsh di Windows:

- **NvimTree `ENOENT fs_watcher` error:** Diperbaiki dengan mematikan fitur `filesystem_watchers` agar NvimTree tidak bingung membaca path `/c/Users/` dari Zsh.
- **Garis Putus pada Logo NvChad:** Diperbaiki dengan mengatur `font.offset = { y = -1 }` dan `builtin_box_drawing = true` di Alacritty.
- **Error** `:!git` (can't open input file /s): Diperbaiki dengan memaksa Neovim menggunakan flag `-c` bawaan POSIX `melalui vim.opt.shellcmdflag = "-c"` di `options.lua`.
- **Karakter aneh** `[200~` saat Copy-Paste: Diperbaiki dengan unset paste di dalam `.zshrc`.

## 👤 Author

[@hafistafrizal](https://github.com/hafistafrizal)
