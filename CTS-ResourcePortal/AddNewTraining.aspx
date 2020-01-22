<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AddNewTraining.aspx.cs" Inherits="CTS_ResourcePortal.AddNewTraining" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <link href="AddNew.css" rel="stylesheet" />
    <link href="css.css" rel="stylesheet" />
    <div class="container">
        <div class="row">
            <div class="col"></div>
            <h2 class="col-md-auto">Add New Training Opportunity</h2>
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
                    <asp:Label ID="lblTitle" runat="server"><span class="requiredRed">*</span>Training Title: </asp:Label><br />
                    <asp:TextBox ID="txtTitle" class="form-control" runat="server">CDL Classes</asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblHost" runat="server">Hosted By: </asp:Label><br />
                    <asp:TextBox ID="txtHost" class="form-control" runat="server">Communicty College of Philadelphia</asp:TextBox>
                </div>
            </div>
            <br />
            <asp:Label ID="lblLoc" runat="server">Location</asp:Label>
            <div class="row" id="addy1Row">
                <div class="col-sm-6">
                    <asp:Label ID="lblAddLine1" runat="server"><span class="requiredRed">*</span>Address Line 1: </asp:Label><br />
                    <asp:TextBox ID="txtAddLine1" class="form-control" runat="server">123 N Main St.</asp:TextBox>
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
                    <asp:Label ID="lblRegDeadline" runat="server"><span class="requiredRed">*</span>Registration Deadline: </asp:Label><br />
                    <input type="date" class="form-control" />
                </div>
                <div class="col-sm-2"></div>
                <div class="col-sm-3">
                    <asp:Label ID="lblStart" runat="server"><span class="requiredRed">*</span>Start Date: </asp:Label><br />
                    <input type="date" class="form-control" />
                </div>
                <div class="col-sm-2"></div>
            </div>
            <div class="row" id="hrs">
                <div class="col-sm-6">
                    <asp:Label ID="lblHours" runat="server"><span class="requiredRed">*</span>Weekly Hours: </asp:Label><br />
                    <asp:TextBox ID="txtHours" class="form-control" runat="server">40</asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="Label2" runat="server"><span class="requiredRed">*</span>Length of Training: </asp:Label><br />
                    <asp:TextBox ID="txtLength" class="form-control" runat="server">3 Months</asp:TextBox>
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
                    <asp:Label ID="lblContEmail" runat="server"><span class="requiredRed">*</span>Primary Contact Email: </asp:Label><br />
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
                    <asp:Label ID="lblSignUp" runat="server"><span class="requiredRed">*</span>How to Sign Up:</asp:Label><br />
                    <asp:TextBox ID="txtSignUp" class="form-control" runat="server">www.MyCDLClasses.com</asp:TextBox>
                </div>
            </div>

            <br />
            <div class="row" id="descDiv">
                <div class="col-sm-12">
                    <asp:Label ID="lblDesc" runat="server"><span class="requiredRed">*</span>Training Description: </asp:Label><br />
                    <asp:TextBox ID="txtDesc" runat="server" TextMode="multiline" Rows="4" CssClass="col-md-8 form-control">This course is designed to provide students with a working knowledge of a tractor
                                and trailer and preparation for the road CDL test.
                                Included in this course is pre-trip inspection, basic
                                driver skill training, backing a tractor trailer combination, and post
                                trip inspection. Students will take the North Dakota CDL Driving
                                test to demonstrate their driving knowledge and skills. Students
                                will be required to complete 28 hours of hands
                                on training. Students will also have a chance to complete a
                                2 day 1000 mile road trip where the students will trip plan the whole trip and meet with industry leaders about jobs.
                    </asp:TextBox>
                </div>
            </div>
            <br />

            <div class="row" id="skillDiv">
                <div class="col-sm-12">
                    <asp:Label ID="lblSkills" runat="server"><span class="requiredRed">*</span>Knowledge, Skills, & Other Requirements: </asp:Label><br />
                    <asp:TextBox ID="txtSkills" runat="server" TextMode="multiline" Rows="4" CssClass="col-md-8 form-control">Must be atleast 21 years of age. Must have a valid driver's license in the state of Pennslyvania.</asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row justify-content-center align-items-center">
                <div class="col-md-2">
                    <asp:Button ID="btnCreate" runat="server" Text="Add Training" class="btn btn-dark" OnClick="btnCreate_Click" />
                </div>
            </div>
            <br />
        </div>
        <br />
    </div>
</asp:Content>