resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  version          = "v1.13.0"
  namespace        = "cert-manager"
  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }
}

resource "kubernetes_manifest" "cluster_issuer" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "ClusterIssuer"
    metadata = {
      name = "letsencrypt-prod"
    }
    spec = {
      acme = {
        email  = var.email
        server = "https://acme-v02.api.letsencrypt.org/directory"
        privateKeySecretRef = {
          name = "letsencrypt-prod"
        }
        solvers = [
          {
            http01 = {
              ingress = {
                ingressClassName = "azure-application-gateway"
                ingressTemplate = {
                  metadata = {
                    annotations = {
                      "appgw.ingress.kubernetes.io/health-probe-status-codes" = "200-399, 404"
                    }
                  }
                }
              }
            }
          }
        ]
      }
    }
  }

  depends_on = [helm_release.cert_manager]
}
resource "kubernetes_namespace" "env_ns" {
  metadata {
    name = var.environment
  }
}