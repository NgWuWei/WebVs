<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="Mainpage.aspx.cs" Inherits="Web.Mainpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h1>This is main page, will add more stuff</h1>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
</asp:Content>
