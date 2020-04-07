---
title: [Slack integration]
summary: Learn how to configure ThoughtSpot's Slack integration.
last_updated: 11/18/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Working with ThoughtSpot, you can configure your installation to work with Slack.
Users can use the integration, called **Spot**, to make queries or view charts.
Any users with administrative rights can apply a `spot` sticker to specific
objects. Then, the object is available through Slack.

The first time a user messages Spot, it returns a login link for ThoughtSpot.
After logging in, the user's Slack and ThoughtSpot accounts are connected.
Actions a user makes from Slack are tied to the user's permissions and
authorization.

## Spot workflow for administration   

Here are the high level steps:

1. Contact ThoughtSpot Support (https://docs.thoughtspot.com/latest/admin/misc/contact.html)
 to install the Spot Slack bot on your cluster.
2. Log in to ThoughtSpot.
3. Label answers, pinboards, and other objects with the spot sticker.
4. Start Spot Bot.
5. Register Spot bot with your company's Slack instance.
6. Register your Spot Slack account to ThoughtSpot.

## Related Information

Relevant `tscli` commands are in the tscli command reference (See https://docs.thoughtspot.com/latest/reference/tscli-command-ref.html#spot), but these will not work until Spot is enabled by ThoughtSpot Support. Support
will work with you to install Spot, and then provide the rest of the workflow to
you, including `tscli` command usage.
