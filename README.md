# 🚀 mynvim-dotfiles

Konfigurasi personal (*dotfiles*) untuk lingkungan pengembangan saya di Windows dan Linux, yaitu **PowerShell 7** dan kustomisasi terminal dengan **Oh-My-Posh**.

> 📝 **Konfigurasi Neovim sekarang ada di repo terpisah:** [hafistafrizal/nvim-config](https://github.com/hafistafrizal/mynvim-config)

## 📚 Dokumentasi

Setiap konfigurasi punya panduan sendiri:

| Konfigurasi | Isi | Panduan |
|-------------|-----|---------|
| 📝 **Neovim** | Config NvChad, LSP, Treesitter, LazyGit | [Repo nvim-config](https://github.com/hafistafrizal/mynvim-config) (repo terpisah) |
| 💻 **Terminal** | Profil PowerShell 7 dan tema Oh-My-Posh | [powershell/README.md](powershell/README.md) |

## 📂 Struktur Direktori

```text
.
├── powershell/         # Profil PowerShell 7 ($PROFILE)
│   └── README.md       # Panduan konfigurasi terminal (PowerShell + Oh-My-Posh)
├── oh-my-posh/         # Tema Oh-My-Posh kustom (ys.omp.json)
├── .gitignore          # Mengabaikan file swap, backup, dan cache
├── LICENSE             # Unlicense
└── README.md           # Dokumentasi utama (file ini)
```

## ⚡ Quick Start

**Terminal (PowerShell & Oh-My-Posh)**

```bash
git clone https://github.com/hafistafrizal/mynvim-dotfiles.git ~/dotfiles
```

Lalu ikuti bagian *Instalasi* di [powershell/README.md](powershell/README.md).

**Neovim**

Neovim memakai repo sendiri dan di-clone langsung ke folder konfigurasi Neovim:

```powershell
# Windows (PowerShell)
git clone https://github.com/hafistafrizal/nvim-config.git "$env:LOCALAPPDATA\nvim"
```

```bash
# Linux
git clone https://github.com/hafistafrizal/nvim-config.git ~/.config/nvim
```

Detail lengkap ada di [README nvim-config](https://github.com/hafistafrizal/nvim-config#readme).

> 💡 Disarankan memasang **Nerd Font** terlebih dahulu, karena dipakai oleh Neovim maupun prompt Oh-My-Posh. Caranya ada di [panduan terminal](powershell/README.md#1-pasang-nerd-font).

## ✨ Sekilas Fitur

- **PowerShell 7 + Oh-My-Posh:** prompt kustom dengan tema `ys.omp.json`.
- **Neovim + NvChad** (repo terpisah): UI cepat dan estetis, LSP & formatter untuk C, C++, PHP, Python, HTML, CSS, JavaScript, serta integrasi LazyGit.

## 📄 Lisensi

Dirilis di bawah [Unlicense](LICENSE), bebas dipakai, disalin, dan dimodifikasi.

## 👤 Author

[@hafistafrizal](https://github.com/hafistafrizal)
