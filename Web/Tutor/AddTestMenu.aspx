<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="AddTestMenu.aspx.cs" Inherits="Web.Tutor.TestMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-top: 175px;
            width: 494px;
            height: 126px;
            margin-left: 304px;
        }
        .auto-style2 {
            margin-left: 90px;
        }
        .auto-style3 {
            margin-left: 70px;
        }
        .auto-style4 {
            margin-top: 61px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">


    <div style="border-style:groove;align-items:center;text-align:center" class="auto-style1">
        <asp:Label ID="lblNewTest" runat="server" Text="Test Name : " ></asp:Label>
        <asp:TextBox ID="txtTestName" runat="server" style="text-align:center" CssClass="auto-style2"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="QuestionTypelbl" runat="server" Text="Question Type : "></asp:Label>
        <asp:DropDownList ID="QuestionTypeList" runat="server" CssClass="auto-style3">
            <asp:ListItem>Multiple Question</asp:ListItem>
            <asp:ListItem>Free Text</asp:ListItem>
            <asp:ListItem>Match List</asp:ListItem>
            <asp:ListItem>True False</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="AddTestbtn" runat="server" BackColor="#FF3300" ForeColor="White" Text="Start Adding Question"  OnClientClick="javascript:alert('You are now will be directed to the add question page')" PostBackUrl="~/Tutor/AddMultipleTest.aspx" CssClass="auto-style4" />
      </div>
</asp:Content>
