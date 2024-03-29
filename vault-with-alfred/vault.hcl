ui = true

storage "file" {
  path = "/opt/vault-data"
}


listener "tcp" {
  tls_disable             = 1
  address                 = "0.0.0.0:8200"
  proxy_protocol_behavior = "use_always"
  tls_cert_file           = "/home/cafanwii/etc/ssl/vault/ca.pem"
  tls_key_file            =  "/home/cafanwii/etc/ssl/vault/priv.pem"
}

disable_cache             = true
disable_mlock             = true
max_lease_ttl             = "1h"
default_lease_ttl         = "1"
api_addr                  = "https://vault.iwordee.com"