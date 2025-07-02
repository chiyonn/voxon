## 🔧 実行手順

### 1. 必要なロールのインストール

以下のコマンドでDockerインストール用のAnsibleロールを取得。

```
ansible-galaxy install geerlingguy.docker -p ansible/roles
```

### 2. Playbookの実行

```
ansible-playbook -i ansible/inventory/hosts.ini ansible/playbooks/install-docker.yaml
```

