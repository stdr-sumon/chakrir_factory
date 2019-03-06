<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Pages/Common_MasterPage.Master" AutoEventWireup="true" CodeBehind="companysignup.aspx.cs" Inherits="ChakrirFactory.com.companysignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ChakrirFactory :: Company Sign Up </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link href="css/companysignup.css" rel="stylesheet" />
<div class="container">
    <h1 class="well">Company Registration Form</h1>
    <div class="col-lg-12 well">
        <div class="row">
            <form runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>                  
                <div class="col-sm-12">
                    <div class="well">
                        <h3>Account Information</h3>   
                        <div class="row">
                            <div class="col-sm-12 form-group">
                                <label>User Name</label>
                                <asp:TextBox ID="txtCompanyUserName" runat="server" placeholder="User Name" class="form-control" autofocus></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldUserName" runat="server" ControlToValidate="txtCompanyUserName" ErrorMessage="*User Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label>Password</label>
                                 <asp:TextBox ID="txtCompanyPassword" runat="server" placeholder="Password" class="form-control" autofocus TextMode="Password"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldPassword" runat="server" ControlToValidate="txtCompanyPassword" ErrorMessage="*Password Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label>Confirm Password</label>
                                <asp:TextBox ID="txtCompanyConfirmPassword" runat="server" placeholder="Confirm Password" class="form-control" autofocus TextMode="Password" required="required"></asp:TextBox>
                                <asp:CompareValidator ID="ComparePassword" runat="server" ControlToCompare="txtCompanyPassword" ControlToValidate="txtCompanyConfirmPassword" ErrorMessage="*Password Doesn't Matched" ForeColor="Red"></asp:CompareValidator>
                            </div>
                        </div>
                    </div>

                    <div class="well">
                        <h3>Company Details</h3>   
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <label>Compnay Name</label>
                                <asp:TextBox ID="txtCompanyName" runat="server" placeholder="Company Name" class="form-control" autofocus></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCompanyName" ErrorMessage="*Company Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label>Compnay Phone Number</label>
                                 <asp:TextBox ID="txtCompanyPhoneNum" runat="server" placeholder="Company Phone Number" class="form-control" autofocus></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCompanyPhoneNum" ErrorMessage="*Company Phone Number Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-sm-12 form-group">
                                <label>Company Description</label>
                                <asp:TextBox ID="txtCompanyDescription" runat="server" placeholder="Company Description" class="form-control" autofocus TextMode="MultiLine" Rows="3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCompanyDescription" ErrorMessage="*Company Description Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>  

                            <div class="col-sm-12 form-group">
                                <label>Company Address</label>
                                <asp:TextBox ID="txtCompanyAddress" runat="server" placeholder="Company Address" class="form-control" autofocus TextMode="MultiLine" Rows="2"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCompanyAddress" ErrorMessage="*Company Address Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>  

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                            <div class="col-sm-12 form-group">
                                <label>Comapany City</label>
                                <asp:DropDownList ID="ddlCompanyCity" runat="server" class="form-control" autofocus AutoPostBack="True"></asp:DropDownList>                                                  
                            </ContentTemplate>
                            </asp:UpdatePanel>
                            </div>    
                        </div>
                    </div>

                    <div class="well">
                        <h3>Company Person Details</h3>   
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <label>Contact Person Name</label>
                                <asp:TextBox ID="txtContactPersonName" runat="server" placeholder="Contact Person Name" class="form-control" autofocus></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtContactPersonName" ErrorMessage="*Contact Person Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label>Contact Person Designation</label>
                                 <asp:TextBox ID="txtCompanyPersionDesignation" runat="server" placeholder="Contact Person Designation" class="form-control" autofocus></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCompanyPersionDesignation" ErrorMessage="*Contact Person Designation Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label>Contact Person Phone Number</label>
                                <asp:TextBox ID="txtContactPersonPhone" runat="server" placeholder="Contact Person Phone Number" class="form-control" autofocus></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtContactPersonPhone" ErrorMessage="*Contact Person Phone Number Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            
                        </div>
                    </div>                          

                    <div class="col-sm-2 form-group">
                        <asp:Button ID="btn_CompanyRegistration" runat="server" Text="Register" class="btn btn-primary btn-block" OnClick="btn_CompanyRegistration_Click"/>
                    </div>  
                    <div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblComapanyErrorMsg" runat="server" Visible="False" Text=""></asp:Label>
                    </div>                 
        </form>
            
        </div>
    </div>
    </div>
</asp:Content>
