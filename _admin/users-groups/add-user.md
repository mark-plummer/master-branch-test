---
title: ["Create, edit, or delete a user"]
last_updated: 10/08/2019
summary: "For each unique person who accesses ThoughtSpot, you must create a user account. When you create a user manually in ThoughtSpot, you continue to manage that user in ThoughtSpot."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
You can create users directly in ThoughtSpot, or import users and user groups through LDAP or similar protocols.

For users who have access through LDAP, the LDAP installation manages all user information.

{: id="add-user"}
## Create a user in ThoughtSpot

This procedure demonstrates how to create a user manually. When you create a user, you can specify the _[username](#username)_, _[display name](#display-name)_, _[sharing visibility](#sharing-visibility)_, the _[password](#password)_, _[email](#email)_, whether they get a _[welcome email](#welcome-email)_ and its _[text](#welcome-text)_, and assign _[group](#groups)_ memberships. The user inherits privileges and permissions directly from the group assignments.

Note that all users automatically belong to the group **All**.

To create a new user and assign that user to groups, follow these steps:

1. Log in to ThoughtSpot from a browser.
2. Click the **Admin** icon, on the top navigation bar.

    ![Admin tab]({{ site.baseurl }}/images/click-admin.png "Admin Tab")

3.  In the **Admin** panel, click **User Management**.

    ![Admin > User Management]({{ site.baseurl }}/images/admin-user-management.png "Admin > User Management")

4.  In the **User Management** section, click **Users**.

    ![Manage Groups]({{ site.baseurl }}/images/admin-user-management-users.png "Manage Users")

5. Click the **+ Add User** button on the upper right-hand side of the list of users.

     ![Add a new User]({{ site.baseurl }}/images/admin-user-management-add-user.png "Add a new User")

5. In the **Add a new user** interface, enter the details for the new user:

     ![Add a new User]({{ site.baseurl }}/images/add-user.png "Add a new User")

    <table>
     <colgroup>
      <col width="20%">
      <col width="10%">
      <col width="70%">
     </colgroup>
     <tr>
      <th>Field</th>
      <th>Required?</th>
      <th>Description</th>
      </tr>
      <tr id="username">
        <th>Username</th>
        <td>Yes</td>
        <td>A login name for the user. Usernames must be unique and lowercase.
        <p>If you are using Active Directory to authenticate users, and your LDAP configuration requires users to be created manually (they are not created automatically in ThoughtSpot upon authentication), the username you specify has to be domain-qualified (<code>username@ldap.thoughtspot.com</code>), and you must enter a dummy password.</p></td>
      </tr>
      <tr id="display-name">
        <th>Display name</th>
        <td>Yes</td>
        <td>A unique name for the user (usually their first and last name).</td>
      </tr>
      <tr id="sharing-visibility">
        <th>Sharing visibility</th>
        <td>Yes</td>
        <td>Indicate whether objects can be shared with this user. When set to <b>SHAREABLE</b>,
        this user is an option in the <b>Share</b> dialog.</td>
      </tr>
      <tr id="password">
        <th>Change password</th>
        <td>Yes</td>
        <td>A password. Your password must contain three of the following: uppercase letters A-Z, lowercase letters a-z, special characters !#$ etc, numbers 0-9. Your password must be at least eight characters long. When you click on the <strong>change password</strong> field, a tooltip appears to tell you these requirements.</td>
      </tr>
      <tr id="confirm_password">
        <th>Confirm password</th>
        <td>Yes</td>
        <td>Enter the password again.</td>
      </tr>   
      <tr id="email">
        <th>Email</th>
        <td>Yes</td>
        <td>The user's email address. ThoughtSpot uses this for  notification when another user shares something with them, for onboarding, for the <strong>Ask an Export</strong> feature, and others.
        <p>Note that during cluster configuration, the domain is specified. ThoughtSpot does not accept emails outside this domain.</p></td>
      </tr>    
      <tr id="welcome-email">     
        <th>Send a welcome email</th>
        <td>No</td>
        <td>When checked, this option ensures that the new user receives a welcome email.</td>
      </tr>
      <tr id="email-text">     
        <th>Email message text</th>
        <td>No</td>
        <td>Enter text of the optional welcome email here.</td>
      </tr>
      <tr id="groups">
        <th>Groups</th>
        <td>Recommended</td>
        <td>Select the groups for the user.
        <p>Note that if you add the user to a group that has the privilege <b>Has administration privileges</b>, they can see all the data in ThoughtSpot. </p>
        <p>When you create a new user, the groups they belong to define the following attributes for the user:</p>
        <ul>
          <li><strong>Privileges</strong>: the actions they can perform, defined when you <a href="add-group.html">Add a group and set security privileges</a>.</li>
          <li><strong>Permissions</strong>: the data they can access and view, defined when you consider <a href="{{"/admin/data-security/sharing-security-overview.html#" | prepend: site.baseurl }}">Data security</a>.</li>
      </ul>
        <p>Administrators can see all data sources, and <a href="{{"/admin/data-security/about-row-security.html#" | prepend: site.baseurl }}">Row level security</a> does not apply to them.</p></td>
      </tr>
     </table>

6. Click **Add** to create the user.

Note that this process of identifying the user's needs contributes to a robust onboarding process. See [Onboarding users]({{ site.baseurl }}/end-user/onboarding/intro-onboarding.html#).

{: id="edit-user"}
## Edit an existing user ##

As an administrator, you can edit a user account, and change the user's groups. You can also help users by resetting their password, and evaluating their onboarding experience to ensure they receive the best possible introduction to relevant information in ThoughtSpot.

To edit an existing user, follow these steps:

1. Log in to ThoughtSpot from a browser.

2. Click the **Admin** icon, on the top navigation bar.

    ![Admin tab]({{ site.baseurl }}/images/click-admin.png "Admin Tab")

3.  In the **Admin** panel, click **User Management**.

    ![Admin > User Management]({{ site.baseurl }}/images/admin-user-management.png "Admin > User Management")

4.  In the **User Management** section, click **Users**.

    ![Manage Groups]({{ site.baseurl }}/images/admin-user-management-users.png "Manage Users")

5.  Click the username in the list to open the **Edit User** interface.

    If you don't immediately see the username you plan to edit, try searching for it.

    ![Search Users]({{ site.baseurl }}/images/edit-user-search.png "Search Users")

6.  In the **Edit User** interface, edit the basic user information.

    You can change the _[username](#username)_, _[display name](#display-name)_, _[sharing visibility](#sharing-visibility)_, _[passwords](#password)_, and _[user's email](#email)_.

    ![Edit User]({{ site.baseurl }}/images/edit-user.png "Edit User")

    You can also [Preview onboarding](#edit-user-preview-onboarding), and make changes to the _[Groups](#edit-user-groups)_ assigned to the user.<!--, and check _[Email](#edit-user-email)_ options.-->

7.  Click **Update**.

{: id="edit-user-preview-onboarding"}
### Preview onboarding

You can click **Preview onboarding** to evaluate this user's first experience with ThoughtSpot. After previewing the user's default data source and Pinboards, you may choose to change the **[Group](*change-groups)** assignments.

![Preview onboarding experience]({{ site.baseurl }}/images/edit-user-preview-onboarding.png "Preview onboarding experience")

{: id="edit-user-groups"}
### Groups

Follow these steps to change the user's groups:

1. Click the **Groups** tab.

2. Select the groups you want to add in the list by clicking the box next to the group name.

3. You can also use **Search** to find groups by name.

4. Deselect the groups you want to remove from the list by clearing the box next to the group name.

5. Click **Update** to save changes.

![Edit User Grouops]({{ site.baseurl }}/images/edit-user-groups.png "Edit User Groups")

<!--
{: id="edit-user-email"}
### Email

You can _Resend welcome email_ by clicking **Send**.

Clicking **Test welcome email**  introduces them to ThoughtSpot, and initiates the onboarding process.

Follow these steps to configure group-wide emails:

1. Click the **Email** tab.

2. Under **Resend welcome email**, select either either _All users_ or _New users_.

3. Enter optional text for the email.
   Here, we added "Welcome!"

4. To send the email immediately, click **Send**.

5. To test the email, click "Test welcome email"

6. Click **Update** to save changes.

![Edit User Email]({{ site.baseurl }}/images/edit-user-email.png "Edit User Email")-->

{: id="delete-user"}
## Delete users ##

To delete users, follow these steps:

1. Log in to ThoughtSpot from a browser.

2. Click the **Admin** icon, on the top navigation bar.

    ![Admin tab]({{ site.baseurl }}/images/click-admin.png "Admin Tab")

3.  In the **Admin** panel, click **User Management**.

    ![Admin > User Management]({{ site.baseurl }}/images/admin-user-management.png "Admin > User Management")

4.  In the **User Management** section, click **Users**.

    ![Manage Groups]({{ site.baseurl }}/images/admin-user-management-users.png "Manage Users")

5. Select the users you plan to delete by clicking the box next to the username.

   If you don't immediately see the username you plan to delete, try searching for it.

   ![Search Users]({{ site.baseurl }}/images/edit-user-search.png "Search Users")

6. Click **Delete**.

   ![Delete Users]({{ site.baseurl }}/images/delete-users.png "Delete Users")
