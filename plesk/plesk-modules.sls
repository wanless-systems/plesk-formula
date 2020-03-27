{% set fqdn = grains['fqdn'] %}
{% set email = salt['pillar.get']('plesk:admin:email', 'user@example.com') %}
{% set gdrive_extension_url = 'https://ext.plesk.com/packages/52fd6315-22a4-48b8-959d-b2f1fd737d11-google-drive-backup/download' %}
{% set image_extension_url = 'https://ext.plesk.com/packages/24cbff67-6a7e-45a2-8fcb-8221462dfdd9-image-preview/download?1.2-4' %}
{% set help_extension_url = 'https://ext.plesk.com/packages/e88d4685-3e80-46a1-b46d-98f69974cc51-help-center/download?1.9.0-3' %}
{% set migrator_extension_url = 'https://ext.plesk.com/packages/bebc4866-d171-45fb-91a6-4b139b8c9a1b-panel-migrator/download?2.18.0-897' %}
{% set git_extension_url = 'https://ext.plesk.com/packages/ad09122e-0f57-49ba-b06c-847b735158af-git/download?1.1.3-245' %}
{% set sftpbackup_extension_url = 'https://ext.plesk.com/packages/50e0dbd3-0fa3-45e8-ac4c-9333ade4de96-sftp-backup/download?1.1.0-14' %}
{% set wptoolkit_extension_url = 'https://ext.plesk.com/packages/e191cb00-41b4-4ca9-a1d4-9cae619e2546-wp-toolkit/download?4.5.1-2962' %}
{% set mobile_extension_url = 'https://ext.plesk.com/packages/585327df-b695-4b8f-9ade-2e9d1962d4c2-plesk-mobile/download?1.13-19' %}
{% set letsencrypt_extension_url = 'https://ext.plesk.com/packages/f6847e61-33a7-4104-8dc9-d26a0183a8dd-letsencrypt/download' %}

# Installation of plesk modules from https://www.plesk.com/extensions

install_letsencrypt_plesk:
  cmd.run:
    - name: /usr/sbin/plesk bin extension --install-url {{ letsencrypt_extension_url }}
    - unless: /usr/sbin/plesk bin extension --list | grep -q letsencrypt

install_mobile_plesk:
  cmd.run:
    - name: /usr/sbin/plesk bin extension --install-url {{ mobile_extension_url }}
    - unless: /usr/sbin/plesk bin extension --list | grep plesk-mobile


install_google-drive-backup_plesk:
  cmd.run:
    - name: /usr/sbin/plesk bin extension --install-url {{ gdrive_extension_url }}
    - unless: /usr/sbin/plesk bin extension --list | grep google-drive-backup

install_image-preview_plesk:
  cmd.run:
    - name: /usr/sbin/plesk bin extension --install-url {{ image_extension_url }}
    - unless: /usr/sbin/plesk bin extension --list | grep image-preview

install_help-center_plesk:
  cmd.run:
    - name: /usr/sbin/plesk bin extension --install-url {{ help_extension_url }}
    - unless: /usr/sbin/plesk bin extension --list | grep help-center

install_panel-migrator_plesk:
  cmd.run:
    - name: /usr/sbin/plesk bin extension --install-url {{ migrator_extension_url }}
    - unless: /usr/sbin/plesk bin extension --list | grep panel-migrator

install_git_plesk:
  cmd.run:
    - name: /usr/sbin/plesk bin extension --install-url {{ git_extension_url }}
    - unless: /usr/sbin/plesk bin extension --list | grep git

install_sftp-backup_plesk:
  cmd.run:
    - name: /usr/sbin/plesk bin extension --install-url {{ sftpbackup_extension_url }}
    - unless: /usr/sbin/plesk bin extension --list | grep sftp-backup

install_wp-toolkit_plesk:
  cmd.run:
    - name: /usr/sbin/plesk bin extension --install-url {{ wptoolkit_extension_url }}
    - unless: /usr/sbin/plesk bin extension --list | grep wp-toolkit
