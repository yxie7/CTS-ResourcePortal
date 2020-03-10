<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="ViewFeedback.aspx.cs" Inherits="CTS_ResourcePortal.ViewFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                columnDefs: [{
                    orderable: false,
                    className: 'select-checkbox',
                    targets: 0
                }],
                select: {
                    style: 'os',
                    selector: 'td:first-child'
                },
                order: [[1, 'asc']]
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

    <script type="text/javascript">
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <link href="css.css" rel="stylesheet" />
   <%-- <div id="MyPopup" class="modal" role="dialog">
            <div class="modal-dialog modal-xl">
                <!-- Modal content-->
                <div class="modal-content container">
                    <div class="modal-body">

                        <br />
                        <div class="row  justify-content-center align-items-center text-center">
                            <div class="col"></div>
                            <div class="col-md-4">
                                <asp:Label runat="server" Text="Feedback Removed!" ID="lblThanks" Font-Bold="True"></asp:Label>
                            </div>
                            <div class="col"></div>
                        </div>
                        <br />
                    </div>
                </div>
            </div>
        </div>--%>
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
                <br />
                <asp:Label ID="lblDDLResources" runat="server" Text="Select Resources to View: "></asp:Label>
                <asp:DropDownList ID="ddlResources" runat="server" AutoPostBack="false">
                    <asp:ListItem Text="All Resources"></asp:ListItem>
                </asp:DropDownList>
                &nbsp
                <asp:Button ID="btnViewR" runat="server" Text="View" OnClick="btnViewR_Click" />
                &nbsp
                <asp:Button ID="btnAllResources" runat="server" Text="View All Resources" OnClick="btnAllResources_Click" />

                <br />
                <br />
                <asp:Repeater ID="rptViewR" runat="server">
                    <HeaderTemplate>
                        <table id="datatable" class="table table-striped table-bordered" border="0" cellpadding="0"
                            cellspacing="0">
                            <thead>
                                <tr>
                                    <th>
                                        <asp:CheckBox ID="chkHeader" runat="server" /></th>
                                    <th>Resource Title
                                    </th>
                                    <th>Feedback
                                    </th>
                                    <%--<th>Active Status 
                                    </th>--%>
                                    <th>Date Posted
                                    </th>
                                    <th>Reply to Feedback
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
                                <asp:Label ID="lblResourceName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, ("ResourceName")) %>'></asp:Label>
                                <%--<%# (string) DataBinder.Eval(Container.DataItem, ("ResourceName")) %>--%>
                            </td>
                            <%--<td>
                                <%# DataBinder.Eval(Container.DataItem, ("Active")) %>
                            </td>--%>
                            <td>
                                <asp:Label ID="lblFeedbackText" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, ("FeedbackText")) %>'></asp:Label>
                            </td>
                            <td>
                                <%# DataBinder.Eval(Container.DataItem, ("Date")) %>
                            </td>
                            <td>
                                <asp:Button ID="btnReply" Text="Reply" runat="server" />
                            </td>

                            <%--<td>

                                <asp:Button ID="btnSelect" Text="Remove Feedback" runat="server" />

                            </td>--%>
                        </tr>

                    </ItemTemplate>

                    <FooterTemplate>
                        </tbody></table>
                    </FooterTemplate>
                </asp:Repeater>
                <br />
                <br />
                <div style="align-content: center; margin: auto">
                    <asp:Button ID="btnSelect" Text="Remove Feedback" runat="server" OnClick="btnSelect_Click" />
                </div>
                


            </div>
            <br />
            <%--<div class="row justify-content-center align-items-center text-center">
            <div class="col-md-2">
                <asp:Button ID="btnRemove" runat="server" class="btn btn-dark" Text="Remove" OnClick="btnRemove_Click" /></asp:Button>
                
            </div>
        </div>--%>
        </div>
        
        </div>
</asp:Content>

