<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchGoods.aspx.cs" Inherits="SearchGoods" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td align="center" bgcolor="#fbfbfb" class="middle_border_1 margin_middle1" style="width: 661px">
                类别：<asp:DropDownList ID="DropDownList1" runat="server" Width="81px">
    </asp:DropDownList>厂家：<asp:DropDownList ID="DropDownList2" runat="server" Width="103px">
    </asp:DropDownList>小类：<asp:DropDownList ID="DropDownList3" runat="server" Width="104px">
    </asp:DropDownList>名称关键字：<asp:TextBox ID="TxtName" runat="server" Style="border-right: #ffcc00 1px solid;
        border-top: #ffcc00 1px solid; border-left: #ffcc00 1px solid; border-bottom: #ffcc00 1px solid"
        Width="96px"></asp:TextBox><br />
                价格：<asp:TextBox ID="TextBox1" runat="server" Style="border-right: #ffcc00 1px solid;
                    border-top: #ffcc00 1px solid; border-left: #ffcc00 1px solid; border-bottom: #ffcc00 1px solid"
                    Width="96px"></asp:TextBox>到<asp:TextBox ID="TextBox2" runat="server" Style="border-right: #ffcc00 1px solid;
                        border-top: #ffcc00 1px solid; border-left: #ffcc00 1px solid; border-bottom: #ffcc00 1px solid"
                        Width="96px"></asp:TextBox><br />
    <asp:Button ID="btnRegister" runat="server" CausesValidation="False" Font-Size="12pt"
        OnClick="btnRegister_Click" Text="查询" /></td>
        </tr>
        <tr>
            <td align="left" bgcolor="#fbfbfb" class="middle_border_1 margin_middle1" style="width: 661px">
                </td>
        </tr>
    </table>
</asp:Content>

