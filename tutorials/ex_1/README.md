Пример установки minikube и использования helm для разворачивания. 

#### План выполнения: 
#### 1. развернуть minikube на Linux (Ubuntu 22.04)
```bash 
# для разворачивания на MacBook
1.1 подготовка к установке
sudo apt update && sudo apt upgrade -y

1.2 
# установка docker https://docs.docker.com/engine/install/ubuntu/
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/ docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

1.3 
# установка kubectl https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install kubectl /usr/local/bin/kubectl && rm kubectl
kubectl version

1.4 # установка minikube https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
minikube version

1.5 
# установка helm https://helm.sh/docs/intro/install/
sudo apt-get install curl gpg apt-transport-https --yes
curl -fsSL https://packages.buildkite.com/helm-linux/helm-debian/gpgkey | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/helm.gpg] https://packages.buildkite.com/helm-linux/helm-debian/any/ any main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
helm version
```

#### 2. запуск minikube + docker deamon 

```bash
# запуск docker deamon
sudo systemctl restart docker.service
sudo systemctl status docker.service
```


```bash 
# запуск minikube
minikube start \
  --driver=docker \
  --memory=6192 \
  --cpus=4 \
  --disk-size=20g \
  --cni=bridge

minikube status
kubectl get nodes
```

#### 3. установим dashboard + смотрим deployment для dashboard 
```bash 
minikube addons enable dashboard
kubectl get pods -n kubernetes-dashboard
minikube dashboard
```

#### 4.создадим приложение на Fast API и логином/паролем для теста

#### 5. развернем локальное хранилище docker образов

#### 5 соберем Docker образ приложения на Fast API в локальное хранилище Docker registry 

#### 6. Создадим deployment + service для приложения Запустим приложение на Fast API в minikube

#### 7. Создадим helm chart для разворачивания приложения Fast API

#### 8. Создадим deployment + service для nginx и развернем

#### 9. Настроим Egress

#### 9. Добавим сертификаты 

#### 10. Настроить мониторинг под с помощью Grafana + Prometheus

#### 11. Настроим и опишем health checks (liveness и readiness)

#### 12. Развернем opensearch в minikube

#### 13. Настроим Istio Servic Mesh

#### 14. Поднимем HashiCorp и перенесем конфиги и секреты туда 

#### 15. Настроим снятие логов с помощью Fluentd/Fluent Bit (агенты на нодах).

### для каждого шага примеры и конфиги 