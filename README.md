# VOXON

voxonは自宅のProxmox仮想化基盤の名前

## 構成
```
infra/
├── terraform/
│   ├── main.tf               # 本体
│   ├── variables.tf          # 変数定義
│   ├── terraform.tfvars      # 変数の値（gitignore推奨）
│   ├── outputs.tf            # 出力定義（IPアドレスとか）
│   └── modules/              # 使い回しテンプレの保管所
│       └── vm_template/      # 単一VM構築用moduleとか
├── ansible/
│   ├── inventory/            # インベントリファイル
│   ├── playbooks/            # プレイブック一式
│   └── roles/                # Ansibleロール（構成再利用）
└── README.md                 # 未来の自分へのメモ
```
