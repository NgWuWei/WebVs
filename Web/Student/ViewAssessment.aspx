<%@ Page Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="ViewAssessment.aspx.cs" Inherits="Web.Student.ViewAssessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div><h1>View Assessment Results</h1></div>
    <div>
        <!-- Get student name , assessment name, student score -->
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

    </div>
</asp:Content>
