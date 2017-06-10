<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyShouCang.aspx.cs" Inherits="MyShouCang" Title="Untitled Page" %>

<%@ Register Src="Home.ascx" TagName="Home" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="2" class="registeInfo" width="100%">
        <tr>
            <td colspan="2" style="height: 35px">
                <uc1:Home ID="Home1" runat="server" />
            </td>
        </tr>
        <tr>
            <td id="TD1" align="left" colspan="2" style="height: 35px">
                <asp:GridView ID="gvMove" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    BackColor="White" CellPadding="5" DataKeyNames="id" OnPageIndexChanging="gvFilms_PageIndexChanging"
                    OnRowDataBound="gvFilms_RowDataBound" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="商品名称">
                            <ItemStyle HorizontalAlign="Left" Width="200px" />
                            <ItemTemplate>
                                <asp:Label ID="ShangPinName" runat="server" Text='<%# Bind("ShangPinName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="查看">
                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "ShowShangPin.aspx?id="+Eval("ShangPinID") %>'
                                    Text="查看"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="选择">
                            <HeaderTemplate>
                                选择</HeaderTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </EditItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="40px" />
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BackColor="#F6F6F6" />
                    <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPreviousFirstLast"
                        NextPageText="下一页" PageButtonCount="12" PreviousPageText="上一页" />
                    <RowStyle HorizontalAlign="Left" />
                    <PagerStyle BackColor="#F6F6F6" HorizontalAlign="Left" />
                    <PagerTemplate>
                        <table border="0" width="100%">
                            <tr>
                                <td>
                                    <asp:LinkButton ID="LinkButtonFirstPage" runat="server" CommandArgument="First" CommandName="Page"
                                        Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != 0 %>">首页 </asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonPreviousPage" runat="server" CommandArgument="Prev"
                                        CommandName="Page" Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != 0 %>">上一页 </asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonNextPage" runat="server" CommandArgument="Next" CommandName="Page"
                                        Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>">下一页 </asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonLastPage" runat="server" CommandArgument="Last" CommandName="Page"
                                        Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>">尾页 </asp:LinkButton>
                                    共
                                    <asp:Label ID="LabelPageCount" runat="server" Text=" <%# ((GridView)Container.NamingContainer).PageCount %>"> </asp:Label>页
                                    第
                                    <asp:Label ID="Label2" runat="server" Text=" <%# ((GridView)Container.NamingContainer).PageIndex + 1 %>"> </asp:Label>页
                                </td>
                                <td align="right" width="20%">
                                </td>
                            </tr>
                        </table>
                    </PagerTemplate>
                </asp:GridView>
                </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnSelectAll" runat="server" OnClick="btnSelectAll_Click" Text="全选" /><asp:Button
                    ID="btnDel" runat="server" OnClick="btnDel_Click" OnClientClick="javascript:return confirm('确定删除所新闻么？');"
                    Text="删除" /></td>
        </tr>
    </table>
</asp:Content>

