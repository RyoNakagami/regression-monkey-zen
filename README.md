# REGMONKEY_ZEN

Unixの哲学、ソフトウェア開発、データ可視化、研究手法など、さまざまな「Zen」の原則を表示するためのスクリプト

## Features

- 複数のZen原則をインタラクティブに選択可能
- テキストベースのZenおよびPythonベースのZenの両方に対応
- ページングオプション付き(オプション `-p` で `less` 経由で表示)
- 日本語版 Zen はオプション `-l JP` で表示可能

## Available Zens

- **Unix Zen**: Core principles of Unix philosophy and software design
- **Bazaar Zen**: Open source development wisdom from "The Cathedral and the Bazaar"
- **EDA Zen**: Best practices for Exploratory Data Analysis and visualization
- **Research Question Zen**: Guidelines for formulating research questions
- **Statistics Zen**: Principles for statistical analysis and modeling
- **Slide Zen**: Best practices for presentation design
- **Python Zen**: The Zen of Python (PEP 20)

## Requirements

- Bash shell
- Python 3 (for Python-based Zens)
- Unix-like environment (MacOS, Linux, WSL)

## Setup

1. `.zshrc` or `.bashrc` にパスに追加：

   ```bash
   export PATH="$PATH:/path/to/regression-monkey-zen/src"
   ```

2. (Optional) エイリアスを追加：

   ```bash
   alias regmonkey_zen="/path/to/regression-monkey-zen/src/regmonkey_zen.sh"
   ```

## Usage

```bash
./regmonkey_zen.sh           # Normal display
./regmonkey_zen.sh -p        # Display output through less for scrolling
```

## Directory Structure

```ini
.
├── README.md
└── src/
     ├── regmonkey_zen.sh        # Main script
     ├── utils/
     │   └── zen_parser.sh       # Text file parser
     └── zen_docs/               # Zen document collection
         ├── unix-zen.txt
         ├── bazaar-zen.txt
         ├── eda-zen.txt
         ├── research-question-zen.txt
         ├── statistics-zen.txt
         ├── slide-zen.txt
         └── pyzen.py
```
