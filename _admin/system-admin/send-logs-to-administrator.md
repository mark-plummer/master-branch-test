---
title: [Send logs when reporting problems]
last_updated: 11/18/2019
summary: You can report problems to ThoughtSpot support or your administrator by sending logs.
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
You can generate a log bundle which you can then send to ThoughtSpot Support or you can send logs direct to your administrator.

##  Generate log bundle

Before you can send a log bundle to ThoughtSpot Support, you must [Connect to the ThoughtSpot Support file server]({{ site.baseurl }}/admin/setup/work-with-ts-support.html#). This is a one-time setup operation.

To generate a log bundle:

1. Log in to the Linux shell using SSH.
2. Issue the command to generate the log bundle:

    ```
    tscli callhome generate-bundle
       --d <directory> --since <num_of_daysd>
    ```

    **Note:** Don't forget to include `d` after your specified number of days. For example, `30d`.

3. Change directories to the directory where you wrote the log bundle.
4. Issue the command to send the log bundle to ThoughtSpot Support:

    ```
    tscli fileserver upload
       --file_name <file>
       --server_dir_path <path>
    ```


## Send a log to the administrator

Alternately, you can easily send log files directly to your administrator with a
single click. When ThoughtSpot encounters a problem, a red bar displays in the
browser with an error message. You can use the **Report Problem** option to
complete this task.

Click **Report Problem** in the bottom right corner of the error message.

![]({{ site.baseurl }}/images/trace_log.png "Report problem")

The logs will be sent to your administrator as an email attachment from your email account. Your administrator then has the option to followup with ThoughtSpot, if necessary.
