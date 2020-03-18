<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AddNewEvent.aspx.cs" Inherits="CTS_ResourcePortal.AddNewEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <link href="AddNew.css" rel="stylesheet" />
    <link href="css.css" rel="stylesheet" />

    <div id="MyPopup" class="modal" role="dialog">
        <div class="modal-dialog modal-xl">
            <!-- Modal content-->
            <div class="modal-content container">
                <div class="modal-body">

                    <br />
                    <div class="row  justify-content-center align-items-center text-center">
                        <div class="col"></div>
                        <div class="col-md-4">
                            <asp:Label runat="server" Text="Event Successfully Added!" ID="lblEventAdded" Font-Bold="True"></asp:Label>
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
            <h2 class="col-md-auto">Add New Event</h2>
            <div class="col"></div>
        </div>

        <br />
        <div id="" class="section">
            <br />
            <asp:Label ID="lblRequired" runat="server"><span class="requiredRed">*</span>Required</asp:Label>
            <br />
            <asp:Label runat="server" ID="lblError" class="requiredRed" Text="You have left one of the fields blank. Please fill out all of the required fields!" Visible="false"></asp:Label>
            <br />
            <div class="row" id="titleRow">
                <div class="col-sm-6">
                    <asp:Label ID="lblTitle" runat="server"><span class="requiredRed">*</span>Event Title: </asp:Label><br />
                    <asp:TextBox ID="txtTitle" class="form-control" runat="server"></asp:TextBox>
                    <asp:Label ID="lblTitleError" Visible="false" runat="server" Text="Please enter a Title for the Event."></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblHost" runat="server"><span class="requiredRed">*</span>Hosted By: </asp:Label><br />
                    <asp:TextBox ID="txtHost" class="form-control" runat="server"></asp:TextBox>
                    <asp:Label ID="lblHostError" Visible="false" runat="server" Text="Please enter a Host for the Event."></asp:Label>
                </div>
            </div>
            <br />
            <asp:Label ID="lblLocation" runat="server">Location</asp:Label>
            <div class="row" id="addy1Row">
                <div class="col-sm-6">

                    <asp:Label ID="lblAddLine1" runat="server"><span class="requiredRed">*</span>Address Line 1: </asp:Label><br />
                    <asp:TextBox ID="txtAddLine1" class="form-control" runat="server"></asp:TextBox>
                    <asp:Label ID="lblAdd1Error" Visible="false" runat="server" Text="Please enter an Address for the Event."></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblAddLine2" runat="server">Address Line 2: </asp:Label><br />
                    <asp:TextBox ID="txtAddLine2" class="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row" id="addy2Row">
                <div class="col-sm-4">
                    <asp:Label ID="lblCity" runat="server"><span class="requiredRed">*</span>City: </asp:Label><br />
                    <asp:TextBox ID="txtCity" class="form-control" runat="server"></asp:TextBox>
                    <asp:Label ID="lblCityError" Visible="false" runat="server" Text="Please enter a City for the Event."></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblState" runat="server"><span class="requiredRed">*</span>State: </asp:Label><br />
                    <asp:DropDownList ID="ddlState" class="form-control" runat="server">
                        <asp:ListItem Value="AL">Alabama</asp:ListItem>
                        <asp:ListItem Value="AK">Alaska</asp:ListItem>
                        <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                        <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                        <asp:ListItem Value="CA">California</asp:ListItem>
                        <asp:ListItem Value="CO">Colorado</asp:ListItem>
                        <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                        <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                        <asp:ListItem Value="DE">Delaware</asp:ListItem>
                        <asp:ListItem Value="FL">Florida</asp:ListItem>
                        <asp:ListItem Value="GA">Georgia</asp:ListItem>
                        <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                        <asp:ListItem Value="ID">Idaho</asp:ListItem>
                        <asp:ListItem Value="IL">Illinois</asp:ListItem>
                        <asp:ListItem Value="IN">Indiana</asp:ListItem>
                        <asp:ListItem Value="IA">Iowa</asp:ListItem>
                        <asp:ListItem Value="KS">Kansas</asp:ListItem>
                        <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                        <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                        <asp:ListItem Value="ME">Maine</asp:ListItem>
                        <asp:ListItem Value="MD">Maryland</asp:ListItem>
                        <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                        <asp:ListItem Value="MI">Michigan</asp:ListItem>
                        <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                        <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                        <asp:ListItem Value="MO">Missouri</asp:ListItem>
                        <asp:ListItem Value="MT">Montana</asp:ListItem>
                        <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                        <asp:ListItem Value="NV">Nevada</asp:ListItem>
                        <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                        <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                        <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                        <asp:ListItem Value="NY">New York</asp:ListItem>
                        <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                        <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                        <asp:ListItem Value="OH">Ohio</asp:ListItem>
                        <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                        <asp:ListItem Value="OR">Oregon</asp:ListItem>
                        <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                        <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                        <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                        <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                        <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                        <asp:ListItem Value="TX">Texas</asp:ListItem>
                        <asp:ListItem Value="UT">Utah</asp:ListItem>
                        <asp:ListItem Value="VT">Vermont</asp:ListItem>
                        <asp:ListItem Value="VA">Virginia</asp:ListItem>
                        <asp:ListItem Value="WA">Washington</asp:ListItem>
                        <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                        <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                        <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-sm-4">
                    <asp:Label ID="lblZip" runat="server"><span class="requiredRed">*</span>Zip: </asp:Label><br />
                    <asp:TextBox ID="txtZip" class="form-control" runat="server"></asp:TextBox>
                    <asp:Label ID="lblZipError" Visible="false" runat="server" Text="Please enter a Zip for the Event."></asp:Label>
                </div>
            </div>
            <br />
            <div class="row" id="dates">
                <div class="col-sm-2"></div>
                <div class="col-sm-3">
                    <asp:Label ID="lblDate" runat="server"><span class="requiredRed">*</span>Event Date: </asp:Label><br />
                    <asp:Calendar ID="CalanderDate" runat="server">
                        <OtherMonthDayStyle ForeColor="LightGray"></OtherMonthDayStyle>

                        <TitleStyle BackColor="Yellow"
                            ForeColor="Black"></TitleStyle>

                        <DayStyle BackColor="gray"></DayStyle>

                        <SelectedDayStyle BackColor="LightGray"
                            Font-Bold="True"></SelectedDayStyle>
                    </asp:Calendar>
                </div>
                <div class="col-sm-2"></div>
                <div class="col-sm-3">
                    <asp:Label ID="lblRegDeadline" runat="server"><span class="requiredRed">*</span>Registration Deadline: </asp:Label><br />
                    <asp:Calendar ID="CalendarReg" runat="server">
                        <OtherMonthDayStyle ForeColor="LightGray"></OtherMonthDayStyle>

                        <TitleStyle BackColor="Yellow"
                            ForeColor="Black"></TitleStyle>

                        <DayStyle BackColor="gray"></DayStyle>

                        <SelectedDayStyle BackColor="LightGray"
                            Font-Bold="True"></SelectedDayStyle>
                    </asp:Calendar>
                </div>
                <div class="col-sm-2"></div>
            </div>
            <br />
            <div class="row" id="times">
                <div class="col-sm-6">
                    <asp:Label ID="lblStart" runat="server"><span class="requiredRed">*</span>Start Time: </asp:Label><br />
                    <asp:TextBox ID="txtStartTime" class="form-control" runat="server"></asp:TextBox>
                    <asp:Label ID="lblStartError" Visible="false" runat="server" Text="Please enter a Start Time for the Event."></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblEnd" runat="server"><span class="requiredRed">*</span>End Time: </asp:Label><br />
                    <asp:TextBox ID="txtEndTime" class="form-control" runat="server"></asp:TextBox>
                    <asp:Label ID="lblEndError" Visible="false" runat="server" Text="Please enter an Address for the Event."></asp:Label>
                </div>
            </div>
            <br />
            <div class="row" id="cont1">
                <div class="col-sm-6">
                    <asp:Label ID="lblFn" runat="server"><span class="requiredRed">*</span>Primary Contact First Name: </asp:Label><br />
                    <asp:TextBox ID="txtFn" class="form-control" runat="server"></asp:TextBox>
                    <asp:Label ID="lblFNError" Visible="false" runat="server" Text="Please enter a Contact First Name for the Event."></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblLn" runat="server"><span class="requiredRed">*</span>Primary Contact Last Name: </asp:Label><br />
                    <asp:TextBox ID="txtLn" class="form-control" runat="server"></asp:TextBox>
                    <asp:Label ID="lblLNError" Visible="false" runat="server" Text="Please enter a Contact Last Name for the Event."></asp:Label>
                </div>
            </div>
            <div class="row" id="cont2">
                <div class="col-sm-6">
                    <asp:Label ID="lblContEmail" runat="server"><span class="requiredRed">*</span>*Primary Contact Email: </asp:Label><br />
                    <asp:TextBox ID="txtContEmail" class="form-control" runat="server" TextMode="Email"></asp:TextBox>
                    <asp:Label ID="lblEmailError" Visible="false" runat="server" Text="Please enter an Email for the Event."></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblContPhone" runat="server"><span class="requiredRed">*</span>Primary Contact Phone #: </asp:Label><br />
                    <asp:TextBox ID="txtContPhone" class="form-control" runat="server"></asp:TextBox>
                    <asp:Label ID="lblPhoneError" Visible="false" runat="server" Text="Please enter an Address for the Event."></asp:Label>
                </div>
            </div>
            <br />
            <div class="row" id="linkdiv">
                <div class="col-sm-6">
                    <asp:Label ID="lblAtire" runat="server">Attire: </asp:Label><br />
                    <asp:TextBox ID="txtAtire" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblLink" runat="server"><span class="requiredRed">*</span>Link to Apply: </asp:Label><br />
                    <asp:TextBox ID="txtLink" class="form-control" runat="server"></asp:TextBox>
                    <asp:Label ID="lblLinkError" Visible="false" runat="server" Text="Please enter a Link for the Event."></asp:Label>
                </div>
            </div>
            <br />
            <div class="row" id="descDiv">
                <div class="col-sm-12">
                    <asp:Label ID="lblDesc" runat="server"><span class="requiredRed">*</span>Event Description: </asp:Label><br />
                    <asp:TextBox ID="txtDesc" class="form-control" runat="server" TextMode="multiline" Rows="4" CssClass="col-md-8 form-control"></asp:TextBox>
                    <asp:Label ID="lblDescError" Visible="false" runat="server" Text="Please enter an Address for the Event."></asp:Label>
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

    <script type="text/javascript">
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }
    </script>
</asp:Content>