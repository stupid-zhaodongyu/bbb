<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderChk.aspx.cs" Inherits="AdminManger_OrderChk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css"/>
</head>
<body >
    <form id="form1" runat="server">
    <div>
    <table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#e3ebfe" align="center">
<tr>
 <td height="26" >
  <table width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td align="center" style="height: 22px">
      订单处理</td>
 </tr>
</table>
</td>
</tr>
</table>
    </div>
        <table align="center" bgcolor="#e3ebfe" border="0" cellpadding="2" cellspacing="1"
            style="margin-top: 8px" width="98%">
            <tr align="right" bgcolor="#eef4ea">
                <td align="center" colspan="10" height="36">
                    输入物流信息</td>
            </tr>
            <tr align="right" bgcolor="#eef4ea">
                <td align="center" colspan="10" height="36">
                    <asp:TextBox ID="TextBox1" runat="server" Height="212px" TextMode="MultiLine" Width="740px"></asp:TextBox></td>
            </tr>
            <tr align="right" bgcolor="#eef4ea">
                <td align="center" colspan="10" height="36">
                    <span style="font-family: Times New Roman">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发货" />
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="更新物流信息" /></span></td>
            </tr>
        </table>
    </form>
</body>
</html>
