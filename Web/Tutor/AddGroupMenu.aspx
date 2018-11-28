<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="AddGroupMenu.aspx.cs" Inherits="Web.Tutor.AddGroupMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
      <style type="text/css">
        .auto-style1 {
            margin-top: 175px;
            width: 494px;
            height: 126px;
            margin-left: 304px;
        }
        .auto-style2 {
            margin-left: 90px;
        }
        .auto-style4 {
            margin-top: 61px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">

    <div style="border-style:groove;align-items:center;text-align:center" class="auto-style1">
        <asp:Label ID="lblNewGroup" runat="server" Text="Group Name : " ></asp:Label>
        <asp:TextBox ID="txtGroupName" runat="server" style="text-align:center" CssClass="auto-style2"></asp:TextBox>
       
        <br />
        <asp:Button ID="AddGroupbtn" runat="server" BackColor="#FF3300" ForeColor="White" Text="Create Group"  OnClientClick="javascript:alert('You are now will be directed to the add group page')"  OnClick ="AddTestbtn_Click" CssClass="auto-style4" />
      </div>
</asp:Content>
