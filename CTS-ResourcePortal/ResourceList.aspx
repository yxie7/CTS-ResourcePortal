<%@ Page Title="" Language="C#" MasterPageFile="~/Guest.master" AutoEventWireup="true" CodeBehind="ResourceList.aspx.cs" Inherits="CTS_ResourcePortal.ResourceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <link href="css.css" rel="stylesheet" />
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
                                                <asp:BoundField DataField="ResourceID" HeaderText="ID"  Visible="false" />
                                                <asp:BoundField DataField="ResourceTitle" HeaderText="Title" />
                                                <asp:BoundField DataField="email" HeaderText="Contact" />
                                                <asp:BoundField DataField="AddressLine2" HeaderText="Location" />
                                                <asp:BoundField DataField="datePosted" HeaderText="Date Posted" />
                                                <asp:BoundField DataField="expDate" HeaderText="Date Expired" />
                                                <asp:TemplateField HeaderText="Details">
                                                    <ItemTemplate>
                                                        <asp:Button runat="server" Text="Click for Details" CssClass="btn btn-dark" ID="btnJob" OnClick="btnJob_Click" />
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
                                                <asp:BoundField DataField="ResourceID" HeaderText="ID" Visible="false" />
                                                <asp:BoundField DataField="ResourceTitle" HeaderText="Title" />
                                                <asp:BoundField DataField="email" HeaderText="Contact" />
                                                <asp:BoundField DataField="AddressLine2" HeaderText="Location" />
                                                <asp:BoundField DataField="EventDate" HeaderText="Event Date" />
                                                <asp:BoundField DataField="expDate" HeaderText="Date Expired" />
                                                <asp:TemplateField HeaderText="Details">
                                                    <ItemTemplate>
                                                        <asp:Button runat="server" Text="Click for Details" CssClass="btn btn-dark" ID="btnJob" OnClick="btnJob_Click" />
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
                                                <asp:BoundField DataField="ResourceID" HeaderText="ID" Visible="false" />
                                                <asp:BoundField DataField="ResourceTitle" HeaderText="Title" />
                                                <asp:BoundField DataField="email" HeaderText="Contact" />
                                                <asp:BoundField DataField="AddressLine2" HeaderText="Location" />
                                                <asp:BoundField DataField="StartDate" HeaderText="Start Date" />
                                                <asp:BoundField DataField="expDate" HeaderText="Date Expired" />
                                                <asp:TemplateField HeaderText="Details">
                                                    <ItemTemplate>
                                                        <asp:Button runat="server" Text="Click for Details" CssClass="btn btn-dark" ID="btnJob" OnClick="btnJob_Click" />
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
</asp:Content>