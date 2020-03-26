{% set fqdn = grains['fqdn'] %}
{% set email = salt['pillar.get']('plesk:admin:email', 'user@example.com') %}

retrieve_certificate_for_default_domain:
  cmd.run:
    - name: /usr/sbin/plesk bin extension --exec letsencrypt cli.php -d {{ fqdn }} --letsencrypt-plesk:plesk-secure-panel --email {{ email }}
    - unless: /usr/sbin/plesk bin certificate -l -domain {{ fqdn }} | grep -q "Lets Encrypt"
