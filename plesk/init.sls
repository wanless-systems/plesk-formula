{%- set components = salt['pillar.get']('plesk:components') %}

wget:
  pkg.installed

install_plesk:
  cmd.run:
    - name: |
        /usr/bin/wget autoinstall.plesk.com/plesk-installer -O /root/plesk-installer
        chmod 0700 /root/plesk-installer
        /root/plesk-installer --select-product-id plesk --select-release-latest --install-component {{ components | join(' --install-component ') }}
    - unless: plesk version &>/dev/null

# Create an alias to enable the root user to login MariaDB
update root alias:
  file.append:
    - name: /root/.bashrc
    - text: alias mysql='mysql -u admin -p`cat /etc/psa/.psa.shadow`'
