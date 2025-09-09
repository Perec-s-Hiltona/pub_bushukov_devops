Пример установка minikube и использования helm для разворачивания. 

#### План выполнения: 
#### 1. развернуть minikube 
```bash 
# для разворачивания на MacBook
1.1 установить brew 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew --version

1.2 # установка docker 
brew install docker
docker --version

1.3 # установка kubectl
brew install kubectl
kubectl version --client

1.4 # установка minikube
brew install minikube
minikube version

1.5 # установка helm
brew install helm
helm version
```

#### 2. запуск minikube 
```bash 
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
deployment в ...


#### 4. создадим приложение на Fast API и логином/паролем для теста

#### 5 соберем Docker образ приложения на Flask 

#### 6. Создадим deployment + service для приложения Запустим приложение на Flask в minikube 

#### 7. Создадим deployment + service для nginx и развернем

#### 8. Добавим сертификаты 

#### 9. Разберемся  
