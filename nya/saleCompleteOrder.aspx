<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="saleCompleteOrder.aspx.cs" Inherits="nya.saleCompleteOrder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style4
        {
            text-align: right;
            height: 50px;
            background-color: #0D7BD5;
            width: 965px;
        }
        .style5
        {
            color: #FFFFFF;
        }
        
        .style1
        {
            font-size: large;
            font-family: 微软雅黑;
            width: 665px;
            height: 731px;
            margin-bottom: 0px;
            margin-left: 127px;
        }
        #form1
        {
            text-align: center;
        }
    </style>
</head>
<body background="5.gif">
    <form id="form1" runat="server">
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
    
        <br />
        <br />
        <br />
    
    </div>
    
    </div>
    <br />
    <br />
    <asp:Button ID="fahuo" runat="server" Height="50px" onclick="fahuo_Click" 
        style="font-size: x-large; font-family: 微软雅黑; color: #FFFFFF;" 
        Text="该商品已发货" Width="300px" BackColor="#0D7BD5" BorderColor="#0066FF" 
        BorderStyle="Solid" />
    </form>
</body>
</html>
