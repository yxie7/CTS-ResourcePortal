﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="NewsletterCreate.aspx.cs" Inherits="CTS_ResourcePortal.NewsletterCreate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <link href="css.css" rel="stylesheet" />

    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/popper.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <div class="container">
        <div class="row">
            <div class="col"></div>
            <h2 class="col-md-auto">Create a Newsletter</h2>
            <div class="col"></div>
        </div>
        <br />
        <div class="section">
            <br />
            <div class="row text-left">
                <div class="col"></div>
                <div class="col-10 ">
                    <b>Filter for the resources that you want to look for.
                    </b>
                </div>
                <div class="col"></div>
            </div>
            <br />
            <div class="row justify-content-center align-items-center">
                <div class="col"></div>
                <div class="col-lg-2 d-flex justify-content-center ">Resource Types:</div>
                <div class="col-lg-4 d-flex justify-content-center ">
                    <asp:CheckBox Text="Job Openings" runat="server" CssClass="aspl" />
                    <asp:CheckBox Text="Event" runat="server" CssClass="aspl" />
                    <asp:CheckBox Text="Training Opportunities" runat="server" CssClass="aspl" />
                </div>
                <div class="col"></div>
            </div>
            <div class="row justify-content-center align-content-center">
                <div class="col"></div>
                <div class="col row">
                    <label class="col-lg-auto">Start Date</label>
                    <div class="form-group date col-lg-auto" data-provide="datepicker" data-date-format="mm/dd/yyyy">
                        <input class="form-control" type="date" />
                    </div>
                    <label class="col-lg-auto">End Date</label>
                    <div class="form-group date col-lg-auto" data-provide="datepicker" data-date-format="mm/dd/yyyy">
                        <input class="form-control" type="date" />
                    </div>
                </div>
                <div class="col"></div>
            </div>
            <div class="row">
                <div class="col"></div>
                <div class="col-lg-10 form-group row d-flex justify-content-center">
                    <div class="col"></div>
                    <div class="row col-8">
                        <div class=" col-lg-auto align-content-end">
                            <label class="col-form-label">Location</label>
                        </div>
                        <div class="col-lg-8">
                            <asp:TextBox runat="server" ID="txtLocation" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col"></div>
                </div>
                <div class="col"></div>
            </div>
            <div class="row">
                <div class="col"></div>
                <div class="col text-right">Include inactive resources</div>
                <div class="col justify-content-center align-items-center">
                    <asp:CheckBox Text="" runat="server" CssClass="aspl" TextAlign="Left" />
                </div>
                <div class="col"></div>
            </div>
            <br />
        </div>
        <br />
        <div class="section">
            <br />
            <div class="row text-left">
                <div class="col"></div>
                <div class="col-10 ">
                    <b>Select the resources you want to add to newsletter.
                    </b>
                </div>
                <div class="col"></div>
            </div>
            <br />
            <div class="row d-flex justify-content-center">
                <div class="accordion col-10" id="resources">
                    <div class="card">
                        <div class="card-header" id="jobHeader">
                            <h2 class="mb-0">
                                <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#jobCollapse" aria-expanded="true" aria-controls="jobCollapse">
                                    Job Openings
                                </button>
                            </h2>
                        </div>
                        <div class="collapse" id="jobCollapse" aria-labelledby="jobHeader" data-parent="#jobHeader">
                            <div class="card-body">
                                <div class="row d-flex justify-content-center">
                                    <div class="table-responsive-lg  ">
                                        <asp:GridView ID="gvJob" runat="server" AutoGenerateColumns="false" class="table table-striped table-dark" DataKeyNames="ResourceID">
                                            <Columns>
                                                <asp:BoundField DataField="ResourceID" Visible="false" />
                                                <asp:TemplateField HeaderText="Select">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelect" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="ResourceTitle" HeaderText="Title" ItemStyle-CssClass="col-1" />
                                                <asp:TemplateField HeaderText="Comments" ItemStyle-CssClass="col-8">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txtComment" TextMode="multiline" Columns="50" Rows="3" placeholder="Enter comments, tips, or other information you would like to give to citizens here..."></asp:TextBox>
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
                                <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#eventCollapse" aria-expanded="true" aria-controls="eventCollapse">
                                    Events
                                </button>
                            </h2>
                        </div>
                        <div class="collapse" id="eventCollapse" aria-labelledby="eventHeader" data-parent="#eventHeader">
                            <div class="card-body">
                                <div class="row d-flex justify-content-center">
                                    <div class="table-responsive-lg  ">
                                        <asp:GridView ID="gvEvent" runat="server" AutoGenerateColumns="false" class="table table-striped table-dark" DataKeyNames="ResourceID">
                                            <Columns>
                                                <asp:BoundField DataField="ResourceID" Visible="false" />
                                                <asp:TemplateField HeaderText="Select">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelect" AutoPostBack="false" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="ResourceTitle" HeaderText="Title" ItemStyle-CssClass="col-1" />
                                                <asp:TemplateField HeaderText="Comments" ItemStyle-CssClass="col-8">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txtComment" TextMode="multiline" Columns="50" Rows="3" placeholder="Enter comments, tips, or other information you would like to give to citizens here..."></asp:TextBox>
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
                                <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#trainingCollapse" aria-expanded="true" aria-controls="trainingCollapse">
                                    Training Opportunities
                                </button>
                            </h2>
                        </div>
                        <div class="collapse" id="trainingCollapse" aria-labelledby="trainingHeader" data-parent="#trainingHeader">
                            <div class="card-body">
                                <div class="row d-flex justify-content-center">
                                    <div class="table-responsive-lg  ">
                                        <asp:GridView ID="gvTraining" runat="server" AutoGenerateColumns="false" class="table table-striped table-dark" DataKeyNames="ResourceID">
                                            <Columns>
                                                <asp:BoundField DataField="ResourceID" Visible="false" />
                                                <asp:TemplateField HeaderText="Select">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelect" AutoPostBack="false" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="ResourceTitle" HeaderText="Title" ItemStyle-CssClass="col-1" />
                                                <asp:TemplateField HeaderText="Comments" ItemStyle-CssClass="col-8">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txtComment" TextMode="multiline" Columns="50" Rows="3" placeholder="Enter comments, tips, or other information you would like to give to citizens here..."></asp:TextBox>
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
            <br />
            <div class="row justify-content-center align-items-center">
                <div class="col-2"></div>
                <div class="col-md-auto">
                    Enter the date for the newsletter:
                </div>
                <div class="col-md-auto">
                    <input type="date" name="newletterDate" value="" />
                </div>
                <div class="col-2"></div>
            </div>
            <br />
            <div class="row justify-content-center align-items-center">
                <div class="col-md-auto">
                    <asp:Button runat="server" class="btn btn-dark" Text="Preview Newsletter" ID="btnPreview" OnClick="btnPreview_Click"></asp:Button>
                </div>
            </div>
            <br />
        </div>
        <br />
    </div>
</asp:Content>