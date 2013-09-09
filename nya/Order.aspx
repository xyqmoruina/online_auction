<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="nya.WebForm8" EnableEventValidation="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style1
        {
            font-size: large;
            font-family: 微软雅黑;
            width: 665px;
            height: 731px;
            margin-bottom: 0px;
            margin-left: 127px;
        }
        .style5
        {
            color: #FFFFFF;
        }
        .style4
        {
            text-align: right;
            height: 50px;
            background-color: #0D7BD5;
            width: 963px;
            margin-left: 0px;
        }
        .style6
        {
            font-size: x-large;
            font-family: 微软雅黑;
            text-align: center;
        }
        #form1
        {
            text-align: center;
        }
        .style7
        {
        }
        .style8
        {
            font-family: 微软雅黑;
            font-size: x-large;
        }
        </style>
</head>
<body background="4.gif">
    <form id="form1" runat="server" >
    <div>
    
    <div class="style4" style="width: 1350px">
    
        <asp:Image ID="Logo" runat="server" Height="50px" ImageAlign="Left" 
            Width="50px" />
        <span class="style5"><span class="style1">喵，<asp:Label ID="urname" 
            runat="server" CssClass="style5"></asp:Label>
        !&nbsp; &nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" BackColor="#0D7BD5" 
            BorderColor="#0066FF" BorderStyle="Solid" Height="30px" onclick="Button2_Click" 
            style="font-family: 微软雅黑; color: #FFFFFF; font-size: medium;" Text="用户中心" 
            Width="90px" />
        </span>&nbsp;&nbsp; </span>
        <asp:Button ID="Button1" runat="server" Height="30px" style="text-align: center; font-family: 微软雅黑; color: #FFFFFF; font-size: medium;" 
            Text="注销" onclick="Button1_Click" BackColor="#0D7BD5" 
            BorderColor="#0066FF" BorderStyle="Solid" Width="50px" />
    
    &nbsp;&nbsp;&nbsp;&nbsp;
    
    </div>
    
    </div>
    <p class="style6" id="sty1">
        <asp:Label ID="Label4" runat="server" Text="没有需要处理的订单" Visible="False"></asp:Label>
    </p>
    <p class="style6">
        <asp:Label ID="Label1" runat="server" Text="填写以下订单的地址以使订单生效"></asp:Label>
    </p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" Height="225px" HorizontalAlign="Center" 
        style="text-align: center" Width="813px" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        DataKeyNames="ordernum,goodnum" onrowdatabound="GridView1_RowDataBound" 
        AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ordernum" HeaderText="订单号" ReadOnly="True" 
                SortExpression="ordernum" />
            <asp:BoundField DataField="goodnum" HeaderText="商品编号" 
                SortExpression="goodnum" ReadOnly="True" />
            <asp:BoundField DataField="goodname" HeaderText="商品名称" 
                SortExpression="goodname" />
            <asp:BoundField DataField="price" HeaderText="商品价格" SortExpression="price" />
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
        SelectCommand="SELECT [order].ordernum,goods.goodnum, goods.goodname, [order].price FROM goods INNER JOIN [order] ON goods.goodnum = [order].goodnum WHERE ([order].consumer = @consumer) and [order].state = 0">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0000" Name="consumer" 
                SessionField="username" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <span class="style7">
    <asp:Label ID="Label2" runat="server" 
        style="font-family: 微软雅黑; font-size: x-large" Text="下列订单等待您发货"></asp:Label>
    <br />
    <asp:GridView ID="GridView2" runat="server" Height="225px" 
        HorizontalAlign="Center" Width="813px" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="ordernum" 
        DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="GridView2_SelectedIndexChanged" 
        onrowdatabound="GridView2_RowDataBound" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ordernum" HeaderText="订单编号" ReadOnly="True" 
                SortExpression="ordernum" />
            <asp:BoundField DataField="goodname" HeaderText="商品名称" 
                SortExpression="goodname" />
            <asp:BoundField DataField="consumer" HeaderText="买家" 
                SortExpression="consumer" />
            <asp:BoundField DataField="address" HeaderText="收货地址" 
                SortExpression="address" />
            <asp:BoundField DataField="price" HeaderText="成交价格" SortExpression="price" />
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
        
        SelectCommand="SELECT [order].ordernum, goods.goodname, [order].consumer, [order].address, [order].price FROM goods INNER JOIN [order] ON goods.goodnum = [order].goodnum WHERE (goods.mail = @mail) AND ([order].state = 1)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0000" Name="mail" SessionField="username" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="Label3" runat="server" 
        style="font-family: 微软雅黑; font-size: x-large" Text="下列订单等待您确认收货"></asp:Label>
    </span>
    <asp:GridView ID="GridView3" 
        runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="ordernum" DataSourceID="SqlDataSource3" 
        ForeColor="#333333" GridLines="None" Height="225px" HorizontalAlign="Center" 
        onselectedindexchanged="GridView3_SelectedIndexChanged" Width="813px" 
        onrowdatabound="GridView3_RowDataBound" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ordernum" HeaderText="订单编号" ReadOnly="True" 
                SortExpression="ordernum" />
            <asp:BoundField DataField="goodname" HeaderText="商品名称" 
                SortExpression="goodname" />
            <asp:BoundField DataField="address" HeaderText="收货地址" 
                SortExpression="address" />
            <asp:BoundField DataField="price" HeaderText="成交价格" SortExpression="price" />
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
        SelectCommand="SELECT [order].ordernum, goods.goodname, [order].address, [order].price FROM goods INNER JOIN [order] ON goods.goodnum = [order].goodnum WHERE ([order].consumer = @consumer) AND ([order].state = 2)">
        <SelectParameters>
            <asp:SessionParameter Name="consumer" SessionField="username" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
