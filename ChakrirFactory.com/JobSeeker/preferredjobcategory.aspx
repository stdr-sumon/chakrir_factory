<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Pages/JobSeeker_MasterPage.Master" AutoEventWireup="true" CodeBehind="preferredjobcategory.aspx.cs" Inherits="ChakrirFactory.com.JobSeeker.preferredjobcategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container" style="width:900px">    
    <form class="form-horizontal" role="form" runat="server">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <h2>Job Category</h2>
            <hr />

            <h4>Preferred Job Category</h4>
            <hr />
            <div class="form-group">
                <label for="ddlJobCategory_1" class="col-sm-2 control-label">Job Category 1</label>
                <div class="col-sm-6">
                    <asp:DropDownList ID="ddlJobCategory_1" runat="server" class="form-control" autofocus AutoPostBack="True">
                    <asp:ListItem>--Select Job Category--</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
                <label for="ddlJobCategory_2" class="col-sm-2 control-label">Job Category 2</label>
                <div class="col-sm-6">
                    <asp:DropDownList ID="ddlJobCategory_2" runat="server" class="form-control" autofocus AutoPostBack="True">
                    <asp:ListItem>--Select Job Category--</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

            <div class="form-group">
                <label for="ddlJobCategory_3" class="col-sm-2 control-label">Job Category 3</label>
                <div class="col-sm-6">
                    <asp:DropDownList ID="ddlJobCategory_3" runat="server" class="form-control" autofocus AutoPostBack="True">
                    <asp:ListItem>--Select Job Category--</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>


    <h4>Preferred Location</h4>
    <hr />
    <div class="form-group">
                <label for="ddlJobLocation_1" class="col-sm-2 control-label">Job Location 1</label>
                <div class="col-sm-6">
                    <asp:DropDownList ID="ddlJobLocation_1" runat="server" class="form-control" autofocus AutoPostBack="True">
                    <asp:ListItem>--Select Job Location--</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

    <div class="form-group">
                <label for="ddlJobLocation_2" class="col-sm-2 control-label">Job Location 2</label>
                <div class="col-sm-6">
                    <asp:DropDownList ID="ddlJobLocation_2" runat="server" class="form-control" autofocus AutoPostBack="True">
                    <asp:ListItem>--Select Job Location--</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

            <div class="form-group">
                <label for="ddlJobLocation_3" class="col-sm-2 control-label">Job Location 3</label>
                <div class="col-sm-6">
                    <asp:DropDownList ID="ddlJobLocation_3" runat="server" class="form-control" autofocus AutoPostBack="True">
                    <asp:ListItem>--Select Job Location--</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

</ContentTemplate>
</asp:UpdatePanel>           
        <div class="form-group">
            <div class="col-sm-6 col-sm-offset-2">
                <asp:Button ID="btn_JobCategorySave" runat="server" Text="Save" class="btn btn-primary btn-block" OnClick="btn_JobCategorySave_Click"/>
            </div>
        </div>
<div>
    <asp:Label ID="lblJobSeekerPreferredJobCatandLocErrorMsg" runat="server" Visible="False" Text=""></asp:Label>
</div>
</form> <!-- /form -->
<br />
</div> <!-- ./container -->
</asp:Content>
