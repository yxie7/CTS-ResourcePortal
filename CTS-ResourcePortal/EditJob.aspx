<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="EditJob.aspx.cs" Inherits="CTS_ResourcePortal.EditJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <link href="AddNew.css" rel="stylesheet" />
    <link href="css.css" rel="stylesheet" />
    <div class="container">
        <div class="row">
            <div class="col"></div>
            <h2 class="col-md-auto">Edit Job Opening</h2>
            <div class="col"></div>
        </div>
        <br />
        <div class="section">
            <br />
            <asp:Label ID="lblRequired" runat="server"><span class="requiredRed">*</span>Required</asp:Label>
            <br />
            <br />
            <div class="row" id="titleRow">
                <div class="col-sm-6">
                    <asp:Label ID="lblTitle" runat="server"><span class="requiredRed">*</span>Job Opportunity Title: </asp:Label><br />
                    <asp:TextBox ID="txtTitle" runat="server" class="form-control" Text="Entry Level Contractor"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblCompany" runat="server"><span class="requiredRed">*</span>Company Name: </asp:Label><br />
                    <asp:TextBox ID="txtCompany" runat="server" class="form-control" Text="Philadelphia Construction Works" Width="301px"></asp:TextBox>
                </div>
            </div>
            <br />
            <asp:Label ID="lblLoc" runat="server">Location </asp:Label>
            <div class="row" id="addy1Row">
                <div class="col-sm-6">

                    <asp:Label ID="lblAddLine1" runat="server"><span class="requiredRed">*</span>Address Line 1: </asp:Label><br />
                    <asp:TextBox ID="txtAddLine1" runat="server" class="form-control" Text="123 N Main St "></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblAddLine2" runat="server">   <span class="requiredRed">*</span>Address Line 2: </asp:Label><br />
                    <asp:TextBox ID="txtAddLine2" runat="server" class="form-control" Text="N/A"></asp:TextBox>
                </div>
            </div>
            <div class="row" id="addy2Row">
                <div class="col-sm-4">
                    <asp:Label ID="lblCity" runat="server"><span class="requiredRed">*</span>City: </asp:Label><br />
                    <asp:TextBox ID="txtCity" runat="server" class="form-control" Text="Philadelphia"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblState" runat="server"><span class="requiredRed">*</span>State: </asp:Label><br />
                    <asp:TextBox ID="txtState" runat="server" class="form-control" Text="PA"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblZip" runat="server"><span class="requiredRed">*</span>Zip: </asp:Label><br />
                    <asp:TextBox ID="txtZip" runat="server" class="form-control" Text="19121"></asp:TextBox>
                </div>
            </div>

            <br />

            <div class="row" id="dates">
                <div class="col-sm-6">
                    <asp:Label ID="lblStart" runat="server"><span class="requiredRed">*</span>Date Posted: </asp:Label><br />
                    <asp:TextBox ID="txtDatePosted" runat="server" class="form-control" Text="10-25-19"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblExp" runat="server"><span class="requiredRed">*</span>Expiration Date: </asp:Label><br />

                    <asp:TextBox ID="txtExpirationDate" runat="server" class="form-control" Text="12-25-19"></asp:TextBox>
                </div>
            </div>

            <br />

            <div class="row" id="cont1">
                <div class="col-sm-6">
                    <asp:Label ID="lblFn" runat="server"><span class="requiredRed">*</span>Primary Contact First Name: </asp:Label><br />
                    <asp:TextBox ID="txtFn" runat="server" class="form-control" Text="Joe"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblLn" runat="server"><span class="requiredRed">*</span>Primary Contact Last Name: </asp:Label><br />
                    <asp:TextBox ID="txtLn" runat="server" class="form-control" Text="Schmoe"></asp:TextBox>
                </div>
            </div>

            <div class="row" id="cont2">
                <div class="col-sm-6">
                    <asp:Label ID="lblContEmail" runat="server"><span class="requiredRed">*</span>Primary Contact Email: </asp:Label><br />
                    <asp:TextBox ID="txtContEmail" runat="server" class="form-control" Text="joe@schmoe.edu"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblContPhone" runat="server"><span class="requiredRed">*</span>Primary Contact Phone #: </asp:Label><br />
                    <asp:TextBox ID="txtContPhone" runat="server" class="form-control" Text="12345981"></asp:TextBox>
                </div>
            </div>

            <br />

            <div class="row" id="linkdiv">
                <div class="col-sm-6">
                    <asp:Label ID="lblLink" runat="server"><span class="requiredRed">*</span>Link to Apply: </asp:Label><br />
                    <asp:TextBox ID="txtLink" runat="server" class="form-control" Text="tinyurl.com/11231"></asp:TextBox>
                </div>
            </div>

            <br />
            <div class="row" id="descDiv">
                <div class="col-sm-12">
                    <asp:Label ID="lblDesc" runat="server"><span class="requiredRed">*</span>Job Description: </asp:Label><br />

                    <asp:TextBox ID="txtDesc" runat="server" TextMode="multiline" Rows="4" CssClass="col-md-8 form-control" Text="This job involves being able to create and design blueprints for buildings"></asp:TextBox>
                </div>
            </div>
            <br />

            <div class="row" id="skillDiv">
                <div class="col-sm-12">
                    <asp:Label ID="lblSkills" runat="server"><span class="requiredRed">*</span>Knowledge, Skills, & Other Requirements: </asp:Label><br />
                    <asp:TextBox ID="txtSkills" runat="server" TextMode="multiline" Rows="4" CssClass="col-md-8 form-control" Text="Must be able to lift 50lbs"></asp:TextBox>
                </div>
            </div>

            <br />
            <br />

            <div class="row" id="btn">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <asp:Button ID="btnCreate" runat="server" Text="Submit" Width="200px" OnClick="btnCreate_Click" class="btn btn-dark" />
                </div>
                <div class="col-sm-4"></div>
            </div>
        </div>
    </div>
</asp:Content>