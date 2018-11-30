<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="AssignTestPart1.aspx.cs" Inherits="Web.Tutor.AssignTestPart1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    
    <table style="width:100%;">
        <tr>
            <td>
                <h3>1) Please select the group : </h3>
                <br />
                <asp:CheckBoxList ID="GroupCBL" runat="server"></asp:CheckBoxList>
                <br />
                <hr />
                <h3>2) Available For Eveyone</h3>
                <br />
                
                <br />
                <div>
                    <asp:Button ID="nextbtn" runat="server" Text="Next" OnClick="nextbtn_Click" />
                </div>
                 <hr />
                <div>>
                    <asp:Button ID="ceratenewbtn" runat="server" Text="Create New Group" OnClick="ceratenewbtn_Click" />
                </div>
                
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>
