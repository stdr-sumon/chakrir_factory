﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Pages/Common_MasterPage.Master" AutoEventWireup="true" CodeBehind="jobseekersignin.aspx.cs" Inherits="ChakrirFactory.com.JobSeekerSignIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ChakrirFactory :: Job Seeker Sign In</title>
<link href="css/login.css" rel="stylesheet" />
<style type="text/css">
.auto-style1 {
	width: 400px
}
.auto-style2 {
	width: 800px;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table runat="server">
	<tr>
		<td class="auto-style1">

		</td>
		<td class="auto-style2">
			<div style="margin:15px;">
				<div class="col-md-8 single_right">
					<div class="login-form-section">
						<div class="login-content">
							<form runat="server">
								<div class="section-title well" style="text-align:center">
									<h2>Job Seeker Account Sigin</h2>
								</div>
								<div class="textbox-wrap">
									<div class="input-group">
										<span class="input-group-addon "><i class="fa fa-user"></i></span>
										<asp:TextBox ID="txtJobSeekeUsername" runat="server" required="required" class="form-control" placeholder="Username"></asp:TextBox>
									</div>
								</div>
								<div class="textbox-wrap">
									<div class="input-group">
										<span class="input-group-addon "><i class="fa fa-key"></i></span>
										<asp:TextBox ID="txtJobSeekePassword" runat="server" required="required" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
									</div>
								</div>
								<div class="forgot">
									<div class="login-check">
                                        <label class="checkbox1"><asp:CheckBox ID="chkBox_JobSeeker" runat="server" /><i> </i>Remember Me</label>                   
									</div>
									<div class="clearfix"> </div>
								</div>
								<div class="login-btn">
									<asp:Button ID="btn_JobSeeker_LogIn" runat="server" Text="Button" OnClick="btn_JobSeeker_LogIn_Click" />
								</div>
								<div class="login-bottom">
									<div class="social-icons">
										<h4>Don't have an Account? <a href="jobseekersignup.aspx"> Register Now!</a></h4>
										<br />
									</div>
								</div>
							</form>       
						</div>
					</div>
				</div>
			</div> 
		</td>
		<td>

		</td>
	</tr>
</table>
</asp:Content>