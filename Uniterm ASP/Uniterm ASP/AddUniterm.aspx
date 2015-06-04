<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUniterm.aspx.cs" Inherits="Uniterm_ASP.WebForm1"
    MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td style="width: 30px">
            </td>
            <td colspan="2">
                <table>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lbError" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="content">
                            Nazwa
                        </td>
                        <td>
                            <asp:TextBox ID="tbName" runat="server"></asp:TextBox><asp:RegularExpressionValidator
                                ID="reqName" runat="server" ErrorMessage="Wpisz poprawną nazwę!" Display="None"
                                ControlToValidate="tbName" ValidationExpression="[A-Za-z0-9]{1,50}" /><cc1:ValidatorCalloutExtender
                                    ID="ValidatorCalloutExtender5" runat="server" TargetControlID="reqName">
                                </cc1:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="regtbName" runat="server" ErrorMessage="Wpisz A!"
                                ControlToValidate="tbName"></asp:RequiredFieldValidator>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender8" runat="server" TargetControlID="regtbName">
                            </cc1:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="content">
                            Opis
                        </td>
                        <td>
                            <asp:TextBox ID="tbDescription" runat="server" Height="16px" Width="401px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="content">
                            <table>
                                <tr>
                                    <td>
                                        Podstawienie
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="cbPodstawienie" runat="server">
                                            <asp:ListItem Value="NONE" Selected="True">Brak</asp:ListItem>
                                            <asp:ListItem Value="A">A</asp:ListItem>
                                            <asp:ListItem Value="B">B</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    Rozmiar czcionki
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlSize" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Czcionka
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlFont" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td valign="top">
                <div>
                    <h3>
                        Uniterm Eliminacji</h3>
                    <table>
                        <tr>
                            <td class="content">
                                A
                            </td>
                            <td>
                                <asp:TextBox ID="tbA" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="reqtbA" runat="server" ErrorMessage="Wpisz poprawnie A!"
                                    ControlToValidate="tbA" Display="None" ValidationExpression="[A-Za-z0-9]{1,50}"></asp:RegularExpressionValidator>
                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="reqtbA">
                                </cc1:ValidatorCalloutExtender>
                                <asp:RequiredFieldValidator ID="regtbA" runat="server" ErrorMessage="Wpisz A!" Display="None"
                                    ControlToValidate="tbA"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender9" runat="server" TargetControlID="regtbA">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td class="content">
                                B
                            </td>
                            <td>
                                <asp:TextBox ID="tbB" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="reqtbB" runat="server" Display="None" ErrorMessage="Wpisz poprawnie B!"
                                    ValidationExpression="[A-Za-z0-9]{1,50}" ControlToValidate="tbB"></asp:RegularExpressionValidator>
                                <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator1_ValidatorCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="reqtbB">
                                </cc1:ValidatorCalloutExtender>
                                <asp:RequiredFieldValidator ID="regtbB" runat="server" ErrorMessage="Wpisz B!" Display="None"
                                    ControlToValidate="tbB"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender10" runat="server" TargetControlID="regtbB">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td class="content">
                                C
                            </td>
                            <td>
                                <asp:TextBox ID="tbC" runat="server"></asp:TextBox><asp:RegularExpressionValidator
                                    ValidationExpression="[A-Za-z0-9]{1,50}" ID="reqtbC" runat="server" ErrorMessage="Wpisz poprawnie C!"
                                    Display="None" ControlToValidate="tbC"></asp:RegularExpressionValidator>
                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="reqtbC">
                                </cc1:ValidatorCalloutExtender>
                                <asp:RequiredFieldValidator ID="regtbC" runat="server" ErrorMessage="Wpisz C!" Display="None"
                                    ControlToValidate="tbC"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender11" runat="server" TargetControlID="regtbC">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td valign="top">
                <div>
                    <h3>
                        Uniterm Sekwencjonowania</h3>
                    <table>
                        <tr>
                            <td class="content">
                                A
                            </td>
                            <td>
                                <asp:TextBox ID="tbSA" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="reqtbSA" runat="server" ErrorMessage="Wpisz poprawnie A!"
                                    ControlToValidate="tbSA" Display="None" ValidationExpression="[A-Za-z0-9]{1,50}" /><cc1:ValidatorCalloutExtender
                                        ID="ValidatorCalloutExtender3" runat="server" TargetControlID="reqtbSA">
                                    </cc1:ValidatorCalloutExtender>
                                <asp:RequiredFieldValidator ID="regtbSA" runat="server" ErrorMessage="Wpisz A!" Display="None"
                                    ControlToValidate="tbSA"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender7" runat="server" TargetControlID="regtbSA">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td class="content">
                                B
                            </td>
                            <td>
                                <asp:TextBox ID="tbSB" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="regtbSB" runat="server" ErrorMessage="Wpisz B!" ControlToValidate="tbSB"
                                    Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" runat="server" TargetControlID="regtbSB">
                                </cc1:ValidatorCalloutExtender>
                                <asp:RegularExpressionValidator ID="reqtbSB" runat="server" ErrorMessage="Wpisz poprawnie B!"
                                    Display="None" ControlToValidate="tbSB" ValidationExpression="([A-Za-z0-9]){1,50}"></asp:RegularExpressionValidator>
                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="reqtbSB">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td class="content">
                                Operator
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rblOperator" runat="server">
                                    <asp:ListItem Value=";" Selected="True">;</asp:ListItem>
                                    <asp:ListItem Value=",">,</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnSave" runat="server" Text="Dodaj" CausesValidation="true" OnClick="btnSave_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
