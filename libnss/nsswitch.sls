{%- from "libnss/map.jinja" import libnss with context %}

libnss-nsswitch-config:
  file.managed:
  - name: {{ libnss.nsswitch.config }}
  - source: salt://libnss/files/nsswitch.conf
  - template: jinja
  - context:
      config: {{ salt['pillar.get']('libnss:nsswitch:config', {}) }}
