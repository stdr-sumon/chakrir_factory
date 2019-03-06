<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Pages/JobSeeker_MasterPage.Master" AutoEventWireup="true" CodeBehind="personalinformation.aspx.cs" Inherits="ChakrirFactory.com.JobSeeker.personalinformation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Personal Information</title>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container" style="width:900px">    
    <form class="form-horizontal" role="form" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <h2>Personal Information</h2>
        <hr />

        <div class="form-group">
            <label for="txtFatherName" class="col-sm-2 control-label">Father Name</label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtFatherName" runat="server" placeholder="Enter Father Name" class="form-control" autofocus></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label for="txtMotherName" class="col-sm-2 control-label">Last Name</label>
            <div class="col-sm-6">   
                <asp:TextBox ID="txtMotherName" runat="server" placeholder="Enter Mother Name" class="form-control" autofocus></asp:TextBox>      
            </div>
        </div>

        <div class="form-group">
            <label for="txtDob" class="col-sm-2 control-label">Date of Birth</label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtDob" runat="server" placeholder="Enter Date of Birth" class="form-control" autofocus></asp:TextBox>      
            </div>
        </div>

        <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" BehaviorID="TextBox1_CalendarExtender" TargetControlID="txtDob">
        </ajaxToolkit:CalendarExtender>

        <div class="form-group">
            <label for="ddlGender" class="col-sm-2 control-label">Gender</label>
            <div class="col-sm-6">
                <asp:DropDownList ID="ddlGender" runat="server" class="form-control" autofocus>
                    <asp:ListItem>--Select Gender--</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <label for="ddlReligion" class="col-sm-2 control-label">Religion</label>
            <div class="col-sm-6">
                <asp:DropDownList ID="ddlReligion" runat="server" class="form-control" autofocus>
                    <asp:ListItem>--Select Religion--</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <label for="ddlMaritalStatus" class="col-sm-2 control-label">Marital Status</label>
            <div class="col-sm-6">
                <asp:DropDownList ID="ddlMaritalStatus" runat="server" class="form-control" autofocus>
                    <asp:ListItem>--Select Marital Status--</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <label for="txtNidNumber" class="col-sm-2 control-label">NID Number</label>
            <div class="col-sm-6">   
                <asp:TextBox ID="txtNidNumber" runat="server" placeholder="Enter NID Number" class="form-control" autofocus></asp:TextBox>      
            </div>
        </div>

        <div class="form-group">
            <label for="txtPresentAddress" class="col-sm-2 control-label">Present Address</label>
            <div class="col-sm-6">   
                <asp:TextBox ID="txtPresentAddress" runat="server" Rows="5" placeholder="Enter Present Address Here.." class="form-control" TextMode="MultiLine"></asp:TextBox>     
            </div>
        </div>

        <div class="form-group">
            <label for="txtPermanentAddress" class="col-sm-2 control-label">Permanent Address</label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtPermanentAddress" runat="server" Rows="5" placeholder="Enter Permanent Address Here.." class="form-control" TextMode="MultiLine"></asp:TextBox>   
            </div>
        </div>
         
        <div class="form-group">
            <label for="ddlCurentCity" class="col-sm-2 control-label">Current City</label>
            <div class="col-sm-6">
                <asp:DropDownList ID="ddlCurentCity" runat="server" class="form-control" autofocus ="">
                    <asp:ListItem>--Select Current City--</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <label for="txtPhoneNum_1" class="col-sm-2 control-label">Phone Number 1</label>
            <div class="col-sm-6">    
                <asp:TextBox ID="txtPhoneNum_1" runat="server" placeholder="Enter Phone Number 1" class="form-control" autofocus></asp:TextBox>    
            </div>
        </div>

        <div class="form-group">
            <label for="txtPhoneNum_2" class="col-sm-2 control-label">Phone Number 2</label>
            <div class="col-sm-6">    
                <asp:TextBox ID="txtPhoneNum_2" runat="server" placeholder="Enter Phone Number 2" class="form-control" autofocus></asp:TextBox>  
                 
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-6 col-sm-offset-2">
                <asp:Button ID="btn_PersonalInfoSave" runat="server" Text="Save" class="btn btn-primary btn-block" OnClick="btn_PersonalInfoSave_Click"/>
            </div>
        </div>

        <div>
            <asp:Label ID="lblJobSeekerPersonalInfoErrorMsg" runat="server" Visible="False" Text=""></asp:Label>
        </div>
    </form> <!-- /form -->
    <br />
</div> <!-- ./container -->
</asp:Content>
