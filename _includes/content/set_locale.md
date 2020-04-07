The language that ThoughtSpot displays depends on the system locale. If you set your browser locale or OS locale to one of ThoughtSpot's supported locales, ThoughtSpot automatically defaults to that locale. If your browser locale is not one of ThoughtSpot's supported locales, ThoughtSpot defaults to US English.

It is simple to change this locale using the **Profile** interface.

1. Navigate to your user profile:
* Select your user icon next to the **help** button.
* Select **Profile**.
2. Under **Preferences**, click the drop-down menu icon to change the language.
    ![Select a new locale]({{ site.baseurl }}/images/locale-set.png "Select a new locale")

The **Language** selection specifies more than just the language: it sets the locale, which controls both the language choice and standard data formats for date and number. So, if you set French as the default locale in your profile settings, the interface updates to reflect this. Be sure to refresh your browser page.

For example, in the United States the number format for large numbers uses the comma thousands separator and a period decimals separator, and looks like this: `xxx,xxx.xx`. Most  European countries use the reverse notation, with a comma decimals separator and a period thousands separator, like this: `xxx.xxx,xx`.

In addition to American English (*en-US*), ThoughtSpot supports the following locales:

| Locale |  Language  
|---|---|
| *da-DK* | Dansk  |
| *de-DE* | Deutsche  |
| *en-AU* | English (Australia)  |
| *en-CA* | English (Canada)  |
| *en-GB* | English (United Kingdom)  |
| *en-US* | English (United States)  |
| *es-US* | Español (latín)  |
| *es-ES* | Español (España)  |
| *fr-CA* | Français (Canada)  |
| *fr-FR* | Français (France)  |
| *it-IT* | Italiano  |
| *nl-NL* | Nederland (beta)  |
| *nb-NO* | Norsk  |
| *pt-BR* | Português (Brazil)  |
| *pt-PT* | Português (Portugal)  |
| *fi-FI* | Suomi  |
| *sv-SE* | Svenska  |
| *zh-CN* | 中文(简体)  |
| *ja-JP* | 日本語  |

ThoughtSpot translates keywords, operators, and error messages. See the [keyword reference]({{ site.baseurl }}/reference/keywords.html) for all supported languages.

ThoughtSpot _DOES NOT_ translate formulas, or metadata entered by the user. For example, if you name a visualization 'Quarterly Sales' in any variant of English and subsequently change the locale to a variant of French, the visualization remains 'Quarterly Sales' and does not become 'Ventes trimestrielles'. If you specify a currency when uploading data, that currency does not change when the locale changes.

Here is an example of a locale change from the default, American English, to Español.

![Locale change -- Español]({{ site.baseurl }}/images/locale-spanish.png "Locale change -- Español")

Note that the top navigation bar is now in Spanish. The number formatting of the data markers now reflects the European format, with a comma decimals separator, and a period thousands separator. However, the column names are still in English, because ThoughtSpot does not translate your metadata.
