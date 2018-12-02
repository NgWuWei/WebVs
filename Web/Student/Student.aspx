<%@ Page Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Web.Student.Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div><h1>Hello <% Session["name"].ToString(); %>
         </h1></div>
    <div>
        <asp:HyperLink runat="server" NavigateUrl="~/Student/StudentAssessment.aspx">Check Assessments</asp:HyperLink>
        <br />
        <asp:HyperLink runat="server" NavigateUrl="~/Student/ViewAssessment.aspx">View Assessment</asp:HyperLink>
        <br />
    </div>
</asp:Content>
