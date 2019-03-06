<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Pages/Company_MasterPage.Master" AutoEventWireup="true" CodeBehind="postjob.aspx.cs" Inherits="ChakrirFactory.com.Company.postjob" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="width:900px">    
    <form class="form-horizontal" role="form" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <h2>Post a Job</h2>
        <hr />

        <div class="form-group">
            <label for="txtJobTitle" class="col-sm-2 control-label">Job Title</label>
            <br/>
            <div class="col-sm-8">
                <asp:TextBox ID="txtJobTitle" runat="server" placeholder="Enter Job Title" class="form-control" autofocus></asp:TextBox>
            </div>
        </div>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="form-group">
                <label for="ddlJobCategory" class="col-sm-2 control-label">Job Category</label>
                <br/>
                <div class="col-sm-8">
                    <asp:DropDownList ID="ddlJobCategory" runat="server" class="form-control" autofocus AutoPostBack="True">
                    </asp:DropDownList>
                </div>
            </div>                                              
        </ContentTemplate>
        </asp:UpdatePanel>   

        <div class="form-group">
            <label for="txtJobVacancyNo" class="col-sm-2 control-label">Vacancy No.</label>
            <br/>
            <div class="col-sm-8">
                <asp:TextBox ID="txtJobVacancyNo" runat="server" placeholder="Enter Vacancy No" class="form-control" autofocus ></asp:TextBox>
            </div>
        </div>

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="form-group">
                <label for="ddlGender" class="col-sm-2 control-label">Gender</label>
                <br/>
                <div class="col-sm-8">
                    <asp:DropDownList ID="ddlGender" runat="server" class="form-control" autofocus AutoPostBack="True">
                        <asp:ListItem Value="1">Male</asp:ListItem>
                        <asp:ListItem Value="2">Female</asp:ListItem>
                        <asp:ListItem Value="3">Others</asp:ListItem>
                        <asp:ListItem Value="4">All</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>                                              
        </ContentTemplate>
        </asp:UpdatePanel> 

        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <div class="form-group">
                <label for="ddlJobNature" class="col-sm-2 control-label">Job Nature</label>
                <br/>
                <div class="col-sm-8">
                    <asp:DropDownList ID="ddlJobNature" runat="server" class="form-control" autofocus AutoPostBack="True">
                    </asp:DropDownList>
                </div>
            </div>                                              
        </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>
            <div class="form-group">
                <label for="ddlJobLocation" class="col-sm-2 control-label">Job Location</label>
                <br/>
                <div class="col-sm-8">
                    <asp:DropDownList ID="ddlJobLocation" runat="server" class="form-control" autofocus AutoPostBack="True">
                    </asp:DropDownList>
                </div>
            </div>                                              
        </ContentTemplate>
        </asp:UpdatePanel>

        <div class="form-group">
            <label for="txtSalRange" class="col-sm-2 control-label">Salary Range</label>
            <br/>
            <div class="col-sm-8">
                <asp:TextBox ID="txtSalRange" runat="server" placeholder="Enter Salary Range" class="form-control" autofocus ></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label for="txtJobDescription" class="col-sm-2 control-label">Job Description</label>
            <br/>
            <div class="col-sm-8">   
                <asp:TextBox ID="txtJobDescription" runat="server" placeholder="Enter Job Description" class="form-control" autofocus TextMode="MultiLine" Rows="10"></asp:TextBox>      
            </div>
        </div>

        <div class="form-group">
            <label for="txtJobExpReq" class="col-sm-2 control-label">Job Experiance Requriment</label>
            <br/>
            <div class="col-sm-8">   
                <asp:TextBox ID="txtJobExpReq" runat="server" placeholder="Enter Job Experiance Requriment" class="form-control" autofocus TextMode="MultiLine" Rows="4"></asp:TextBox>      
            </div>
        </div>


        <div class="form-group">
            <label for="txtJobEduReq" class="col-sm-2 control-label">Job Education Requriment</label>
            <br/>
            <div class="col-sm-8">   
                <asp:TextBox ID="txtJobEduReq" runat="server" placeholder="Enter Job Education Requriment" class="form-control" autofocus TextMode="MultiLine" Rows="4"></asp:TextBox>      
            </div>
        </div>

        <div class="form-group">
            <label for="txtJobJobReq" class="col-sm-2 control-label">Job Requriment</label>
            <br/>
            <div class="col-sm-8">   
                <asp:TextBox ID="txtJobJobReq" runat="server" placeholder="Enter Job Requriment" class="form-control" autofocus TextMode="MultiLine" Rows="8"></asp:TextBox>      
            </div>
        </div>

        <div class="form-group">
            <label for="txtOtherBenifit" class="col-sm-2 control-label">Other Benefit</label>
            <br/>
            <div class="col-sm-8">   
                <asp:TextBox ID="txtOtherBenifit" runat="server" placeholder="Enter Other Benefit" class="form-control" autofocus TextMode="MultiLine" Rows="4"></asp:TextBox>      
            </div>
        </div>

        <div class="form-group">
            <label for="txtPostDeadDate" class="col-sm-2 control-label">Job Post Deadline</label>
            <div class="col-sm-8">
                <asp:TextBox ID="txtPostDeadDate" runat="server" placeholder="Enter Job Post Deadline" class="form-control" autofocus TextMode="Date"></asp:TextBox>      
                <%--<ajaxToolkit:CalendarExtender ID="txtPostDeadDate_CalendarExtender" runat="server" BehaviorID="txtPostDeadDate_CalendarExtender" TargetControlID="txtPostDeadDate" />--%>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-3 col-sm-offset-2">
                <asp:Button ID="btn_JobPost" runat="server" Text="Post" class="btn btn-primary btn-block" OnClick="btn_JobPost_Click"/>
            </div>
        </div>

        <div>
            <asp:Label ID="lblJobPostErrorMsg" runat="server" Visible="False" Text=""></asp:Label>
        </div>
    </form> <!-- /form -->
    <br />
</div> <!-- ./container -->
</asp:Content>
