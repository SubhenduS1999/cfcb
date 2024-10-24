<!-- login.cfm -->
<cfif structKeyExists(form, "submit")>
    <!-- Capture form values -->
    <cfset email = trim(form.email)>
    <cfset password = trim(form.password)>

    <!-- Validate if email and password fields are filled -->
    <cfif len(email) EQ 0 OR len(password) EQ 0>
        <cfset errorMsg = "Please enter both email and password.">
    <cfelse>
        <!-- Query the database to find the user -->
        <cfquery datasource="test" name="getUser">
            SELECT * FROM Users
            WHERE Email = <cfqueryparam value="#email#" cfsqltype="cf_sql_varchar">
            AND Password = <cfqueryparam value="#hash(password, 'SHA-256')#" cfsqltype="cf_sql_varchar">
        </cfquery>
        
        <!-- Check if user exists -->
        <cfif getUser.recordCount EQ 0>
            <cfset errorMsg = "Invalid email or password.">
        <cfelse>
            <!-- Successful login: Set user session and redirect -->
            <cfset session.loggedIn = true>
            <cfset session.userFirstName = getUser.FirstName>
            <cfset session.userLastName = getUser.LastName>
            <cfset session.userEmail = getUser.Email>
            
            <!-- Redirect to dashboard or welcome page -->
            <cflocation url="listUsers.cfm">
        </cfif>
    </cfif>
</cfif>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <!-- Login form -->
    <form method="post" action="login.cfm">
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required>
    
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <input type="submit" name="submit" value="Login">
    </form>
</body>
</html>