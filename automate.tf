resource "kubernetes_ingress" "example_ingress" {
  metadata {
    name = "example-ingress"
  }

  spec {
    backend {
      service_name = "blue-svc"
      service_port = 8080
    }

    rule {
      http {
        path {
          backend {
            service_name = "blue-svc"
            service_port = 8080
          }

          path = "/blue"
        }

        path {
          backend {
            service_name = "green-svc"
            service_port = 8080
          }

          path = "/green"
        }
      }
    }
  }
}

resource "kubernetes_service1" "hello_world_deployment" {
  metadata {
    name = "myapp-1"
  }
  spec {
    selector = {
      app = blueapp
    }
    session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 80
    }

    type = "NodePort"
  }
}

resource "kubernetes_service" "hello_world_deployment" {
  metadata {
    name = "myapp-2"
  }
  spec {
    selector = {
      app = greenapp
    }
    session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 80
    }

    type = "NodePort"
  }
}



resource "kubernetes_deployment" "hello_world_deployment1" {
  metadata {
    name = "kubernetes-example-deployment"
    labels = {
      app = "blueapp"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "blueapp"
      }
    }
    template {
      metadata {
        labels = {
          app = "blueapp"
        }
      }
      spec {
        container {
          image = "hashicorp/http-echo"
          args = "I am Blue"
          name  = "blueapp"
        }
      }
    }
  }
}

resource "kubernetes_deployment" "hello_world_deployment" {
  metadata {
    name = "kubernetes-example-deployment"
    labels = {
      app = "greenapp"
    }
  }

  spec {
    replicas = 3
    selector {
      match_labels = {
        app = "greenapp"
      }
    }
    template {
      metadata {
        labels = {
          app = "greenapp"
        }
      }
      spec {
        container {
          image = "hashicorp/http-echo"
          args = "I am Green"
          name  = "greenapp"
        }
      }
    }
  }
}