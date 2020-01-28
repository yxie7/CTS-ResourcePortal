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
                                      <%--  <table class="table table-striped table-light">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Title</th>
                                                    <th scope="col">Contact</th>
                                                    <th scope="col">Location</th>
                                                    <th scope="col">Date Posted</th>
                                                    <th scope="col">Date Expired</th>
                                                    <th scope="col">Details</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Entry Level Contractor</td>
                                                    <td>flacko@asapmob.com</td>
                                                    <td>123 N Main ST, New York City, NY, 12345</td>
                                                    <td>9/23/19</td>
                                                    <td>12/23/19</td>
                                                    <td>
                                                        <asp:Button runat="server" Text="Click for Details" CssClass="btn btn-dark" ID="btnJob" OnClick="btnJob_Click" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Plumber's Apprentice</td>
                                                    <td>plummin@yahoo.com</td>
                                                    <td>717 N 15th St, Philadelphia, PA 19121</td>
                                                    <td>10/20/19</td>
                                                    <td>1/1/20</td>
                                                    <td>
                                                        <asp:Button runat="server" Text="Click for Details" CssClass="btn btn-dark" Enabled="false" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Coca-Cola Delivery</td>
                                                    <td>sugardrinkin@soda.com</td>
                                                    <td>420 N Main St, Philadelphia, PA 19221</td>
                                                    <td>9/6/19</td>
                                                    <td>11/15/19</td>
                                                    <td>
                                                        <asp:Button runat="server" Text="Click for Details" CssClass="btn btn-dark" Enabled="false" /></td>
                                                </tr>
                                            </tbody>
                                        </table>--%>
                                        <asp:GridView ID="gvJob" runat="server" AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:BoundField HeaderText="Title" />
                                                <asp:BoundField HeaderText="Contact" />
                                                <asp:BoundField HeaderText="Location" />
                                                <asp:BoundField HeaderText="Date Posted" />
                                                <asp:BoundField HeaderText="Date Expired" />
                                                <asp:ButtonField HeaderText="Details" Text="Button" />
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
                                        <table class="table table-striped table-light">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Title</th>
                                                    <th scope="col">Contact</th>
                                                    <th scope="col">Location</th>
                                                    <th scope="col">Date</th>
                                                    <th scope="col">Details</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Newtown Job Fair</td>
                                                    <td>Meek.Mill@dreams.com</td>
                                                    <td>12th Main St Newtown, PA 19221</td>
                                                    <td>7/6/19</td>
                                                    <td>
                                                        <asp:Button runat="server" Text="Click for Details" CssClass="btn btn-dark" Enabled="false" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Resume Critique</td>
                                                    <td>Resumer@critiquer.com</td>
                                                    <td>678 Liacouras Wlk Philadelphia, PA 19231</td>
                                                    <td>10/27/19</td>
                                                    <td>
                                                        <asp:Button runat="server" Text="Click for Details" CssClass="btn btn-dark" Enabled="false" /></td>
                                                </tr>
                                                <tr>
                                                    <td>North Philly Job Fair</td>
                                                    <td>Newtown@press.com</td>
                                                    <td>456 North Broad St Philadelphia, PA 19140</td>
                                                    <td>12/21/19</td>
                                                    <td>
                                                        <asp:Button runat="server" Text="Click for Details" CssClass="btn btn-dark" ID="btnEvent" OnClick="btnEvent_Click" /></td>
                                                </tr>
                                            </tbody>
                                        </table>
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
                                        <table class="table table-striped table-light">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Title</th>
                                                    <th scope="col">Contact</th>
                                                    <th scope="col">Location</th>
                                                    <th scope="col">Date Posted</th>
                                                    <th scope="col">Date Expired</th>
                                                    <th scope="col">Details</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <tr>
                                                    <td>Electrician Classes </td>
                                                    <td>King@gmail.com</td>
                                                    <td>717 N 15th St, Philadelphia, PA 19121</td>
                                                    <td>9/23/19</td>
                                                    <td>12/23/19</td>
                                                    <td>
                                                        <asp:Button runat="server" Text="Click for Details" CssClass="btn btn-dark" Enabled="false" /></td>
                                                </tr>
                                                <tr>
                                                    <td>CDL Classes
                                                    </td>
                                                    <td>kingis@aol.com</td>
                                                    <td>420 N Main St, Philadelphia, PA 19221</td>
                                                    <td>10/20/19</td>
                                                    <td>1/1/20</td>
                                                    <td>
                                                        <asp:Button runat="server" Text="Click for Details" CssClass="btn btn-dark" ID="btnTraining" OnClick="btnTraining_Click" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Forklift Training</td>
                                                    <td>longlivetheking@aim.com</td>
                                                    <td>123 N Main ST, New York City, NY, 12345</td>
                                                    <td>9/6/19</td>
                                                    <td>11/15/19</td>
                                                    <td>
                                                        <asp:Button runat="server" Text="Click for Details" CssClass="btn btn-dark" Enabled="false" /></td>
                                                </tr>
                                            </tbody>
                                        </table>
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