{% from "springboot/map.jinja" import spring_settings with context %}

/opt/spring-boot/spring-boot-app/configs.conf:
  file.managed:
    - user: "root"
    - group: "root"
    - contents: |
         {% for key, value in spring_settings.config.file_content.items() %}{{ key }}={{ value }}
         {% endfor %}
