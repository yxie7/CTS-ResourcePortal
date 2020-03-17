<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="ManageR.aspx.cs" Inherits="CTS_ResourcePortal.ManageR" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


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
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>


    <%--<script>
        /*$(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable td").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });*/

        $(document).ready(function () {
            $('#gvManageR').DataTable();
        });
    </script>--%>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">




    <%--    /*************************************************************Style Sheets************************************************/--%>
    <link href="css.css" rel="stylesheet" />

<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <%--//https://datatables.net/examples/plug-ins/range_filtering.html--%>
<%--    https://datatables.net/extensions/fixedheader/examples/integration/buttons.html--%>

    <%-- /*************************************************Stuff to make Data tables work*******************************/--%>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <%--   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />--%>
    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
    <%--    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css" />--%>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('[id*=datatable]').DataTable({
                //columnDefs: [{
                //    orderable: false,
                //    className: 'select-checkbox',
                //    targets: 0
                //}],
                //select: {
                //    style: 'os',
                //    selector: 'td:first-child'
                //},
                //order: [[1, 'asc']]
            });
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#datatable [id*=chkHeader]").click(function () {
                if ($(this).is(":checked")) {
                    $("#datatable [id*=chkRow]").attr("checked", "checked");
                } else {
                    $("#datatable [id*=chkRow]").removeAttr("checked");
                }
            });
            $("#datatable [id*=chkRow]").click(function () {
                if ($("#datatable [id*=chkRow]").length == $("#datatable [id*=chkRow]:checked").length) {
                    $("#datatable [id*=chkHeader]").attr("checked", "checked");
                } else {
                    $("#datatable [id*=chkHeader]").removeAttr("checked");
                }
            });
        });
    </script>
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
                <h2 class="col-sm-8" style="margin: auto;">Manage Resources
                </h2>
                <br />
                <br />
                    <asp:Label ID="lblDDLResources" runat="server" Text="Select Resources to View: "></asp:Label>
                    <asp:DropDownList ID="ddlResources" runat="server" AutoPostBack="false" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Text="All Resources"></asp:ListItem>
                    </asp:DropDownList> &nbsp <asp:Button ID="btnViewR" runat="server" OnClick="btnViewR_Click" Text="View" />  &nbsp <asp:Button ID="btnAllResources" runat="server" OnClick="btnAllResources_Click"  Text="View All Resources"/>

                <br />
                <br />
                <asp:Repeater ID="rptManageR" runat="server">
                    <HeaderTemplate>
                        <table id="datatable" class="table table-striped table-bordered" border="0" cellpadding="0"
                            cellspacing="0">
                            <thead>
                                <tr>
                                    <th>
                                        <asp:CheckBox ID="chkHeader" runat="server" /></th>
                                    <th>ID
                                    </th>
                                    <th>Resource Title
                                    </th>
                                    <th>Resource Type ID
                                    </th>
                                    <th>Active Status 
                                    </th>
                                    <th>Address
                                    </th>
                                    <th>City
                                    </th>
                                    <th>Date Posted
                                    </th>
                                    <th>Current Status
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>

                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:CheckBox ID="chkRow" runat="server" /></td>
                            <td>
                                <asp:Label runat="server" ID="lblResID" Text='<%# DataBinder.Eval(Container.DataItem, ("ResourcesID")) %>' > </asp:Label>
                            </td>
                            <td>
                                <%# DataBinder.Eval(Container.DataItem, ("ResourceName")) %>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblResTypeID" Text='<%# DataBinder.Eval(Container.DataItem, ("ResourceTypeID")) %>' > </asp:Label>
                            </td>
                            <td>
                                <%# DataBinder.Eval(Container.DataItem, ("Active")) %>
                            </td>
                            <td>
                                <%# DataBinder.Eval(Container.DataItem, ("AddressLine")) %>
                            </td>
                            <td>
                                <%# DataBinder.Eval(Container.DataItem, ("LocationCity")) %>
                            </td>
                            <td>
                                <%# DataBinder.Eval(Container.DataItem, ("StartDate")) %>
                            </td>
                            <td>

                                 <%# DataBinder.Eval(Container.DataItem, ("Active")) %>

                            </td>
                        </tr>

                    </ItemTemplate>

                    <FooterTemplate>
                        </tbody></table>
                    </FooterTemplate>
                </asp:Repeater>
                <br />
                <br />
                <div class="row justify-content-center align-items-center">
                <div class="col-md-2">
                    <asp:Button ID="btnActivate" runat="server" Text="Activate Resource(s)" OnClick="btnActivate_Click"/>
                </div>
                    <div class="col-md-1"></div>
                    <div class="col-md-2">
                    <asp:Button ID="btnInactivate" Text="Inactivate Resource(s)" runat="server" OnClick="btnInactivate_Click"  />
                </div>
                    <div class="col-md-1"></div>
                    <div class="col-md-2">
                    <asp:Button ID="btnEdit" Text="Edit Resource" runat="server" OnClick="btnEdit_Click" />
                </div>
            </div>

                <%--<asp:GridView ID="gvManageR" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="ResourceName" HeaderText="Resource Title" />
                        <asp:BoundField DataField="AddressLine" HeaderText ="Address" />
                        <asp:BoundField DataField="LocationCity" HeaderText="City" />
                        <asp:BoundField DataField="StartDate" HeaderText="Date Posted" />
                        <asp:ButtonField Text="Inactivate" />
                        <asp:ButtonField Text="Edit" />
                    </Columns>
                </asp:GridView>--%>



                
            </div>
        </div>
        <br />

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