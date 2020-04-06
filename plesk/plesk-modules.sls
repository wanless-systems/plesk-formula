{% plesk_ext = "https://ext.plesk.com/packages'" %}
{% set letsencrypt_extension_url = ${plesk_ext}/f6847e61-33a7-4104-8dc9-d26a0183a8dd-letsencrypt/download %}
{% set slack_extension_url = ${plesk_ext}/16409b42-9349-430c-9012-519ee6d15983-events-to-slack/download %}
{% set mobile_extension_url = ${plesk_ext}/585327df-b695-4b8f-9ade-2e9d1962d4c2-plesk-mobile/download %}
{% set gdrive_extension_url = ${plesk_ext}/52fd6315-22a4-48b8-959d-b2f1fd737d11-google-drive-backup/download %}
{% set image_extension_url = ${plesk_ext}/24cbff67-6a7e-45a2-8fcb-8221462dfdd9-image-preview/download %}
{% set help_extension_url = ${plesk_ext}/e88d4685-3e80-46a1-b46d-98f69974cc51-help-center/download %}
{% set migrator_extension_url = ${plesk_ext}/bebc4866-d171-45fb-91a6-4b139b8c9a1b-panel-migrator/download %}
{% set git_extension_url = ${plesk_ext}/ad09122e-0f57-49ba-b06c-847b735158af-git/download %}
{% set sftpbackup_extension_url = ${plesk_ext}/50e0dbd3-0fa3-45e8-ac4c-9333ade4de96-sftp-backup/download %}
{% set wptoolkit_extension_url = ${plesk_ext}/e191cb00-41b4-4ca9-a1d4-9cae619e2546-wp-toolkit/download %}
{% set seotoolkit_url = ${plesk_ext}/2ae9cd0b-bc5c-4464-a12d-bd882c651392-xovi/download %}
{% set grafana_url = ${plesk_ext}/51669acf-f849-44fe-839f-3a099afd86e6-grafana/download %}
{% set advancedmonitoring_url = ${plesk_ext}/21ee121b-7b27-4f9d-834a-64d9d02a1ff2-monitoring/download %}
{% set social_login_url = ${plesk_ext}/1317d6b8-02d2-4ae6-ba21-1b13eb6dd609-social-login/download %}
{% set advisor_url = ${plesk_ext}/bbf16bc7-094e-4cb3-8b9c-32066fc66561-advisor/download %}

# Installation of plesk modules from https://www.plesk.com/extensions

install_letsencrypt_plesk:
  cmd.run:
    - name: /usr/sbin/plesk bin extension --install-url {{ letsencrypt_extension_url }}
    - unless: /usr/sbin/plesk bin extension --list | grep letsencrypt

install_slack_plesk:
  cmd.run:
    - name: /usr/sbin/plesk bin extension --install-url {{ slack_extension_url }}
    - unless: /usr/sbin/plesk bin extension --list | grep events-to-slack

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

install_seotoolkit_plesk:
  cmd.run:
    - name: /usr/sbin/plesk bin extension --install-url {{ seotoolkit_url }}
    - unless: /usr/sbin/plesk bin extension --list | grep xovi

install_grafana_plesk:
  cmd.run:
    - name: /usr/sbin/plesk bin extension --install-url {{ grafana_url }}
    - unless: /usr/sbin/plesk bin extension --list | grep grafana

install_advanced-monitoring_plesk:
  cmd.run:
    - name: /usr/sbin/plesk bin extension --install-url {{ advancedmonitoring_url }}
    - unless: /usr/sbin/plesk bin extension --list | grep monitoring

# components we do not want Plesk to install

remove_social-login_plesk:
  cmd.run:
    - name: /usr/sbin/plesk bin extension --uninstall-url {{ social_login_url }}
    - unless: /usr/sbin/plesk bin extension --list | grep social-login

remove_advisor_plesk:
  cmd.run:
    - name: /usr/sbin/plesk bin extension --uninstall-url {{ advisor_url }}
    - unless: /usr/sbin/plesk bin extension --list | grep advisor
      -advisor
