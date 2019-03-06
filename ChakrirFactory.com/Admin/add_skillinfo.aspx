<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Pages/Admin_MasterPage.Master" AutoEventWireup="true" CodeBehind="add_skillinfo.aspx.cs" Inherits="ChakrirFactory.com.Admin.add_skillinfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
    
    <asp:GridView ID="gvSkill" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Skill_ID" ForeColor="#333333" Height="69px" ShowFooter="True" Width="605px" OnRowCommand="gvSkill_RowCommand" OnRowCancelingEdit="gvSkill_RowCancelingEdit" OnRowDeleting="gvSkill_RowDeleting" OnRowEditing="gvSkill_RowEditing" OnRowUpdating="gvSkill_RowUpdating" OnPageIndexChanging="gvSkill_PageIndexChanging">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Skill_ID" HeaderText="Language Proficiency ID" ReadOnly="True" />
            <asp:TemplateField HeaderText="Language Proficiency Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtSkillName" runat="server" Text='<%# Eval("Skill_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtSkillNameAdd" runat="server" Width="135px" ForeColor="#3366CC"></asp:TextBox>
                    <asp:Button ID="btnSkillAdd" runat="server" CommandName="AddNew" Font-Bold="True" ForeColor="#000066" Text="Add" Width="83px" />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblSkillName" runat="server" Text='<%# Eval("Skill_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" BorderColor="#000099" BorderStyle="Solid" BorderWidth="2px" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:Label ID="lblresult" runat="server"></asp:Label>

    </form>

</asp:Content>
