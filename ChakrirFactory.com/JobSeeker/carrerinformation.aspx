<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Pages/JobSeeker_MasterPage.Master" AutoEventWireup="true" CodeBehind="carrerinformation.aspx.cs" Inherits="ChakrirFactory.com.JobSeeker.carrerinformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container" style="width:900px">    
    <form class="form-horizontal" role="form" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <h2>Carrer Information</h2>
        <hr />

        <div class="form-group">
            <label for="txtCarrerObjective" class="col-sm-2 control-label">Objective</label>
            <div class="col-sm-6">   
                <asp:TextBox ID="txtCarrerObjective" runat="server" Rows="10" placeholder="Write Objective Here.." class="form-control" TextMode="MultiLine"></asp:TextBox>     
            </div>
        </div>

        <div class="form-group">
            <label for="txtExpSal" class="col-sm-2 control-label">Expected Salary</label>
            <div class="col-sm-6">   
                <asp:TextBox ID="txtExpSal" runat="server" placeholder="Enter Expected Salary" class="form-control" autofocus></asp:TextBox>      
            </div>
        </div>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="form-group">
            <label for="ddlJobLevel" class="col-sm-2 control-label">Job Level</label>
            <div class="col-sm-6">
                <asp:DropDownList ID="ddlJobLevel" runat="server" class="form-control" autofocus AutoPostBack="True">
                    <asp:ListItem>--Select Job Level--</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <label for="ddlJobNature" class="col-sm-2 control-label">Job Nature</label>
            <div class="col-sm-6">
                <asp:DropDownList ID="ddlJobNature" runat="server" class="form-control" autofocus AutoPostBack="True">
                    <asp:ListItem>--Select Job Nature--</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div> 
            </ContentTemplate>
        </asp:UpdatePanel>           

        <div class="form-group">
            <div class="col-sm-6 col-sm-offset-2">
                <asp:Button ID="btn_CarrerInfoSave" runat="server" Text="Save" class="btn btn-primary btn-block" OnClick="btn_CarrerInfoSave_Click"/>
            </div>
        </div>

        <div>
            <asp:Label ID="lblJobSeekerCarrerInfoErrorMsg" runat="server" Visible="False" Text=""></asp:Label>
        </div>
    </form> <!-- /form -->
    <br />
</div> <!-- ./container -->
</asp:Content>
