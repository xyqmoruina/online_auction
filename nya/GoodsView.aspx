<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoodsView.aspx.cs" Inherits="nya.WebForm4" %>

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
        #form1
        {
            margin-left: 0px;
        }
        .style2
        {
            font-size: medium;
        }
        .style3
        {
            font-family: 微软雅黑;
            color: #FFFFFF;
            text-align: justify;
            font-size: medium;
        }
        .style4
        {
            font-family: 微软雅黑;
            font-size: medium;
        }
        .style5
        {
            font-family: 微软雅黑;
            font-size: large;
        }
        .style6
        {
            font-size: large;
        }
    </style>
</head>
<body background="5.gif">

    <form id="form1" runat="server">
    <p style="background-color: #0D7BD5; height: 50px; width: 1350px; text-align: right;" >
    
        <asp:Image ID="Logo" runat="server" Height="50px" ImageAlign="Left" 
            Width="50px" style="margin-left: 0px" />
        <span class="style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
    <div style="margin-left: 180px">
    </p>
    <p style="text-align: left">
        &nbsp;</p>
    <p style="text-align: left">
        <asp:Image ID="MiaoImage" runat="server" Height="300px" 
            style="text-align: right; margin-left: 145px;" Width="300px" 
            ImageAlign="Left" />
    </p>
    <p style="text-align: left">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="style4">&nbsp;</span><span 
            class="style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 商品名称 :&nbsp;
        </span> 
        <asp:Label ID="GoodName" runat="server" 
            style="text-align: left; " CssClass="style5"></asp:Label>
        <span class="style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
    </p>
    <p style="text-align: left; width: 576px; margin-left: 260px;">
        <span class="style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品类别 
        :&nbsp; 
        </span>
        <asp:Label ID="Variety" runat="server" CssClass="style5"></asp:Label>
        <span class="style5">&nbsp;</span></p>
    <p style="text-align: left; width: 635px;">
        <span class="style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        卖家：</span><asp:Label ID="Saler" runat="server" CssClass="style5"></asp:Label>
    </p>
    <p style="margin-left: 520px; width: 429px;">
        <span class="style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
        <asp:Label ID="CurrentPrice" runat="server" ForeColor="Red" CssClass="style5"></asp:Label>
    </p>
    <p style="margin-left: 550px; width: 471px;">
        <span class="style5">竞拍截止日期：</span><asp:Label ID="DeadLine" runat="server" 
            CssClass="style5"></asp:Label>
    </p>
    <p style="margin-left: 542px; width: 471px;">
        &nbsp;
    <asp:Label ID="Times" runat="server" Text="现在共有" CssClass="style5"></asp:Label>
        <span class="style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
    </p>
    <span class="style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    描述： </span> <asp:Label ID="desc" runat="server" CssClass="style5"></asp:Label>
    &nbsp;<br class="style6" />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Buy" runat="server" 
        style="font-family: 微软雅黑; font-size: x-large; color: #FFFFFF;" Text="我要竞拍！" 
        onclick="Buy_Click" BackColor="#0D7BD5" BorderColor="#0066FF" 
        BorderStyle="Solid" />

        </div>
    </form>
</body>
</html>
