<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AdminUserPage.aspx.cs" Inherits="CTS_ResourcePortal.AdminUserPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%-- /*************************************************Stuff to make Data tables work*******************************/--%>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('[id*=datatable]').DataTable({
         
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

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <link href="AdminContent.css" rel="stylesheet" />
    <div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content" style="margin-top: 55%; }">

                <h4 class="modal-title"></h4>

                <div class="modal-body" style="color: black">
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" ID="close" class="btn btn-danger" data-dismiss="modal"/>
                    <asp:Button runat="server" ID="no" class="btn btn-danger" data-dismiss="modal" UseSubmitBehavior="false" OnClick="no_Click"/>
                    <asp:Button runat="server" ID="yes" class="btn btn-success" data-dismiss="modal" UseSubmitBehavior="false" OnClick="yes_Click" />
                    <asp:Button runat="server" ID="yesAccept" class="btn btn-success" data-dismiss="modal" UseSubmitBehavior="false" OnClick="yesAccept_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="section">
            <div class="row">
                
                <h2 class="col-md-auto" style="margin:auto">New Citizen Accounts</h2>
                
            </div>

            <div class="table-wrapper ">
            <asp:Repeater ID="rptNewCitizen" runat="server">
                    <HeaderTemplate>
                        <table id="datatable" class="table table-striped table-bordered" border="0" cellpadding="0"
                            cellspacing="0">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>First Name
                                    </th>
                                    <th>Last Name
                                    </th>
                                    <th>Email
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>

                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:CheckBox runat="server" ID="chkRow" />
                            </td>
                            <td>
                                <asp:Label ID="lblfName" runat=server Text='<%# DataBinder.Eval(Container.DataItem, ("FirstName")) %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblLName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, ("LastName")) %>'></asp:Label>
                            </td>
                            <td>
                                 <asp:Label ID="lblEmail" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, ("Email")) %>'></asp:Label>
                            </td>
                            
                        </tr>

                    </ItemTemplate>

                    <FooterTemplate>
                        </tbody></table>
                        <div style="align-content:center">
                    <asp:Button ID="btnAccept" Text="Accept" runat="server" OnClick="btnAccept_Click" />
                    <asp:Button ID="btnReject" Text="Reject" runat="server" OnClick="btnReject_Click"  />
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
                </div>
                <br />
                <br />
                
                
            

        <!--------------------------------------Another table------------------------------------------------------>
        <div class="section">
             <h2 class="col-md-auto">All Citizens</h2>
            <div class="table-wrapper ">
            <asp:Repeater ID="rptManageR" runat="server">
                    <HeaderTemplate>
                        <table id="datatable" class="table table-striped table-bordered" border="0" cellpadding="0"
                            cellspacing="0">
                            <thead>
                                <tr>

                                    <th>First Name
                                    </th>
                                    <th>Last Name
                                    </th>
                                    <th>Email
                                    </th>
                                    <th>Phone Number
                                    </th>
                                     <th>Address
                                    </th>
                                    <th>Resume
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>

                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="lblfName" runat=server Text='<%# DataBinder.Eval(Container.DataItem, ("FirstName")) %>'></asp:Label>
                            </td>
                            <td>
                               <asp:Label ID="lblLName" runat="server" Text=' <%# DataBinder.Eval(Container.DataItem, ("LastName")) %>'></asp:Label>
                            </td>
                            <td>
                               <asp:Label ID="lblEmail" runat="server" Text=' <%# DataBinder.Eval(Container.DataItem, ("Email")) %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblPhone" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, ("PhoneNumber")) %>'></asp:Label>
                            </td>
                             <td>
                                <asp:Label ID="lblAddress" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, ("Address")) %>'></asp:Label>
                                 <asp:Label ID="lblCity" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, ("City")) %>'></asp:Label>
                                 <asp:Label ID="lblState" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, ("State")) %>'></asp:Label>
                                 <asp:Label ID="lblZip" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, ("Zipcode")) %>'></asp:Label>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkType" runat="server" Text="View" OnClick="lnkView_Click" Visible="false"></asp:LinkButton >
                            </td>
                        </tr>

                    </ItemTemplate>

                    <FooterTemplate>
                        </tbody>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
				
                </div>
        </div>
        <br />
    </div>
        </div>

    <script type="text/javascript">
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }
    </script>
</asp:Content>