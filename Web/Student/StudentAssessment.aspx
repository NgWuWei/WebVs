<%@ Page Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Web.Student.Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div><h1>Student
         </h1></div>
    <div>
        <!-- This page contains question that is prepared for student
            GridTable to show and load selected question
            
            TODO link database of assessment and group
            -->

        <!-- assessment id, assessment name and question title the same, question type, question no., due date, timer-->

        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>

    </div>
</asp:Content>