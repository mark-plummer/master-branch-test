---
title: ["Allow users to sign up"]
summary: Learn how to allow people in your organization to sign up for ThoughtSpot.
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
You can allow people in your organization to sign up for ThoughtSpot by clicking a button on the sign-in page.

You do this by providing them with the ThoughtSpot sign-up URL. When they go to this URL, they see the sign-up button.

![]({{ site.baseurl }}/images/admin_sign-up.png)

When a person clicks the sign-up button, they go to a sign-up page that you've already set up outside of ThoughtSpot. This can be any page you want to use for registering new users.

## Create the ThoughtSpot sign-up URL

Follow this syntax for creating the URL:

```https://<your-thoughtspot-URL>/?signUpEnabled=true&signUpButtonLink=https://<your-sign-up-page-URL> ```

Example: `https://thoughtspot.mycompany.com/?signUpEnabled=true&signUpButtonLink=https://signup.mycompany.com/thoughtspot`

## Customize the sign-up button text

By default, the button text is ‘Sign up’, but you have the option to change it. To do that, you add the ’signUpButtonText’ parameter to the URL and include the custom text you want. If the text contains spaces, you must replace each space with a percent sign and the number 20 (%20). For example, if you wanted the button text to be ‘Request Account’, you would use ‘Request%20Account’.

Follow this syntax for creating the URL with custom button text:

```https://<your-thoughtspot-URL>/?signUpEnabled=true&signUpButtonText=<your-sign-up-button-text>&signUpButtonLink=https://<your-sign-up-page-URL> ```

Example: `https://thoughtspot.mycompany.com/?signUpEnabled=true&signUpButtonText=Request%20Account&signUpButtonLink=https://signup.mycompany.com/thoughtspot`

## Display the sign-up button by default

If you want to display the sign-up button on the ThoughtSpot sign-in page without using the special sign-up URL, contact ThoughtSpot support.
