<!-- login.cfm -->
<cfinclude template="../asset/cdn_links.cfm">

<cfoutput>
  <div class="container">
    
  </div>
</cfoutput>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Demo App.</title>
  <script src="user_js/login.js"></script>
</head>
<body class="bg-info">
    <div class="container">
        <br>
        <div class="row">
            <div class="form-group">
                <label class="col-lg-12 col-md-12 col-sm-12 col-xs-12 required text-white" for="txtEmail">Email :&nbsp;<span class="text-danger">*</span></label>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <input class="form-control" type="text" name="txtEmail" id="txtEmail" placeholder="Enter Email Address" autocomplete="off"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-12 col-md-12 col-sm-12 col-xs-12 required text-white" for="txtEmail">Password :&nbsp;<span class="text-danger">*</span></label>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <input class="form-control" type="password" name="txtPassword" id="txtPassword" placeholder="Enter Password" autocomplete="off"/>
                </div>
            </div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 align-right">
                <button id="btnLogin" class="btn btn-dark">Login <i class="fa fa-arrow-circle-right fa-lg"></i></button>
            </div>
        </div>
    </div>
</body>
</html>