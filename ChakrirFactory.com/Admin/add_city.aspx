<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Pages/Admin_MasterPage.Master" AutoEventWireup="true" CodeBehind="add_city.aspx.cs" Inherits="ChakrirFactory.com.Admin.add_city" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-top: 4;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:GridView ID="gvCity" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="City_ID,Country_Name" ForeColor="#333333" GridLines="None" ShowFooter="True" Width="707px" OnRowCommand="gvCity_RowCommand"  OnRowDataBound="gvCity_RowDataBound" OnRowCancelingEdit="gvCity_RowCancelingEdit" OnRowDeleting="gvCity_RowDeleting" OnRowEditing="gvCity_RowEditing" OnRowUpdating="gvCity_RowUpdating" OnPageIndexChanging="gvCity_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="City_ID" HeaderText="City_ID" ReadOnly="True" />
                <asp:TemplateField HeaderText="City_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCityName" runat="server" Text='<%# Eval("City_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtCityNameAdd" runat="server" ForeColor="#3366CC" Width="135px"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCityName" runat="server" Text='<%# Eval("City_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Country_ID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlCountryEdit" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlCountry" runat="server" ForeColor="#3333FF">
                        </asp:DropDownList>
                        <asp:Button ID="btnCountryAdd" runat="server" CommandName="AddNew" CssClass="auto-style1" Font-Bold="True" ForeColor="#000066" Height="23px" Text="Add" Width="83px" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCountryName" runat="server" Text='<%# Eval("Country_Name") %>'></asp:Label>
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
