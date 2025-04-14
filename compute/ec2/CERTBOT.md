# Setting Up SSL with Certbot and Nginx

## Documentation

This guide provides step-by-step instructions for setting up HTTPS using Let's Encrypt certificates with Nginx on Amazon Linux 3 using open standard Automatic Certificate Management Environment (ACME). Here is the RFC specification for ACME https://datatracker.ietf.org/doc/html/rfc8555.

## Prerequisites

- EC2 instance with Amazon Linux
- Domain name pointing to your server's IP address ("Automatic" Renewal requires instance IP is publicy available)
- Nginx installed and running
- Port 80 and 443 open in security group

## Install Certbot

```bash
# Install certbot and the nginx plugin
sudo yum install -y certbot
```

## Configure Nginx for Domain

1. Create a configuration file for your domain:

```bash
sudo nano /etc/nginx/conf.d/example.com.conf
```

2. Add basic HTTP configuration with Let's Encrypt validation support:

```nginx
server {
    listen 80;
    server_name example.com;

    # Let's Encrypt verification location
    # https://letsencrypt.org/docs/challenge-types/
    location /.well-known/acme-challenge/ {
        root /var/www/letsencrypt;
        allow all;
    }

    # Your application configuration
    location / {
        # For now just return a simple page
        return 200 "Site is being configured";
    }
}
```

3. Test and reload Nginx:

```bash
sudo nginx -t
sudo systemctl reload nginx
```

## Set Up Let's Encrypt Directory

```bash
# Create directory for Let's Encrypt challenges
sudo mkdir -p /var/www/letsencrypt/.well-known/acme-challenge

# Set proper permissions
sudo chown -R nginx:nginx /var/www/letsencrypt
```

## Obtain SSL Certificate

```bash
sudo certbot certonly --webroot -w /var/www/letsencrypt -d example.com
```

If successful, certificates will be stored in `/etc/letsencrypt/live/example.com/`.

## Configure Nginx for HTTPS

1. Update your Nginx configuration:

```bash
sudo nano /etc/nginx/conf.d/example.com.conf
```

2. Replace with HTTP + HTTPS configuration:

```nginx
# HTTP - Redirect to HTTPS
server {
    listen 80;
    server_name example.com;

    # Keep this for certificate renewals
    location /.well-known/acme-challenge/ {
        root /var/www/letsencrypt;
        allow all;
    }

    # Redirect all other traffic to HTTPS
    location / {
        return 301 https://$host$request_uri;
    }
}

# HTTPS server
server {
    listen 443 ssl;
    server_name example.com;

    # SSL certificates
    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;

    # SSL configuration
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers on;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 10m;

    # Your application configuration
    location / {
        # Replace with your actual application
        # For example, to proxy to a Node.js app:
        # proxy_pass http://localhost:3000;
        # proxy_set_header Host $host;
        # proxy_set_header X-Real-IP $remote_addr;
        
        # For now just return a placeholder
        return 200 "HTTPS is configured properly!";
    }
}
```

3. Test and reload Nginx:

```bash
sudo nginx -t
sudo systemctl reload nginx
```

## Verify Automatic Renewal

Let's Encrypt certificates are valid for 90 days. Certbot sets up automatic renewal. 

1. Verify certbot timer is active:

```bash
sudo systemctl list-timers | grep certbot
```

2. Test certificate renewal (dry run):

```bash
sudo certbot renew --dry-run
```

## Some Considerations 

- **Connection timeouts during verification**: Check security groups, network ACLs, and DNS settings
- **Permission issues**: Ensure nginx user can access the /var/www/letsencrypt directory
- **Certificate not found**: Check paths in Nginx configuration
- **502 Bad Gateway**: Backend application not running or misconfigured