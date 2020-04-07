{: id="specify-permissions"}
## Specify permissions
5. After you click the **Share** icon, the sharing dialog box appears.

    ![The sharing dialog box]({{ site.baseurl }}/images/sharing-modal.png "The sharing dialog box")

4. Enter users or groups with whom you want to share this object in the text box.

    ![Enter users or groups]({{ site.baseurl }}/images/sharing-textbox.png "Enter users or groups")

    Note that you can only enter whitelisted email addresses. Whitelisted email domains appear when you click on the info button ![]({{ site.baseurl }}/images/icon-info.png){: .inline}.

    {% include tip.html content="If you want to hide the whitelisted email domains for your company, or otherwise customize them, contact ThoughtSpot support." %}

5. Configure the level of access by selecting from the drop-down list. You can select:
    -   **Can View** to provide read-only access. If the user doesn't have access to the underlying worksheet, they can only view the shared object.
    -   **Can Edit** to allow modification. Enables renaming or deleting the shared object. If a user with edit privileges modifies a shared object, the object saves their changes.

    ![Specify permissions]({{ site.baseurl }}/images/sharing-permissions.png "Specify permissions")

    If the selected group or user does not have access to the underlying data, you must enable access to the worksheet, view, or table. A yellow warning symbol ![]({{ site.baseurl }}/images/icon-warning-yellow-20px.png){: .inline} appears. If you click on it, it tells you to enable access:

    ![Enable data access]({{ site.baseurl }}/images/sharing-enabledata.png "Enable data access")

    If you own the underlying data source, refer to [share uploaded data]({{ site.baseurl }}/end-user/data-view/share-user-imported-data.html). If you do not own the data source, ThoughtSpot emails the owner of the data source or your ThoughtSpot administrator to ask them to share the data.

6. To stop sharing with a user or group, click the **x** icon ![]({{ site.baseurl }}/images/icon-delete-20px.png){: .inline}.

    ![Stop sharing]({{ site.baseurl }}/images/sharing-delete.png "Stop sharing")

6. You can send an email notification and an optional message:

    ![Send notification]({{ site.baseurl }}/images/sharing-notifmessage.png "Send notification")

6. Click **Share**.

    ![Share your Pinboard or Answer]({{ site.baseurl }}/images/sharing-share.png "Share your Pinboard or Answer")
