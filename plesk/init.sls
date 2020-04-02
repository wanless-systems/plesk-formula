{%- set components = salt['pillar.get']('plesk:components') %}

install_installation_dependencies:
  pkg.installed:
    - name: wget

install_plesk:
  cmd.run:
    - name: |
        /usr/bin/wget autoinstall.plesk.com/plesk-installer -O /root/plesk-installer
        chmod 0700 /root/plesk-installer
        /root/plesk-installer install plesk --preset Recommended --with {{ components | join(' ') }}
    - unless: plesk version &>/dev/null
    - require:
      - pkg: install_installation_dependencies

# Create an alias to enable the root user to login MariaDB
update root alias:
  file.append:
    - name: /root/.bashrc
    - text: alias mysql='mysql -u admin -p`cat /etc/psa/.psa.shadow`'
