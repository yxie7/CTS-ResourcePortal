<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="CTS_ResourcePortal.AdminHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <link href="css.css" rel="stylesheet" />

    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/popper.js"></script>
    <script src="Scripts/bootstrap.js"></script>

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
                </div>
            </div>
        </div>
    </div>

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
                        <h2 class="mb-0">Resources
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
                                    <asp:Repeater ID="rptJob" runat="server">
                                        <ItemTemplate>
                                            <li>
                                                <asp:LinkButton runat="server" ID="btnJob" CommandArgument='<%#Eval("ResourcesID") %>' Text='<%# Eval("ResourceName") %>' OnCommand="btnJob_Command"></asp:LinkButton></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
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
                                    <asp:Repeater ID="rptEvent" runat="server">
                                        <ItemTemplate>
                                            <li>
                                                <asp:LinkButton runat="server" ID="btnEvent" CommandArgument='<%#Eval("ResourcesID") %>' Text='<%# Eval("ResourceName") %>' OnCommand="btnEvent_Command"></asp:LinkButton></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
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
                                    <asp:Repeater ID="rptTraining" runat="server">
                                        <ItemTemplate>
                                            <li>
                                                <asp:LinkButton runat="server" ID="btnTraining" CommandArgument='<%#Eval("ResourcesID") %>' Text='<%# Eval("ResourceName") %>' OnCommand="btnTraining_Command"></asp:LinkButton></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <script type="text/javascript">
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }
    </script>
</asp:Content>