<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="ManageR.aspx.cs" Inherits="CTS_ResourcePortal.ManageR" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <style>
        .search {
            align-content: center;
        }
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
        }

        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
    </style>
    <link rel="stylesheet" type="text/css" href="DataTables/datatables.min.css" />
    <script type="text/javascript" src="DataTables/jQuery-3.2.1/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="DataTables/datatables.min.js"></script>
    <script type="text/javascript" src="DataTables/DataTables-1.10.16/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="DataTables/Buttons-1.5.1/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="DataTables/JSZip-2.5.0/jszip.min.js"></script>
    <script type="text/javascript" src="DataTables/pdfmake-0.1.32/pdfmake.min.js"></script>
    <script type="text/javascript" src="DataTables/Buttons-1.5.1/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="custom.js"></script>

    <%--<script type="text/javascript">
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }
        function myFunction() {
            // Declare variables
            var input, filter, table, table2, table3, tr, tr2, tr3, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable1");
            tr = table.getElementsByTagName("tr");
            table2 = document.getElementById("myTable2");
            tr2 = table2.getElementsByTagName("tr");
            table3 = document.getElementById("myTable3");
            tr3 = table3.getElementsByTagName("tr");

            // Loop through all table rows, and hide those who don't match the search query
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
            // Loop through all table rows, and hide those who don't match the search query
            for (i = 0; i < tr2.length; i++) {
                td = tr2[i].getElementsByTagName("td")[0];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr2[i].style.display = "";
                    } else {
                        tr2[i].style.display = "none";
                    }
                }
            }
            // Loop through all table rows, and hide those who don't match the search query
            for (i = 0; i < tr3.length; i++) {
                td = tr3[i].getElementsByTagName("td")[0];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr3[i].style.display = "";
                    } else {
                        tr3[i].style.display = "none";
                    }
                }
            }
        }
    </script>--%>
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>-->
    <script type="text/javascript">
        /*$(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable td").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });*/

        $(document).ready(function () {
            $('#<%= gvManageR.ClientID %>').DataTable();
        });
    </script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link href="css.css" rel="stylesheet" />


</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-10 text-center">
            </div>
        </div>
        <div class="row">
            <div class="col-10 align-content-center">
            </div>
        </div>
        <br />
        <div class="row d-flex justify-content-center">
            <div class="accordion col-10" id="resources">
                <br />
                <h2 class="col-sm-8" style="margin: auto">Manage Resources
                </h2>
                <br />
                <div class="col-lg-auto">
                    <asp:GridView ID="gvManageR" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvManageR_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="ResourceName" HeaderText="Resource Title" />
                            <asp:BoundField DataField="AddressLine" HeaderText="Address" />
                            <asp:BoundField DataField="LocationCity" HeaderText="City" />
                            <asp:BoundField DataField="StartDate" HeaderText="Date Posted" />
                            <asp:ButtonField Text="Inactivate" />
                            <asp:ButtonField Text="Edit" />
                        </Columns>
                    </asp:GridView>

                </div>



                <%--<div class="col-lg-auto" style="text-align: center;">
                    <input id="myInput" type="text" placeholder="Search..." onkeyup="myFunction()" />
                </div>

                <br />
                <div class="card">
                    <div class="card-header" id="jobHeader">
                        <h2 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#jobCollapse" aria-expanded="true" aria-controls="jobCollapse">
                                Job Openings</button>
                        </h2>
                    </div>
                    <div class="collapse" id="jobCollapse" aria-labelledby="jobHeader" data-parent="#jobHeader">
                        <div class="card-body">
                            <div class="row d-flex justify-content-center">
                                <div class="table-responsive-lg">
                                    <table class="table table-striped table-light" id="myTable1">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="col-1">Title</th>
                                                <th scope="col" class="col-md-8">Location</th>
                                                <th scope="col" class="col-1">Date Posted</th>
                                                <th scope="col" class="col-md-2">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="table-body">
                                            <tr>
                                                <td>Entry Level Contractor</td>
                                                <td>
                                                    <p>123 N Main ST,  Philadelphia, PA 19121</p>
                                                </td>
                                                <td>
                                                    <p>10/25/19</p>
                                                </td>
                                                <td>
                                                    <asp:Button ID="Button1" class="btn btn-dark" runat="server" Text="Inactivate" OnClientClick="showModal()" OnClick="myBtn_Click1"></asp:Button>
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="btnEdit1" runat="server" class="btn btn-dark" OnClick="EditJob" Text="Edit"></asp:Button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Plumber's Apprentice</td>
                                                <td>
                                                    <p>717 Nth 13th St, Philadelohia, PA 19121</p>
                                                </td>
                                                <td>
                                                    <p>11/27/19</p>
                                                </td>
                                                <td>
                                                    <asp:Button ID="Button2" class="btn btn-dark" runat="server" Text="Inactivate" OnClientClick="showModal()" OnClick="myBtn_Click1" Enabled="false"></asp:Button>
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="btnEdit2" runat="server" class="btn btn-dark" OnClick="EditJob" Text="Edit" Enabled="false"></asp:Button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Coca-Cola Delivery</td>
                                                <td>
                                                    <p>12th Mongomery St Trenton, NJ 07840</p>
                                                </td>
                                                <td>02/05/19
                                                </td>
                                                <td>
                                                    <asp:Button ID="Button3" class="btn btn-dark" runat="server" Text="Inactivate" OnClientClick="showModal()" OnClick="myBtn_Click1" Enabled="false"></asp:Button>
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="btnEdit3" runat="server" class="btn btn-dark" OnClick="EditJob" Text="Edit" Enabled="false"></asp:Button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Security Guard</td>
                                                <td>
                                                    <p>1541 N Broad St Philadelphia, PA 19134</p>
                                                </td>
                                                <td>02/27/19
                                                </td>
                                                <td>
                                                    <asp:Button ID="Button10" class="btn btn-dark" runat="server" Text="Inactivate" OnClientClick="showModal()" OnClick="myBtn_Click1" Enabled="false"></asp:Button>
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="Button11" runat="server" class="btn btn-dark" OnClick="EditJob" Text="Edit" Enabled="false"></asp:Button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
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
                                <div class="table-responsive-lg" >
                                    <table class="table table-striped table-light" id="myTable2">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="col-1">Title</th>
                                                <th scope="col" class="col-md-8">Location</th>
                                                <th scope="col" class="col-1">Date Posted</th>
                                                <th scope="col" class="col-md-2">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Newtown Job Fair</td>
                                                <td>123 Newton St Newtown, PA 18234
                                                </td>
                                                <td>12/26/19
                                                </td>
                                                <td>
                                                    <asp:Button ID="Button4" class="btn btn-dark" runat="server" Text="Inactivate" OnClientClick="showModal()" OnClick="myBtn_Click1" Enabled="false"></asp:Button>
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="btnEdit4" runat="server" class="btn btn-dark" OnClick="EditEvent" Text="Edit" Enabled="false"></asp:Button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Resume Critique</td>
                                                <td>44 Winsor Court Allentown, PA 18104
                                                </td>
                                                <td>09/27/19
                                                </td>
                                                <td>
                                                    <asp:Button ID="Button5" class="btn btn-dark" runat="server" Text="Inactivate" OnClientClick="showModal()" OnClick="myBtn_Click1" Enabled="false"></asp:Button>
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="btnEdit5" runat="server" class="btn btn-dark" OnClick="EditEvent" Text="Edit" Enabled="false"></asp:Button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>North Philly Job Fair</td>
                                                <td>1617 Cecil B Moore Ave Philadelphia, PA 19121
                                                </td>
                                                <td>10/31/19
                                                </td>
                                                <td>
                                                    <asp:Button ID="Button6" class="btn btn-dark" runat="server" Text="Inactivate" OnClientClick="showModal()" OnClick="myBtn_Click1"></asp:Button>
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="btnEdit6" runat="server" class="btn btn-dark" OnClick="EditEvent" Text="Edit"></asp:Button>
                                                </td>
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
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#trainingCollapse" aria-expanded="true" aria-controls="trainingCollapse">
                                Training Opportunities
                            </button>
                        </h2>
                    </div>
                    <div class="collapse" id="trainingCollapse" aria-labelledby="trainingHeader" data-parent="#trainingHeader">
                        <div class="card-body">
                            <div class="row d-flex justify-content-center">
                                <div class="table-responsive-lg">
                                    <table class="table table-striped table-light" id="myTable3">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="col-1">Title</th>
                                                <th scope="col" class="col-md-8">Location</th>
                                                <th scope="col" class="col-1">Date Posted</th>
                                                <th scope="col" class="col-md-2">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Electrician Classes</td>
                                                <td>420 Green St Ohio, PA 4321
                                                </td>
                                                <td>04/20/19
                                                </td>
                                                <td>
                                                    <asp:Button ID="Button7" class="btn btn-dark" runat="server" Text="Inactivate" OnClientClick="showModal()" OnClick="myBtn_Click1" Enabled="false"></asp:Button>
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="btnEdit7" runat="server" class="btn btn-dark" OnClick="EditTraining" Text="Edit" Enabled="false"></asp:Button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>CDL Classes</td>
                                                <td>679 Master St Philadelphia, PA 19121
                                                </td>
                                                <td>11/01/19
                                                </td>
                                                <td>
                                                    <asp:Button ID="Button8" class="btn btn-dark" runat="server" Text="Inactivate" OnClientClick="showModal()" OnClick="myBtn_Click1"></asp:Button>
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="btnEdit8" runat="server" class="btn btn-dark" OnClick="EditTraining" Text="Edit"></asp:Button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Fork Lift Training</td>
                                                <td>234 Vine Ave  Trenton, NJ 07840
                                                </td>
                                                <td>12/05/19
                                                </td>
                                                <td>
                                                    <asp:Button ID="Button9" class="btn btn-dark" runat="server" Text="Inactivate" OnClientClick="showModal()" OnClick="myBtn_Click1" Enabled="false"></asp:Button>
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="btnEdit9" runat="server" class="btn btn-dark" OnClick="EditTraining" Text="Edit" Enabled="false"></asp:Button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>
        <br />
        <!--<div class="row justify-content-center align-items-center">
            <div class="col-md-2">
                <asp:Button ID="myBtn" class="btn btn-dark" runat="server" Text="Inactivate" OnClientClick="showModal()" OnClick="myBtn_Click1"></asp:Button>
                &nbsp
                <asp:Button ID="btnEdit" runat="server" class="btn btn-dark" OnClick="EditJob"></asp:Button>
            </div>
        </div>-->
    </div>



    <%--<div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content" style="margin-top: 55%; }">

                <h4 class="modal-title"></h4>

                <div class="modal-body">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Close</button>
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>
