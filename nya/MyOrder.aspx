<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyOrder.aspx.cs" Inherits="nya.MyOrder" EnableEventValidation="false"%>

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
            style="font-family: 微软雅黑; color: #FFFFFF; margin-left: 0px;" Text="我的物品" 
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
    <asp:Label ID="Label1" runat="server" 
        style="text-align: center; font-family: 微软雅黑; font-size: x-large" Text="没有订单" 
        Visible="False"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" 
        style="font-family: 微软雅黑; font-size: x-large" Text="买到的物品订单"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="ordernum,goodnum" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" Height="242px" HorizontalAlign="Center" 
        onrowdatabound="GridView1_RowDataBound" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" Width="748px" 
        AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ordernum" HeaderText="订单号" ReadOnly="True" 
                SortExpression="ordernum" />
            <asp:BoundField DataField="goodnum" HeaderText="商品编号" ReadOnly="True" 
                SortExpression="goodnum" />
            <asp:BoundField DataField="goodname" HeaderText="商品名称" 
                SortExpression="goodname" />
            <asp:BoundField DataField="price" HeaderText="成交价格" SortExpression="price" />
            <asp:BoundField DataField="address" HeaderText="收货地址" 
                SortExpression="address" />
            <asp:BoundField DataField="saler" HeaderText="卖家" SortExpression="saler" />
            <asp:BoundField DataField="state" HeaderText="订单状态" SortExpression="state" />
            <asp:BoundField DataField="deadline" HeaderText="订单生成时间" 
                SortExpression="deadline" />
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
        SelectCommand="SELECT goods.goodname, [order].price, [order].address, [order].saler, [order].state, goods.deadline, [order].ordernum, goods.goodnum FROM goods INNER JOIN [order] ON goods.goodnum = [order].goodnum WHERE ([order].consumer = @consumer)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0000" Name="consumer" 
                SessionField="username" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="Label3" runat="server" 
        style="font-family: 微软雅黑; font-size: x-large" Text="卖出的物品订单"></asp:Label>
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="ordernum,goodnum" DataSourceID="SqlDataSource2" 
        ForeColor="#333333" GridLines="None" Height="242px" HorizontalAlign="Center" 
        onrowdatabound="GridView2_RowDataBound" 
        onselectedindexchanged="GridView2_SelectedIndexChanged" Width="748px" 
        AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ordernum" HeaderText="订单号" ReadOnly="True" 
                SortExpression="ordernum" />
            <asp:BoundField DataField="goodnum" HeaderText="商品编号" ReadOnly="True" 
                SortExpression="goodnum" />
            <asp:BoundField DataField="goodname" HeaderText="商品名称" 
                SortExpression="goodname" />
            <asp:BoundField DataField="price" HeaderText="成交价格" SortExpression="price" />
            <asp:BoundField DataField="address" HeaderText="收货地址" 
                SortExpression="address" />
            <asp:BoundField DataField="consumer" HeaderText="买家" 
                SortExpression="consumer" />
            <asp:BoundField DataField="state" HeaderText="订单状态" SortExpression="state" />
            <asp:BoundField DataField="deadline" HeaderText="订单生成时间" 
                SortExpression="deadline" />
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
        SelectCommand="SELECT goods.goodname, [order].consumer, [order].address, [order].state, [order].price, goods.deadline, [order].ordernum, goods.goodnum FROM goods INNER JOIN [order] ON goods.goodnum = [order].goodnum WHERE ([order].saler = @saler)">
        <SelectParameters>
            <asp:SessionParameter Name="saler" SessionField="username" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
