# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_service_clean = tplroot ~ '.service.clean' %}
{%- from tplroot ~ "/map.jinja" import template with context %}
{%- from tplroot ~ "/macros.jinja" import files_switch with context %}

include:
  - {{ sls_service_clean }}

template-config-absent:
  file.absent:
    - name: {{ template.config }}
    - require:
      - sls: {{ sls_service_clean }}
