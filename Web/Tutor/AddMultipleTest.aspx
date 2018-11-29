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
        .auto-style13 {
            height: 40px;
            width: 171px;
        }
        .auto-style14 {
            height: 40px;
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
        <asp:Button ID="returnbtn" runat="server" Text="Return to test menu" />
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
                    *QUE4TION NO.<br />
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
            <tr>
                <td class="auto-style13">
                    *CORRECT ANSWER : <br />
                    <asp:DropDownList ID ="CorrectAnswerddl"  runat="server" ></asp:DropDownList>
                    <br />
                    <br />
                    <asp:Button ID="savebtn" runat="server" Text="Save"  />
                </td>
                <td class="auto-style14">
                
                <br />
            </td>
        </tr>
    </table>
    <table style="width: 100%;">
        
        <tr>
            <td>
                <asp:GridView ID="MultiTestView" runat="server" AutoGenerateColumns="False" ShowFooter="True" 
                    DataKeyNames="mqdAnswerID"
                ShowHeaderWhenEmpty="True"
                    OnRowCommand="multiTest_RowCommand" 

                 CellPadding="4" ForeColor="#333333" GridLines="None">

                    <AlternatingRowStyle BackColor="White" />

                    <Columns>
                    
                    <asp:TemplateField HeaderText="Answer Label">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("mqdAnswerLabel") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLastName" Text='<%# Eval("mqdAnswerLabel") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAnswerLabelFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Answer Description">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("mqdAnswerDesc") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtmqdAnswerDescName" Text='<%# Eval("mqdAnswerDesc") %>' runat="server" />
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

                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />

                </asp:GridView>

                <br />
                <asp:GridView ID="MultiTestView0" runat="server" AutoGenerateColumns="False" ShowFooter="True"
                ShowHeaderWhenEmpty="True"

                 CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="SqlDataSource1">

                    <AlternatingRowStyle BackColor="White" />

                    <Columns>
                    
                        <asp:BoundField DataField="mqdAnswerLabel" HeaderText="mqdAnswerLabel" SortExpression="mqdAnswerLabel" />
                        <asp:BoundField DataField="mqdAnswerDesc" HeaderText="mqdAnswerDesc" SortExpression="mqdAnswerDesc" />

                    </Columns>

                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />

                </asp:GridView>

                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT mqd.mqdAnswerLabel, mqd.mqdAnswerDesc FROM MultiQuestionDetail mqd, MultiQuestions mq WHERE mqd.mqQuestionID = mq.mqQuestionID"></asp:SqlDataSource>

                <br />

            </td>
        </tr>
    </table>

</asp:Content>
