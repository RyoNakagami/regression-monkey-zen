## Description

今回のPRにおいて，[#Issue番号](リンク)に従いリポジトリ環境のセットアップを実施．変更内容は以下：

- 新しいリポジトリ環境のセットアップスクリプト `setup_environment.sh` を作成
- 必要な依存関係を `requirements.txt` に追加
- プロジェクトの初期設定を行うためのドキュメント `SETUP.md` を作成

## Changes

- **New Script**:
  - `setup_environment.sh`: リポジトリ環境をセットアップするためのスクリプトを作成
- **Dependencies**:
  - `requirements.txt`: 必要な依存関係を追加
- **Documentation**:
  - `SETUP.md`: プロジェクトの初期設定を行うための手順を記載

## Example

<strong > &#9654;&nbsp; `setup_environment.sh` の内容</strong>

```sh
#!/bin/bash

# Update package lists
sudo apt-get update

# Install required packages
sudo apt-get install -y python3 python3-venv python3-pip

# Create a virtual environment
python3 -m venv .venv

# Activate the virtual environment
source .venv/bin/activate

# Install dependencies
pip install -r requirements.txt
```

<strong > &#9654;&nbsp; `requirements.txt` の内容</strong>

```txt
# Example dependencies
pandas==1.3.3
numpy==1.21.2
scikit-learn==0.24.2
```

<strong > &#9654;&nbsp; `SETUP.md` の内容</strong>

プロジェクトのセットアップ手順を以下のように記述

1. リポジトリをクローンします。
   ```sh
   git clone [リポジトリのURL]
   cd [リポジトリのディレクトリ]
   ```

2. 環境をセットアップします。
   ```sh
   ./setup_environment.sh
   ```

3. 仮想環境をアクティブにします。
   ```sh
   source .venv/bin/activate
   ```

4. 必要な依存関係がインストールされていることを確認します。
   ```sh
   pip list
   ```


## Test

<strong > &#9654;&nbsp; 実施テスト内容</strong>

- 環境セットアップスクリプトの動作確認
- 依存関係のインストール確認
- ドキュメントの手順に従って環境が正しくセットアップされることを確認

<strong > &#9654;&nbsp; テスト結果</strong>

```sh
% ./setup_environment.sh
# スクリプトの実行結果を記載

% source .venv/bin/activate
% pip list
# 依存関係のリストを記載
```

## Tasks

- [ ] 新しいリポジトリ環境のセットアップスクリプト `setup_environment.sh` を作成
- [ ] 必要な依存関係を `requirements.txt` に追加
- [ ] プロジェクトの初期設定を行うためのドキュメント `SETUP.md` を作成
- [ ] すべてのテストがパスすることを確認

## Additional Notes

- 修正内容に関する追加の情報や注意点があれば記載してください

## Related Issue

- [#Issue番号](リンク)
