<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Pages/Common_MasterPage.Master" AutoEventWireup="true" CodeBehind="naturejobshow.aspx.cs" Inherits="ChakrirFactory.com.fulltimejob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ChakrirFactory :: Jobs</title>
    <style>
        #jobs {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 1250px;
            background-color: white;
            margin-top: 50px;
            margin-bottom: 50px;
            margin-left: 50px;
        }

        #jobs td, #jobs th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #jobs tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #jobs tr:hover {
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
    <asp:PlaceHolder ID="placeholder" runat="server" />
</asp:Content>
