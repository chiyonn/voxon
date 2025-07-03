## 🔧 実行手順

### 1. 必要なロールのインストール

以下のコマンドでDockerインストール用のAnsibleロールを取得。

```
ansible-galaxy install geerlingguy.docker -p ansible/roles
```

### 2. Playbookの実行

Docker のインストールと Silverbullet 用の設定を行う 2 つの Playbook が
含まれています。

```
# Docker インストール
ansible-playbook -i inventory/hosts.ini playbooks/install-docker.yaml

# Silverbullet ボリュームのマウント
ansible-playbook -i inventory/hosts.ini playbooks/mount-silverbullet-volume.yaml
```

`mount-silverbullet-volume.yaml` では `nfs_server` や `user_name`
などの変数を必要に応じて変更してください。

