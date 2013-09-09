<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyGoods.aspx.cs" Inherits="nya.MyGoods" EnableEventValidation="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


        .style1
        {
            font-family: 微软雅黑;
            color: #FFFFFF;
            text-align: center;
        }
        .style3
        {
            font-size: medium;
        }
        .style4
        {
            font-family: 微软雅黑;
            color: #FFFFFF;
            text-align: center;
            font-size: medium;
        }
        .style5
        {
            font-family: 微软雅黑;
            font-size: x-large;
        }
        #form1
        {
            text-align: center;
        }
    </style>
</head>
<body background="4.gif">
    <form id="form1" runat="server">
    <div>
    
    <p style="text-align: right; height: 50px; width: 1350px; background-color: #0D7BD5; margin-top: 0px; margin-left: 0px;">
    
        <span class="style1">
    
        <asp:Image ID="Logo" runat="server" Height="50px" ImageAlign="Left" 
            Width="50px" style="margin-left: 0px" />
        <span class="style3">喵，</span></span><asp:Label ID="username" 
            runat="server" CssClass="style4"></asp:Label>
        <span class="style1" style="width: 1350px; left: 0px"><span class="style3">!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" BackColor="#0D7BD5" 
            BorderColor="#0066FF" BorderStyle="Solid" Height="30px" onclick="Button3_Click" 
            style="font-family: 微软雅黑; color: #FFFFFF; margin-left: 0px;" Text="我的订单" 
            Width="90px" CssClass="style3" />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
        </span>
        <asp:Button ID="Button2" runat="server" BackColor="#0D7BD5" 
            BorderColor="#0066FF" BorderStyle="Solid" Height="30px" onclick="Button2_Click" 
            style="font-family: 微软雅黑; color: #FFFFFF; margin-left: 0px;" Text="用户中心" 
            Width="90px" CssClass="style3" />
        <span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; </span>
        <asp:Button ID="Button1" runat="server" Height="30px" 
            Text="注销" onclick="Button1_Click" BackColor="#0D7BD5" 
            BorderColor="#0066FF" BorderStyle="Solid" CssClass="style4" Width="50px" />
    
        <span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</span>&nbsp;</span></p>
    
    </div>
    <p style="text-align: center">
        <asp:Label ID="nogood" runat="server" 
            style="font-family: 微软雅黑; font-size: x-large" Text="没有物品" Visible="False"></asp:Label>
    </p>
    <p style="text-align: center">
        <span class="style5">
        <asp:Label ID="Label1" runat="server" Text="竞拍的宝贝"></asp:Label>
        </span><asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None" Height="242px" HorizontalAlign="Center" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" Width="748px" 
            DataKeyNames="goodnum" onrowdatabound="GridView1_RowDataBound">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="goodnum" HeaderText="商品编号" 
                    SortExpression="goodnum" ReadOnly="True" />
                <asp:BoundField DataField="variety" HeaderText="商品类别" 
                    SortExpression="variety" />
                <asp:BoundField DataField="description" HeaderText="商品描述" 
                    SortExpression="description" />
                <asp:BoundField DataField="goodname" HeaderText="商品名称" 
                    SortExpression="goodname" />
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
            
            
            SelectCommand="SELECT [goodnum], [variety], [description], [goodname] FROM [goods] WHERE ([nowhighest] = @nowhighest) AND  (issaled &lt;&gt; 1 OR  issaled IS NULL)">
            <SelectParameters>
                <asp:SessionParameter Name="nowhighest" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p class="style5" style="text-align: center">
        <asp:Label ID="Label2" runat="server" Text="上架的宝贝"></asp:Label>
    </p>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" 
        Height="242px" HorizontalAlign="Center" 
        onselectedindexchanged="GridView2_SelectedIndexChanged" Width="748px" 
        style="text-align: center" DataKeyNames="goodnum" 
        onrowdatabound="GridView2_RowDataBound">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="goodnum" HeaderText="商品编号" 
                SortExpression="goodnum" ReadOnly="True" />
            <asp:BoundField DataField="goodname" HeaderText="商品名称" 
                SortExpression="goodname" />
            <asp:BoundField DataField="bottomprice" HeaderText="底价" 
                SortExpression="bottomprice" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:userConnectionString %>" 
        
        
        
        SelectCommand="SELECT goodnum, goodname, bottomprice, currentprice FROM goods WHERE (mail = @mail)">
        <SelectParameters>
            <asp:SessionParameter Name="mail" SessionField="username" Type="String" 
                DefaultValue="0000" />
        </SelectParameters>
    </asp:SqlDataSource>
    &nbsp;<asp:Label ID="Label3" runat="server" 
        style="font-family: 微软雅黑; font-size: x-large" Text="已买到的物品"></asp:Label>
    <asp:GridView ID="GridView3" 
        runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="goodnum" DataSourceID="SqlDataSource3" 
        ForeColor="#333333" GridLines="None" Height="242px" HorizontalAlign="Center" 
        onselectedindexchanged="GridView3_SelectedIndexChanged" Width="748px" 
        onrowdatabound="GridView3_RowDataBound">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="goodnum" HeaderText="商品编号" ReadOnly="True" 
                SortExpression="goodnum" />
            <asp:BoundField DataField="goodname" HeaderText="商品名称" 
                SortExpression="goodname" />
            <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
            <asp:BoundField DataField="address" HeaderText="地址" 
                SortExpression="address" />
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:userConnectionString %>" 
        SelectCommand="SELECT goods.goodnum, goods.goodname, [order].address, [order].price FROM goods INNER JOIN [order] ON goods.goodnum = [order].goodnum WHERE ([order].consumer = @consumer) AND ([order].state = 1 OR [order].state = 2)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0000" Name="consumer" 
                SessionField="username" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
