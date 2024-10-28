$(document).ready(function () {
    // Submit button on click
    $("#btnLogin").click(function () {
        $("#btnLogin").html('<i class="fa fa-gear fa-spin"></i>&nbsp;Please Wait...');
        // $("#btnLogin").attr('disabled', true);

        let email = $("#txtEmail").val();
        let password = $("#txtPassword").val();
        let captcha = $("#txtCaptcha").val();

        $.ajax({
            url: "http://test.com:1025/api/userLogin.cfc?method=VerifyUser",

            type: "POST",
            data: { email: email, password: password },
            success: function (response) {
                const parser = new DOMParser();
                const xmlDoc = parser.parseFromString(response, "text/xml");

                // Extract the JSON string within the <string> tag
                const jsonString = xmlDoc.querySelector("string").textContent;

                // Parse the JSON string
                const jsonData = JSON.parse(jsonString);

                // Access the MESSAGE and STATUS properties
                const message = jsonData.MESSAGE;
                const status = jsonData.STATUS;

               
                if (status == 'Success') {
                    alert(message);
                    $("#txtEmail").val('');
                    $("#txtPassword").val('');

                    $("#btnLogin").html('Submit&nbsp;<i class="fa fa-arrow-circle-right fa-lg"></i>');
                    $("#btnLogin").removeAttr('disabled');
                    window.open("/listUsers.cfm", "_self");
                } else if (response.STATUS == 'Error') {
                    $("#btnLogin").html('Submit&nbsp;<i class="fa fa-arrow-circle-right fa-lg"></i>');
                    $("#btnLogin").removeAttr('disabled');
                    alert.warning(message);
                } else {
                    $("#btnLogin").html('Submit&nbsp;<i class="fa fa-arrow-circle-right fa-lg"></i>');
                    $("#btnLogin").removeAttr('disabled');
                    alert(message);
                }
            },
            error: function (response) {
                alert('Sorry! Something Went Wrong!!!');
            }
        });
    });
});