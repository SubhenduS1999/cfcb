<cfset testVar = "Hello World">
<cfoutput>
	<h2>#testVar#</h2>
</cfoutput>

<cfquery name="myQuery" datasource="test">
    SELECT * FROM users
</cfquery>

<cfdump var="#myQuery#">