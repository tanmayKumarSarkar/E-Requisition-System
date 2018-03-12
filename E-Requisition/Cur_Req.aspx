<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cur_Req.aspx.cs" Inherits="E_Requisition.Cur_Req" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
#header_div
{
	background:rgba(0,153,255,0.2); box-shadow:0 0 2px 2px rgba(0,51,102,0.5); width:595px; height:26px; padding-top:4px; margin-left:0px; margin-bottom:10px;
}
</style>
</head>
<body>
    <form id="form_cur_req" runat="server">
    <div>
    
    </div>

    <asp:ScriptManager ID="MainScriptManager" runat="server" />
        <asp:UpdatePanel ID="pnlHelloWorld" runat="server">
            <ContentTemplate>
            <div id="header_div" align="center" 
                style="font-family: 'Comic Sans MS'; font-size: 16px; font-weight: normal">Current Requests</div>
               
                <div style="height:250px; width:620px; overflow-y:scroll;">
    <asp:GridView ID="GridView_Cur_Req" runat="server" AutoGenerateColumns="False" 
        CellPadding="3" ForeColor="#333333" GridLines="None" Height="16px" 
        onrowcommand="GridView_Cur_Req_RowCommand" 
        onselectedindexchanged="GridView_Cur_Req_SelectedIndexChanged" 
        Width="595px" BorderColor="#006600" BorderStyle="None" 
        Font-Italic="True" Font-Names="Comic Sans MS" Font-Size="Small" 
        onrowdatabound="GridView_Cur_Req_RowDataBound">
        <AlternatingRowStyle BackColor="White" Font-Italic="True" 
            Font-Names="Comic Sans MS" Font-Size="Small" />
        <Columns>
            <asp:TemplateField HeaderText="Emp ID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Emp_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Emp_ID") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle Width="50px" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Item">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Item_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Item_Name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle Width="45px" />
                <ItemStyle Height="15px" HorizontalAlign="Center" Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle Width="170px" />
                <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle Width="75px" />
                <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:ButtonField ButtonType="Button" CommandName="Proceed" Text="Proceed" />
            <asp:ButtonField ButtonType="Button" CommandName="req_cancel" Text="Cancel" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <EmptyDataTemplate>
            <asp:Button ID="Button1" runat="server" CommandName="Proceed" Text="Button" />
        </EmptyDataTemplate>
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
    </ContentTemplate>
        </asp:UpdatePanel>
     


    </form>
</body>
</html>
