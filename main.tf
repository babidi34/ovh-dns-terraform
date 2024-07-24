# main.tf

locals {
  dns_records = flatten([
    for zone, records in var.dns_zones : [
      for record in records : {
        zone      = zone
        fieldtype = record.fieldtype
        subdomain = record.subdomain
        ttl       = record.ttl
        target    = record.target
      }
    ]
  ])
}

resource "ovh_domain_zone_record" "dns_records" {
  for_each = { for idx, record in local.dns_records : "${record.zone}-${record.subdomain}-${record.fieldtype}" => record }
  zone      = each.value.zone
  fieldtype = each.value.fieldtype
  subdomain = each.value.subdomain
  ttl       = each.value.ttl
  target    = each.value.target
}