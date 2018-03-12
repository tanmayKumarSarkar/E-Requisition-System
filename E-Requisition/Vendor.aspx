<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vendor.aspx.cs" Inherits="E_Requisition.Vendor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Vendor </title>

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
	width: 335px;
	left: 24px;
	top: 75px;
	height: 136px;
	color: rgba(140,4,191,1);
	font-size: 16px;
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
#btn_sold_list,#btn_requested_list{
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
#btn_sold_list:hover,#btn_requested_list:hover{
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
	  
	  background: -moz-linear-gradient(top,  rgba(0,0,0,0.8) 0%, rgba(0,0,0,0) 100%); /* FF3.6+ */
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0.8)), color-stop(100%,rgba(0,0,0,0))); 
		background: -webkit-linear-gradient(top,  rgba(0,0,0,0.8) 0%,rgba(0,0,0,0) 100%); /* Chrome10+,Safari5.1+ */
		background: -o-linear-gradient(top,  rgba(0,0,0,0.8) 0%,rgba(0,0,0,0) 100%); /* Opera 11.10+ */
		background: -ms-linear-gradient(top,  rgba(0,0,0,0.8) 0%,rgba(0,0,0,0) 100%); /* IE10+ */
		background: linear-gradient(to bottom,  rgba(0,0,0,0.8) 0%,rgba(0,0,0,0) 100%); /* W3C */
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a6000000', endColorstr='#00000000',GradientType=0 ); /* IE6-9 */
 
	  border-top:1px solid white;
	}	
	#Order_Price_show{
	height:300px; width:580px; background:rgba(0,102,153,0.1); box-shadow:0 0 3px 3px rgba(0,0,51,0.2);
	 margin:45px; color:#003; font-size:18px; padding-left:30px; padding-top:30px;
	}	
.textbox_css
{
	width:200px; height:25px;
	border-radius:4px; padding-left:10px;
	border:1px solid #d1c7ac;
	color:#333333;
	background-image:url(images/form_bg.jpg);
	background-repeat:repeat-x;	
}	
#header_div
{
	background:rgba(0,153,255,0.2); box-shadow:0 0 2px 2px rgba(0,51,102,0.5); width:557px; height:26px; padding-top:4px; margin-bottom:10px;
}
.btn_show
{
	background:rgb(0,153,204); color:#fff; border:1px solid #069; cursor:pointer; height:27px;
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
 
 
<form id="form_vendor" runat="server">
<div>    
    <div id="header">
    <div id="header_top">
   	  <div id="my_account">
          <div id="my_account_left"></div>
          <div id="my_account_right"></div>
          My Account <asp:ImageButton title="Click here to logout !" 
              runat="server" ImageUrl="images/exit.png" ID="img_Actn_mnu" width="30" 
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
                <td>Ph. No. :</td>
                <td>&nbsp;<%= phone %></td>
              </tr>
            </table>

   	  </div>
        <div id="main_body_left_buttons">
        <div id="dv_requested_list">
            <asp:Button runat="server" id="btn_requested_list" onclick="Cancel_btn_Click"  
                Text="Request Lists" />
        </div>
        <div id="dv_sold_list">
            <asp:Button runat="server" id="btn_sold_list"  Text="Sold Items" 
                onclick="btn_sold_list_Click" />
        </div>   
   		</div>
    
    </div>
    <div id="main_body_right">
    
    <div id="Order_Price_show">	  
        <div id="Set_price_form" runat="server" class="ans_class">
        	 <div id="header_div" align="center" 
                style="font-family: 'Comic Sans MS'; font-size: 16px; font-weight: normal">Request List</div>

                <div style="height:250px; width:575px; overflow-y:auto;">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                CellPadding="3" GridLines="Horizontal" Height="16px" 
                Width="553px" onrowdatabound="GridView2_RowDataBound" Font-Names="Comic Sans MS" 
                Font-Size="Small" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" 
                BorderWidth="1px" onrowcommand="GridView2_RowCommand">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Req_ID") %>'></asp:Label>
                        </ItemTemplate>
                        <ControlStyle Width="10px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Item_Name") %>'></asp:Label>
                        </ItemTemplate>
                        <ControlStyle Width="50px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:Buttonfield ButtonType="Button" CommandName="set_price" Text="Set Price" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:Buttonfield>
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            </div>
        </div>
    
    	<div id="Set_items_Prices" style="display:none;" runat="server" class="ans_class">
            <div id="header_div" align="center" 
                style="font-family: 'Comic Sans MS'; font-size: 16px; font-weight: normal">Set Item Price</div>
        	
            <asp:Table ID="Show_Request" runat="server" Font-Names="Comic Sans MS" 
                Font-Size="Small" Height="200px" Width="453px" HorizontalAlign="Center">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Request Id :</asp:TableCell>
                    <asp:TableCell runat="server">&nbsp;<%= Session["req_id_now"].ToString()%></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Item :</asp:TableCell>
                    <asp:TableCell runat="server">&nbsp;<%= Session["item_name"].ToString() %></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Quantity :</asp:TableCell>
                    <asp:TableCell runat="server">&nbsp;<%= Session["quantity"].ToString()%></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Date :</asp:TableCell>
                    <asp:TableCell runat="server">&nbsp;<%= Session["req_date"].ToString()%></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Set Price :</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox runat="server" CssClass="textbox_css" ID="Item_price" placeholder="Type your price"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        	 <asp:Button ID="Submit_price_Data" CssClass="btn_show" Text="Set Price" runat="server" 
                Font-Bold="True" Font-Names="Comic Sans MS" onclick="Submit_price_Data_Click" 
                style="z-index: 1; left: 230px; top: 329px; width: 110px; position: absolute"/>

                <asp:Button ID="btn_back" CssClass="btn_show" Text="Cancel" runat="server" 
                Font-Bold="True" Font-Names="Comic Sans MS" onclick="Cancel_btn_Click" 
                style="z-index: 1; left: 350px; top: 329px; position: absolute; width: 110px;"/>
        	
        </div>
    	<div id="Sold_items"  style="display:none;" runat="server"  class="ans_class">
        
        <div id="header_div" align="center" 
                style="font-family: 'Comic Sans MS'; font-size: 16px; font-weight: normal">Total Sold Items</div>
        
        <div style="height:250px; width:580px; overflow-y:auto;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" Height="16px" Width="556px" Font-Names="Comic Sans MS" 
                        Font-Size="Small" onrowdatabound="GridView1_RowDataBound" 
                ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Order">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("O_ID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("O_ID") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Request">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Req_ID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Req_ID") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Item">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Item") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Item") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
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

</body>
</html>
