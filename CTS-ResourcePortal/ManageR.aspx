<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="ManageR.aspx.cs" Inherits="CTS_ResourcePortal.ManageR" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <link href="css.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/popper.js"></script>
    <script src="Scripts/bootstrap.js"></script>

    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
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
    <div id="MyPopup" class="modal" role="dialog">
        <div class="modal-dialog modal-xl">
            <!-- Modal content-->
            <div class="modal-content container">
                <div class="modal-body">

                    <br />
                    <div class="row  justify-content-center align-items-center text-center">
                        <div class="col"></div>
                        <div class="col-md-4">
                            <asp:Label runat="server" Text="Resource(s) Activated!" ID="lblResourceActivated" Font-Bold="True"></asp:Label>
                        </div>
                        <div class="col"></div>
                    </div>
                    <br />
                </div>
            </div>
        </div>
    </div>

    <div id="MyPopup1" class="modal" role="dialog">
        <div class="modal-dialog modal-xl">
            <!-- Modal content-->
            <div class="modal-content container">
                <div class="modal-body">

                    <br />
                    <div class="row  justify-content-center align-items-center text-center">
                        <div class="col"></div>
                        <div class="col-md-4">
                            <asp:Label runat="server" Text="Resource(s) Inactivated!" ID="lblResourceInactivated" Font-Bold="True"></asp:Label>
                        </div>
                        <div class="col"></div>
                    </div>
                    <br />
                </div>
            </div>
        </div>
    </div>

    <div id="MyPopup2" class="modal" role="dialog">
        <div class="modal-dialog modal-xl">
            <!-- Modal content-->
            <div class="modal-content container">
                <div class="modal-body">

                    <br />
                    <div class="row  justify-content-center align-items-center text-center">
                        <div class="col"></div>
                        <div class="col-md-4">
                            <asp:Label runat="server" Text="Please choose 1 Resource to edit!" ID="lblNoEdit" Font-Bold="True"></asp:Label>
                        </div>
                        <div class="col"></div>
                    </div>
                    <br />
                </div>
            </div>
        </div>
    </div>

    <div id="MyPopup3" class="modal" role="dialog">
        <div class="modal-dialog modal-xl">
            <!-- Modal content-->
            <div class="modal-content container">
                <div class="modal-body">

                    <br />
                    <div class="row  justify-content-center align-items-center text-center">
                        <div class="col"></div>
                        <div class="col-md-4">
                            <asp:Label runat="server" Text="Please only choose 1 Resource to edit!" ID="lblTooManyEdi" Font-Bold="True"></asp:Label>
                        </div>
                        <div class="col"></div>
                    </div>
                    <br />
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="section">
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

                <div class="row" id="rowInst">
                <asp:Label ID="lblInst" runat="server">The Manage Resources page is for Activating/Inactivating or Editing resources. In order to Activate/Inactivate a resource, click the checkboxes on left side of the table and click the respective button for the action needed. The current status of resource can be seen in the “Current Status” column. Multiple resources can be Activated/Inactivated at a time. To Edit a resource, click the checkbox next to only one resource and then Click “Edit Resource”. </asp:Label>
                </div>

                <br />
                <br />
                <asp:Label ID="lblDDLResources" runat="server" Text="Select Resources to View: "></asp:Label>
                <asp:DropDownList ID="ddlResources" runat="server" AutoPostBack="false" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Text="All Resources"></asp:ListItem>
                </asp:DropDownList>
                &nbsp
                <asp:Button ID="btnViewR" runat="server" OnClick="btnViewR_Click" Text="View" />
                &nbsp
                <asp:Button ID="btnAllResources" runat="server" OnClick="btnAllResources_Click" Text="View All Resources" />

                <br />
                <br />
                <asp:Repeater ID="rptManageR" runat="server">
                    <HeaderTemplate>
                        <table id="datatable" class="table table-bordered" border="0" cellpadding="0"
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
                                    <th>Current Status
                                    </th>
                                    <th>Address
                                    </th>
                                    <th>City
                                    </th>
                                    <th>Date Posted
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
                                <asp:Label runat="server" ID="lblResID" Text='<%# DataBinder.Eval(Container.DataItem, ("ResourcesID")) %>'> </asp:Label>
                            </td>
                            <td>
                                <%# DataBinder.Eval(Container.DataItem, ("ResourceName")) %>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblResTypeID" Text='<%# DataBinder.Eval(Container.DataItem, ("ResourceTypeID")) %>'> </asp:Label>
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
                        <asp:Button ID="btnActivate" runat="server" Text="Activate Resource(s)" OnClick="btnActivate_Click" />
                    </div>
                    <div class="col-md-1"></div>
                    <div class="col-md-2">
                        <asp:Button ID="btnInactivate" Text="Inactivate Resource(s)" runat="server" OnClick="btnInactivate_Click" />
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

    <script type="text/javascript">
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }
    </script>

    <script type="text/javascript">
        function ShowPopup1(title, body) {
            $("#MyPopup1 .modal-title").html(title);
            $("#MyPopup1 .modal-body").html(body);
            $("#MyPopup1").modal("show");
        }
    </script>

    <script type="text/javascript">
        function ShowPopup2(title, body) {
            $("#MyPopup2 .modal-title").html(title);
            $("#MyPopup2 .modal-body").html(body);
            $("#MyPopup2").modal("show");
        }
    </script>

    <script type="text/javascript">
        function ShowPopup3(title, body) {
            $("#MyPopup3 .modal-title").html(title);
            $("#MyPopup3 .modal-body").html(body);
            $("#MyPopup3").modal("show");
        }
    </script>
</asp:Content>