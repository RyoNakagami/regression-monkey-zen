# Branching & Release Promotion Workflow

このドキュメントは本リポジトリにおける `develop` → `release/v*.*.x` → `main` のフローと，それを支えるGitHub Actions workflowをまとめたもの

## 1. ブランチモデル

| Branch | 役割 |
| --- | --- |
| `develop` | 開発等号ブランチ |
| `release/v[0-9]+.[0-9]+.x` | リリース候補を凍結する経過ブランチ（例: `release/v0.2.x`） |
| `main` | 公開・配布対象．常に最新リリースを表す |

フローは一方向：

```ini
feature → develop → PR → release/vX.Y.x → automatically kick workflow → main
```

## 2. 通常の開発からリリースまで

### 2.1 develop → release/vX.Y.x

ユーザーが PR を作成してマージする．

```bash
gh pr create \
  --base release/v0.2.x \
  --head develop \
  --title "..." \
  --body "..."
```

レビューが通った段階でマージする．マージ方式は squash でも merge でもよいが，本リポジトリ
ではこれまで `--merge`（squash）としている

### 2.2 release/vX.Y.x → main （自動）

`release/v[0-9]+.[0-9]+.x` への push をトリガーとして，
[.github/workflows/release_to_main.yml](../.github/workflows/release_to_main.yml)
が以下を実行する：

1. 該当 release ブランチが `main` よりも進んでいるか確認．進んでいなければ no-op で終了．
2. `release/* → main` の PR を新規作成（既存があれば再利用）．
3. `gh pr merge --auto --merge` で auto-merge を有効化．required checks が無い場合は
   即時マージにフォールバックする．

- 人手の操作は不要
- release ブランチへ何かが入った瞬間，`main` へのmergeが走る．

## 3. 必要なリポジトリ設定

このworkflowが動作するためには，**Settings → Actions → General → Workflow permissions**
にて以下が有効であることが必要：

- ☑ **Allow GitHub Actions to create and approve pull requests**

CLI で確認・設定する場合：

```bash
# 確認
gh api /repos/<owner>/<repo>/actions/permissions/workflow

# 有効化
gh api -X PUT /repos/<owner>/<repo>/actions/permissions/workflow \
  -F default_workflow_permissions='read' \
  -F can_approve_pull_request_reviews=true
```

期待される値：

```json
{
  "default_workflow_permissions": "read",
  "can_approve_pull_request_reviews": true
}
```

> **注意**: `can_approve_pull_request_reviews` は名前に反して PR の **作成** と **承認** の
> 両方を制御する単一フラグである．有効化すると workflow が PR を承認することも可能になる
> ため，`gh pr review --approve` を実行する workflow を追加する場合は別途レビュー要件で
> 自己承認を防ぐこと．

## 4. 失敗したときの対応

### 4.1 "GitHub Actions is not permitted to create or approve pull requests"

§3 の設定が無効になっている．有効化したのち，失敗した run を rerun する：

```bash
gh run list --workflow=release_to_main.yml --limit 3
gh run rerun <run-id>
```

### 4.2 release ブランチが main より遅れている / コンフリクト

workflow は no-op で終了するか PR 作成で失敗する．`main` を release ブランチに取り込む
（あるいは hotfix を release ブランチへ反映する）ことで解消する．

### 4.3 main 側に required checks を後から追加した場合

auto-merge は必要なチェックが緑になるまで待機する．workflow 内のフォールバック
（`gh pr merge --merge`）は走らない．運用上は何もしなくてよい．

## 5. 関連ファイル

- [.github/workflows/release_to_main.yml](../.github/workflows/release_to_main.yml) — 本workflow
- [.github/workflows/label_generator.yml](../.github/workflows/label_generator.yml) — ラベル同期 workflow（独立）
- [.github/repository_metadata/label_master.yml](../.github/repository_metadata/label_master.yml) — ラベル定義の source of truth
