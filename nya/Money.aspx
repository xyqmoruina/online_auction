<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Money.aspx.cs" Inherits="nya.Money" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style1
        {
            font-family: 微软雅黑;
            color: #FFFFFF;
            text-align: justify;
        }
        .style3
        {
            font-family: 微软雅黑;
            color: #FFFFFF;
            text-align: justify;
            font-size: medium;
        }
        .style2
        {
            font-size: medium;
        }
        .style4
        {
            font-family: 微软雅黑;
            font-size: large;
        }
        </style>
</head>
<body background="4.gif">
    <form id="form1" runat="server">
    <div>
    
    <p style="background-color: #0D7BD5; height: 50px; width: 1350px; left: 0px; margin-left: 0px;" >
    
        <asp:Image ID="Logo" runat="server" Height="50px" ImageAlign="Left" 
            Width="50px" style="margin-left: 0px" />
        <span class="style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="style2">喵，</span></span><asp:Label ID="username" 
            runat="server" CssClass="style3"></asp:Label>
        <span class="style1"><span class="style2">!&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span>
        <asp:Button ID="Button2" runat="server" BackColor="#0D7BD5" 
            BorderColor="#0066FF" BorderStyle="Solid" Height="30px" onclick="Button2_Click" 
            style="font-family: 微软雅黑; color: #FFFFFF" Text="用户中心" Width="90px" 
            CssClass="style2" />
        <span class="style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span>
        <asp:Button ID="Button1" runat="server" Height="30px" 
            Text="注销" onclick="Button1_Click" BackColor="#0D7BD5" 
            BorderColor="#0066FF" BorderStyle="Solid" CssClass="style3" Width="50px" />
    
        <span class="style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span> </span>
    
    </p>
    
    </div>
    <p style="height: 50px; width: 950px; left: 150px; margin-left: 150px;">
        &nbsp;</p>
    <p class="style4" 
        style="height: 50px; width: 950px; left: 150px; margin-left: 489px; text-align: justify;">
        账户现有余额：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </p>
    <p class="style4" 
        style="height: 50px; width: 950px; left: 150px; margin-left: 150px; text-align: center;">
        账户充值：<asp:TextBox ID="TextBox1" runat="server" style="font-size: medium"></asp:TextBox>
    </p>
    <p class="style4" 
        style="height: 50px; width: 950px; left: 150px; margin-left: 150px; text-align: center;">
        <asp:Button ID="Button3" runat="server" BackColor="#0D7BD5" 
            BorderColor="#0066FF" BorderStyle="Solid" onclick="Button3_Click" 
            style="font-size: large; color: #FFFFFF; font-family: 微软雅黑;" Text="确认充值" />
    </p>
    </form>
</body>
</html>
