<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="EditJob.aspx.cs" Inherits="CTS_ResourcePortal.EditJob" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog modal-xl">
            <!-- Modal content-->
            <div class="modal-content container">
                <div class="modal-body">

                    <br />
                    <div class="row  justify-content-center align-items-center text-center">
                        <div class="col"></div>
                        <div class="col-md-4">
                            <asp:Label runat="server" Text="Job Opening Successfully Edited!" ID="lblJobEdited" Font-Bold="True"></asp:Label>
                        </div>
                        <div class="col"></div>
                    </div>
                    <br />
                </div>
            </div>
        </div>
    </div>

    <div id="MyPopup2" class="modal fade" role="dialog">
        <div class="modal-dialog modal-xl">
            <!-- Modal content-->
            <div class="modal-content container">
                <div class="modal-body">

                    <br />
                    <div class="row  justify-content-center align-items-center text-center">
                        <div class="col"></div>
                        <div class="col-md-4">
                            <asp:Label runat="server" Text="Please fill out all of the required fields!" ID="lblfailll" Font-Bold="True"></asp:Label>
                        </div>
                        <div class="col"></div>
                    </div>
                    <br />
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col"></div>
            <h2 class="col-md-auto">Edit Job Opening</h2>
            <div class="col"></div>
        </div>
        <br />
        <div class="section">
            <br />
            <div class="row" id="rowInst">
                <div class="col-sm-1"></div>
                <div class="col-sm-10">
                    <asp:Label ID="lblInstructions" runat="server">This page is for editing an already existing Job Opening. All fields are filled with the current information, but any of them can be changed. To ensure a successful submission, all required fields must be correctly filled out. A required field is marked with a “<span class="requiredRed">*</span>”.<br />Once satisfied with the information that has been entered, click “Edit Job” to complete editing a Job Opening.</asp:Label><br />
                </div>
                <div class="col-sm-1"></div>
            </div>
            <br />
            <br />
            <div class="row" id="titleRow">
                <div class="col-sm-6">
                    <asp:Label ID="lblTitle" runat="server"><span class="requiredRed">*</span>Job Opportunity Title: </asp:Label><br />
                    <input type="text" ID="txtTitle" class="form-control" runat="server" required>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblCompany" runat="server"><span class="requiredRed">*</span>Company Name: </asp:Label><br />
                    <input type="text" ID="txtCompany" class="form-control" runat="server" required>
                </div>
            </div>
            <br />
            <div class="row" id="addy1Row">
                <div class="col-sm-6">

                    <asp:Label ID="lblAddLine1" runat="server"><span class="requiredRed">*</span>Address Line 1: </asp:Label><br />
                    <input type="text" ID="txtAddLine1" class="form-control" runat="server" required>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblAddLine2" runat="server">Address Line 2: </asp:Label><br />
                    <input type="text" ID="txtAddLine2" class="form-control" runat="server">
                </div>
            </div>
            <div class="row" id="addy2Row">
                <div class="col-sm-4">
                    <asp:Label ID="lblCity" runat="server"><span class="requiredRed">*</span>City: </asp:Label><br />
                    <input type="text" ID="txtCity" class="form-control" runat="server" required>
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblState" runat="server"><span class="requiredRed">*</span>State: </asp:Label><br />
                    <asp:DropDownList ID="ddlState" class="form-control" runat="server">
                        <asp:ListItem Value="DE">Delaware</asp:ListItem>
                        <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                        <asp:ListItem Value="NY">New York</asp:ListItem>
                        <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblZip" runat="server"><span class="requiredRed">*</span>Zip: </asp:Label><br />
                    <input type="text" ID="txtZip" class="form-control" pattern="[0-9]{5}" title="#####" runat="server" required>
                </div>
            </div>

            <br />

            <div class="row" id="dates">
                <div class="col-sm-2"></div>
                <div class="col-sm-3">
                    <asp:Label ID="lblStart" runat="server"><span class="requiredRed">*</span>Date Posted: </asp:Label><br />
                    <input type="date" id="datePosted" class="form-control" runat="server" required />
                </div>
                <div class="col-sm-2"></div>
                <div class="col-sm-3">
                    <asp:Label ID="lblExp" runat="server"><span class="requiredRed">*</span>Expiration Date: </asp:Label><br />
                    <input type="date" id="dateRegDeadline" class="form-control" runat="server" required />
                </div>
                <div class="col-sm-2"></div>
            </div>

            <br />

            <div class="row" id="cont1">
                <div class="col-sm-6">
                    <asp:Label ID="lblFn" runat="server"><span class="requiredRed">*</span>Primary Contact First Name: </asp:Label><br />
                    <input type="text" ID="txtFn" class="form-control" runat="server" required>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblLn" runat="server"><span class="requiredRed">*</span>Primary Contact Last Name: </asp:Label><br />
                    <input type="text" ID="txtLn" class="form-control" runat="server" required>
                </div>
            </div>

            <div class="row" id="cont2">
                <div class="col-sm-6">
                    <asp:Label ID="lblContEmail" runat="server"><span class="requiredRed">*</span>Primary Contact Email: </asp:Label><br />
                    <input type="email" ID="txtContEmail" class="form-control" runat="server" required>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblContPhone" runat="server"><span class="requiredRed">*</span>Primary Contact Phone #: </asp:Label><br />
                    <input type="tel" ID="txtContPhone" class="form-control" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" title="###-###-####" runat="server" required>
                </div>
            </div>

            <br />

            <div class="row" id="linkdiv">
                <div class="col-sm-6">
                    <asp:Label ID="lblHours" runat="server"><span class="requiredRed">*</span>Weekly Hours: </asp:Label><br />
                    <input type="text" ID="txtHours" class="form-control" runat="server" required>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblLink" runat="server">Link to Apply: </asp:Label><br />
                    <input type="text" ID="txtLink" class="form-control" runat="server">
                </div>
            </div>

            <br />
            <div class="row" id="descDiv">
                <div class="col-sm-12">
                    <asp:Label ID="lblPrimResp" runat="server"><span class="requiredRed">*</span>Primary Responsibilities:  </asp:Label><br />
                    <textarea id="txtPrimResp" cols="50" rows="10" class="form-control" CssClass="col-md-8 form-control" required runat="server"></textarea>
                </div>
            </div>
            <br />

            <div class="row" id="skillDiv">
                <div class="col-sm-12">
                    <asp:Label ID="lblSkills" runat="server"><span class="requiredRed">*</span>Knowledge, Skills, & Other Requirements: </asp:Label><br />
                    <textarea id="txtSkills" cols="50" rows="10" class="form-control" CssClass="col-md-8 form-control" required runat="server"></textarea>
                </div>
            </div>

            <br />

            <div class="row justify-content-center align-items-center">
                <asp:Button ID="btnCreate" runat="server" Text="Edit Job" Width="200px" OnClick="btnCreate_Click" class="btn btn-primary" />
            </div>
        </div>
    </div>
</asp:Content>