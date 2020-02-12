<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="CTS_ResourcePortal.AdminHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <link href="css.css" rel="stylesheet" />

    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/popper.js"></script>
    <script src="Scripts/bootstrap.js"></script>

    <div style="text-align: end">
        <asp:LinkButton CssClass="btn btn-link" runat="server" ID="btnUsers" Text="New Citizens" OnClick="btnUsers_Click" Style="font-size: 30px; margin-right: 6%;"></asp:LinkButton>
    </div>
    <div class="container">
        <div class="col row">
            <label class="col-lg-auto">Search: </label>
            <div class="form-group date col-lg-auto" data-provide="datepicker" data-date-format="mm/dd/yyyy">
                <input class="form-control" type="date" />
            </div>
        </div>
        <div class="row d-flex justify-content-center">
            <div class="accordion col-10" id="resources">
                <div class="card">
                    <div class="card-header" id="title">
                        <h2 class="mb-0">Upcoming Events
                        </h2>
                    </div>
                </div>
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
                            <div class="row d-flex justify-content-center align-items-center">
                                <ul class="cardlist col-8  justify-content-center align-items-center ">
                                    <li>
                                        <a class="" href="MobileJob.aspx">Entry Level Contractor</a>
                                    </li>
                                    <li>
                                        <a href="#">Plumber's Apprentice</a>
                                    </li>
                                    <li>
                                        <a href="#">Coca-Cola Delivery</a>
                                    </li>
                                </ul>
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
                                <ul class="cardlist col-8  justify-content-center align-items-center ">
                                    <li>
                                        <a href="MobileEvent.aspx">North Philly Job Fair</a>
                                    </li>
                                    <li>
                                        <a href="#">Newtown Job Fair</a>
                                    </li>
                                    <li>
                                        <a href="#">Resume Critique</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header" id="trainingHeader">
                        <h2 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#trainingCollapse" aria-expanded="true" aria-controls="trainingCollapse">
                                Training Opportunity
                            </button>
                        </h2>
                    </div>
                    <div class="collapse" id="trainingCollapse" aria-labelledby="trainingHeader" data-parent="#trainingHeader">
                        <div class="card-body">
                            <div class="row d-flex justify-content-center">
                                <ul class="cardlist col-8  justify-content-center align-items-center ">
                                    <li>
                                        <a href="MobileTraining.aspx">CDL Classes</a>
                                    </li>
                                    <li>
                                        <a href="#">Electrician Classes</a>
                                    </li>
                                    <li>
                                        <a href="#">Fork Lift Training</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    </div>
    </div>
</asp:Content>