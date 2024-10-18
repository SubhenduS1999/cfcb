<cfquery datasource="test">
    DELETE FROM Users WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
</cfquery>
<cflocation url="listUsers.cfm">