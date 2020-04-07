---
title: [Packages installed with ThoughtSpot for RHEL]
last_updated: 3/20/2020
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
To successfully deploy ThoughtSpot in your organization, you must have the following RPM packages on each node of your ThoughtSpot cluster: [yum](#yum), [python 3](#pip), and [R](#r). When the Ansible playbook runs, it automatically installs them.

ThoughtSpot works with the latest version of each package; see the minimum supported version.

<details id="yum">
  <summary><strong>Yum RPM packages</strong></summary>
  {% include content/rhel/yum-rpm-packages.md %}
</details>

<details id="pip">
<summary><strong>Python 3 packages</strong></summary>
{% include content/rhel/pip-rpm-packages.md %}
</details>

<details id="r">
<summary><strong>R packages</strong></summary>
{% include content/rhel/r-rpm-packages.md %}
</details>
