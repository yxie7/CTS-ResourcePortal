﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Guest.master" AutoEventWireup="true" CodeBehind="ResourceList.aspx.cs" Inherits="CTS_ResourcePortal.ResourceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <link href="css.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <div id="MyPopup" class="modal" role="dialog">
        <div class="modal-dialog modal-xl">
            <!-- Modal content-->
            <div class="modal-content container">
                <div class="modal-body " style="color: black">

                    <div class="row" id="h2">
                        <div class="col"></div>
                        <div class="col-md-auto">
                            <h2 id="myHeader" runat="server"></h2>
                        </div>
                        <div class="col"></div>
                    </div>
                    <div class="section">
                        <div class="row" id="job">
                            <div class="col-md-3">
                                <asp:Label runat="server" Text="Hosted By:" ID="lblHostedBy" Font-Bold="True"></asp:Label>
                                <asp:Label runat="server" Text="Company Name:" ID="lblCompaniesName" Font-Bold="True"></asp:Label>
                            </div>
                            <div class="col-1"></div>
                            <div class="col-md-8">
                                <asp:Label runat="server" Text="Company Name" ID="lblCompanyName"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="section">
                        <div class="row" id="title62">
                            <div class="col-md-3">
                                <b>Description:
                                </b>
                            </div>
                            <div class="col-1"></div>

                            <div class="col-md-8">
                                <asp:Label runat="server" Text="Primary Responsibilities" ID="lblResponsibilities"></asp:Label>
                                &nbsp;
                                    <p>
                                        Hours:
                                        <asp:Label runat="server" Text="Hours" ID="lblHours"></asp:Label>
                                    </p>

                                <p>
                                    Length of Time:
                                    <asp:Label runat="server" Text="Length of Time" ID="lblLength"></asp:Label>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="section">
                        <div class="row" id="title4">
                            <div class="col-md-3 ">
                                <b>Location:
                                </b>
                            </div>
                            <div class="col-1"></div>

                            <div class="col-md-8">
                                <asp:Label runat="server" Text="Location" ID="lblLocation"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="section">
                        <div class="row" id="title3">
                            <div class="col-md-3 ">
                                <b>Primary Contact:
                                </b>
                            </div>
                            <div class="col-1"></div>

                            <div class="col-md-8">
                                <asp:Label runat="server" Text="Contact" ID="lblContact"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="section">
                        <div class="row" id="title1">
                            <div class="col-md-3 ">
                                <asp:Label runat="server" Text="Date Posted:" ID="lblDtPosted" Font-Bold="True"></asp:Label>
                                <asp:Label runat="server" Text="Start Date:" ID="lblStartDt" Font-Bold="True"></asp:Label>
                            </div>
                            <div class="col-1"></div>

                            <div class="col-md-8">
                                <asp:Label runat="server" Text="Date Posted" ID="lblPosted"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="section">
                        <div class="row" id="title2">
                            <div class="col-md-3 ">
                                <asp:Label runat="server" Text="Date Expired:" ID="lblExpiration" Font-Bold="True"></asp:Label>
                            </div>
                            <div class="col-1"></div>

                            <div class="col-md-8">
                                <asp:Label runat="server" Text="Date Expired" ID="lblExpired"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="section" id="StartEndTime" runat="server" visible="false">
                        <div class="row">
                            <div class="col-md-3 ">
                                <asp:Label runat="server" Text="From - To:" ID="lblStartEndTime" Font-Bold="True"></asp:Label>
                            </div>
                            <div class="col-1"></div>

                            <div class="col-md-8">
                                <asp:Label runat="server" Text="From - To:" ID="lblStartEnd"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="section">
                        <div class="row" id="">
                            <div class="col-md-3">
                                <asp:Label runat="server" Text="Knowledge, Skills and Other Requirements." ID="lblOtherReqs" Font-Bold="True"></asp:Label>
                                <asp:Label runat="server" Text="Attire" ID="lblAttire" Font-Bold="True"></asp:Label>
                            </div>
                            <div class="col-1"></div>

                            <div class="col-md-8">
                                <asp:Label runat="server" Text="Other Requirements" ID="lblOtherRequirements"></asp:Label>
                                <asp:Label runat="server" Text="Attire" ID="lblAttire1"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <br />
                    <div class="row  justify-content-center align-items-center text-center">
                        <div class="col"></div>
                        <div class="col-md-4">
                            <asp:Button runat="server" CssClass="btn btn-large btn-info" Text="Apply Here" ID="btnLink" OnClick="btnLink_Click" />
                        </div>
                        <div class="col"></div>
                    </div>
                    <br />
                    <div class="row  justify-content-center align-items-center text-center">
                        <div class="col"></div>
                        <div class="col-md-4">
                            <a class="btn btn-large btn-info" href="Feedback.aspx">Leave Feedback</a>
                        </div>
                        <div class="col"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col"></div>
            <h2 class="col-md-auto">Resource List</h2>
            <div class="col"></div>
        </div>
        <br />
        <div class="section">
            <div class="row d-flex justify-content-center">
                <div class="col-10">
                    <input class="form-control search" type="text" placeholder="Search" aria-label="Search">
                </div>
            </div>
            <br />
            <div class="row d-flex justify-content-center">
                <div class="accordion col-11" id="resources">
                    <div class="card">
                        <div class="card-header" id="jobHeader">
                            <h2 class="mb-0">
                                <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#jobResourceCollapse" aria-expanded="true" aria-controls="jobResourceCollapse">
                                    Job Openings
                                </button>
                            </h2>
                        </div>
                        <div class="collapse" id="jobResourceCollapse" aria-labelledby="jobHeader" data-parent="#jobHeader">
                            <div class="card-body">
                                <div class="row d-flex justify-content-center">
                                    <div class="table-responsive-lg  ">
                                        <asp:GridView ID="gvJob" runat="server" AutoGenerateColumns="False" class="table table-striped table-light">
                                            <Columns>
                                                <asp:BoundField DataField="ResourceID" HeaderText="ID" Visible="true" />
                                                <asp:BoundField DataField="ResourceTitle" HeaderText="Title" />
                                                <asp:BoundField DataField="email" HeaderText="Contact" />
                                                <asp:BoundField DataField="AddressLine2" HeaderText="Location" />
                                                <asp:BoundField DataField="datePosted" HeaderText="Date Posted" />
                                                <asp:BoundField DataField="expDate" HeaderText="Date Expired" />
                                                <asp:TemplateField HeaderText="Details">
                                                    <ItemTemplate>
                                                        <asp:Button runat="server" Text="Click for Details" CssClass="btn btn-dark" ID="btnJob" CommandName="Select" OnClick="btnJob_Click" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="eventHeader">
                            <h2 class="mb-0">
                                <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#eventResourceCollapse" aria-expanded="true" aria-controls="eventResourceCollapse">
                                    Events</button>
                            </h2>
                        </div>
                        <div class="collapse" id="eventResourceCollapse" aria-labelledby="eventHeader" data-parent="#eventHeader">
                            <div class="card-body">
                                <div class="row d-flex justify-content-center">
                                    <div class="table-responsive-lg  ">
                                        <asp:GridView ID="gvEvent" runat="server" AutoGenerateColumns="False" class="table table-striped table-light">
                                            <Columns>
                                                <asp:BoundField DataField="ResourceID" HeaderText="ID" Visible="true" />
                                                <asp:BoundField DataField="ResourceTitle" HeaderText="Title" />
                                                <asp:BoundField DataField="email" HeaderText="Contact" />
                                                <asp:BoundField DataField="AddressLine2" HeaderText="Location" />
                                                <asp:BoundField DataField="EventDate" HeaderText="Event Date" />
                                                <asp:BoundField DataField="expDate" HeaderText="Date Expired" />
                                                <asp:TemplateField HeaderText="Details">
                                                    <ItemTemplate>
                                                        <asp:Button runat="server" Text="Click for Details" CssClass="btn btn-dark" ID="btnEvent" OnClick="btnEvent_Click" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="trainingHeader">
                            <h2 class="mb-0">
                                <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#trainingResourceCollapse" aria-expanded="true" aria-controls="trainingResourceCollapse">
                                    Training Opportunities</button>
                            </h2>
                        </div>
                        <div class="collapse" id="trainingResourceCollapse" aria-labelledby="trainingHeader" data-parent="#trainingHeader">
                            <div class="card-body">
                                <div class="row d-flex justify-content-center">
                                    <div class="table-responsive-lg  ">
                                        <asp:GridView ID="gvTraining" runat="server" AutoGenerateColumns="False" class="table table-striped table-light">
                                            <Columns>
                                                <asp:BoundField DataField="ResourceID" HeaderText="ID" Visible="true" />
                                                <asp:BoundField DataField="ResourceTitle" HeaderText="Title" />
                                                <asp:BoundField DataField="email" HeaderText="Contact" />
                                                <asp:BoundField DataField="AddressLine2" HeaderText="Location" />
                                                <asp:BoundField DataField="StartDate" HeaderText="Start Date" />
                                                <asp:BoundField DataField="expDate" HeaderText="Date Expired" />
                                                <asp:TemplateField HeaderText="Details">
                                                    <ItemTemplate>
                                                        <asp:Button runat="server" Text="Click for Details" CssClass="btn btn-dark" ID="btnTraining" OnClick="btnTraining_Click" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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