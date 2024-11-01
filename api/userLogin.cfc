<cfcomponent displayname="Login" hint="Component to handle user login verification">

    <cffunction name="VerifyUser" access="remote" returntype="string" httpmethod="POST" output="false" hint="Verifies user login details">
        <cfargument name="email" type="string" required="yes" hint="User email address">
        <cfargument name="password" type="string" required="yes" hint="User password">
        
        <cfset var output = {} />
        
        <cftry>
            <!-- Validate email -->
            <cfif not len(arguments.email)>
                <cfthrow message="Email is required" type="Application"/>
            <cfelseif not REFindNoCase("^[\w\.-]+@[\w\.-]+\.\w+$", arguments.email)>
                <cfthrow message="Invalid email format" type="Application"/>
            </cfif>
            
            <!-- Validate password -->
            <cfif not len(arguments.password)>
                <cfthrow message="Password is required" type="Application"/>
            </cfif>
            
            <!-- Query to check for user existence in the database -->
            <cfset var data = { email = arguments.email, password = arguments.password } />
            <cfquery name="result" datasource="test">
                SELECT * FROM Users
                WHERE Email = <cfqueryparam value="#data.email#" cfsqltype="cf_sql_varchar">
                  AND Password = <cfqueryparam value="#hash(data.password, 'SHA-256')#" cfsqltype="cf_sql_varchar">
            </cfquery>

            <cfif result.recordcount gt 0>
                <!-- Populate session variables and output response -->
                 <cfloop query="result">
                    <cfset session.id = result.id>
                    <cfset session.userFirstName = result.FirstName>
                    <cfset session.userLastName = result.LastName>
                    <cfset session.userEmail = result.Email>
                </cfloop>
                
                <cfset output.status = "Success">
                <cfset output.message = "Login successful">
            <cfelse>
                <cfset output.status = "Failure">
                <cfset output.message = "Invalid email or password">
            </cfif>
            
        <cfcatch type="any">
            <cfset output.status = "Error">
            <cfset output.message = cfcatch.message>
        </cfcatch>
        </cftry>

        <cfreturn serializejson(output)> <!-- Returning a JSON string -->
    </cffunction>

    <cffunction name="CheckLogin" access="remote" returntype="string" httpmethod="POST" output="false" hint="Checks login using different cases">
        <cfargument name="email" type="string" required="yes" hint="User email address">
        <cfargument name="password" type="string" required="yes" hint="User password">
        
        <cfset var output = {} />
        
        <cftry>
            <!-- Validate email -->
            <cfif not len(arguments.email)>
                <cfthrow message="Email is required" type="Application"/>
            <cfelseif not REFindNoCase("^[\w\.-]+@[\w\.-]+\.\w+$", arguments.email)>
                <cfthrow message="Invalid email format" type="Application"/>
            </cfif>
            
            <!-- Validate password -->
            <cfif not len(arguments.password)>
                <cfthrow message="Password is required" type="Application"/>
            </cfif>
            
            <!-- Query to check for user existence in the database -->
            <cfset var data = { email = arguments.email, password = arguments.password } />
            <cfquery name="result" datasource="test">
                SELECT * FROM Users
                WHERE Email = <cfqueryparam value="#data.email#" cfsqltype="cf_sql_varchar">
                  AND Password = <cfqueryparam value="#hash(data.password, 'SHA-256')#" cfsqltype="cf_sql_varchar">
            </cfquery>

            <cfif result.recordcount gt 0>
                <!-- Populate session variables and output response -->
                 <cfloop query="result">
                    <cfset session.id = result.id>
                    <cfset session.userFirstName = result.FirstName>
                    <cfset session.userLastName = result.LastName>
                    <cfset session.userEmail = result.Email>
                </cfloop>
                
                <cfset output.status = "Success">
                <cfset output.message = "Login successful">
            <cfelse>
                <cfset output.status = "Failure">
                <cfset output.message = "Invalid email or password">
            </cfif>
            
        <cfcatch type="any">
            <cfset output.status = "Error">
            <cfset output.message = cfcatch.message>
        </cfcatch>
        </cftry>

        <cfreturn serializejson(output)> <!-- Returning a JSON string -->
    </cffunction>

</cfcomponent>
