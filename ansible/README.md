## 🔧 実行手順

### 1. 必要なロールのインストール

Docker 環境を構築するために [geerlingguy.docker](https://galaxy.ansible.com/geerlingguy/docker) ロールを利用します。

```bash
ansible-galaxy install geerlingguy.docker -p ansible/roles
```

### 2. Playbook の実行

各ホストのセットアップは `playbooks/` 配下の Playbook から実行します。

```bash
# Docker のインストール
ansible-playbook -i inventory/hosts.ini playbooks/install-docker.yaml

# fappom ホストのセットアップ
ansible-playbook -i inventory/hosts.ini playbooks/setup-fappom.yaml
```

必要に応じて `inventory/hosts.ini` 内の変数や Playbook の変数を調整してください。
