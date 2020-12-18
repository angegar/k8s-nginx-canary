nginx:
	helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
	helm upgrade -f ./values-nginx.yaml  \
			--install --create-namespace --namespace nginx \
			--atomic \
			k8s-nginx ingress-nginx/ingress-nginx

apache: 
	kubectl create ns apache || echo 'NS already exist'
	kubectl apply --namespace apache -f apache-configmap.yaml
	helm repo add bitnami https://charts.bitnami.com/bitnami
	helm upgrade --namespace apache --create-namespace \
		--install \
		--atomic \
		-f values-apache.yaml \
		apache bitnami/apache

apache-canary:
	kubectl create ns apache-canary || echo 'NS already exist'
	kubectl apply --namespace apache-canary -f apache-canary-configmap.yaml
	helm repo add bitnami https://charts.bitnami.com/bitnami
	helm upgrade --namespace apache-canary --create-namespace \
		--install \
		--atomic \
		-f values-apache-canary.yaml \
		apache bitnami/apache