﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="cloud363finalproject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
  <asp:Label ID="Label1" style="margin-left:550px;"  runat="server" Text="Welcome To Speech Translator System" Font-Bold="True" Font-Size="X-Large"></asp:Label>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        
            <asp:TextBox ID="txtUsername" placeholder="Username" style="margin-left:500px; margin-top:200px; border-style:solid; border-radius:5px;  height:30px; width:500px;" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtPassword" type="Password" placeholder="Password" style="margin-top:270px;  margin-left:-507px; border-style:solid; border-radius:5px; height:30px; width:500px; position:absolute;"  runat="server"></asp:TextBox>
        <asp:Button ID="btnLogin" style="margin-top:350px; margin-left:-506px; position:absolute; height:30px; width:500px; border-style:solid; border-radius:5px;  background-color:seagreen; " runat ="server" Text="Login" Font-Bold="True" ForeColor="White" OnClick="btnLogin_Click" />
        <asp:Button ID="btnSignup" style="margin-top:400px; margin-left:-506px; position:absolute; height:30px; width:500px; border-style:solid; border-radius:5px;  background-color:darkslateblue;" runat ="server" Text="Sign-Up" Font-Bold="True" ForeColor="White" OnClick="btnSignup_Click" />
    </form>
</body>
</html>
