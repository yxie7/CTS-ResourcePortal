<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="ViewFeedback.aspx.cs" Inherits="CTS_ResourcePortal.ViewFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <link href="css.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/popper.js"></script>
    <script src="Scripts/bootstrap.js"></script>

    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }
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
    <div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content container" style="margin-top: 55%; }">
                <h4 class="modal-title"></h4>
                <div class="modal-body">
                </div>
                <div class="modal-msg">
                    <form action="">
                        <textarea id="txtReply" name="myTextBox" runat="server" cols="68" rows="8"> Enter some text...
                            </textarea>
                        <br />
                        
                    </form>
                </div>
                <div class="modal-footer">
                    <%--<button type="button" class="btn btn-danger" data-dismiss="modal">
                        Close</button>--%>
                    <asp:Button ID="btnReplySubmit" runat="server" Text="Submit" OnClick="btnReplySubmit_Click" />
                </div>
            </div>
        </div>
    </div>
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
                <asp:Button ID="btnAllResources" runat="server" Text="View All Feedback" OnClick="btnAllResources_Click" />

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
                                <%--<%# DataBinder.Eval(Container.DataItem, ("ResourceName")) %>--%>
                            </td>
                            <td>
                                <asp:Label ID="lblFeedbackText" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, ("FeedbackText")) %>'></asp:Label>
                                <%--<%# DataBinder.Eval(Container.DataItem, ("FeedbackText")) %>--%>
                            </td>
                            <td>
                                <%# DataBinder.Eval(Container.DataItem, ("Date")) %>
                            </td>
                            <td>

                                <asp:Button ID="btnReply" runat="server" Text="Reply" OnClick="btnReply_Click" />
                            </td>
                        </tr>
                    </ItemTemplate>

                    <FooterTemplate>
                        </tbody></table>
                    </FooterTemplate>
                </asp:Repeater>
                <br />
                <br />
                <div style="align-content: center; margin: auto">
                    <asp:Button ID="btnRemove" Text="Remove Feedback" runat="server" OnClick="btnSelect_Click" />
                </div>
            </div>
            <br />
        </div>
    </div>
</asp:Content>
