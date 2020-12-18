# Test canary deployment with Nginx

If you use a local kubernetes stack hosted on Windows Docker CE, add the following entry to your etc/hosts file :

127.0.0.1 apache.nginx.com

The Nginx canary feature is based on ingress annotations. Basically you have to deploy your canary release in a new namespace but with the same ingress definition. The only new item will be the annotation specifying that the ingress entry is used for a canary release.

```yaml
    nginx.ingress.kubernetes.io/canary: "true"
    nginx.ingress.kubernetes.io/canary-weight: "80"
```