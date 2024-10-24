<!-- Application.cfc -->
<cfcomponent>
    <!-- Application configuration -->
    <cfset this.name = "CRUDApplication">
    <cfset this.datasource = "test"> <!-- Set this to your datasource name in ColdFusion Admin -->
    <cfset this.sessionManagement = true>
    <cfset this.applicationTimeout = createTimeSpan(0, 2, 0, 0)> <!-- 2-hour application timeout -->
    <cfset this.sessionTimeout = createTimeSpan(0, 2, 0, 0)> <!-- 2-hour session timeout -->

    <!-- onApplicationStart: Runs when the application starts -->
    <cffunction name="onApplicationStart" returntype="boolean">
        <cfset application.startTime = now()>
        <cfreturn true>
    </cffunction>

    <!-- onSessionStart: Runs when a new session starts -->
    <cffunction name="onSessionStart" returntype="void">
        <cfset session.user = "Guest"> <!-- Setting a default session variable -->
    </cffunction>

    <!-- onRequest: Handles every request -->
    <cffunction name="onRequest" returntype="void">
        <cfargument name="targetPage" type="string" required="true">
        <!-- This will run on every page request before loading the requested page -->
        <cfinclude template="#arguments.targetPage#">
    </cffunction>
</cfcomponent>
