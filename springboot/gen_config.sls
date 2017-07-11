{% from "springboot/map.jinja" import spring_settings with context %}
sprinboot:
  user.present

/opt/spring-boot/spring-boot-app/configs.conf:
  file.managed:
    - user: springboot
    - group: springboot
    - makedirs: True
    - contents: |
         {% for key, value in spring_settings.config.file_content.items() %}{{ key }}={{ value }}
         {% endfor %}
