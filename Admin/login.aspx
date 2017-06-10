<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Admin_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>网上购物系统</title>
     <link href="style/style.css" rel="Stylesheet" type="text/css" />
</head>
<body style="background-color: #175C7B;">
    <form id="form1" runat="server">
      <div  align="center"  >
  <div  style="padding-top :150px; padding-bottom :150px; width:440px; height:260px;background-image: url(images/denglu.jpg);background-repeat: no-repeat;
	background-position: center center;">
    <table width="440" border="0" cellpadding="0" cellspacing="0" id="divmaintable1">
      <tr>
        <td height="90" colspan="3">&nbsp; &nbsp;</td>
      </tr>
      <tr>
        <td align="right" style="height: 32px">
            <span style="font-size: 9pt">用户名：</span></td>
        <td align="left" style="height: 32px">
            <asp:TextBox ID="TxtUserName" runat="server"></asp:TextBox></td>
        <td style="text-align: left; height: 32px;">&nbsp;<asp:RequiredFieldValidator ID="fileusename" runat="server" ControlToValidate="TxtUserName"
                ErrorMessage="用户名不能为空"></asp:RequiredFieldValidator>
            <asp:Label ID="lblusename" runat="server" ForeColor="#FF3300"></asp:Label></td>
      </tr>

      <tr>
        <td align="right">
            <span style="font-size: 9pt">密 码：</span></td>
        <td height="25" style="text-align: left" align="left">
            <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" Width="149px"></asp:TextBox></td>
        <td style="text-align: left">&nbsp;<asp:RequiredFieldValidator ID="filepass" runat="server" ErrorMessage="密码不能为空" ControlToValidate="TxtPassword"></asp:RequiredFieldValidator>
            <asp:Label ID="lblpass" runat="server" ForeColor="#FF3300"></asp:Label></td>
      </tr>
      <tr>
        <td width="170" align="right" style="height: 25px">
            <span style="font-size: 9pt">验证码：</span></td>
        <td  align="left" style="height: 25px">
            <asp:TextBox ID="txtyan" runat="server" Width="85px"></asp:TextBox>
            <asp:Label ID="lblyanzheng" runat="server" BackColor="DeepSkyBlue" ForeColor="#004000" ></asp:Label> </td>
         <td  align="left" style="height: 25px">
            <asp:Label ID="lblyan" runat="server" ForeColor="#FF3300"></asp:Label></td> 
      </tr>
	   <tr>
        <td height="50" colspan="3" align="center">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/deng.jpg"
                OnClick="ImageButton1_Click" />&nbsp;
            </td>
      </tr>
    </table>
  </div>
</div>
    </form>
</body>
</html>
