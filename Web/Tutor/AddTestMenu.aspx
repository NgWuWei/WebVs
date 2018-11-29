<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="AddTestMenu.aspx.cs" Inherits="Web.Tutor.AddTestMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 26px;
        }
        .auto-style2 {
            position: center;
            margin-top: 28px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    
    <div style="text-align:center" class="auto-style2"> 
        <asp:Label ID="Label1" runat="server" Text="Test Name         : " ></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1"  ></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Question Type : "></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style3">
            <asp:ListItem>Multiple Question</asp:ListItem>
            <asp:ListItem>Free Text</asp:ListItem>
            <asp:ListItem>Match List</asp:ListItem>
            <asp:ListItem>True False</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="Button1"  ClientIDMode="Static" runat="server" BackColor="#FF3300" ForeColor="White" Text="Start Adding Question"  OnClientClick="javascript:alert('You are now will be directed to the add question page')"   CssClass="auto-style4" OnClick="Button1_Click"    />

        <br />

    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">

</asp:Content>
