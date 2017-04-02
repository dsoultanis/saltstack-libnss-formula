{%- from "libnss/map.jinja" import libnss with context %}

libnss-mysql-pkg:
  pkg.installed:
  - name: {{ libnss.mysql.pkg }}

libnss-mysql-config-user:
  file.managed:
  - name: {{ libnss.mysql.user_config }}
  - source: salt://libnss/files/libnss-mysql.cfg
  - template: jinja
  - context:
      config: {{ salt['pillar.get']('libnss:mysql:config:user', {}) }}
  - require:
    - pkg: libnss-mysql-pkg

libnss-mysql-config-root:
  file.managed:
  - name: {{ libnss.mysql.root_config }}
  - source: salt://libnss/files/libnss-mysql.cfg
  - template: jinja
  - context:
      config: {{ salt['pillar.get']('libnss:mysql:config:root', {}) }}
  - require:
    - pkg: libnss-mysql-pkg
