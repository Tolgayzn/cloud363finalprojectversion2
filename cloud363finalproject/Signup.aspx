<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="cloud363finalproject.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <asp:Label ID="Label1" style="margin-left:700px;"  runat="server" Text="Sign-Up" Font-Bold="True" Font-Size="X-Large"></asp:Label>
</head>
<body>
    <form id="form1" runat="server">
        <asp:TextBox ID="txtUsername" placeholder="Username" style="margin-left:500px; margin-top:200px; border-style:solid; border-radius:5px;  height:30px; width:500px;" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtPassword"  placeholder="Password" type="Password" style="margin-top:270px;  margin-left:-507px; border-style:solid; border-radius:5px; height:30px; width:500px; position:absolute;"  runat="server"></asp:TextBox>
         <asp:TextBox ID="txtConfirmPassword"  placeholder="Confirm Password" type="Password" style="margin-top:340px;  margin-left:-507px; border-style:solid; border-radius:5px; height:30px; width:500px; position:absolute;"  runat="server"></asp:TextBox>
        <asp:Button ID="btnSignup" style="margin-top:400px; margin-left:-506px; position:absolute; height:30px; width:500px; border-style:solid; border-radius:5px;  background-color:darkslateblue;" runat ="server" Text="Sign-Up" Font-Bold="True" ForeColor="White" OnClick="btnSignup_Click" />
    </form>
</body>
</html>
