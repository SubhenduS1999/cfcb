<cfcomponent>
    <cfscript>
        function init(){
            attributes.users = StructNew();
            attributes.users.name = "";
            attributes.users.age = "";
            attributes.users.role = "";
            return this;
        }

        function get_name() {
            return attributes.users.name;
        }

        function set_name(name) {
            attributes.users.name = arguments.name;
        }
    </cfscript>
</cfcomponent>