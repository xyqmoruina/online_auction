<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="completeOrder.aspx.cs" Inherits="nya.completeOrder" %>

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
        .style6
        {
            font-size: medium;
            font-family: 微软雅黑;
        }
        #form1
        {
            height: 684px;
        }
        .style7
        {
            font-size: large;
            font-family: 微软雅黑;
        }
        .style8
        {
            text-align: center;
        }
        </style>
</head>
<body background="2.gif">
    <form id="form1" runat="server">
   
    
    <div class="style4">
    
        <asp:Image ID="Logo" runat="server" Height="50px" ImageAlign="Left" 
            Width="50px" />
        <span class="style5"><span class="style1">喵，<asp:Label ID="urname" 
            runat="server" CssClass="style5"></asp:Label>
        !&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" BackColor="#0D7BD5" 
            BorderColor="#0066FF" BorderStyle="Solid" Height="30px" onclick="Button2_Click" 
            style="font-family: 微软雅黑; color: #FFFFFF; font-size: medium;" Text="用户中心" 
            Width="90px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span>&nbsp;&nbsp; </span>
        <asp:Button ID="Button1" runat="server" Height="30px" style="text-align: center; font-family: 微软雅黑; color: #FFFFFF; font-size: medium;" 
            Text="注销" onclick="Button1_Click" BackColor="#0D7BD5" 
            BorderColor="#0066FF" BorderStyle="Solid" Width="50px" />
    
    &nbsp;&nbsp;&nbsp;&nbsp;
    
    </div>
     <div class="style8" 
        style="width: 960px; margin-left: 0px; ">
    
    <br />
         <br />
         <br />
         <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Image ID="goodimage" runat="server" Height="300px" ImageAlign="Middle" 
        Width="300px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <br />
         <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
    <asp:Label ID="Label1" runat="server" 
        style="font-family: 微软雅黑; font-size: large; text-align: center;" Text="Label"></asp:Label>
         <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" 
        style="font-family: 微软雅黑; font-size: large" Text="Label"></asp:Label>
    <br />
    <br />
    <span class="style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
         <span class="style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 请填写您的收货地址：</span><asp:TextBox ID="addr" runat="server" 
        Height="27px" Width="377px"></asp:TextBox>
         <br />
         <br />
         <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
    <asp:Button ID="submit" runat="server" onclick="Button3_Click" Text="提交" 
             BackColor="#0D7BD5" BorderColor="#0066FF" BorderStyle="Solid" 
             style="color: #FFFFFF; font-size: x-large; text-align: center" />
    </div>
    </form>
</body>
</html>
