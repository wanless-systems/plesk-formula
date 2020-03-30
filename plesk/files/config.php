<?php



# Custom Plesk Logo
{%- if plesk.config.custom_logo is defined %}
$config['title_image'] = "/usr/sbin/plesk bin branding --custom-logo -file /usr/local/psa/admin/cp/public/theme/images/logos/plesk/logo.png";
{%- endif %}
