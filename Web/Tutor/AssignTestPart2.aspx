﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="AssignTestPart2.aspx.cs" Inherits="Web.Tutor.AssignTestPart2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">

    <div>
        <asp:Label ID="Confirmlbl" runat="server"  ></asp:Label>
    </div>
    <asp:Button ID="confirmbtn" runat="server" Text="Confirm" OnClick="confirmbtn_Click" />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>