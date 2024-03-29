﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Citizen.master" AutoEventWireup="true" CodeBehind="ResourceList.aspx.cs" Inherits="CTS_ResourcePortal.ResourceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog modal-xl">
            <button type="button" class="btn btn-danger btnDismiss" data-dismiss="modal">
                <span aria-hidden="true"><i class="fas fa-times fa-2x"></i></span>
            </button>
            <!-- Modal content-->
            <div class="modal-content container">
                <div class="modal-body">
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
                                        <asp:Label runat="server" Text="Hours:" ID="lblHours1"></asp:Label>
                                        <asp:Label runat="server" Text="Hours" ID="lblHours"></asp:Label>
                                    </p>

                                <p>
                                    <asp:Label runat="server" Text="Length of Time:" ID="lblLength1"></asp:Label>
                                
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
                               <%-- <asp:Label runat="server" Text="Date Posted:" ID="lblDtPosted" Font-Bold="True"></asp:Label>--%>
                                <asp:Label runat="server" Text="Start Date:" ID="lblStartDt" Font-Bold="True"></asp:Label>
                                <asp:Label runat="server" Text="Event Date:" ID="lblEventDt" Font-Bold="True"></asp:Label>
                            </div>
                            <div class="col-1"></div>

                            <div class="col-md-8">
                                <asp:Label runat="server" Text="Date Posted" ID="lblPosted"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="section" id="divDtExp" runat="server">
                        <div class="row" id="title2">
                            <div class="col-md-3 ">
                                <asp:Label runat="server" Text="Registration Deadline:" ID="lblExpiration" Font-Bold="True"></asp:Label>
                            </div>
                            <div class="col-1"></div>

                            <div class="col-md-8">
                                <asp:Label runat="server" Text="Registration Deadline" ID="lblExpired"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="section" id="StartEndTime" runat="server" visible="false">
                        <div class="row">
                            <div class="col-md-3 ">
                                <asp:Label runat="server" Text="From / To:" ID="lblStartEndTime" Font-Bold="True"></asp:Label>
                            </div>
                            <div class="col-1"></div>

                            <div class="col-md-8">
                                <asp:Label runat="server" Text="From / To:" ID="lblStartEnd"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="section" runat="server" id="divAttire">
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
                            <asp:Button runat="server" CssClass="btn btn-large btn-primary" Text="Apply Here" ID="btnLink" OnClick="btnLink_Click" />
                        </div>
                        <div class="col"></div>
                    </div>
                    <br />
                    <div class="row  justify-content-center align-items-center text-center">
                        <div class="col"></div>
                        <div class="col-md-4">
                            <asp:Button runat="server" CssClass="btn btn-large btn-primary" Text="Leave Feedback" ID="btnFeedback" OnClick="btnFeedback_Click" />
                        </div>
                        <div class="col"></div>
                    </div>
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
                            <asp:Label runat="server" Text="" ID="lblConfirm" Visible="False"></asp:Label>
                        </div>
                        <div class="col"></div>
                    </div>
                    <br />
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div id="banner" class="text-center alert alert-primary alert-dismissible fade show" role="alert">
            <strong>Welcome!</strong> You are at the Called to Serve's Resource Portal.
            <br />
            This will be your go-to site for all the job related information you can find in the Nicetown-Tioga area!
            <br />
            You can find active job openings, upcoming events, and current training opportunities.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="section">
            <div class="row">
                <div class="col"></div>
                <h2 class="col-md-auto">Resource List</h2>
                <div class="col"></div>
            </div>
            <br />
            <div class="row d-flex justify-content-center">
                <div class="col-10">
                    <asp:TextBox runat="server" ID="txtTitleSearch" AutoPostBack="true" CssClass="form-control search" placeholder="Search Titles Here..." OnTextChanged="txtTitleSearch_TextChanged"></asp:TextBox>
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
                                        <asp:GridView ID="gvJob" runat="server" AutoGenerateColumns="False" class="table table-light" DataKeyNames="ResourceID" OnRowDataBound="gv_RowDataBound">
                                            <Columns>
                                                <%-- <asp:BoundField DataField="ResourceID" HeaderText="ID" Visible="false" />--%>
                                                <asp:BoundField DataField="ResourceTitle" HeaderText="Title" HeaderStyle-CssClass="rrth" ItemStyle-CssClass="rrtd" />
                                                <asp:BoundField DataField="email" HeaderText="Contact" HeaderStyle-CssClass="rrth" ItemStyle-CssClass="rrtd" />
                                                <asp:BoundField DataField="AddressLine2" HeaderText="Location" HeaderStyle-CssClass="rrth" ItemStyle-CssClass="rrtd" />
                                                <asp:BoundField DataField="datePosted" HeaderText="Date Posted" HeaderStyle-CssClass="rrth" ItemStyle-CssClass="rrtd" />
                                                <asp:BoundField DataField="expDate" HeaderText="Registration Deadline" HeaderStyle-CssClass="rrth" ItemStyle-CssClass="rrtd" />
                                                <asp:TemplateField HeaderText="Details" HeaderStyle-CssClass="rrth" ItemStyle-CssClass="rrtd">
                                                    <ItemTemplate>
                                                        <asp:Button runat="server" Text="Click for Details" CssClass="btn btn-primary" ID="btnJob" CommandName="Select" OnClick="btnJob_Click" />
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
                                        <asp:GridView ID="gvEvent" runat="server" AutoGenerateColumns="False" class="table table-light" DataKeyNames="ResourceID">
                                            <Columns>
                                                <%--<asp:BoundField DataField="ResourceID" HeaderText="ID" Visible="false" />--%>
                                                <asp:BoundField DataField="ResourceTitle" HeaderText="Title" />
                                                <asp:BoundField DataField="email" HeaderText="Contact" />
                                                <asp:BoundField DataField="AddressLine2" HeaderText="Location" />
                                                <asp:BoundField DataField="EventDate" HeaderText="Event Date" />
                                                <asp:BoundField DataField="expDate" HeaderText="Registration Deadline" />
                                                <asp:TemplateField HeaderText="Details">
                                                    <ItemTemplate>
                                                        <asp:Button runat="server" Text="Click for Details" CssClass="btn btn-primary" ID="btnEvent" OnClick="btnEvent_Click" />
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
                                        <asp:GridView ID="gvTraining" runat="server" AutoGenerateColumns="False" class="table table-light" DataKeyNames="ResourceID">
                                            <Columns>
                                                <%--<asp:BoundField DataField="ResourceID" HeaderText="ID" Visible="false" />--%>
                                                <asp:BoundField DataField="ResourceTitle" HeaderText="Title" />
                                                <asp:BoundField DataField="email" HeaderText="Contact" />
                                                <asp:BoundField DataField="AddressLine2" HeaderText="Location" />
                                                <asp:BoundField DataField="StartDate" HeaderText="Start Date" />
                                                <asp:BoundField DataField="expDate" HeaderText="Registration Deadline" />
                                                <asp:TemplateField HeaderText="Details">
                                                    <ItemTemplate>
                                                        <asp:Button runat="server" Text="Click for Details" CssClass="btn btn-primary" ID="btnTraining" OnClick="btnTraining_Click" />
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
        <%--  </ContentTemplate>
             </asp:UpdatePanel>--%>
    </div>
</asp:Content>