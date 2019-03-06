<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Pages/Common_MasterPage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ChakrirFactory.com.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ChakrirFactory :: Home</title>
    <style>
        #jobs {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 1275px;
            background-color: white;
            margin-top: 10px;
            margin-bottom: 10px;
            margin-left: 10px;
        }

        #jobs td, #jobs th {
            background-color: #fff;
            padding: 8px;
        }

        #jobs td:hover {
            background-color: #ddd;
        }

        #jobs th {
            font-size: 23px;
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #3e5e8e;
            color: white;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Table ID="Table1" runat="server" Height="100%" Width="100%" BackImageUrl="~/img/banner.jpg">
            <asp:TableRow>
                <asp:TableCell Width="5%">

                </asp:TableCell>
                <asp:TableCell Width="60%">
                    <asp:Table runat="server" Height="100%" Width="100%" CellPadding="0" CellSpacing="0">
                        <asp:TableRow>
                            <asp:TableCell>
                                <br />
                                <br />
                                <div>
                                    <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="X-Large" Font-Bold="True">Find the Right Job</asp:Label>
                                </div>
                                <br />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Center" VerticalAlign="Middle">
                                <div class="divbold">
                                    <div class="form-group">
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" placeholder="Location Name" id="txtLocationName" runat="server">
                                        </div>
                                        <div class="col-sm-4">
                                            <select class="form-control" id="ddlIndustryCategory" runat="server">
                                                <option>Industry Type</option>
                                                <option>Option one</option>
                                                <option>Option two</option>
                                                <option>Option three</option>
                                                <option>Option four</option>
                                            </select>
                                        </div>
                                        <button type="button" class="btn btn-round btn-success" runat="server">Search</button>
                                    </div>
                                </div>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <br/>                
                                    <button type="button" class="btn btn-primary">LIVE JOBS <br/> <span class="badge">2048</span></button> &nbsp; &nbsp; &nbsp; &nbsp;
                                    <button type="button" class="btn btn-primary">COMPANIES <br/><span class="badge">335</span></button>    &nbsp; &nbsp; &nbsp; &nbsp;
                                    <button type="button" class="btn btn-primary">NES JOBS <br/> <span class="badge">124</span></button>  &nbsp; &nbsp; &nbsp; &nbsp;
                                <br/>
                                <br/>
                                <br/>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
                <asp:TableCell Width="5%"> </asp:TableCell>
                <asp:TableCell Width="25%" BackColor="#3e5e8e" HorizontalAlign="Center" VerticalAlign="Middle">
                    <div style="padding:15px;">
                        <br />
                        <a class="btn btn-primary" style="background-color:transparent; border-color:white; color:white;" href="cityjobshow.aspx?jobCity_Name=Dhaka">Dhaka </a> &nbsp; &nbsp;
                        <a class="btn btn-primary" style="background-color:transparent; border-color:white; color:white;" href="cityjobshow.aspx?jobCity_Name=Chittagong">Chittagong </a> &nbsp; &nbsp;
                        <br />
                        <br />
                        <a class="btn btn-primary" style="background-color:transparent; border-color:white; color:white;" href="cityjobshow.aspx?jobCity_Name=Rangpur">Rangpur </a> &nbsp; &nbsp;
                        <a class="btn btn-primary" style="background-color:transparent; border-color:white; color:white;" href="cityjobshow.aspx?jobCity_Name=Barisal">Barisal </a> &nbsp; &nbsp;
                        <br />
                        <br />
                        <a class="btn btn-primary" style="background-color:transparent; border-color:white; color:white;" href="cityjobshow.aspx?jobCity_Name=Khulna">Khulna </a> &nbsp; &nbsp;
                        <a class="btn btn-primary" style="background-color:transparent; border-color:white; color:white;" href="cityjobshow.aspx?jobCity_Name=Mymensingh">Mymensingh </a> &nbsp; &nbsp;
                        <br />
                        <br />
                        <a class="btn btn-primary" style="background-color:transparent; border-color:white; color:white;" href="cityjobshow.aspx?jobCity_Name=Sylhet">Sylhet </a> &nbsp; &nbsp;
                        <a class="btn btn-primary" style="background-color:transparent; border-color:white; color:white;" href="cityjobshow.aspx?jobCity_Name=Rajshahi">Rajshahi </a> &nbsp; &nbsp;
                        <br />
                        <br />
                    </div>            
                </asp:TableCell>
                <asp:TableCell Width="5%"> </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <div style="margin-left: 30px; margin-right: 30px; margin-bottom: 10px; margin-top: 10px;">
            <asp:PlaceHolder ID="placeholder" runat="server" />
        </div>
    </div>
</asp:Content>
