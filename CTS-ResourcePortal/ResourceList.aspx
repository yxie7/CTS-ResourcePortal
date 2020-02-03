<%@ Page Title="" Language="C#" MasterPageFile="~/Guest.master" AutoEventWireup="true" CodeBehind="ResourceList.aspx.cs" Inherits="CTS_ResourcePortal.ResourceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <link href="css.css" rel="stylesheet" />


      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content container" ">

                
                <div class="modal-body " style="color: black">
                   
                   
                        <div class="row" id="h2">
                            <div class="col"></div>
                            <div class="col-md-auto">
                                <h2>Entry Level Contractor</h2>
                            </div>
                            <div class="col"></div>
                        </div>
                        <div class="section">
                            <div class="row" id="job">
                                <div class="col-md-3">
                                    <b>Company Name:</b>
                                </div>
                                <div class="col-1"></div>

                                <div class="col-md-8">
                                    <p>
                                        Philadelphia Construction
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="section">
                            <div class="row" id="title62">
                                <div class="col-md-3">
                                    <b>Primary Responsibilities:
                                    </b>
                                </div>
                                <div class="col-1"></div>

                                <div class="col-md-8">
                                    <p>
                                        The role of the Contractor is to own the project from development through construction, 
                and up until the close out of the home. This includes working with the sales team,
                the Construction Managers, working with architects and engineers, and zoning attorneys 
                for all entitlement and zoning needs.
                                    </p>
                                    <p>
                                        Hours: 40/week
                                    </p>
                                    <p>
                                        Length of Time: Three Months
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
                                    <p>
                                        123 N Main St. Philadelphia, PA 19140
                                    </p>
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
                                    <b>Flaco@asapmob.com
                                    </b>
                                </div>
                            </div>
                        </div>

                        <div class="section">
                            <div class="row" id="title1">
                                <div class="col-md-3 ">
                                    <b>Date Posted:
                                    </b>
                                </div>
                                <div class="col-1"></div>

                                <div class="col-md-8">
                                    <p>
                                        10/27/2019
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="section">
                            <div class="row" id="title2">
                                <div class="col-md-3 ">
                                    <b>Expiration Date:
                                    </b>
                                </div>
                                <div class="col-1"></div>

                                <div class="col-md-8">
                                    <p>
                                        10/31/2019
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="section">
                            <div class="row" id="">
                                <div class="col-md-3">
                                    <b>Knowledge, Skills and Other Requirements:
                                    </b>
                                </div>
                                <div class="col-1"></div>

                                <div class="col-md-8">
                                    <p>
                                        General knowledge of building maintenance, general carpentry, plumbing, electrical, and custodial skills required.
                                    </p>
                                    <p>
                                        Must have the ability to work safely, efficiently and effectively both independently and in team situations.
                                    </p>
                                    <p>
                                        Must be able to maintain professional boundaries with all other employees and volunteers.
                                    </p>
                                    <p>
                                        Must have the ability to communicate and establish effective working relationships with all types of people.
                                    </p>
                                    <p>
                                        Must be able to climb a ladder and lift up to 50 lbs.
                                    </p>
                                </div>
                            </div>
                        </div>


                        <br />

                        <div class="row justify-content-center align-items-center  text-center">
                            <div class="col-md-4">
                                <a class="btn btn-large btn-info" href="templates/home.html">Apply Here</a>
                            </div>
                        </div>
                        <br />
                        <div class="row  justify-content-center align-items-center text-center">
                            <div class="col"></div>
                            <div class="col-md-4">
                                <a class="btn btn-large btn-info" href="MobileFeedback.aspx">Leave Feedback</a>
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
                                                <asp:BoundField DataField="ResourceID" HeaderText="ID" Visible="false" />
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