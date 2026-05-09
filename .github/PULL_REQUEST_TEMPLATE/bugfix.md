## Description

今回のPRにおいて，[#Issue番号](リンク)に従いバグ修正を実施．変更内容は以下：

- バグの原因となっていた問題を特定し、修正し。
- 影響を受けるモジュールや関数をリファクタリング
- 必要に応じて、新しいテストケースを追加

## Changes

- **Fixed Bug**:
  - `module_name.py`: バグの原因となっていたコードを修正
- **Refactored Code**:
  - `module_name.py`: コードの可読性と保守性を向上させるためにリファクタリングを実施
- **Added Tests**:
  - `test_module_name.py`: 修正したバグに対するテストケースを追加

## Example

<strong > &#9654;&nbsp; `module_name.py` の変更</strong>

**Before:**

```python
# In module_name.py
def buggy_function():
    # バグの原因となっていたコード
    pass
```

**After:**

```python
# In module_name.py
def fixed_function():
    # 修正後のコード
    pass
```

## Pytest

<strong > &#9654;&nbsp; 実施テスト内容</strong>

修正したバグに対するテストケースを以下の観点で追加し，テストを実行

- hogehoge
- fugefuge
- pogepoge

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

- [ ] バグの原因を特定し，修正
- [ ] 影響を受けるモジュールや関数をリファクタリング
- [ ] 必要に応じて，新しいテストケースを追加
- [ ] すべてのテストがパスすることを確認

## Additional Notes

- 修正内容に関する追加の情報や注意点があれば記載してください。

## Related Issue

- [#Issue番号](リンク)
