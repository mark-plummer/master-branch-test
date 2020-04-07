---
title: ["Create, edit, or delete a group"]
last_updated: 10/07/2019
summary: "ThoughtSpot has intuitive and powerful user group management for assigning privileges, user selection, multi-tier subgroups, default Pinboard assignment, and emailing."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Before adding users, create the groups to which they belong. Each group includes a set of privileges for its users.

{: id="add-group"}
## Create a group

To create a group and add privileges for the group, follow these steps:

1. Log in to ThoughtSpot from a browser.
2. Click the **Admin** icon, on the top navigation bar.

    ![Admin tab]({{ site.baseurl }}/images/click-admin.png "Admin Tab")

3.  In the **Admin** panel, click **User Management**.

    ![Admin > User Management]({{ site.baseurl }}/images/admin-user-management.png "Admin > User Management")

4.  In the **User Management** section, click **Groups**.

    ![Manage Groups]({{ site.baseurl }}/images/admin-user-management-groups.png "Manage Groups")

5. Click the **+ Add Group** button on the upper right-hand side of the list of groups.

     ![Add a new Group]({{ site.baseurl }}/images/admin-user-management-add-group.png "Add a new Group")

6. In the **Add a new group** modal, enter the details for the new group:

     ![Enter details for the new group]({{ site.baseurl }}/images/add-group.png "Enter details for the new group")

    <table>
    <colgroup>
    <col width="20%" />
    <col width="80%" />
    </colgroup>
     <tr>
       <th>Field</th>
       <th>Description</th>
     </tr>
     <tr id="group-name">
       <th>Group name</th>
       <td>Enter a unique name for the group.</td>
     </tr>
     <tr id="display-name">
       <th>Display name</th>
       <td>Name of the group as it appears in ThoughtSpot.</td>
     </tr>
     <tr id="sharing-visibioity">
       <th>Sharing visibility</th>
       <td>Indicate whether objects can be shared with this group. When set to <b>SHAREABLE</b>,
       this group is an option in the <b>Share</b> dialog.</td>
     </tr>
     <tr id="description">
       <th>Description</th>
       <td>Optionally, enter a description.</td>
     </tr>
     <tr id="privileges">
       <th>Privileges</th>
       <td>Check the <a href="{{"/admin/users-groups/about-users-groups.html#list-of-privileges" | prepend: site.baseurl }}">privileges</a> you want to grant to the group. If you add the privilege <b>Has administration privileges</b> to a group, all users in that group can see all the data in ThoughtSpot. Administrators can always see all data sources, and <a href="{{"/admin/data-security/about-row-security.html#" | prepend: site.baseurl }}">Row level security</a> does not
       apply to them.
       </td>
     </tr>
    </table>

7. You can also add _[Groups](#add-groups)_ (these would be the subgroups of the group you are editing), _[Users](#add-users)_. Also, see _[Default Pinboards](#add-default-pinboard)_.

8. Click **Add** to create the group.

{: id="add-default-pinboards"}
### Default Pinboards

You cannot add default Pinboards to a new user group. You must create it first, and then edit it to add default Pinboards. See **[Edit a group > Default Pinboards](#change-default-pinboards)**.

![Add a new group > Default Pinboards]({{ site.baseurl }}/images/add-group-pinboards.png "Add group > Default Pinboards")

{: id="add-groups"}
### Groups

Follow these steps to assign subgroups to the group:

1. Click the **Groups** tab.

2. Select the groups you want to add in the list by clicking the box next to the group name.

3. You can also use **Search** to find groups by name.

![Add a new group > Groups]({{ site.baseurl }}/images/add-group-groups.png "Add group > Groups")

{: id="add-users"}
### Users

Follow these steps to assign users to the group:

1. Click the **Users** tab.

2. Select the users you want to add in the list by clicking the box next to the user name.

3. You can also use **Search** to find users by name.

![Add a new group > Users]({{ site.baseurl }}/images/add-group-groups.png "Add group > Users")

{: id="edit-group"}
## Edit a group

After adding a group, you can edit its settings to add or
revoke privileges. The new settings apply to all group members.

To edit an existing group, follow these steps:

1. Log in to ThoughtSpot from a browser.

2. Click the **Admin** icon, on the top navigation bar.

    ![Admin tab]({{ site.baseurl }}/images/click-admin.png "Admin Tab")

3.  In the **Admin** panel, click **User Management**.

    ![Admin > User Management]({{ site.baseurl }}/images/admin-user-management.png "Admin > User Management")

4.  In the **User Management** section, click **Groups**.

    ![Manage Groups]({{ site.baseurl }}/images/admin-user-management-groups.png "Manage Groups")

5. Find the group you want to edit in the list, and click its name.

   If you don't immediately see the name of the group, try searching for it.

   ![Search Groups]({{ site.baseurl }}/images/edit-group-search.png "Search Groups")

6. You can change the _[Group name](#group-name)_, _[Display name](#display-name)_, _[Sharing visibility](#sharing-visibility)_, _[Description](#description)_, and the selected _[Privileges](#privileges)_.

   Here, we added the _Can manage data_ privilege.

   ![Change the details for the group]({{ site.baseurl }}/images/edit-group.png "Change details for the group")

   You can also make changes to the _[Default Pinboards](#change-default-pinboards)_, _[Groups](#change-groups)_ (these would be the subgroups of the group you are editing), _[Users](#change-users)_, or _[Email](#change-email)_.

7. Make your changes, and click **Update**.

{: id="change-default-pinboards"}
### Default Pinboards

To assgin default pinboards to groups, follow these steps:

1. Create a group, or choose an existing group. Note its name.

2. In the **Pinboards** interface, find the correct Pinboards, and share them with this group. See [Share a Pinboard]({{ site.baseurl }}/admin/data-security/share-pinboards.html).

3. Open the Group for editing. See [Edit a group](#edit-group).

4. Click the **Default Pinboards** tab.

2. From the list of shared Pinboards, select 1-3 default Pinboards in the list by clicking the box next to the Pinboard name.

3. You can also use **Search** to find Pinboards by name.

4. Click **Update** to save changes.

{: id="change-groups"}
### Groups

When editing a group, keep in mind that only subgroups or possible subgroups appear in the list of groups. The **No Groups in Group** only indicates there are no children in this group's hierarchy. Do not underestimate the importance of the parent(s) of the group, because each group inherits the privileges of each of its parent groups.

Follow these steps to change subgroups of the group:

1. Click the **Groups** tab.

2. Select the groups you want to add in the list by clicking the box next to the group name.

3. You can also use **Search** to find groups by name.

4. Deselect the groups you want to remove from the list by clearing the box next to the group name.

5. Click **Update** to save changes.

![Change a group > Groups]({{ site.baseurl }}/images/edit-group-groups.png "Change a group > Groups")

{: id="change-users"}
### Users

Follow these steps to change the users of the group:

1. Click the **Users** tab.

2. Select the users you want to add in the list by clicking the box next to the user name.

3. You can also use **Search** to find users by name.

4. Deselect the users you want to remove from the list by clearing the box next to the user name.

5. Click **Update** to save changes.

![Change a group > Users]({{ site.baseurl }}/images/edit-group-users.png "Change a group > Users")

{: id="change-email"}
### Email

You can configure groups so that users receive a _welcome email_ that introduces them to ThoughtSpot, and initiates the onboarding process.

Follow these steps to configure group-wide emails:

1. Click the **Email** tab.

2. Under **Resend welcome email**, select either either _All users_ or _New users_.

3. Enter optional text for the email.
   Here, we added "Welcome!"

4. To send the email immediately, click **Send**.

5. To test the email, click "Test welcome email"

6. Click **Update** to save changes.

![Email for group > Email]({{ site.baseurl }}/images/edit-group-email.png "Change a group > Email")

{: id="delete-group"}
## Deleting groups

To delete existing groups, follow these steps:

1. Log in to ThoughtSpot from a browser.

2. Click the **Admin** icon, on the top navigation bar.

    ![Admin tab]({{ site.baseurl }}/images/click-admin.png "Admin Tab")

3.  In the **Admin** panel, click **User Management**.

    ![Admin > User Management]({{ site.baseurl }}/images/admin-user-management.png "Admin > User Management")

4.  In the **User Management** section, click **Groups**.

    ![Manage Groups]({{ site.baseurl }}/images/admin-user-management-groups.png "Manage Groups")

5. Select the groups you plan to delete by clicking the box next to the group name.

   If you don't immediately see the name of the group, try searching for it.

   ![Search Groups]({{ site.baseurl }}/images/edit-group-search.png "Search Groups")

6. Click **Delete**.

    ![Delete Groups]({{ site.baseurl }}/images/delete-group.png "Delete Groups")

{: id="list-group-members"}
## List group members

When browsing through users or subgroups, you can often see only a limited list. To check for other users, search for the name of a specific user or subgroup.

{: id="add-users-to-groups"}
## Add multiple users to a group

To add multiple users to a group, you must be on the **Users** interface. Follow these steps:

1. Log in to ThoughtSpot from a browser.

2. Click the **Admin** icon, on the top navigation bar.

    ![Admin tab]({{ site.baseurl }}/images/click-admin.png "Admin Tab")

3.  In the **Admin** panel, click **User Management**.

    ![Admin > User Management]({{ site.baseurl }}/images/admin-user-management.png "Admin > User Management")

4.  In the **User Management** section, click **Users**.

    ![Manage Users]({{ site.baseurl }}/images/admin-user-management-users.png "Manage Users")

5. Select the names of users you plan to add to groups by clicking the box next to the user name.

   If you don't immediately see the user name, try searching for it.

   ![Search Users]({{ site.baseurl }}/images/edit-user-search.png "Search Users")

5. Click the **Add Users to Groups** button on the top of the list of users.

     ![Add Users to Groups]({{ site.baseurl }}/images/add-many-users.png "Add Users to Groups")

6. In the **Add Users to Groups** interface, select the groups by clicking the box next to the group name.

7. Click **Add**.

     ![Choose Groups]({{ site.baseurl }}/images/add-users-to-groups.png "Choose Groups")
