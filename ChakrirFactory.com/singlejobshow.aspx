<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Pages/Common_MasterPage.Master" AutoEventWireup="true" CodeBehind="singlejobshow.aspx.cs" Inherits="ChakrirFactory.com.singlejobshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ChakrirFactory :: Job Description</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html, body, h1, h2, h3, h4, h5, h6 {
            font-family: "Roboto", sans-serif;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Container -->
    <div class="w3-content w3-margin-top" style="max-width: 1400px;">

        <!-- The Grid -->
        <div class="w3-row-padding">

            <!-- Left Column -->
            <div class="w3-third">

                <div class="w3-white w3-text-grey w3-card-4">
                    <div class="w3-container">
                        <br>
                        <p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>Job Summary</b></p>
                        <p><b>Job Published: </b><span runat="server" id="job_pub"></span></p>
                        <p><b>Job Category: </b><span runat="server" id="job_cat"></span></p>
                        <p><b>Vacancy No: </b><span runat="server" id="job_vacancy"></span></p>
                        <p><b>Gender: </b><span runat="server" id="job_gen"></span></p>
                        <p><b>Selary Range: </b><span runat="server" id="job_sal"></span></p>
                        <p><b>Job Nature: </b><span runat="server" id="job_nature"></span></p>
                        <p><b>Job Location: </b><span runat="server" id="job_city"></span></p>
                        <p><b>Job Dealine: </b><span runat="server" id="job_dead"></span></p>
                        <hr>
                        <p><b>Compane Name: </b><span runat="server" id="cmp_name">></span></p>
                        <p><b>Company Address: </b><span runat="server" id="cmp_add"></span></p>
                        <p><b>Company Phone: </b><span runat="server" id="cmp_phone"></span></p>
                    </div>
                </div>
                <br>

                    <form runat="server">
                    <div class="col-sm-4 form-group right">
                        <asp:Button ID="btn_ApplyOnline" runat="server" Text="Apply Online" class="btn btn-primary btn-block" OnClick="btn_ApplyOnline_Click"/>
                    </div>  
                    <div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblApplyOnlineMsg" runat="server" Visible="False" Text=""></asp:Label>
                    </div>  
                    </form >
                <!-- End Left Column -->
            </div>

            <!-- Right Column -->
            <div class="w3-twothird">

                <div class="w3-container w3-card w3-white w3-margin-bottom">
                    <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-suitcase w3-margin-right w3-xxlarge w3-text-teal" runat="server" id="jobTtile"></i></h2>
                    <div class="w3-container">
                        <h5 class="w3-opacity"><b>Job Description</b></h5>
                        <p runat="server" id="jobDescription"></p>
                    </div>
                </div>

                <div class="w3-container w3-card w3-white">
                    <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Requirements</h2>

                    <div class="w3-container">
                        <h5 class="w3-opacity"><b>Experience Requirements</b></h5>
                        <p runat="server" id="jobExpRequirement">Consectetur adipisicing elit. Praesentium magnam consectetur vel in deserunt aspernatur est reprehenderit sunt hic. Nulla tempora soluta ea et odio, unde doloremque repellendus iure, iste.</p>
                        <hr>
                    </div>

                    <div class="w3-container">
                        <h5 class="w3-opacity"><b>Job Requirements</b></h5>
                        <p runat="server" id="jobJobRequirement">Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p>
                        <br>
                        <hr>
                    </div>

                    <div class="w3-container">
                        <h5 class="w3-opacity"><b>Educational Requirements</b></h5>
                        <p runat="server" id="eduRequirement">Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p>
                        <br>
                    </div>
                    <hr>

                    <div class="w3-container">
                        <h5 class="w3-opacity"><b>Other Benefiys</b></h5>
                        <p runat="server" id="job_other">Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p>
                        <br>
                    </div>
                </div>               

                <!-- End Right Column -->
            </div>

            <!-- End Grid -->
        </div>

        <!-- End Page Container -->
    </div>
</asp:Content>
