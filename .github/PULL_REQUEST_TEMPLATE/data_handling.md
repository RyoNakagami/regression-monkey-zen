## Description

今回のPRにおいて，[#Issue番号](リンク)に従いデータエンジニアリングタスクを実施．変更内容は以下：

- 新しいデータパイプライン `data_pipeline.py` を作成
- 既存のETLプロセスをリファクタリングし、パフォーマンスを改善
- データ検証ロジックを追加し、データ品質を向上

## Changes

- **New Pipeline**:
  - `data_pipeline.py`: 新しいデータパイプラインを作成し，データの抽出、変換、ロードを実装
- **Refactored ETL**:
  - `etl_process.py`: 既存のETLプロセスをリファクタリングし，パフォーマンスを改善
- **Data Validation**:
  - `data_validation.py`: データ検証ロジックを追加し，データ品質を向上

## Example

<strong > &#9654;&nbsp; `data_pipeline.py` の変更</strong>

**Before:**

```python
# In etl_process.py
def extract_data():
    # データ抽出ロジック
    pass

def transform_data(data):
    # データ変換ロジック
    pass

def load_data(data):
    # データロードロジック
    pass
```

**After:**

```python
# In data_pipeline.py
from typing import List

class DataPipeline:
    def extract_data(self) -> List[dict]:
        # データ抽出ロジック
        pass

    def transform_data(self, data: List[dict]) -> List[dict]:
        # データ変換ロジック
        pass

    def load_data(self, data: List[dict]) -> None:
        # データロードロジック
        pass
```

## Test

<strong > &#9654;&nbsp; 実施テスト内容</strong>

- 新しいデータパイプラインのユニットテストを追加
- 既存のETLプロセスのパフォーマンステストを実施

<strong > &#9654;&nbsp; Pytest Result</strong>

```sh
% pytest
======================= test session starts =======================
platform linux -- Python 3.11.8, pytest-8.3.2, pluggy-1.5.0
rootdir: /home/pupupuland/Desktop/spitz/rocknroll
configfile: file:///home/pupupuland/Desktop/spitz/rocknroll/pyproject.toml
collected 10 items                                                 

synth_coremodel/tests/data_pipeline/test_data_pipeline.py ...  [ 70%]
synth_coremodel/tests/etl_process/test_etl_process.py ...      [100%]

======================== 10 passed in 1.02s ========================
```

## Tasks

- [ ] 新しいデータパイプライン `data_pipeline.py` を作成
- [ ] 既存のETLプロセスをリファクタリングし、パフォーマンスを改善
- [ ] データ検証ロジックを追加
- [ ] すべてのテストがパスすることを確認

## Additional Notes

- 修正内容に関する追加の情報や注意点があれば記載してください

## Related Issue

- [#Issue番号](リンク)
