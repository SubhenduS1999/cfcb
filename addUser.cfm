<cfif structKeyExists(form, "submit")>
    <cfquery datasource="test">
        INSERT INTO Users (FirstName, LastName, Email, CreatedDate)
        VALUES (
            <cfqueryparam value="#form.FirstName#" cfsqltype="cf_sql_varchar" maxlength="100">,
            <cfqueryparam value="#form.LastName#" cfsqltype="cf_sql_varchar" maxlength="100">,
            <cfqueryparam value="#form.Email#" cfsqltype="cf_sql_varchar" maxlength="100">,
            GETDATE()
        )
    </cfquery>
    <cflocation url="listUsers.cfm">
</cfif>

<h2>Add New User</h2>
<form method="post" action="addUser.cfm">
    <label>First Name:</label>
    <input type="text" name="FirstName" required>

    <label>Last Name:</label>
    <input type="text" name="LastName" required>

    <label>Email:</label>
    <input type="email" name="Email" required>

    <input type="submit" name="submit" value="Add User">
</form>