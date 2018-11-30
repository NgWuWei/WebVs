<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="Web.Student.StudentProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h1>Hello! <%# Session["name"] %></h1>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
    <h3>Your profile details. Design will improve...</h3>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="studId" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            studId:
            <asp:Label ID="studIdLabel" runat="server" Text='<%# Eval("studId") %>' />
            <br />
            studName:
            <asp:Label ID="studNameLabel" runat="server" Text='<%# Eval("studName") %>' />
            <br />
            studEmail:
            <asp:Label ID="studEmailLabel" runat="server" Text='<%# Eval("studEmail") %>' />
            <br />
            studBirthdate:
            <asp:Label ID="studBirthdateLabel" runat="server" Text='<%# Eval("studBirthdate") %>' />
            <br />
            studGrade:
            <asp:Label ID="studGradeLabel" runat="server" Text='<%# Eval("studGrade") %>' />
            <br />
            studGender:
            <asp:Label ID="studGenderLabel" runat="server" Text='<%# Eval("studGender") %>' />
            <br />
            studPrivate:
            <asp:Label ID="studPrivateLabel" runat="server" Text='<%# Eval("studPrivate") %>' />
            <br />
            courseId:
            <asp:Label ID="courseIdLabel" runat="server" Text='<%# Eval("courseId") %>' />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select * from students where studId = @id">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="user" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
