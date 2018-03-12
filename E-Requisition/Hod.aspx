<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hod.aspx.cs" Inherits="E_Requisition.Hod" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> H.O.D </title>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
<style type="text/css">
    
html,body {
	margin:0;
	padding:0;
}
html{
    height: 100%;
	font-size: 100%; 
    -webkit-text-size-adjust: 100%; 
    -ms-text-size-adjust: 100%; 
}
body{ position:relative;
	  min-width: 1366px; min-width:678px;
	  background:url(images/background.jpg);
	  background-size: 1366px auto;
	  background-repeat: no-repeat;
      background-attachment: fixed;
	  height: 100%;
	  overflow-y: hidden;
	  overflow-x: hidden;
	  font-family:Tahoma, Geneva, sans-serif;
	  -webkit-user-select: none; 
	  cursor: default;
	  font-weight : 200;
	  padding-left: 30px;padding-top: 0px;
}
#header{
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 87px;
	background: -moz-linear-gradient(top,  rgba(0,0,0,0.8) 0%, rgba(0,0,0,0) 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0.8)), color-stop(100%,rgba(0,0,0,0))); 
	background: -webkit-linear-gradient(top,  rgba(0,0,0,0.8) 0%,rgba(0,0,0,0) 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top,  rgba(0,0,0,0.8) 0%,rgba(0,0,0,0) 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top,  rgba(0,0,0,0.8) 0%,rgba(0,0,0,0) 100%); /* IE10+ */
	background: linear-gradient(to bottom,  rgba(0,0,0,0.8) 0%,rgba(0,0,0,0) 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a6000000', endColorstr='#00000000',GradientType=0 ); /* IE6-9 */

	border-bottom: 2px solid rgba(160,250,248,1);
	color: white;
	padding-left: 10px;
	padding-top: 12px;
	font-size: 18px;
	}
#header_top{
	width: 100%;
	height: 55px;
	margin-top:-10px;
	margin-left:-10px;	
	border-bottom: 2px solid rgba(160,250,248,1);
	}
#my_account{
	background-color: rgba(189,124,70,0.8) /*#16B594 rgba(69,155,241,1)*/;
	padding-top: 10px;
	padding-bottom:10px;
	height: 22px;
	width: 132px;
	position: absolute;
	left: 1020px;
	top: 9px;	
	}
#my_account_left{
	position: absolute;
	top: 0px;
	left: -72px;
	width: 72px;
	height: 42px;
	background-color: rgba(189,124,70,0.8);
	background: -moz-linear-gradient(left, rgba(242,254,255,0) 0%, rgba(189,124,70,0.7) 85%, rgba(189,124,70,0.8) 100%);
	background: -webkit-linear-gradient(left,rgba(242,254,255,0) 0%, rgba(189,124,70,0.7) 85%, rgba(189,124,70,0.8) 100%);
	background: -0-linear-gradient(left,rgba(242,254,255,0) 0%, rgba(189,124,70,0.7) 85%, rgba(189,124,70,0.8) 100%);
	background: -ms-linear-gradient(left,rgba(242,254,255,0) 0%, rgba(189,124,70,0.7) 85%, rgba(189,124,70,0.8) 100%);
	background: linear-gradient(left,rgba(242,254,255,0) 0%, rgba(189,124,70,0.7) 85%, rgba(189,124,70,0.8) 100%);
	}
#my_account_right{
	position: absolute;
	top: 0px;
	left: 132px;
	width: 72px;
	height: 42px;
	background-color: rgba(189,124,70,0.8);
	background: -moz-linear-gradient(right, rgba(242,254,255,0) 0%, rgba(189,124,70,0.7) 85%, rgba(189,124,70,0.8) 100%);
	background: -webkit-linear-gradient(right,rgba(242,254,255,0) 0%, rgba(189,124,70,0.7) 85%, rgba(189,124,70,0.8) 100%);
	background: -0-linear-gradient(right,rgba(242,254,255,0) 0%, rgba(189,124,70,0.7) 85%, rgba(189,124,70,0.8) 100%);
	background: -ms-linear-gradient(right,rgba(242,254,255,0) 0%, rgba(189,124,70,0.7) 85%, rgba(189,124,70,0.8) 100%);
	background: linear-gradient(right,rgba(242,254,255,0) 0%, rgba(189,124,70,0.7) 85%, rgba(189,124,70,0.8) 100%);
	}		
#my_account:hover{
	text-shadow: 1px 1px rgba(117,117,117,1);
	box-shadow:0px 1px 1px -1px black;
	}		
#img_Actn_mnu{
	position: absolute;
	left: 104px;
	top: 8px;
	height: 28px;
	width: 30px;
	cursor:pointer;
	}	

#header_mid{
	width: 100%;
	height: 40px;
	margin-left:-10px;
	background-color: #16B594/*rgba(69,155,241,1)*/;
}
#main_body{
	position: absolute;
	top: 130px;
	left: 128px;
	width: 1090px;
	height: 435px;
	background-color: rgba(163,108,230,0.2);	
	color: white;
	padding-left: 10px;
	padding-top: 12px;
	font-size: 18px;
	
	-webkit-animation: bxshdw 5s infinite; 
    animation: bxshdw 5s infinite;
	}
	
@-webkit-keyframes bxshdw {
    50% {box-shadow: 0 0 5px 5px rgba(158,73,228,1);}
}

@keyframes bxshdw {
    50% {box-shadow: 0 0 5px 5px rgba(158,73,228,1);}
}
	
#main_body_center{
	margin-top:-10px;
	margin-left:-10px;
	width: 1090px;
	height: 435px;	
	}
#main_body_left{
	margin-top:10px;
	margin-left:15px;
	width: 350px;
	height: 425px;		
	float:left;
	}
#main_body_left_details{
	margin-top:0px;
	margin-left:0px;
	padding-top:2px;
	width: 348px;
	height: 213px;	
	background:url(images/bg.png) repeat scroll 0 0 #f3f4f4;
	border:1px solid #0099CC;
	box-shadow:0 0 3px 3px rgba(0,153,255,0.3);
	}	
#main_body_left_details_lbl{
	padding-top:5px;
	height:30px;
	background-color: rgba(69,155,241,1);
	text-align:center;
	box-shadow:0px 0px 1px 1px rgba(102,102,102,0.7);
	}	
#tab_details{
	position: absolute;
	width: 346px;
	left: 17px;
	top: 51px;
	height: 177px;
	color:rgba(140,4,191,1);
	font-size:16px;
	}
#main_body_left_buttons{
	margin-top:10px;
	margin-left:0px;
	padding-top:2px;
	width: 348px;
	height: 194px;
	background:url(images/bg.png) repeat scroll 0 0 #f3f4f4;
	border:1px solid #0099CC;
	box-shadow:0 0 3px 3px rgba(0,153,255,0.3);
	}
#btn_current_req,#btn_purchased_list,#btn_rejected_list,#btn_price_list{
	margin-top:15px;
	margin-left:88px;
	width:170px;
	height:30px;
	background:rgba(215,107,237,1);
	color:#fff;
	letter-spacing:2px;
	word-spacing:4px;
	cursor:pointer;
	border-radius:5px;
	box-shadow:1px 1px 3px 2px rgba(0,0,0,0.3);
	}	
#btn_current_req:hover,#btn_purchased_list:hover,#btn_rejected_list:hover,#btn_price_list:hover{
	background:rgba(255,102,102,1);
	color:#fff;
	text-shadow:1px 1px rgba(144,144,144,1);
	}
#main_body_right{
		margin-top:10px;
	margin-left:20px;
	width: 700px;
	height: 425px;	
	position:relative;
	float:left;
	background:url(images/body_bg.jpg) repeat-x scroll 0 0 #f3f4f4;
	background-color: rgba(255,255,255,1);}
#main_body_right_in{
   height :300px; width:600px; background:rgba(0,102,153,0.1); box-shadow:0 0 3px 3px rgba(0,0,51,0.2);
	 margin:45px; color:#003; font-size:18px; padding-left:5px; padding-top:5px;
    }		
#footer_btm{
	 position:absolute; left:0px; bottom:0px; text-align:center; 
	  color:#fff;
	  padding-top:5px;
	  height:30px; width:100%;
	  //background:#DB4DFF;
	  background: -moz-linear-gradient(top,  rgba(0,0,0,0.8) 0%, rgba(0,0,0,0) 100%); /* FF3.6+ */
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0.8)), color-stop(100%,rgba(0,0,0,0))); 
		background: -webkit-linear-gradient(top,  rgba(0,0,0,0.8) 0%,rgba(0,0,0,0) 100%); /* Chrome10+,Safari5.1+ */
		background: -o-linear-gradient(top,  rgba(0,0,0,0.8) 0%,rgba(0,0,0,0) 100%); /* Opera 11.10+ */
		background: -ms-linear-gradient(top,  rgba(0,0,0,0.8) 0%,rgba(0,0,0,0) 100%); /* IE10+ */
		background: linear-gradient(to bottom,  rgba(0,0,0,0.8) 0%,rgba(0,0,0,0) 100%); /* W3C */
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a6000000', endColorstr='#00000000',GradientType=0 ); /* IE6-9 */
 
	  border-top:1px solid white;
	}
#Xcess_logo {
	position: absolute;
	left: 30px;
	top: 45px;
	width: 200px;
	height: 65px;
	}
    
</style>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/alert_box.js" type="text/javascript"></script>
    <link href="Styles/alert_box.css" rel="stylesheet" type="text/css" />
</head>


<body>
    <form id="form_hod" runat="server">


            <div>
            <div id="header">
                <div id="header_top">
   	              <div id="my_account">
                      <div id="my_account_left"></div>
                      <div id="my_account_right"></div>
                        My Account <asp:ImageButton title="Log out" 
                          ImageUrl="images/exit.png" id="img_Actn_mnu" runat="server"  width="30" 
                          height="28" onclick="img_Actn_mnu_Click" />        
                  </div>
                </div>
                <div id="header_mid">
                <img src="images/Jtech.png" name="Xcess_logo" width="205" height="108" id="Xcess_logo" />
                </div>
            </div>



            <div id="main_body">

            <div id="main_body_center">
                <div id="main_body_left">
    
    	            <div id="main_body_left_details">
                    <div id="main_body_left_details_lbl">My Details</div>
        	            <table id="tab_details" border="0" cellspacing="0px" cellpadding="4px">
                          <tr>
                            <td width="124">NAME :</td>
                            <td width="206">&nbsp;<%= name %></td>
                          </tr>
                          <tr>
                            <td>Login ID :</td>
                            <td>&nbsp;<%= loginid%></td>
                          </tr>
                          <tr>
                            <td>DEPARTMENT :</td>
                            <td>&nbsp;<%= dept%></td>
                          </tr>
                          <tr>
                            <td>BUDGET :</td>
                            <td>&nbsp;<%= budget%></td>
                          </tr>
                          <tr>
                            <td>Ph. No. :</td>
                            <td>&nbsp;<%= phone%></td>
                          </tr>
                        </table>

   	              </div>
                    <div id="main_body_left_buttons">
                    <div id="dv_current_req">
                        
                            <input type ="button" value="Current Requests" id="btn_current_req" />
                    </div>
                    <div id="dv_price_list">   
                       
                            <input type ="button" value="Item Price List" id="btn_price_list" />
                    </div>
                    <div id="dv_ordered_list">
                        
                            <input type ="button" value="Purchased Items" id="btn_purchased_list" />
                    </div>
                    <div id="dv_rejected_list">
                        
                            <input type ="button" value="Rejected Items" id="btn_rejected_list" />
                    </div>                        
   		            </div>
    
                </div>

                
                <div id="main_body_right">
                <div id="main_body_right_in">
                <script type="text/javascript">
                    $("#main_body_right_in").load("Cur_Req.aspx");
                    $("#btn_current_req").click(function () {
                        $("#main_body_right_in").load("Cur_Req.aspx");
                    });
                    $("#btn_price_list").click(function () {
                        $("#main_body_right_in").load("Buy_From_Item_Price.aspx");
                    });
                    $("#btn_purchased_list").click(function () {
                        $("#main_body_right_in").load("Purchased_Item.aspx");
                    });
                    $("#btn_rejected_list").click(function () {
                        $("#main_body_right_in").load("Rejected_Item.aspx");
                    });
                    
                </script>
                </div>
                </div>
                



            </div>


            </div>



            <div id="footer">
                <div id="footer_btm">@JGEC Developers Project: E-Requisition
              </div>
            </div>
            </div>


    </form>
</body>
</html>
