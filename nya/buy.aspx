<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buy.aspx.cs" Inherits="nya.WebForm456" %>

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
            font-size: x-large;
            font-family: 微软雅黑;
        }
        .style6
        {
            text-align: center;
        }
        .style7
        {
            font-size: large;
            font-family: 微软雅黑;
        }
        </style>
</head>
<body background="2.gif">
    <form id="form1" runat="server">
    <div>
    
    <p style="text-align: right; background-color: #0D7BD5; height: 50px; width: 1350px; margin-left: 0px;">
    
        <asp:Image ID="Logo" runat="server" Height="50px" ImageAlign="Left" 
            Width="50px" style="margin-left: 0px" />
        <span class="style4">喵，</span><asp:Label ID="username" 
            runat="server" CssClass="style4"></asp:Label>
        <span class="style1"><span class="style3">!&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span>
        <asp:Button ID="Button2" runat="server" BackColor="#0D7BD5" 
            BorderColor="#0066FF" BorderStyle="Solid" Height="30px" onclick="Button2_Click" 
            style="font-family: 微软雅黑; color: #FFFFFF" Text="用户中心" Width="90px" 
            CssClass="style3" />
        <span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
        </span>
        <asp:Button ID="Button1" runat="server" Height="30px" 
            Text="注销" onclick="Button1_Click" BackColor="#0D7BD5" 
            BorderColor="#0066FF" BorderStyle="Solid" CssClass="style4" Width="50px" />
    
        <span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        </span> </span>
    
    </p>
    
    </div>
    <div class="style6">
        <span class="style5">商品名称：</span><asp:Label ID="GoodName" runat="server" 
            CssClass="style5"></asp:Label>
        <br class="style5" />
        <br />
        <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Image ID="GoodImage" runat="server" Height="250px" Width="250px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
        <span class="style7">请输入竞拍价格：<br />
        </span><asp:TextBox ID="priceBox" runat="server" 
            Height="30px" Width="252px" 
            onkeypress="if (event.keyCode<48 || event.keyCode>57) event.returnValue=false;" 
            CssClass="style7"></asp:TextBox>
&nbsp;<br />
        <br class="style7" />
        &nbsp;<asp:Button ID="Button3" runat="server" BackColor="#0D7BD5" 
            BorderColor="#0066FF" BorderStyle="Solid" 
            style="font-size: large; color: #FFFFFF; font-family: 微软雅黑" Text="提交" 
            onclick="Button3_Click" />
        &nbsp;
    </div>
    </form>
</body>
</html>
