<%@ Page Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="Assessment.aspx.cs" Inherits="Web.Tutor.Assessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div><h1>TUTOR NAME HERE</h1></div>
    <!--Use full-page tabs-->
    <!--Use css to made these into tabs -->
    <asp:Panel ID="CreatePanel" runat="server">
        Assessments contain questions
    </asp:Panel>
    <asp:Panel ID="ViewPanel" runat="server">
        Contains all assessment history with question and answer
        <!-- Before this type assessment details 
            next to question tab, add more question, auto sum total marks-->
        <asp:Button ID="btnAdd" runat="server" Text="Add New Question" OnClick="BtnAdd_Click"/>
    </asp:Panel>
    <asp:Panel ID="UpdatePanel" runat="server">
        Edit and Correct assessment questions
    </asp:Panel>
    <asp:Panel ID="DeletePanel" runat="server">
        Can delete any assessment made
    </asp:Panel>
    <asp:Panel ID="ViewRecords" runat="server">
        <asp:HyperLink runat="server" NavigateUrl="~/Tutor/ViewRecords.aspx">View Students Data</asp:HyperLink>
    </asp:Panel>
</asp:Content>
