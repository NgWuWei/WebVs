<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="panelLogin" runat="server">
            <h1>Login</h1>
            <asp:Login ID="Login1" runat="server">
                <LayoutTemplate>
                    <table style="border-collapse:collapse;">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td colspan="2">Log In</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="Email is required." ToolTip="Email is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" MaxLength="30"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="color:Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" OnClick="LoginButton_Click"/>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:Login>
            <div>Dont have an account? Sign up
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">here</asp:HyperLink>
            </div>
        </asp:Panel>
        <asp:Panel ID="panelHelp" runat="server">
            <!--<asp:PasswordRecovery runat="server"></asp:PasswordRecovery><br />-->
        </asp:Panel>
    </form>
</body>
</html>