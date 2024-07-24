dns_zones = {
  "mon-domaine.fr" = [
    {
      fieldtype = "A"
      subdomain = "test"
      ttl       = 0
      target    = "123.45.67.89"
    },
    {
      fieldtype = "CNAME"
      subdomain = "petit-sous-domaine"
      ttl       = 3600
      target    = "machin-truc.com"
    }
  ],
  "un-autre-domaine.com" = [
    {
      fieldtype = "TXT"
      subdomain = "_dmarc"
      ttl       = 60
      target    = "v=DMARC1; p=none; rua=mailto:postmaster@un-autre-domaine.com"
    }
  ]
}