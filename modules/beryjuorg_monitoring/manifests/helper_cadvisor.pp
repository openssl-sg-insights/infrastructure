class beryjuorg_monitoring::helper_cadvisor {

  cron { 'cadvisor_export':
    command => 'curl -s "http://localhost:9101/metrics" > /var/lib/prometheus/node-exporter/docker.prom',
    user    => 'root',
    hour    => '*',
    minute  => '*',
  }

}