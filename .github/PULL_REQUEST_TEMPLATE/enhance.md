## Description

今回のPRにおいて，[#Issue番号](リンク)に従い統計推定クラスの機能強化を実施．変更内容は以下：

- 新しいメソッド `calculate_variance` を `StatisticsEstimator` クラスに追加
- 既存のメソッド `calculate_mean` のパフォーマンスを改善
- クラス全体に型ヒントを追加し，コードの可読性と保守性を向上

## Changes

- **New Method**:
  - `StatisticsEstimator.calculate_variance`: 分散を計算する新しいメソッドを追加
- **Enhanced Method**:
  - `StatisticsEstimator.calculate_mean`: パフォーマンスを改善し、計算速度を向上
- **Type Hints**:
  - `StatisticsEstimator`: クラス全体に型ヒントを追加

## Example

<strong > &#9654;&nbsp; `StatisticsEstimator` クラスの変更</strong>

**Before:**

```python
# In statistics_estimator.py
class StatisticsEstimator:
    def calculate_mean(self, data):
        return sum(data) / len(data)
```

**After:**

```python
# In statistics_estimator.py
from typing import List

class StatisticsEstimator:
    def calculate_mean(self, data: List[float]) -> float:
        return sum(data) / len(data)

    def calculate_variance(self, data: List[float]) -> float:
        mean = self.calculate_mean(data)
        return sum((x - mean) ** 2 for x in data) / len(data)
```

## Pytest

<strong > &#9654;&nbsp; 実施テスト内容</strong>

- `calculate_mean` メソッドのパフォーマンステストを実施
- `calculate_variance` メソッドのユニットテストを追加

<strong > &#9654;&nbsp; Pytest Result</strong>

```sh
% pytest
======================= test session starts =======================
platform linux -- Python 3.11.8, pytest-8.3.2, pluggy-1.5.0
rootdir: /home/pupupuland/Desktop/spitz/rocknroll
configfile: file:///home/pupupuland/Desktop/spitz/rocknroll/pyproject.toml
collected 8 items                                                 

synth_coremodel/tests/statistics/test_statistics_estimator.py ...  [ 75%]
synth_coremodel/tests/statistics/test_performance.py ...           [100%]

======================== 8 passed in 0.85s ========================
```

## Tasks

- [ ] 新しいメソッド `calculate_variance` を `StatisticsEstimator` クラスに追加
- [ ] 既存のメソッド `calculate_mean` のパフォーマンスを改善
- [ ] クラス全体に型ヒントを追加
- [ ] すべてのテストがパスすることを確認

## Additional Notes

- 修正内容に関する追加の情報や注意点があれば記載してください

## Related Issue

- [#Issue番号](リンク)
