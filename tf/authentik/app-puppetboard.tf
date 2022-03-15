module "authentik-app-puppetboard" {
  source = "../modules/authentik_app"

  name     = "Puppetboard"
  internal = "http://puppet1.prod.beryju.org"
  external = "https://puppet-dashboard.infra.beryju.org"
  access_group = [
    data.authentik_group.acl_beryjuorg.id
  ]
}
