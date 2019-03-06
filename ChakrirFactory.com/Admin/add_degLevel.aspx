<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Pages/Admin_MasterPage.Master" AutoEventWireup="true" CodeBehind="add_degLevel.aspx.cs" Inherits="ChakrirFactory.com.Admin.add_degLevel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-top: 4;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <asp:GridView ID="gvDegLevel" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="DegLevel_ID,EduLevel_ID" ForeColor="#333333" GridLines="None" ShowFooter="True" Width="707px" OnRowCommand="gvDegLevel_RowCommand"  OnRowDataBound="gvDegLevel_RowDataBound" OnRowCancelingEdit="gvDegLevel_RowCancelingEdit" OnRowDeleting="gvDegLevel_RowDeleting" OnRowEditing="gvDegLevel_RowEditing" OnRowUpdating="gvDegLevel_RowUpdating" OnPageIndexChanging="gvDegLevel_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="DegLevel_ID" HeaderText="Degree Level ID" ReadOnly="True" />
                <asp:TemplateField HeaderText="Degree Level Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDegLevelName" runat="server" Text='<%# Eval("DegLevel_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtDegLevelNameAdd" runat="server" ForeColor="#3366CC" Width="135px"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblDegLevelName" runat="server" Text='<%# Eval("DegLevel_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Education level">
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlEduLevel" runat="server" ForeColor="#3333FF">
                        </asp:DropDownList>
                        <asp:Button ID="btnEduLevelAdd" runat="server" CommandName="AddNew" CssClass="auto-style1" Font-Bold="True" ForeColor="#000066" Height="23px" Text="Add" Width="83px" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEduLevelName" runat="server" Text='<%# Eval("EduLevel_Name") %>'></asp:Label>
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
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:Label ID="lblresult" runat="server"></asp:Label>
    </form>

</asp:Content>
