<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Pages/Common_MasterPage.Master" AutoEventWireup="true" CodeBehind="jobseekersignup.aspx.cs" Inherits="ChakrirFactory.com.jobseekersignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ChakrirFactory :: Job Seeker Sign Up</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/jobseekersignup.css" rel="stylesheet" />
<div class="container">
    <form class="form-horizontal" role="form" runat="server">
        <h2>Job Seeker Registration</h2>
        <hr />
        <div class="form-group">
            <label for="txtJobSeekerFirstName" class="col-sm-3 control-label">First Name</label>
            <div class="col-sm-9">
                <asp:TextBox ID="txtJobSeekerFirstName" runat="server" placeholder="First Name" class="form-control" autofocus></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldFirstName" runat="server" ControlToValidate="txtJobSeekerFirstName" ErrorMessage="*First Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="txtJobSeekerLastName" class="col-sm-3 control-label">Last Name</label>
            <div class="col-sm-9">
                <asp:TextBox ID="txtJobSeekerLastName" runat="server" placeholder="Last Name" class="form-control" autofocus></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldLastName" runat="server" ControlToValidate="txtJobSeekerLastName" ErrorMessage="*Last Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="txtJobSeekerEmail" class="col-sm-3 control-label">Email</label>
            <div class="col-sm-9">
                <asp:TextBox ID="txtJobSeekerEmail" runat="server" placeholder="Email" class="form-control" autofocus TextMode="Email" required="required"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionEmail" runat="server" ControlToValidate="txtJobSeekerEmail" ErrorMessage="*Email Should be in Valid Format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="txtJobSeekerUserName" class="col-sm-3 control-label">Username</label>
            <div class="col-sm-9">
                <asp:TextBox ID="txtJobSeekerUserName" runat="server" placeholder="Username" class="form-control" autofocus></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldUserName" runat="server" ControlToValidate="txtJobSeekerUserName" ErrorMessage="*Username Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="txtJobSeekerPassword" class="col-sm-3 control-label">Password</label>
            <div class="col-sm-9">
                <asp:TextBox ID="txtJobSeekerPassword" runat="server" placeholder="Password" class="form-control" autofocus TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldPassword" runat="server" ControlToValidate="txtJobSeekerPassword" ErrorMessage="*Password Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="txtJobSeekerConfirmPassword" class="col-sm-3 control-label">Confirm Password</label>
            <div class="col-sm-9">
                <asp:TextBox ID="txtJobSeekerConfirmPassword" runat="server" placeholder="Confirm Password" class="form-control" autofocus TextMode="Password" required="required"></asp:TextBox>
                <asp:CompareValidator ID="ComparePassword" runat="server" ControlToCompare="txtJobSeekerPassword" ControlToValidate="txtJobSeekerConfirmPassword" ErrorMessage="*Password Doesn't Matched" ForeColor="Red"></asp:CompareValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-9 col-sm-offset-3">
                <asp:Button ID="btn_JobSeekerRegistration" runat="server" Text="Register" class="btn btn-primary btn-block" OnClick="btn_JobSeekerRegistration_Click"/>
            </div>
        </div>
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblJobSeekerErrorMsg" runat="server" Visible="False" Text=""></asp:Label>
        </div>
    </form> <!-- /form -->
    <br />
</div> <!-- ./container -->
</asp:Content>
