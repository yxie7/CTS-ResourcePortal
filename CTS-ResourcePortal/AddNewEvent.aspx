<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AddNewEvent.aspx.cs" Inherits="CTS_ResourcePortal.AddNewEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <link href="AddNew.css" rel="stylesheet" />
    <link href="css.css" rel="stylesheet" />
    <div class="container">
        <div class="row">
            <div class="col"></div>
            <h2 class="col-md-auto">Add New Event</h2>
            <div class="col"></div>
        </div>
        <br />
        <div id="" class="section">
            <br />
            <p><span class="requiredRed">*</span>Required</p>
            <br />
            <div class="row" id="titleRow">
                <div class="col-sm-6">
                    <asp:Label ID="lblTitle" runat="server">Event Title: </asp:Label><br />
                    <asp:TextBox ID="txtTitle" class="form-control" runat="server">North Philadelphia Job Fair</asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblHost" runat="server">Hosted By: </asp:Label><br />
                    <asp:TextBox ID="TextBox1" class="form-control" runat="server">Called To Serve</asp:TextBox>
                </div>
            </div>
            <br />
            <asp:Label ID="lblLocation" runat="server">Location</asp:Label>
            <div class="row" id="addy1Row">
                <div class="col-sm-6">

                    <asp:Label ID="lblAddLine1" runat="server"><span class="requiredRed">*</span>Address Line 1: </asp:Label><br />
                    <asp:TextBox ID="txtAddLine1" class="form-control" runat="server">123 N Main St.  19140</asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblAddLine2" runat="server">Address Line 2: </asp:Label><br />
                    <asp:TextBox ID="txtAddLine2" class="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row" id="addy2Row">
                <div class="col-sm-4">
                    <asp:Label ID="lblCity" runat="server"><span class="requiredRed">*</span>City: </asp:Label><br />
                    <asp:TextBox ID="txtCity" class="form-control" runat="server">Philadelphia</asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblState" runat="server"><span class="requiredRed">*</span>State: </asp:Label><br />
                    <select id="sltState" name="state" class="form-control">
                        <option>Alabama</option>
                            <option>Alaska</option>
                            <option>Arizona</option>
                            <option>Arkansas</option>
                            <option>California</option>
                            <option>Colorado</option>
                            <option>Connecticut</option>
                            <option>Delaware</option>
                            <option>Florida</option>
                            <option>Georgia</option>
                            <option>Hawaii</option>
                            <option>Idaho</option>
                            <option>Illinois</option>
                            <option>Indiana</option>
                            <option>Iowa</option>
                            <option>Kansas</option>
                            <option>Kentucky</option>
                            <option>Louisiana</option>
                            <option>Maine</option>
                            <option>Maryland</option>
                            <option>Massachusetts</option>
                            <option>Michigan</option>
                            <option>Minnesota</option>
                            <option>Mississippi</option>
                            <option>Missouri</option>
                            <option>Montana</option>
                            <option>Nebraska</option>
                            <option>Nevada</option>
                            <option>New Hampshire</option>
                            <option>New Jersey</option>
                            <option>New Mexico</option>
                            <option>New York</option>
                            <option>North Carolina</option>
                            <option>North Dakota</option>
                            <option>Ohio</option>
                            <option>Oklahoma</option>
                            <option>Oregon</option>
                            <option>Pennsylvania</option>
                            <option>Rhode Island</option>
                            <option>South Carolina</option>
                            <option>South Dakota</option>
                            <option>Tennessee</option>
                            <option>Texas</option>
                            <option>Utah</option>
                            <option>Vermont</option>
                            <option>Virginia</option>
                            <option>Washington</option>
                            <option>West Virginia</option>
                            <option>Wisconsin</option>
                            <option>Wyoming</option>
                    </select>
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblZip" runat="server"><span class="requiredRed">*</span>Zip: </asp:Label><br />
                    <asp:TextBox ID="txtZip" class="form-control" runat="server">19140</asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row" id="dates">
                <div class="col-sm-2"></div>
                <div class="col-sm-3">
                    <asp:Label ID="lblDate" runat="server"><span class="requiredRed">*</span>Event Date: </asp:Label><br />
                    <input type="date" class="form-control" />
                </div>
                <div class="col-sm-2"></div>
                <div class="col-sm-3">
                    <asp:Label ID="lblRegDeadline" runat="server"><span class="requiredRed">*</span>Registration Deadline: </asp:Label><br />
                    <input type="date" class="form-control" />
                </div>
                <div class="col-sm-2"></div>
            </div>
            <br />
            <div class="row" id="times">
                <div class="col-sm-6">
                    <asp:Label ID="lblStart" runat="server"><span class="requiredRed">*</span>Start Time: </asp:Label><br />
                    <asp:TextBox ID="txtStart" class="form-control" runat="server">8:30am</asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblEnd" runat="server"><span class="requiredRed">*</span>End Time: </asp:Label><br />
                    <asp:TextBox ID="txtExp" class="form-control" runat="server">5:30pm</asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row" id="cont1">
                <div class="col-sm-6">
                    <asp:Label ID="lblFn" runat="server"><span class="requiredRed">*</span>Primary Contact First Name: </asp:Label><br />
                    <asp:TextBox ID="txtFn" class="form-control" runat="server">ASAP</asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblLn" runat="server"><span class="requiredRed">*</span>Primary Contact Last Name: </asp:Label><br />
                    <asp:TextBox ID="txtLn" class="form-control" runat="server">Rocky</asp:TextBox>
                </div>
            </div>
            <div class="row" id="cont2">
                <div class="col-sm-6">
                    <asp:Label ID="lblContEmail" runat="server"><span class="requiredRed">*</span>*Primary Contact Email: </asp:Label><br />
                    <asp:TextBox ID="txtContEmail" class="form-control" runat="server">Flaco@asapmob.com</asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblContPhone" runat="server"><span class="requiredRed">*</span>Primary Contact Phone #: </asp:Label><br />
                    <asp:TextBox ID="txtContPhone" class="form-control" runat="server">7760984200</asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row" id="linkdiv">
                <div class="col-sm-6">
                    <asp:Label ID="lblAtire" runat="server">Attire: </asp:Label><br />
                    <asp:TextBox ID="txtAtire" class="form-control" runat="server">Formal</asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblLink" runat="server"><span class="requiredRed">*</span>Link to Apply: </asp:Label><br />
                    <asp:TextBox ID="txtLink" class="form-control" runat="server">www.NorthPhillyJobFair.com</asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row" id="descDiv">
                <div class="col-sm-12">
                    <asp:Label ID="lblDesc" runat="server"><span class="requiredRed">*</span>Event Description: </asp:Label><br />
                    <asp:TextBox ID="txtDesc"  class="form-control" runat="server"  TextMode="multiline" Rows="4" CssClass="col-md-8 form-control">Job Fairs provide opportunities for students/alumni to learn about potential careers in industry sectors, network with perspective employers, and often submit resumes to prospective employers (Note: Some employers may require online submission of resumes and/or employment applications).</asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row justify-content-center align-items-center">
                <div class="col-md-2">
                    <asp:Button ID="btnCreate" runat="server" Text="Add Event" class="btn btn-dark" OnClick="btnCreate_Click" />
                </div>
            </div>
            <br />
        </div>
        <br />
    </div>
</asp:Content>