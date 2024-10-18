<cfif structKeyExists(url, "id")>

    <!--- Query to get user details based on the ID passed in the URL --->
    <cfquery datasource="test" name="getUser">
        SELECT * FROM Users WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
    </cfquery>

    <!--- Check if the query returned any records --->
    <cfif getUser.RecordCount EQ 0>
        <cfoutput>No user found with the given ID.</cfoutput>
        <cfabort>
    </cfif>

    <!--- Only display the form if a valid user is found --->
    <h2>Edit User</h2>
    <cfform method="post" action="editUser.cfm?id=#url.id#">
        <cfinput type="hidden" name="id" value="#getUser.id[1]#">

        <label>First Name:</label>
        <cfinput type="text" name="FirstName" value="#getUser.FirstName[1]#" required>

        <label>Last Name:</label>
        <cfinput type="text" name="LastName" value="#getUser.LastName[1]#" required>

        <label>Email:</label>
        <cfinput type="email" name="Email" value="#getUser.Email[1]#" required>

        <cfinput type="submit" name="submit" value="Update User">
    </cfform>

<cfelse>
    <cfoutput>No ID provided in the URL.</cfoutput>
</cfif>

<!--- Handle form submission for updating the user details --->
<cfif structKeyExists(form, "submit")>
    <cfquery datasource="test">
        UPDATE Users
        SET FirstName = <cfqueryparam value="#form.FirstName#" cfsqltype="cf_sql_varchar" maxlength="100">,
            LastName = <cfqueryparam value="#form.LastName#" cfsqltype="cf_sql_varchar" maxlength="100">,
            Email = <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar" maxlength="100">
        WHERE id = <cfqueryparam value="#form.id#" cfsqltype="cf_sql_integer">
    </cfquery>

    <!--- Redirect to the list page after the update --->
    <cflocation url="listUsers.cfm">
</cfif>