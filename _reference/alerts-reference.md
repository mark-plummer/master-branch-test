---
title: [Alerts code reference]
summary: Learn about the alerts ThoughtSpot may generate.
last_updated: 11/19/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---

This reference identifies the messages that can appear in the **System Health >
Overview > Critical Alerts** and in the  **Alerts** dashboard.

## Informational alerts

{% for item in site.data.extract-alerts.alerts %}  
  {% if item.type == "INFO" %}
### {{item.id}}

<strong>Msg</strong>: <code style="highlighter-rouge">{{item.msg}}</code>

<strong>Type</strong>: {{item.type}}

 {{item.description}}
   {% endif %}
 {% unless forloop.last %}
 {% endunless %}
{% endfor %}

## Errors

{% for item in site.data.extract-alerts.alerts %}  
  {% if item.type == "ERROR" %}
### {{item.id}}

<strong>Msg</strong>: <code style="highlighter-rouge">{{item.msg}}</code>

<strong>Type</strong>: {{item.type}}

 {{item.description}}
   {% endif %}
 {% unless forloop.last %}
 {% endunless %}
{% endfor %}

## Warnings

{% for item in site.data.extract-alerts.alerts %}  
  {% if item.type == "WARNING" %}
### {{item.id}}

<strong>Msg</strong>: <code style="highlighter-rouge">{{item.msg}}</code>

<strong>Type</strong>: {{item.type}}

 {{item.description}}
   {% endif %}
 {% unless forloop.last %}
 {% endunless %}
{% endfor %}

## Critical alerts

{% for item in site.data.extract-alerts.alerts %}  
  {% if item.type == "CRITICAL" %}
### {{item.id}}

<strong>Msg</strong>: <code style="highlighter-rouge">{{item.msg}}</code>

<strong>Type</strong>: {{item.type}}

 {{item.description}}
   {% endif %}
 {% unless forloop.last %}
 {% endunless %}
{% endfor %}
