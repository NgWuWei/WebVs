<%@ Page Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="Tutor.aspx.cs" Inherits="Web.Tutor.Tutor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div><h1>tutor page
        tutor add question 
         </h1>
        View profile:
        <asp:Button ID="Button1" runat="server" Text="Button" PostBackUrl="~/Tutor/TutorProfile.aspx" /><br />
        Assessment Page:
        <asp:Button ID="Button2" runat="server" Text="Button" PostBackUrl="~/Tutor/Assessment.aspx"/><br />
        View all student:
        <asp:Button ID="Button3" runat="server" Text="Button" PostBackUrl="~/Tutor/ViewRecords.aspx"/><br />
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>