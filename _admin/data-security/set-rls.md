---
title: [Set row level security rules]

last_updated: 3/3/2020

summary: "Learn how to set RLS rules."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
When rule-based row level security (RLS) is set, it prevents users from seeing
data they shouldn't in tables and the objects derived from them. You must have
administrative rights on ThoughtSpot to set RLS rules.

Before you create a rule, make sure you have read [How rule-based RLS works]({{
site.baseurl }}/admin/data-security/row-level-security.html#).

## Create a rule on a table

You can set RLS rules _only_ on tables. To set up rule-based row level security,
do the following:

1. Click **Data**, and double-click a table.
2. Click **Row security**.
3. Click **+ Add row security**.

    ![Click + add row security]({{ site.baseurl }}/images/rls-button.png "click + add row security")

    The system displays the Rule Builder.

    ![Rule builder]({{ site.baseurl }}/images/rls-rule-builder.png "Rule builder")

    You define row level security by creating an expression that gets evaluated
    for every row and group combination. This powerful feature can be used with
    up to thousands of groups.

4. Open the Rule Builder.
5. Give your rule a name.
6. Enter an expression for your rule.

   The rule gets evaluated against an authenticated user for every row and group
   combination. If the rule evaluates to `FALSE`, the user cannot see that row's
   data. Instead, they see the message `No data to display.` Use the variable **ts_groups** to refer to the group name.

   ![]({{ site.baseurl }}/images/rls_enter_expression.png "Enter an expression")

    You can see a list of available operators by clicking on **Rule Assistant**.

    ![Rule assistant]({{ site.baseurl }}/images/rls-rule-assistant.png "Rule assistant")

    As you type, ThoughtSpot suggests formula syntax, variables, and column
    names. If you can't remember the exact column name or variable you want to
    use, the suggestions can help.

    When your expression is valid, a green indicator appears at the bottom of
    the Rule Builder.

7. Click **Save**.

The rule you created is listed in the rules. You can edit the rule or add more
rules by clicking **+ Add**.

## Test your rule with restricted and unrestricted users

To test your rule, log in as users in different groups. Search within the table
for data that your test user can and can't access. Make sure your test users
can see the appropriate rows.

## Related information

* Administrators can bypass the RLS rules set on a the table at the worksheet
level. See [change the join rule or RLS setting for a worksheet]({{
site.baseurl }}/admin/worksheets/change-inclusion-rule.html#).

* For a list of operators and functions you can use to build RLS rules, see the
[row level security rules reference]({{ site.baseurl
}}/reference/rls-rule-builder-reference.html#).
