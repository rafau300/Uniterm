<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Uniterm_ASP._Default"
    MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="updpanel" runat="server">
        <ContentTemplate>
            <table>
                <tr>
                    <td style="width: 70px">
                    </td>
                    <td valign="top">
                        <asp:ListBox ID="lbUniterms" runat="server" DataTextField="name" DataValueField="name"
                            Height="450px" Width="110px" OnSelectedIndexChanged="lbUniterms_SelectedIndexChanged1"
                            AutoPostBack="true"></asp:ListBox>
                    </td>
                    <td style="width: 673px">
                        <asp:Panel runat="server" ScrollBars="Both" Width="700" Height="450" Direction="LeftToRight"
                            Wrap="False" HorizontalAlign="Center">
                            <asp:Image ID="Image1" runat="server" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="btnreload" runat="server" Text="Reload" OnClick="btnreload_Click" />
                    </td>
                    <td style="width: 673px">
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
