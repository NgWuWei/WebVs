<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Web.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser">
                <WizardSteps>
                    <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td colspan="2">Sign Up for Your New Account</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="GenderLabel" runat="server" AssociatedControlID="Gender">Gender:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="Gender" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="M">Male</asp:ListItem>
                                            <asp:ListItem Value="F">Female</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="GenderRequired" runat="server" ControlToValidate="Gender" ErrorMessage="Gender is required." ToolTip="Gender is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password" MaxLength="30"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="BirthDateLabel" runat="server" AssociatedControlID="BirthDate">Birthdate:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:Calendar ID="BirthDateCalendar" runat="server" OnSelectionChanged="BirthDateCalendar_SelectionChanged"></asp:Calendar>
                                        <asp:TextBox ID="BirthDate" runat="server" ReadOnly="true"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="BirthDateRequired" runat="server" ControlToValidate="BirthDate" ErrorMessage="Birthdate is required." ToolTip="Birthdate is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="DepartmentLabel" runat="server" AssociatedControlID="Department">Department:</asp:Label>
                                    </td>
                                    <td>
                                        <!-- Link with datasource after assessment done -->
                                        <asp:DropDownList ID="Department" runat="server" DataTextField="Department">
                                            <asp:ListItem Value="1">Faculty of Accountancy, Finance & Business</asp:ListItem>
                                            <asp:ListItem Value="2">Faculty of Communication & Creative Industries</asp:ListItem>
                                            <asp:ListItem Value="3">Faculty of Built Environment</asp:ListItem>
                                            <asp:ListItem Value="4">Faculty of Applied Sciences</asp:ListItem>
                                            <asp:ListItem Value="5">Faculty of Computing & Information Technology</asp:ListItem>
                                            <asp:ListItem Value="6">Faculty of Engineering & Technology</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="DepartmentRequired" runat="server" ControlToValidate="Department" ErrorMessage="Department is required." ToolTip="Department is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:Red;">
                                        <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <CustomNavigationTemplate>
                            <table border="0" style="width:100%;height:100%;">
                                <tr>
                                    <td>
                                        <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Sign Up" ValidationGroup="CreateUserWizard1" OnClick="CreateUserWizard1_CreatedUser"/>
                                    </td>
                                </tr>
                            </table>
                        </CustomNavigationTemplate>
                    </asp:CreateUserWizardStep>

                    <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                        <ContentTemplate>
                            <table border="0">
                                <tr>
                                    <td colspan="2">
                                        Complete</td>
                                </tr>
                                <tr>
                                    <td>
                                        Your account has been successfully created.<br />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;<asp:Button ID="LoginButton" runat="server" CausesValidation="False" CommandName="Login"
                                            Text="Login" ValidationGroup="CreateUserWizard1" PostBackUrl="~/Login.aspx"/>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:CompleteWizardStep>

                </WizardSteps>
            </asp:CreateUserWizard>
        </div>
    </form>
</body>
</html>
