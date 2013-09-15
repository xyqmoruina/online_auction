<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserCenter.aspx.cs" Inherits="nya.UserCenter" EnableEventValidation="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style2
        {
            text-align: right;
        }
        .style3
        {
            font-family: 微软雅黑;
            color: #FFFFFF;
        }
        .style4
        {
            font-family: 微软雅黑;
            font-size: medium;
            color: #FFFFFF;
        }
        .style5
        {
            color: #FFFFFF;
        }
        .style7
        {
            font-family: 微软雅黑;
            font-size: large;
            color: #000000;
        }
    </style>
</head>
<body style="font-size: medium" background="2.gif">
    <form id="form1" runat="server" defaultbutton="SearchButton">
    <div class="style2" 
        
        style="background-color: #0D7BD5; width: 1350px; margin-left: 0px; height: 50px; margin-top: 0px;">
    
        <asp:Image ID="Logo" runat="server" Height="50px" ImageAlign="Left" 
            Width="50px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<span class="style5"> </span><span class="style3">喵,</span><asp:Label 
            ID="urname" runat="server" CssClass="style3"></asp:Label>
        <span class="style3">!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" BackColor="#0D7BD5" 
            BorderColor="#0066FF" BorderStyle="Solid" onclick="Button1_Click" 
            style="color: #FFFFFF; font-size: medium" Text="账户充值" TabIndex="7" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span>
        <asp:Button ID="UserPocket" runat="server" Height="30px" Text="我的物品" 
            Width="100px" TabIndex="3" onclick="UserPocket_Click" BackColor="#0D7BD5" 
            BorderColor="#0066FF" BorderStyle="Solid" CssClass="style4" />
        <span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;
        </span>
        <asp:Button ID="Info" runat="server" Height="30px" onclick="Info_Click" 
            Text="个人信息" Width="100px" TabIndex="4" BackColor="#0D7BD5" 
            BorderColor="#0066FF" BorderStyle="Solid" CssClass="style4" />
        <span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; </span>
        <asp:Button ID="SaleButton" runat="server" Height="30px" 
            onclick="SaleButton_Click" Text="上架商品" Width="100px" TabIndex="5" 
            BackColor="#0D7BD5" BorderColor="#0066FF" BorderStyle="Solid" 
            CssClass="style4" />
        <span class="style3">&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;<asp:Button ID="LogOut" runat="server" Height="30px" Text="注销" Width="50px" 
            onclick="LogOut_Click" TabIndex="6" BackColor="#0D7BD5" 
            BorderColor="#0066FF" BorderStyle="Solid" CssClass="style4" />
        &nbsp;&nbsp;&nbsp; </span>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</div>
         <div>
             <br />
             <br />
             <br />&nbsp;<span class="style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="newOrder" runat="server" CssClass="style4" ForeColor="Black" 
            onclick="newOrder_Click" Text="有新的未处理订单喵~" BackColor="#0D7BD5" 
                 BorderColor="#0066FF" BorderStyle="Solid" Height="30px" Width="179px" />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 搜索商品:&nbsp;
             </span>
             <asp:TextBox ID="SearchBox" runat="server" Height="28px" Width="500px" 
            
            style="margin-top: 0px; margin-bottom: 0px; text-align: left;" 
                 CssClass="style7" TabIndex="1"></asp:TextBox>
             <span class="style7">&nbsp;&nbsp;
        </span>
             <asp:Button ID="SearchButton" runat="server" Height="30px" Text="喵！" 
            Width="78px" onclick="SearchButton_Click" CssClass="style7" BackColor="#0D7BD5" 
                 BorderColor="#0066FF" BorderStyle="Solid" TabIndex="2" />
             <br />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Label ID="Label1" runat="server" 
                 style="text-align: center; font-family: 微软雅黑; font-size: x-large" Text="无搜索结果" 
                 Visible="False"></asp:Label>
             <br />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <br />
    </div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" Height="223px" HorizontalAlign="Center" 
        Width="800px" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        style="text-align: center" DataKeyNames="goodnum" 
        onrowcreated="GridView1_RowCreated" onrowdatabound="GridView1_RowDataBound1" 
        onselectedindexchanging="GridView1_SelectedIndexChanging">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="goodnum" HeaderText="商品编号" 
                SortExpression="goodnum" ReadOnly="True" />
            <asp:BoundField DataField="goodname" HeaderText="商品名称" 
                SortExpression="goodname" />
            <asp:BoundField DataField="variety" HeaderText="商品类别" 
                SortExpression="variety" />
            <asp:BoundField DataField="description" HeaderText="商品描述" 
                SortExpression="description" />
            <asp:BoundField DataField="currentprice" HeaderText="现价" 
                SortExpression="currentprice" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:userConnectionString %>" 
        
        
        
        
        
        SelectCommand="SELECT goodnum, goodname, variety, description, currentprice FROM goods WHERE ((description LIKE '%' + @description + '%') AND (issaled &lt;&gt; 1 OR issaled IS NULL)) OR ((issaled &lt;&gt; 1 OR issaled IS NULL) AND (goodname LIKE '%' + @goodname + '%')) OR ( (issaled &lt;&gt; 1 OR issaled IS NULL) AND (variety LIKE '%' + @variety + '%')) ORDER BY goodname, variety, description" 
        onselecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:ControlParameter ControlID="SearchBox" Name="description" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="SearchBox" Name="goodname" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="SearchBox" Name="variety" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <p>
        &nbsp;</p>
    </form>
</body>
</html>
