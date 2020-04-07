---
title: ["Understand groups and privileges"]

last_updated: tbd
summary: "Creating groups and assigning users to them makes privilege management easier."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Before people can log in and use ThoughtSpot, you need to create a username, a
password, and a membership in one or more groups for them.

last_updated: January 6, 2020
summary: "Creating groups and assigning users to them makes privilege management easier."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Before people can log in and use ThoughtSpot, you need to create a username, a
password, and a membership in one or more groups for them.

This page describes manual creation of users, groups, and privileges, but you
can also manage users through [LDAP]({{ site.baseurl
}}/admin/setup/about-LDAP.html#) or SAML. For information on configuring SAML
authentication, see [Configure SAML] ({{ site.baseurl
}}/admin/setup/configure-SAML-with-tscli.html).

## Privileges and groups

Privileges determine what kinds of actions users are allowed to do. You assign
privileges to groups. Then, you create users and assign them to groups. This is
how you grant users access to different capabilities in ThoughtSpot.

Each group includes a set of privileges for its users. The privileges a group
has determine the actions that its members are allowed to do. If a user belongs
to more than one group, they will have the highest level of the privileges from
all the groups they belong to. Plan your groups so that you can use them to
assign a common set of privileges to multiple users.  Good planning will pay off
in ease of administration and a better search experience.

There is a default group called **All**, which includes every user in
ThoughtSpot. When you create a new user, they will be added to the **All** group
automatically. You cannot delete the **All** group or remove members from it.

You can also have a hierarchy of groups. That is, groups can belong to (that is,
be children of) other groups. When using group hierarchies, permissions are
inherited from the parent group. So if you're a member of a sub-group, you would
automatically have the privileges of the parent group.


## List of privileges

Here are the different privileges, and the capabilities they enable:

{% include content/privileges.md %}

&nbsp;

Typically, the **ALL** group has a common set of privileges applies such as the
**Can upload user data** and/or **Can download data** privileges.

Privileges are additive, meaning that if a user belongs to more than one group,
they will have the highest level of privileges from among the groups they are a
member of. They are also inherited from the parent, so that a sub-group gets all
the same privileges of its parent, all the way up the group hierarchy.

If you add the privilege **Has administration privileges** to a group, note that
all users in that group will be able to see all the data in ThoughtSpot.
Administrators can see all data sources, and [Row level security]({{
site.baseurl }}/admin/data-security/about-row-security.html#) does not apply to
them.

Permissions to see and edit tables, worksheets, and pinboards are set when you
share them with users and groups, as described in the topic [Data security]({{
site.baseurl }}/admin/data-security/sharing-security-overview.html#).

The following table shows the intersection of user privilege and ability:
{% include content/security-matrix.md %}

## Related information

-   [Add a group and set security privileges]({{ site.baseurl }}/admin/users-groups/add-group.html)  
-   [Add a user]({{ site.baseurl }}/admin/users-groups/add-user.html)  
