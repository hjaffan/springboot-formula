{% from "springboot/map.jinja" import spring_settings with context %}
# sprinboot:
#   user.present:
#     - fullname: Springboot
#     - shell: /bin/bash
#     - home: /home/springboot
#     - uid: 4000
#     - gid: 4000

/opt/spring-boot/spring-boot-app/configs.conf:
  file.managed:
    - user: root
    - group: root
    - makedirs: True
    - contents: |
         {% for key, value in spring_settings.config.file_content.items() %}{{ key }}={{ value }}
         {% endfor %}
