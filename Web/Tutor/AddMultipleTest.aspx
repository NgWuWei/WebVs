<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="AddMultipleTest.aspx.cs" Inherits="Web.Tutor.AddMultipleTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
<style type="text/css">
        .auto-style17 {
        float:right;
    }
    </style>
    &nbsp;
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">

    <asp:Button ID="returnbtn" runat="server" CssClass="auto-style17" Text="Return to Test Menu" OnClick="returnbtn_Click" />

<div style="float:right">
</div>

        <div>
            
            <table align="center" style="color:black" >
        <tr>
            <td style="width: 234px" >
                &nbsp;</td>
            <td style="font-weight: 700; color: #000000; width: 304px;" class="style6">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td valign="top" style="width: 234px">
                Question:</td>
            <td style="width: 304px">
                <asp:TextBox ID="txtTitle" runat="server" Width="264px" TextMode="MultiLine"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td style="width: 234px">
                 <br />Answer Option 1:</td>
            <td style="width: 304px">
                <br /> <asp:TextBox ID="txtAnswer1" runat="server" Width="265px"></asp:TextBox>
            </td>
           
        </tr>
        <tr>
            <td style="width: 234px">
                <br />Answer Option 2:</td>
            <td style="width: 304px">
                <br /> <asp:TextBox ID="txtAnswer2" runat="server" Width="264px"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td style="width: 234px" >
                <br /> Answer Option 3:</td>
            <td style="width: 304px">
                 <br /><asp:TextBox ID="txtAnswer3" runat="server" Width="264px"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td style="width: 234px" >
                <br /> Answer Optin 4:</td>
            <td style="width: 304px" >
                 <br /><asp:TextBox ID="txtAnswer4" runat="server" Width="264px"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td style="width: 234px">
                 <br />Correct Answer:</td>
            <td style="width: 304px">
                <br /> <asp:DropDownList ID="ddlCorrectAnswer" runat="server"
                    Width="264px">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                </asp:DropDownList>
            </td>
            
        </tr>
        <tr>
            <td style="width: 234px">
                <br /> Subject:</td>
            <td style="width: 304px">
                <br /> <asp:DropDownList ID="ddlExamID" runat="server"
                    DataSourceID="SqlDataSource1" DataTextField="Subject" DataValueField="ExamID" 
                     Width="264px">
                </asp:DropDownList>
            </td>
            
        </tr>
           </table>
            <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                    SelectCommand="SELECT * FROM [Exam]"></asp:SqlDataSource>
            <br />
                <asp:Button ID="btnAddQuestion" runat="server" Text="Add Question" 
                    onclick="btnAddQuestion_Click" Width="200px" BackColor="#ffb606" BorderColor="black" />
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="reset" runat="server" type="reset" text="Reset" Width="140px" BackColor="#ffb606" BorderColor="black" OnClick="reset_Click"/>
 
            
        </div>


</asp:Content>
