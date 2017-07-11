{% set configs = salt['pillar.get']('conf.') %}

/opt/spring-boot/spring-boot-app/configs.conf:
  file.managed:
    - user: "root"
    - group: "root"
    - contents: |
         {% for key, value in configs.items() %}{{ key }}={{ value }}
         {% endfor %}
