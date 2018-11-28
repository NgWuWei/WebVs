<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Web.Menu1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 44px;
            margin-right: 47px;
        }
        .auto-style2 {
            margin-left: 72px;
        }
        .auto-style3 {
            margin-left: 119px;
        }
        .auto-style4 {
            margin-left: 71px;
            margin-top: 0px;
        }
        .auto-style5 {
            margin-left: 44px;
        }
        .auto-style7 {
            margin-left: 32px;
        }
        .auto-style8 {
            margin-left: 33px;
            margin-top: 0px;
        }
        .auto-style11 {
            height: 278px;
            margin-top: 31%;
        }
        .auto-style12 {
            margin-left: 16px;
        }
        .auto-style13 {
            margin-top: 0px;
        }
        .auto-style14 {
            margin-left: 6px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div style="float:right">
        <br />
        <asp:ImageButton ID="ImageButton1" runat="server" Height="51px" ImageUrl="~/picture/test.jpg" Width="52px" />
        <asp:ImageButton ID="ImageButton2" runat="server" CssClass="auto-style13" Height="50px" ImageUrl="~/picture/group.png" Width="49px" />
        <asp:ImageButton ID="ImageButton3" runat="server" CssClass="auto-style14" Height="47px" ImageUrl="~/picture/link.png" Width="45px" />
    </div>

    <br />
    <asp:Panel ID="Panel1" runat="server" Height="588px" Width="991px">
        <div style="text-align:center" class="auto-style11">
            <h2 style="text-align:center">How ClassWork Works</h2>
            <asp:Image ID="Image1" runat="server" BorderColor="Black" CssClass="auto-style1" ForeColor="Black" Height="80px" ImageUrl="~/picture/1.png" Width="80px" />
            &nbsp;<asp:Image ID="Image2" runat="server" CssClass="auto-style2" Height="80px" ImageUrl="~/picture/2.png" Width="80px" BorderColor="Black" ForeColor="Black" />
            <asp:Image ID="Image3" runat="server" CssClass="auto-style3" Height="79px" ImageUrl="~/picture/3.jpg" Width="80px" />
            <br />
            <br />
            <asp:Image ID="Image4" runat="server" CssClass="auto-style4" Height="83px" ImageUrl="~/picture/test.jpg" Width="82px" />
            <asp:Image ID="Image5" runat="server" CssClass="auto-style5" Height="46px" ImageUrl="~/picture/right.jpg" Width="43px" />
            &nbsp;&nbsp;
            <asp:Image ID="Image9" runat="server" CssClass="auto-style12" Height="76px" ImageUrl="~/picture/link.png" Width="84px" />
            <asp:Image ID="Image7" runat="server" CssClass="auto-style7" Height="48px" ImageUrl="~/picture/right.jpg" Width="43px" />
            <asp:Image ID="Image8" runat="server" CssClass="auto-style8" Height="78px" ImageUrl="~/picture/correct.jpg" Width="96px" />
        </div>
    </asp:Panel>


</asp:Content>
