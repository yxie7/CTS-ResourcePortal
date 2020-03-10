<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AdminUserPage.aspx.cs" Inherits="CTS_ResourcePortal.AdminUserPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <!--<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>-->
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
  <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>-->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>



    <link href="AdminContent.css" rel="stylesheet" />
    <div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content" style="margin-top: 55%; }">

                <h4 class="modal-title"></h4>

                <div class="modal-body" style="color: black">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="container">

        <div class="section">
             <h2 class="col-md-auto">New Ctizens</h2>
            <div class="table-wrapper ">
            <asp:Repeater ID="rptNewCitizen" runat="server">
                    <HeaderTemplate>
                        <table id="datatable" class="table table-striped table-bordered" border="0" cellpadding="0"
                            cellspacing="0">
                            <thead>
                                <tr>
                                     <th>
                                        <asp:CheckBox ID="chkHeader" runat="server" /></th>
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
                                <asp:CheckBox ID="chkRow" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="lblfName" runat=server Text='<%# DataBinder.Eval(Container.DataItem, ("FirstName")) %>'></asp:Label>
                            </td>
                            <td>
                               <asp:Label ID="lblLName" runat="server" Text=' <%# DataBinder.Eval(Container.DataItem, ("LastName")) %>'></asp:Label>
                            </td>
                            <td>
                               <asp:Label ID="lblEmail" runat="server" Text=' <%# DataBinder.Eval(Container.DataItem, ("Email")) %>'></asp:Label>
                            </td>
                            
                        </tr>

                    </ItemTemplate>

                    <FooterTemplate>
                        </tbody>
                        </table>
                        <!--<div class="clearfix">
                    <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                    <ul class="pagination">
                        <li class="page-item disabled"><a href="#">Previous</a></li>
                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                        <li class="page-item active"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                    </ul>
                </div>-->
                    </FooterTemplate>
                </asp:Repeater>
                <br />
                <br />
                <div style="align-content:center">
                    <asp:Button ID="btnAccept" Text="Accept" runat="server" OnClick="btnAccept_Click" />
                    <asp:Button ID="btnReject" Text="Reject" runat="server" OnClick="btnReject_Click"/>
                </div>
                </div>			
                </div>

        <!-------------------------------------------------------------------------------------------->

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
                                <asp:LinkButton ID="lnkType" runat="server" Text="View" OnClick="lnkView_Click"></asp:LinkButton >
                            </td>
                        </tr>

                    </ItemTemplate>

                    <FooterTemplate>
                        </tbody>
                        </table>
                        <!--<div class="clearfix">
                    <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                    <ul class="pagination">
                        <li class="page-item disabled"><a href="#">Previous</a></li>
                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                        <li class="page-item active"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                    </ul>
                </div>-->
                    </FooterTemplate>
                </asp:Repeater>
                </div>			
        </div>
        <br />
    </div>

     <!--<div class="section">
            <div class="row">
                <div class="col"></div>
                <h2 class="col-md-auto">New Citizen Accounts</h2>
                <div class="col"></div>
            </div>

            <div class="table-wrapper ">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Tyreak</td>
                            <td>Allen</td>
                            <td>tyreak.allen@gmail.com</td>
                            <td>Pending</td>
                            <td>

                                
                            </td>
                        </tr>
                        <tr>

                            <td>Barack</td>
                            <td>Obama</td>
                            <td>obama@gmail.com</td>
                            <td>Pending</td>
                            <td>
                                
                            </td>
                        </tr>
                        <tr>

                            <td>Cookie</td>
                            <td>Monster</td>
                            <td>cookie@gmail.com</td>
                            <td style="color: red">Rejected</td>
                            <td>
                                <%--<asp:Button runat="server" id="Accept3" Text="Accept" class="btn btn-mini" title="Search" OnClick="Accept1_Click"></asp:Button>
                           <asp:Button runat="server" id="Reject3" Text="Reject" class="btn btn-mini" title="Search" OnClick="Reject1_Click"></asp:Button>--%>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="clearfix">
                    <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                    <ul class="pagination">
                        <li class="page-item disabled"><a href="#">Previous</a></li>
                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                        <li class="page-item active"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                    </ul>
                </div>
            </div>
        </div>-->

     <!--<asp:GridView ID="grdAllAccounts" runat="server" AutoGenerateColumns="False"
             Width="623px" class="table table-striped">
            <Columns>
                <asp:TemplateField>
            <ItemTemplate>
                <asp:CheckBox ID="chkRow" runat="server" />
            </ItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField DataField="Firstname" HeaderText="First Name" />

                <asp:BoundField DataField="Lastname" HeaderText="Last Name" />

                <asp:BoundField DataField="Username" HeaderText="Username" />

                <asp:BoundField DataField="Address" HeaderText="Address" />

                <asp:BoundField DataField="Email" HeaderText="Email" />

                <asp:BoundField DataField="Cellphone" HeaderText="Cellphone" />

                <asp:TemplateField HeaderText="Resume">

                    <ItemTemplate>
                        <asp:LinkButton ID="lnkType" runat="server" Text="View" OnClick="lnkView_Click"></asp:LinkButton >
                    </ItemTemplate>                   
                </asp:TemplateField>
            </Columns>
        </asp:GridView>-->

            <!--<div class="row">
                <div class="col"></div>
                <h2 class="col-md-auto">All Citizens</h2>
                <div class="col"></div>


            </div>
            <div class="table-wrapper">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <td></td>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>User Name</th>
                            <th>Address</th>                           
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Resume</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td>Isabella</td>
                            <td>Christensen</td>
                            <td>IsabellaC</td>
                            <td>2244 N Glenwood ST, Philadelphia, PA, 19133</td>
                            <td>isabella@gmail.com</td>
                            <td>(171) 555-2222</td>
                            <td><asp:LinkButton runat="server" ID="lnkView" Text="View" OnClick="lnkView_Click"></asp:LinkButton></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td>Don Quixote</td>
                            <td>Quixote</td>
                            <td>DQuixote</td>
                            <td>1122 E Main ST, Philadelphia, PA, 19133
                            <td>don.ouixote@gmail.com</td>
                            <td>(313) 555-5735</td>
                            <td><asp:LinkButton runat="server" Text="View"></asp:LinkButton></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td>John</td>
                            <td>Doe</td>
                            <td>JDoe</td>
                            <td>4622 W Germantown ST, Philadelphia, PA, 19133
                            <td>john.doe@gmail.com</td>
                            <td>(503) 555-9931</td>
                            <td>N/A</td>
                        </tr>
                    </tbody>
                </table>
                <div class="clearfix">
                    <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                    <ul class="pagination">
                        <li class="page-item disabled"><a href="#">Previous</a></li>
                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                        <li class="page-item active"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                    </ul>
                </div>
            </div>-->		

    <script type="text/javascript">
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }
    </script>
    
</asp:Content>