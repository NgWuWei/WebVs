<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="TutorProfile.aspx.cs" Inherits="Web.Tutor.TutorProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h1>This is <%# Session["name"].ToString() %></h1>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="tutorID" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            tutorID:
            <asp:Label ID="tutorIDLabel" runat="server" Text='<%# Eval("tutorID") %>' />
            <br />
            tutorName:
            <asp:Label ID="tutorNameLabel" runat="server" Text='<%# Eval("tutorName") %>' />
            <br />
            tutorEmail:
            <asp:Label ID="tutorEmailLabel" runat="server" Text='<%# Eval("tutorEmail") %>' />
            <br />
            tutorBirthdate:
            <asp:Label ID="tutorBirthdateLabel" runat="server" Text='<%# Eval("tutorBirthdate") %>' />
            <br />
            tutorGender:
            <asp:Label ID="tutorGenderLabel" runat="server" Text='<%# Eval("tutorGender") %>' />
            <br />
            tutorSubject:
            <asp:Label ID="tutorSubjectLabel" runat="server" Text='<%# Eval("tutorSubject") %>' />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select * from tutors where tutorid = @id">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="user" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
