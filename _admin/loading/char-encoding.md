---
title: [Characters not displaying correctly]
summary: If characters in your data do not display correctly in ThoughtSpot, make sure they are UTF-8 encoded.
last_updated: 11/15/2019
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
Your CSV files are more likely to load smoothly if they are encoded with UTF-8. If you're having problems with some characters rendering incorrectly, you can convert the files to UTF-8 encoding before loading the data.

You might see unexpected characters in your data, especially characters whose ASCII values are at the high and low end of possible values. Some examples of characters that can appear incorrectly are: æ, ñ, ä, í, ö.

If this happens, your data will look like this:

 ![]({{ site.baseurl }}/images/bad_chars.png "Incorrectly displaying characters")

Instead of displaying correctly like this:

![]({{ site.baseurl }}/images/good_chars.png)

To encode your data as UTF-8:

1. On Windows, open your CSV file in Notepad. Save the file as CSV with the Unicode option.
2. On Linux or MacOS, issue a command like:

    ```
    $ iconv -f -t UTF-8 <in_file>.csv > <out_file>.csv
    ```

3. Reload the data.
4. Attempt to import it again.
