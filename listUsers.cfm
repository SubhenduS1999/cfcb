<cfquery datasource="test" name="getUsers">
    SELECT * FROM Users ORDER BY id ASC
</cfquery>

<h2>List of Users</h2>
<table border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Created Date</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <cfoutput query="getUsers">
        <tr>
            <td>#id#</td>
            <td>#FirstName#</td>
            <td>#LastName#</td>
            <td>#Email#</td>
            <td>#DateFormat(CreatedDate, 'mm/dd/yyyy')#</td>
            <td>
                <a href="editUser.cfm?id=#id#">Edit</a> | 
                <a href="deleteUser.cfm?id=#id#">Delete</a>
            </td>
        </tr>
        </cfoutput>
    </tbody>
</table>
<a href="addUser.cfm">Add New User</a>