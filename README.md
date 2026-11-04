# 🚀 mynvim-dotfiles

Konfigurasi personal (*dotfiles*) untuk lingkungan pengembangan saya di Windows dan Linux. Fokus utamanya adalah **Neovim** (berbasis [NvChad](https://nvchad.com/)), **PowerShell 7**, dan kustomisasi terminal dengan **Oh-My-Posh**.

## 📚 Dokumentasi

Setiap konfigurasi punya panduan sendiri. Mulai dari sini, lalu buka panduan yang kamu butuhkan:

| Konfigurasi | Isi | Panduan |
|-------------|-----|---------|
| 📝 **Neovim** | Config NvChad, LSP, Treesitter, LazyGit | [nvim/README.md](nvim/README.md) |
| 💻 **Terminal** | Profil PowerShell 7 dan tema Oh-My-Posh | [powershell/README.md](powershell/README.md) |

## 📂 Struktur Direktori

```text
.
├── nvim/               # Konfigurasi Neovim (custom config di atas NvChad)
│   └── README.md       # Panduan konfigurasi Neovim
├── powershell/         # Profil PowerShell 7 ($PROFILE)
│   └── README.md       # Panduan konfigurasi terminal (PowerShell + Oh-My-Posh)
├── oh-my-posh/         # Tema Oh-My-Posh kustom (ys.omp.json)
├── .gitignore          # Mengabaikan file swap, backup, dan cache
├── LICENSE             # Unlicense
└── README.md           # Dokumentasi utama (file ini)
```

## ⚡ Quick Start

Clone repositori ke home directory:

```bash
git clone https://github.com/hafistafrizal/mynvim-dotfiles.git ~/dotfiles
```

Lalu ikuti panduan sesuai kebutuhan:

1. **Neovim** → bagian *Instalasi* di [nvim/README.md](nvim/README.md)
2. **PowerShell & Oh-My-Posh** → bagian *Instalasi* di [powershell/README.md](powershell/README.md)

> 💡 Disarankan memasang **Nerd Font** terlebih dahulu, karena dipakai oleh Neovim maupun prompt Oh-My-Posh. Caranya ada di [panduan terminal](powershell/README.md#1-pasang-nerd-font).

## ✨ Sekilas Fitur

- **Neovim + NvChad:** UI cepat dan estetis, LSP & formatter untuk C, C++, PHP, Python, HTML, CSS, JavaScript, serta integrasi LazyGit.
- **Treesitter fix untuk Windows:** mencegah *silent crash* saat kompilasi parser.
- **PowerShell 7 + Oh-My-Posh:** prompt kustom dengan tema `ys.omp.json`.

## 📄 Lisensi

Dirilis di bawah [Unlicense](LICENSE), bebas dipakai, disalin, dan dimodifikasi.

## 👤 Author

[@hafistafrizal](https://github.com/hafistafrizal)

Konfigurasi ini dikelola untuk kebutuhan *coding* harian dan tugas perkuliahan.
