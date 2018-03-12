<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="E_Requisition.Employee" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Employee </title>

    <style>

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
#btn_reqsn_frm,#btn_ordered_list{
	margin-top:35px;
	margin-left:88px;
	width:170px;
	height:40px;
	background:rgba(215,107,237,1);
	color:#fff;
	letter-spacing:2px;
	word-spacing:4px;
	cursor:pointer;
	border-radius:5px;
	box-shadow:1px 1px 5px 2px rgba(0,0,0,0.3);
	}	
#btn_reqsn_frm:hover,#btn_ordered_list:hover{
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
	background-color: rgba(255,255,255,1);
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
	
#requisition_form_box{
	height:300px; width:580px; background:rgba(0,102,153,0.1); box-shadow:0 0 3px 3px rgba(0,0,51,0.2);
	 margin:45px; color:#003; font-size:18px; padding-left:30px; padding-top:30px;
	}		
.text_box_style{ 
	margin-left:10px; height:25px;
	width:250px; ;
	border-radius:4px; padding-left:10px;
	border:1px solid #d1c7ac;
	color:#333333;
	background-image:url(../images/form_bg.jpg);
	background-repeat:repeat-x;}
.req_submit_btn{
	margin-top:20px;
  width:160px; height:30px;
  background:#FF6666;
  font-size:16px;
  color: #ffffff;
  border-radius: 5px;
  -moz-border-radius: 5px;
  -webkit-border-radius: 5px;
  border: 1px solid #C6C;
  cursor: pointer;
  box-shadow: 0 1px 0 rgba(255, 255, 255, 0.5) inset;
  -moz-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.5) inset;
  -webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.5) inset;}
 #header_div
{
	background:rgba(0,153,255,0.2); box-shadow:0 0 2px 2px rgba(0,51,102,0.5); width:557px; height:26px; padding-top:4px; margin-bottom:10px;
}
#Xcess_logo {
	position: absolute;
	left: 30px;
	top: 45px;
	width: 200px;
	height: 65px;
	}
</style>
<script type="text/javascript">
function showonlyone(thechosenone) {
	
      var ans_class = document.getElementsByTagName("div");
            for(var x=0; x<ans_class.length; x++) {
                  name = ans_class[x].getAttribute("class");
                  if (name == 'ans_class') {
                        if (ans_class[x].id == thechosenone) {
                        ans_class[x].style.display = 'block';
                  }
                  else {
                        ans_class[x].style.display = 'none';
                  }
            }
      }
}
</script>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/alert_box.js" type="text/javascript"></script>
    <link href="Styles/alert_box.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form_employee" runat="server">



   <div>
    
    <div id="header">
    <div id="header_top">
    
   	  <div id="my_account">
          <div id="my_account_left"></div>
          <div id="my_account_right"></div>
            My Account 
          <asp:ImageButton title="Click here to logout !" 
              runat="server" ImageUrl="images/exit.png" id="img_Actn_mnu" width="30px" 
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
                <td>&nbsp;<%= loginid %></td>
              </tr>
              <tr>
                <td>DEPARTMENT :</td>
                <td>&nbsp;<%= dept %></td>
              </tr>
              <tr>
                <td>Ph. No. :</td>
                <td>&nbsp;<%= phone %></td>
              </tr>
            </table>

   	  </div>
        <div id="main_body_left_buttons">
        <div id="dv_reqsn_frm">
            <asp:Button runat="server" id="btn_reqsn_frm" onclick="requisition_form_click" text="Requisition Form" />
        </div>
        <div id="dv_purchased_list">
            <asp:Button runat="server" onclick="requested_items_click" 
                id="btn_ordered_list" text="Ordered Items" />
        </div>            
   		</div>
    
    </div>
   
    <div id="main_body_right">
    	
        <div id="requisition_form_box">
       		<div runat="server" id="requisition_form" style="display:none;"  class="ans_class">

            <div id="header_div" align="center" 
                style="font-family: 'Comic Sans MS'; font-size: 16px; font-weight: normal">Request For A Item</div>

        	Item Name &nbsp;&nbsp;<asp:TextBox runat="server" ID="Item_Name" CssClass="text_box_style"></asp:TextBox><br /><br />
            Item Quantity<asp:TextBox runat="server" ID="Item_Quantity" CssClass="text_box_style"></asp:TextBox>    <br /><br />
            <asp:Button runat="server" ID="req_form_submit" CssClass="req_submit_btn" 
                Text="Submit Request" title="Click here to Submit" 
                onclick="req_form_submit_Click"></asp:Button>    
        	</div>
            <div runat="server" id="requested_items" class="ans_class">
            
            <div id="header_div" align="center" 
                style="font-family: 'Comic Sans MS'; font-size: 16px; font-weight: normal">Requested Items and Its Status</div>
                
                <div style="height:250px; width:575px; overflow-y:auto;">
            	    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" Height="16px" Width="556px" Font-Names="Comic Sans MS" 
                        Font-Size="Medium" onrowdatabound="GridView1_RowDataBound">
        <Columns>
            <asp:TemplateField HeaderText="id">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Req_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Req_ID") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Item">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Item_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Item_Name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="Status" HeaderText="Status" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
       
    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</div>

 </form>

<div id="footer">
    <div id="footer_btm">@JGEC Developers Project: E-Requisition
  </div>
</div>

   </div>



    
</body>
</html>
