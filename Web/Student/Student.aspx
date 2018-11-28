<%@ Page Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Web.Student.Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div><h1>Student
         </h1></div>
    <div>
        <asp:HyperLink runat="server" NavigateUrl="~/Student/StudentAssessment.aspx"></asp:HyperLink>
        <br />
        <asp:HyperLink runat="server" NavigateUrl="~/Student/ViewAssessment.aspx"> View assessment</asp:HyperLink>
        &nbsp;
        &nbsp;
    </div>
</asp:Content>
