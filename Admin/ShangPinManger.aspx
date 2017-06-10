<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShangPinManger.aspx.cs" Inherits="AdminManger_ShangPinManger" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>�ޱ���ҳ</title>
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
      ��Ʒ��Ϣ����</td>
 </tr>
</table>
     <asp:Label ID="Label4" runat="server" ForeColor="Red" Text=""></asp:Label></td>
</tr>
</table>
    </div>
        <table align="center" bgcolor="#e3ebfe" border="0" cellpadding="2" cellspacing="1"
            style="margin-top: 8px" width="98%">
            <tr align="right" bgcolor="#eef4ea">
                <td align="left" colspan="10" height="36">
                    <asp:GridView ID="gvInfo" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        BackColor="White" CellPadding="5" DataKeyNames="ShangPinID" OnPageIndexChanging="gvInfo_PageIndexChanging"
                        OnRowDataBound="gvInfo_RowDataBound" OnRowDeleting="gvInfo_RowDeleting" PageSize="12"
                        Width="100%">
                        <PagerSettings FirstPageText="��ҳ" LastPageText="βҳ" Mode="NextPreviousFirstLast"
                            NextPageText="��һҳ" PageButtonCount="12" PreviousPageText="��һҳ" />
                        <RowStyle HorizontalAlign="Left" />
                        <Columns>
                        <asp:TemplateField HeaderText="��Ʒ����">
                            <ItemTemplate>
                                <asp:Label ID="ShangPinName" runat="server" Text='<%# Bind("ShangPinName") %>' Width="348px"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="����">
                            <ItemTemplate>
                                <asp:Label ID="ShangPinTypeName" runat="server" Text='<%# Bind("ShangPinTypeName") %>' Width="80px"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="С��">
                            <ItemTemplate>
                                <asp:Label ID="XiaoLeiTypeName" runat="server" Text='<%# Bind("XiaoLeiTypeName") %>' Width="80px"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="����">
                            <ItemTemplate>
                                <asp:Label ID="ChanDiName" runat="server" Text='<%# Bind("ChanDiName") %>' Width="80px"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="���۵���">
                            <ItemTemplate>
                                <asp:Label ID="ShangPinPrice" runat="server" Text='<%# Bind("ShangPinPrice") %>' Width="80px"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="��Ʒ����">
                            <ItemTemplate>
                                <asp:Label ID="ShangPinNum" runat="server" Text='<%# Bind("ShangPinNum") %>' Width="80px"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="��������" SortExpression="num">
                            <ItemTemplate>
                                <asp:Label ID="ShangPinDate" runat="server" Text='<%# Bind("ShangPinDate","{0:d}") %>' Width="130px"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="�޸�">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "ModifyShangPin.aspx?id="+Eval("ShangPinID") %>'
                                    Text="�޸�" Width="36px"></asp:HyperLink>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ɾ��" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                    OnClientClick="return confirm('ȷ��Ҫɾ����')" Text="ɾ��" Width="28px"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                        <PagerTemplate>
                            <table border="0" width="100%">
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="LinkButtonFirstPage" runat="server" CommandArgument="First" CommandName="Page"
                                            Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != 0 %>">��ҳ </asp:LinkButton>
                                        <asp:LinkButton ID="LinkButtonPreviousPage" runat="server" CommandArgument="Prev"
                                            CommandName="Page" Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != 0 %>">��һҳ </asp:LinkButton>
                                        <asp:LinkButton ID="LinkButtonNextPage" runat="server" CommandArgument="Next" CommandName="Page"
                                            Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>">��һҳ </asp:LinkButton>
                                        <asp:LinkButton ID="LinkButtonLastPage" runat="server" CommandArgument="Last" CommandName="Page"
                                            Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>">βҳ </asp:LinkButton>
                                        ��
                                        <asp:Label ID="LabelPageCount" runat="server" Text=" <%# ((GridView)Container.NamingContainer).PageCount %>"> </asp:Label>ҳ
                                        ��
                                        <asp:Label ID="Label2" runat="server" Text=" <%# ((GridView)Container.NamingContainer).PageIndex + 1 %>"> </asp:Label>ҳ
                                    </td>
                                    <td align="right" width="20%">
                                    </td>
                                </tr>
                            </table>
                        </PagerTemplate>
                        <PagerStyle BackColor="#F6F6F6" HorizontalAlign="Left" />
                        <HeaderStyle BackColor="#F6F6F6" />
                    </asp:GridView>
                   
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
