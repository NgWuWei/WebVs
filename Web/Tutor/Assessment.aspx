<%@ Page Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="Assessment.aspx.cs" Inherits="Web.Tutor.Assessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div><h1><%# Session["user"].ToString() + Session["name"].ToString() %></h1></div>
    <!--Use full-page tabs-->
    <!--Use css to made these into tabs -->
    <asp:Panel ID="CreatePanel" runat="server">
        Assessments 
    </asp:Panel>
    <asp:Panel ID="ViewPanel" runat="server">
        Add assessments
        <asp:Button runat="server" Text="To Assessment" PostBackUrl="~/Tutor/AddTestMenu.aspx"/>
    </asp:Panel>
    <asp:Panel ID="UpdatePanel" runat="server">
        Edit and Correct assessment questions (NOT DONE)
    </asp:Panel>
    <asp:Panel ID="DeletePanel" runat="server">
        Can delete any assessment made (NOT DONE)
    </asp:Panel>
    <asp:Panel ID="ViewRecords" runat="server">
        <asp:HyperLink runat="server" NavigateUrl="~/Tutor/ViewRecords.aspx">View Students Data</asp:HyperLink>
    </asp:Panel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>
