<cfscript>
    myQuestion = "What is your name?"
    serverName = cgi.server_name;
    isSecure = cgi.server_port_source;
</cfscript>
<cfoutput>
    <strong>#myQuestion#</strong>
    <strong>Subhendu</strong>
    <strong>#serverName#</strong>
    <strong>#isSecure#</strong>
</cfoutput>