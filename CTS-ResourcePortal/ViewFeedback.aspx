<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="ViewFeedback.aspx.cs" Inherits="CTS_ResourcePortal.ViewFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }
        function myFunction() {
            // Declare variables
            var input, filter,table, table2, table3, tr, tr2, tr3, td, i, txtValue;
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
                td = tr[i].getElementsByTagName("td")[1];
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
                td = tr2[i].getElementsByTagName("td")[1];
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
                td = tr3[i].getElementsByTagName("td")[1];
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
    </script>
    <link href="css.css" rel="stylesheet" />


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <link href="css.css" rel="stylesheet" />
    <div class="container">
        <div class="row">
            <div class="col-10">

                <br />

            </div>
        </div>

        <div class="row">
            <div class="col-10">

                <br />

            </div>
        </div>
        <br />
        <div class="row d-flex justify-content-center">
            <div class="accordion col-10" id="resources">
                <br />
                <h2 class="col-sm-8" style="margin: auto">View Feedback
                </h2>
                <br />
                <div class="col-lg-auto" style="text-align: center;">
                    <input type="text" placeholder="Search..." id="myInput" onkeyup="myFunction()"/>
                </div>

                <br />
                <div class="card">
                    <div class="card-header" id="jobHeader">
                        <h2 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#jobCollapse" aria-expanded="true" aria-controls="jobCollapse" style="color:black">
                                Job Openings</button>
                        </h2>
                    </div>
                    <div class="collapse" id="jobCollapse" aria-labelledby="jobHeader" data-parent="#jobHeader">
                        <div class="card-body">
                            <div class="row d-flex justify-content-center">
                                <div class="table-responsive-lg  ">
                                    <table class="table table-striped table-light" id="myTable1">
                                        <thead>
                                            <tr>
                                                <th scope="col">Select</th>
                                                <th scope="col" class="col-1">Title</th>
                                                <th scope="col" class="col-md-8">Feedback</th>
                                                <th scope="col" class="col-1">Date Posted</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox runat="server" AutoPostBack="false" /></td>
                                                <td>Entry Level Contractor</td>
                                                <td>
                                                    <p>This Job is great for people who are just starting out, who have experience in construction</p>
                                                </td>
                                                <td>
                                                    <p>10/25/19</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox runat="server" AutoPostBack="false" /></td>
                                                <td>Plumber's Apprentice</td>
                                                <td>
                                                    <p>This opportunity is an asset for anyone who wants to make money with no experience, this job is Great!</p>
                                                </td>
                                                <td>
                                                    <p>11/27/19</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox runat="server" AutoPostBack="false" /></td>
                                                <td>Coca-Cola Delivery</td>
                                                <td>
                                                    <p>For anyone who alread has a driver's license</p>
                                                </td>
                                                <td>02/05/19
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

                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#eventCollapse" aria-expanded="true" aria-controls="eventCollapse" style="color:black">

                                Events
                            </button>
                        </h2>
                    </div>
                    <div class="collapse" id="eventCollapse" aria-labelledby="eventHeader" data-parent="#eventHeader">
                        <div class="card-body">
                            <div class="row d-flex justify-content-center">
                                <div class="table-responsive-lg  ">
                                    <table class="table table-striped table-light" id="myTable2">
                                        <thead>
                                            <tr>
                                                <th scope="col">Select</th>
                                                <th scope="col" class="col-1">Title</th>
                                                <th scope="col" class="col-md-8">Feedback</th>
                                                <th scope="col" class="col-1">Date Posted</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox runat="server" AutoPostBack="false" /></td>
                                                <td>Newtown Job Fair</td>
                                                <td>This job fair is for recent college graduates only fyi
                                                </td>
                                                <td>12/26/19
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox runat="server" AutoPostBack="false" /></td>
                                                <td>Resume Critique</td>
                                                <td>The Critiquers were a little too harsh, my resume seemed adequite but now I have nothing on it
                                                </td>
                                                <td>09/27/19
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox runat="server" AutoPostBack="false" /></td>
                                                <td>North Philly Job Fair</td>
                                                <td>The companies who showed up to Job fair were very diverse and seemed very geniune in their mission statements
                                                </td>
                                                <td>10/31/19
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
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#trainingCollapse" aria-expanded="true" aria-controls="trainingCollapse" style="color:black; font-family: 'Glyphicons Halflings';">
                                Training Opportunities
                            </button>
                        </h2>
                    </div>
                    <div class="collapse" id="trainingCollapse" aria-labelledby="trainingHeader" data-parent="#trainingHeader">
                        <div class="card-body">
                            <div class="row d-flex justify-content-center">
                                <div class="table-responsive-lg  ">
                                    <table class="table table-striped table-light" id="myTable3">
                                        <thead>
                                            <tr>
                                                <th scope="col">Select</th>
                                                <th scope="col" class="col-1">Title</th>
                                                <th scope="col" class="col-md-8">Feedback</th>
                                                <th scope="col" class="col-1">Date Posted</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox runat="server" AutoPostBack="false" /></td>
                                                <td>Electrician Classes</td>
                                                <td>These classes are very tough but you lean a lot!
                                                </td>
                                                <td>04/20/19
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox runat="server" AutoPostBack="false" /></td>
                                                <td>CDL Classes</td>
                                                <td>These classes are flexible and the teacher is very eager to provide help
                                                </td>
                                                <td>11/01/19
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox runat="server" AutoPostBack="false" /></td>
                                                <td>Fork Lift Training</td>
                                                <td>Pretty straight forward, the instructor is very to the point and the class is valuable. 
                                                </td>
                                                <td>12/05/19
                                                </td>
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
        <br />
        <div class="row justify-content-center align-items-center text-center">
            <div class="col-md-2">
                <asp:Button ID="btnRemove" runat="server" class="btn btn-dark" Text="Remove" OnClick="btnRemove_Click" /></asp:Button>
                
            </div>
        </div>
    </div>
    <div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content" style="margin-top: 55%; }">
                <h4 class="modal-title"></h4>
                <div class="modal-body" >
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Close</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

