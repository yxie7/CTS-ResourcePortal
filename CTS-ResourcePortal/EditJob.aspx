﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="EditJob.aspx.cs" Inherits="CTS_ResourcePortal.EditJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <link href="AddNew.css" rel="stylesheet" />
    <link href="css.css" rel="stylesheet" />

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
            <asp:Label ID="lblRequired" runat="server"><span class="requiredRed">*</span>Required</asp:Label>
            <br />
            <br />
            <div class="row" id="titleRow">
                <div class="col-sm-6">
                    <asp:Label ID="lblTitle" runat="server"><span class="requiredRed">*</span>Job Opportunity Title: </asp:Label><br />
                    <asp:TextBox ID="txtTitle" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblCompany" runat="server"><span class="requiredRed">*</span>Company Name: </asp:Label><br />
                    <asp:TextBox ID="txtCompany" runat="server" class="form-control"  Width="301px"></asp:TextBox>
                </div>
            </div>
            <br />
            <asp:Label ID="lblLoc" runat="server">Location </asp:Label>
            <div class="row" id="addy1Row">
                <div class="col-sm-6">

                    <asp:Label ID="lblAddLine1" runat="server"><span class="requiredRed">*</span>Address Line 1: </asp:Label><br />
                    <asp:TextBox ID="txtAddLine1" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblAddLine2" runat="server">   <span class="requiredRed">*</span>Address Line 2: </asp:Label><br />
                    <asp:TextBox ID="txtAddLine2" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row" id="addy2Row">
                <div class="col-sm-4">
                    <asp:Label ID="lblCity" runat="server"><span class="requiredRed">*</span>City: </asp:Label><br />
                    <asp:TextBox ID="txtCity" runat="server" class="form-control" ></asp:TextBox>
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
                    <asp:TextBox ID="txtZip" runat="server" class="form-control" ></asp:TextBox>
                </div>
            </div>

            <br />

            <div class="row" id="dates">
                <div class="col-sm-2"></div>
                <div class="col-sm-3">
                    <asp:Label ID="lblStart" runat="server"><span class="requiredRed">*</span>Date Posted: </asp:Label><br />
                    <asp:Calendar ID="CalendarPostedDate" runat="server">
                         <OtherMonthDayStyle ForeColor="LightGray">
           </OtherMonthDayStyle>

           <TitleStyle BackColor="Yellow"
                       ForeColor="Black">
           </TitleStyle>

           <DayStyle BackColor="gray">
           </DayStyle>

           <SelectedDayStyle BackColor="LightGray"
                             Font-Bold="True">
           </SelectedDayStyle>
                    </asp:Calendar>
                </div>
                <div class="col-sm-2"></div>
                <div class="col-sm-3">
                    <asp:Label ID="lblExp" runat="server"><span class="requiredRed">*</span>Expiration Date: </asp:Label><br />
                    <asp:Calendar ID="CalendarExpDate" runat="server">
                         <OtherMonthDayStyle ForeColor="LightGray">
           </OtherMonthDayStyle>

           <TitleStyle BackColor="Yellow"
                       ForeColor="Black">
           </TitleStyle>

           <DayStyle BackColor="gray">
           </DayStyle>

           <SelectedDayStyle BackColor="LightGray"
                             Font-Bold="True">
           </SelectedDayStyle>
                    </asp:Calendar>
                </div>
                <div class="col-sm-2"></div>
            </div>

            <br />

            <div class="row" id="cont1">
                <div class="col-sm-6">
                    <asp:Label ID="lblFn" runat="server"><span class="requiredRed">*</span>Primary Contact First Name: </asp:Label><br />
                    <asp:TextBox ID="txtFn" runat="server" class="form-control" ></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblLn" runat="server"><span class="requiredRed">*</span>Primary Contact Last Name: </asp:Label><br />
                    <asp:TextBox ID="txtLn" runat="server" class="form-control" ></asp:TextBox>
                </div>
            </div>

            <div class="row" id="cont2">
                <div class="col-sm-6">
                    <asp:Label ID="lblContEmail" runat="server"><span class="requiredRed">*</span>Primary Contact Email: </asp:Label><br />
                    <asp:TextBox ID="txtContEmail" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblContPhone" runat="server"><span class="requiredRed">*</span>Primary Contact Phone #: </asp:Label><br />
                    <asp:TextBox ID="txtContPhone" runat="server" class="form-control" ></asp:TextBox>
                </div>
            </div>

            <br />

            <div class="row" id="linkdiv">
                <div class="col-sm-6">
                    <asp:Label ID="lblHours" runat="server"><span class="requiredRed">*</span>Weekly Hours: </asp:Label><br />
                    <asp:TextBox ID="txtHours" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:Label ID="lblLink" runat="server"><span class="requiredRed">*</span>Link to Apply: </asp:Label><br />
                    <asp:TextBox ID="txtLink" class="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <br />
            <div class="row" id="descDiv">
                <div class="col-sm-12">
                    <asp:Label ID="lblPrimResp" runat="server"><span class="requiredRed">*</span>Primary Responsibilities:  </asp:Label><br />

                    <asp:TextBox ID="txtPrimResp" runat="server" TextMode="multiline" Rows="4" CssClass="col-md-8 form-control" ></asp:TextBox>
                </div>
            </div>
            <br />

            <div class="row" id="skillDiv">
                <div class="col-sm-12">
                    <asp:Label ID="lblSkills" runat="server"><span class="requiredRed">*</span>Knowledge, Skills, & Other Requirements: </asp:Label><br />
                    <asp:TextBox ID="txtSkills" runat="server" TextMode="multiline" Rows="4" CssClass="col-md-8 form-control"></asp:TextBox>
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

    <script type="text/javascript">
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }
    </script>

    <script type="text/javascript">
        function ShowPopup2(title, body) {
            $("#MyPopup2 .modal-title").html(title);
            $("#MyPopup2 .modal-body").html(body);
            $("#MyPopup2").modal("show");
        }
    </script>
</asp:Content>