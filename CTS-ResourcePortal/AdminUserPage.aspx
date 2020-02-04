<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AdminUserPage.aspx.cs" Inherits="CTS_ResourcePortal.AdminUserPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
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

                                <asp:Button runat="server" ID="Accept1" Text="Accept" class="btn btn-mini" title="Search" OnClick="Accept1_Click"></asp:Button>
                                <asp:Button runat="server" ID="Reject1" Text="Reject" class="btn btn-mini" title="Search" OnClick="Reject1_Click"></asp:Button>
                            </td>
                        </tr>
                        <tr>

                            <td>Barack</td>
                            <td>Obama</td>
                            <td>obama@gmail.com</td>
                            <td>Pending</td>
                            <td>
                                <asp:Button runat="server" ID="Accept2" Text="Accept" class="btn btn-mini" title="Search" OnClick="Accept1_Click"></asp:Button>
                                <asp:Button runat="server" ID="Reject2" Text="Reject" class="btn btn-mini" title="Search" OnClick="Reject1_Click"></asp:Button>
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
        </div>
        <div class="section">

              <asp:GridView ID="grdAllAccounts" runat="server" AutoGenerateColumns="False" DataKeyNames="countryid"
             Width="623px" class="table table-striped">
            <Columns>
                <asp:TemplateField>
            <ItemTemplate>
                <asp:CheckBox ID="chkRow" runat="server" />
            </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Name" SortExpression="firstname">                  
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                    </EditItemTemplate>  
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("firstname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name" SortExpression="lastname">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("lastname") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("lastname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User Name" SortExpression="username">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("username") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Address" SortExpression="address">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>                
                 <asp:TemplateField HeaderText="Email" SortExpression="email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone" SortExpression="phone">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("phone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Resume">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkType" runat="server" Text="View" ></asp:LinkButton >
                    </ItemTemplate>                   
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

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