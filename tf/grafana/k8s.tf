resource "grafana_folder" "beryjuorg-k8s-preset" {
  title = "BeryJu.org Kube-prom-stack"
}

module "k8s-dashboards" {
  source         = "BeryJu/prom-stack-dashboards/kube"
  version        = "2.0.0"
  grafana_folder = grafana_folder.beryjuorg-k8s-preset.id
}
