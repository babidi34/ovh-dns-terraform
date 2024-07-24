variable "dns_zones" {
  description = "Liste des zones DNS et leurs enregistrements"
  type = map(list(object({
    fieldtype = string
    subdomain = string
    ttl       = number
    target    = string
  })))
  default = {}
}