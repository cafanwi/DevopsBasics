
```sh
sudo certbot certonly --manual -d vault.iwordee.com --agree-tos --manual-public-ip-logging-ok --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory --email=macfenty@gmail.com --rsa-key-size 4096
```

***OUTPUT - Use to create a TXT record in Godaddy***

_acme-challenge.vault

E2B1UOX5T5J5XVnKllAvZjqLIUS8MsCQhddGS6X0OgQ

***OUTPUT AFTER hitting Enter***

Successfully received certificate.
Certificate is saved at: /etc/letsencrypt/live/sosotech.io/fullchain.pem
Key is saved at:         /etc/letsencrypt/live/sosotech.io/privkey.pem
This certificate expires on 2024-04-18.
These files will be updated when the certificate renews.

NEXT STEPS:
- This certificate will not be renewed automatically. Autorenewal of --manual certificates requires the use of an authentication hook script (--manual-auth-hook) but one was not provided. To renew this certificate, repeat this same certbot command before the certificate's expiry date.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
If you like Certbot, please consider supporting our work by:
 * Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
 * Donating to EFF:                    https://eff.org/donate-le
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


### NOTE: use Sudo as below, create a secret yaml ```sosotech-io-tls-secret.yaml```

```sh
sudo kubectl create secret tls gateway-certs --cert=/etc/letsencrypt/live/sosotech.io/fullchain.pem --key=/etc/letsencrypt/live/sosotech.io/privkey.pem -n istio-system --dry-run=client -o yaml > sosotech-io-tls-secret.yaml
```

#### create namespace and deploy secret

```sh
kubectl create ns istio-system
kubectl apply -f sosotech-io-tls-secret.yaml
```