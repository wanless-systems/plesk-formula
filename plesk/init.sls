{%- set components = salt['pillar.get']('plesk:components') %}

install_installation_dependencies:
  pkg.installed:
    - name: wget

install_plesk:
  cmd.run:
    - name: |
        sh <(curl https://autoinstall.plesk.com/one-click-installer || wget -O - https://autoinstall.plesk.com/one-click-installer)
    - require:
      - pkg: install_installation_dependencies

# Create an alias to enable the root user to login MariaDB
update root alias:
  file.append:
    - name: /root/.bashrc
    - text: alias mysql='mysql -u admin -p`cat /etc/psa/.psa.shadow`'
