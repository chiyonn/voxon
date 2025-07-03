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

## 変数

`terraform.tfvars` に以下の値を設定してから適用します。

- `base_template_id` – クローン元テンプレートのID
- `ip_subnet` – VMに割り当てるサブネット(デフォルト `192.168.40`)
- `vm_user` – VM内で作成するユーザー名
