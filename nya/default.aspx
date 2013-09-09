<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="nya.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-family: 微软雅黑;
            font-size: xx-large;
            color: #FFFFFF;
            width: 1253px;
            margin-left: 80px;
        }
        </style>
</head>
<body bgcolor="#0d7bd5" >
    <form id="form1" runat="server">
    <div class="style1">
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:ImageButton ID="reg" 
            runat="server"
            ImageUrl="~/QQ截图20121102162933.png" 
            onclick="ImageButton2_Click"
            style="margin-bottom: 0px"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 欢迎光临喵喵喵网上拍卖行~~<br />
    </div>
    <div align="center" dir="ltr" 
        
        style="border-style: hidden; border-width: thin; width: 1043px; margin-left: 0px;">
    &nbsp;&nbsp;
        <br />
        <br />
        <asp:Image ID="Logo" runat="server" Height="200px" ImageAlign="Left" 
            style="margin-left: 388px" Width="200px" />
        <br />
        <br />
&nbsp;<asp:TextBox ID="UserNameBox" runat="server" BorderColor="#2993EF" 
            BorderStyle="Solid" Height="40px" style="font-family: 微软雅黑; font-size: medium" 
            Width="240px"></asp:TextBox>
    &nbsp;<br />
&nbsp;<asp:Label ID="CanLogin" runat="server" 
            style="font-family: 微软雅黑; color: #FFFFFF;" BorderColor="Black"></asp:Label>
    <br />
    &nbsp;&nbsp;&nbsp;
    <br />
    &nbsp;<asp:TextBox ID="PassWordBox" runat="server" TextMode="Password" Width="240px" 
            BorderColor="#2993EF" BorderStyle="Solid" Height="40px" 
            style="font-family: 微软雅黑; font-size: medium"></asp:TextBox>
&nbsp;<br />
        <br />
&nbsp;&nbsp; &nbsp;
        <asp:ImageButton ID="loginbotton" runat="server" 
            ImageUrl="~/QQ截图20121102160059.png" onclick="ImageButton1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
    </form>
</body>
</html>
