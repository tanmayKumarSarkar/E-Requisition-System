<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="E_Requisition.Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>E-Requisition System : Login</title>
<link href="Styles/home.css" rel="stylesheet" type="text/css" />
<style type="text/css">
</style>
<script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
    document.getElementById("hidden_val").value = "employee";

       function login_fun() {
       if (document.getElementById("user_select").checked == true) { document.getElementById("hidden_val").value = "vendor"; }
       else { document.getElementById("hidden_val").value = "employee"; }

	   }
</script>
    <script src="Scripts/alert_box.js" type="text/javascript"></script>
    <link href="Styles/alert_box.css" rel="stylesheet" type="text/css" />

</head>

<body>
<div id="header_top"> 
	<img src="images/Jtech.png" name="Xcess_logo" width="205" height="108" id="Xcess_logo" />
	<div id = "wlcm_msg">
        <div class="Header_text">
            <span class="title">Welcome to Jgec-tech</span>
            <span class="text">elevation of technology</span>
        </div>
     </div>
</div>
<form id="login_form_box" runat="server">
<div id="main_body">
        <asp:HiddenField ID="hidden_val" runat="server" />
        <asp:Literal id="myLiteral" runat="server" />
	<div id="Login_box_holder">
    	<div id="login_form">
        	<div id="login_form_header">
            	Login Form
            </div>
            <div id="login_form_box">
            	<asp:TextBox runat="server" class="login_texbox" required placeholder="UserName" id="User_name" title="Type your LoginID"></asp:TextBox>
                <asp:TextBox class="login_texbox" runat="server" required TextMode="password" placeholder="Password" id="User_password" title="Type your Secret Password"></asp:TextBox>
                <div id="Select_user_type">
                  <m>Employee</m>
                  <label><input type="checkbox" ID="user_select" runat="server" onchange="login_fun()" class="ios-switch bigswitch" /><div><div></div></div></label>
                  <n>Vendor</n>
                </div>
                <asp:Button runat="server" class="login_button" Text="Sign In" 
                    title="Click here to login" ID="login_button" onclick="login_button_Click" />
            </div>
        </div>
    </div>
</div>
</form>
<div id="footer_btm">@JGEC Developers Project: E-Requisition </div>
</body>
</html>

