## Description

今回のPRにおいて，[#33](https://github.com/spitz-jp/rocknroll/issues/33)に従いxxxを実施．変更内容は以下：

- aaaaに対応するため，新しいモジュール `bbbb.py` を作成
- ccccを目的に `BalancedPanelError` クラスに対して，ddddという変更を実施．
- `CheckRawData` クラスに型ヒントとエラーハンドリングを追加．

## Changes

- **New Module**:
  - `exceptions.py`: dddd.
  - `logger.py`: eeeeを目的
- **Moved Exception**:
  - `BalancedPanelError` moved to `exceptions.py` from `general.py`
- **Enhanced Class**
  - `CheckRawData` of `hogehoge.py`: ffffを実装
- **Deleted Functions**
  - `create_pokemon` of `foofoo.py`: hofehofe

## Example

<strong > &#9654;&nbsp; `exceptions.py` の変更</strong>

**Before:**

```python
# In check_dataset_format.py
class BalancedPanelError(Exception):
    def __init__(self, msg):
        self.msg = msg
        print("The above time_index list could cause the problem")
```

**After:**

```python
# In exceptions.py
class BalancedPanelError(Exception):
    def __init__(self, duplicated_entries):
        self.duplicated_entries = duplicated_entries
        super().__init__(f"Duplicated or missing (entity, time) units: {duplicated_entries}")

# In check_dataset_format.py
from exceptions import BalancedPanelError
```

## Pytest

<strong > &#9654;&nbsp; 実施テスト内容</strong>

- hogehogehoge

<strong > &#9654;&nbsp; Pytest Result</strong>

```sh
% pytest
======================= test session starts =======================
platform linux -- Python 3.11.8, pytest-8.3.2, pluggy-1.5.0
rootdir: /home/pupupuland/Desktop/spitz/rocknroll
configfile: file:///home/pupupuland/Desktop/spitz/rocknroll/pyproject.toml
collected 6 items                                                 

synth_coremodel/tests/errors/test_issue-25.py ...           [ 50%]
file:///home/pupupuland/Desktop/spitz/rocknroll/synth_coremodel/tests/fit/test_issue-22.py .                [ 66%]
file:///home/pupupuland/Desktop/spitz/rocknroll/synth_coremodel/tests/preprocess/test_issue-15.py ..        [100%]

======================== 6 passed in 0.69s ========================
```

## Tasks

- [ ] ISSUEをベースにPRのスコープを確定
- [ ] 影響を受けるモジュールや関数をリファクタリング
- [ ] 必要に応じて，新しいテストケースを追加
- [ ] すべてのテストがパスすることを確認

## Additional Notes

- 修正内容に関する追加の情報や注意点があれば記載してください

## Related Issue

- [#Issue番号](リンク)
