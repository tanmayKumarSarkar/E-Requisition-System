<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Buy_From_Item_Price.aspx.cs" Inherits="E_Requisition.Set_Item_Price" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<style type="text/css">
#header_div
{
	background:rgba(0,153,255,0.2); box-shadow:0 0 2px 2px rgba(0,51,102,0.5); width:508px; height:26px; padding-top:4px; margin-left:45px; margin-bottom:10px;
}
</style>

</head>
<body>
    <form id="form1" runat="server" >
    <div>
    
    </div>

    <asp:ScriptManager ID="MainScriptManager" runat="server" />
        <asp:UpdatePanel ID="pnlHelloWorld" runat="server">
            <ContentTemplate>
            <div id="header_div" align="center" 
                style="font-family: 'Comic Sans MS'; font-size: 16px; font-weight: normal">Buy Items From Vendors</div>

                <div style="height:250px; width:575px; overflow-y:auto;">
    <asp:GridView ID="GridView_Buy" runat="server" AutoGenerateColumns="False" style=" margin-left:50px;"
        CellPadding="5" CellSpacing="1" Font-Italic="True" Font-Names="Comic Sans MS" 
        Font-Size="Small" ForeColor="#333333" GridLines="None" Height="16px" 
        onrowcommand="GridView_Buy_RowCommand" 
        onrowdatabound="GridView_Buy_RowDataBound" Width="500px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="ID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("V_R_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("V_R_ID") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle Width="40px" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Item Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Item_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Item_Name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle Width="70px" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Vendor ID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Vendor_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Vendor_ID") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:ButtonField ButtonType="Button" CommandName="buy" Text="Buy" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:ButtonField>
            <asp:ButtonField ButtonType="Button" CommandName="buy_cancel" Text="Cancel" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:ButtonField>
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
    </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>
