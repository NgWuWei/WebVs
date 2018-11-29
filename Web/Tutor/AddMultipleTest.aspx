<%@ Page Title="" Language="C#" MasterPageFile="~/AssessmentMenu.Master" AutoEventWireup="true" CodeBehind="AddMultipleTest.aspx.cs" Inherits="Web.Tutor.AddMultipleTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
<style type="text/css">
        .auto-style5 {
            height: 23px;
        }
        .auto-style7 {
            height: 23px;
            width: 171px;
        }
        .auto-style8 {
            width: 100%;
            margin-top: 73px;
        }
        .auto-style9 {
            margin-top: 0px;
        }
        .auto-style10 {
            height: 22px;
            width: 171px;
        }
        .auto-style11 {
            height: 22px;
        }
        .auto-style16 {
        margin-left: 252px;
        margin-top: 54px;
    }
    </style>
    <br />
    <br />
    <br />


        TEST NAME     :   <asp:Label ID="testnamelbl" runat="server"></asp:Label>
    <br /><br />
        QUESTION TYPE :   <asp:Label ID="questiontypelbl" runat="server"></asp:Label>
    
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
<div style="float:right">
        <asp:Button ID="returnbtn" runat="server" Text="Return to test menu" OnClick="returnbtn_Click" />
</div>

    <table id="TestTable" class="auto-style8">  
            <tr>
                <td class="auto-style7">Question Entry Options</td>
                <td class="auto-style5">Question Details</td>
            </tr>
            <tr>
                <td class="auto-style10"><br />
                
                    <br />
                    <br />
                    *QUESTION NO.<br />
                    <asp:Label ID="QuestionNolbl" runat="server"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="QuestionTxt" runat="server" CssClass="auto-style9" Height="126px" Width="535px"></asp:TextBox>
                    <br />
                    <asp:Label ID="mulquestionResultlbl" runat="server" Text="Please Select the Marks: "></asp:Label>
                    <asp:TextBox ID="Markstxt" TextMode="Number" runat="server" min="1" max="20" step="1"/>
                    <br />

                </td>
            </tr>
            </table>
        <div>
            

            <asp:GridView ID="MultiTestView" runat="server" AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="No"
                ShowHeaderWhenEmpty="True"

                OnRowCommand="multiTest_RowCommand"  OnRowEditing="multiTest_RowEditing" OnRowCancelingEdit="multiTest_RowCancelingEdit"
                OnRowUpdating="multiTest_RowUpdating" OnRowDeleting="multiTest_RowDeleting"

                BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" CssClass="auto-style16">
                <%-- Theme Properties --%>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle ForeColor="Black" BackColor="#EEEEEE" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
                
                <AlternatingRowStyle BackColor="#DCDCDC" />
                
                <Columns>
                    <asp:templatefield HeaderText="Select">
                    <itemtemplate>
                        <asp:checkbox ID="cbSelect" 

                        CssClass="gridCB" runat="server"></asp:checkbox>
                    </itemtemplate>
                    </asp:templatefield>

                    <asp:TemplateField HeaderText="Answer No.">
                        <ItemTemplate>
                            <asp:Label ID="txtmqdAnswerID" Text='<%# Eval("maAnswerID") %>' runat="server"  ></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtmqdAnswerID"   runat="server" />
                        </EditItemTemplate>
             <%--           Text='<%# Eval("mqdAnswerID") %>'--%>
                        
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Answer Description">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("maAnswerDesc") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtmqdAnswerDescName" Text='<%# Eval("maAnswerDesc") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtmqdAnswerDescFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
     
  
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Resources/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Resources/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/Resources/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Resources/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ImageUrl="~/Resources/addnew.png" runat="server" CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="savebtn" runat="server" OnClick="savebtn_Click1" Text="Save" />
            <br />
            <br />

            <br />

        </div>


</asp:Content>
