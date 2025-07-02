# VOXON

`voxon` は自宅の Proxmox 仮想化基盤の名称です。

## Terraform リポジトリ構成

```
infra/
├── terraform/
│   ├── main.tf               # メイン設定
│   ├── variables.tf          # 変数定義
│   ├── terraform.tfvars      # 変数値 (gitignore 推奨)
│   ├── outputs.tf            # 出力定義 (IP など)
│   └── modules/              # モジュール集
│       └── vm_template/      # 単一 VM 用モジュール
├── ansible/
│   ├── inventory/            # インベントリ
│   ├── playbooks/            # プレイブック
│   └── roles/                # ロール
└── README.md                 # 本ファイル
```

## テンプレート作成手順

1. **Ubuntu 24.04 Server のインストール**

   * ISO を使って通常の Server インストールを実施

2. **必須パッケージのインストール**

   ```bash
   sudo apt update
   sudo apt install -y qemu-guest-agent cloud-init net-tools
   ```

3. **初期クリーンアップ**

   * cloud-init の状態をリセット

     ```bash
     sudo cloud-init clean
     ```
   * 古い SSH ホストキーの削除

     ```bash
     sudo rm -f /etc/ssh/ssh_host_*
     ```
   * DHCP リース情報の削除

     ```bash
     sudo rm -f /var/lib/dhcp/*
     ```
   * コマンド履歴のクリア（任意）

     ```bash
     history -c
     ```

4. **テンプレート化**

   * ゲストをシャットダウンし、Proxmox 上でテンプレート化

     ```bash
     sudo shutdown now
     qm template 900
     ```

---

この手順により、cloud-init 対応の Ubuntu テンプレートが作成できます。
