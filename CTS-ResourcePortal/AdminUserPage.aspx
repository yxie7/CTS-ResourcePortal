<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AdminUserPage.aspx.cs" Inherits="CTS_ResourcePortal.AdminUserPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content" style="margin-top: 55%; }">

                <h4 class="modal-title"></h4>

                <div class="modal-body" style="color: black">
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" ID="close" class="btn btn-danger" data-dismiss="modal" />
                    <asp:Button runat="server" ID="no" class="btn btn-danger" data-dismiss="modal" UseSubmitBehavior="false" OnClick="no_Click" />
                    <asp:Button runat="server" ID="yes" class="btn btn-success" data-dismiss="modal" UseSubmitBehavior="false" OnClick="yes_Click" />
                    <asp:Button runat="server" ID="yesAccept" class="btn btn-success" data-dismiss="modal" UseSubmitBehavior="false" OnClick="yesAccept_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="section">
            <h2 class="col-md-auto">New Citizen Accounts</h2>
            <br />
            <div class="table-wrapper row justify-content-center">
                <div class="col-10">
                    <asp:Repeater ID="rptNewCitizen" runat="server">
                        <HeaderTemplate>
                            <table id="datatable" class="table  table-bordered" 
                                >
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
                                    <asp:Label ID="lblfName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, ("FirstName")) %>'></asp:Label>
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
                        <div style="align-content: center">
                            <asp:Button ID="btnAccept" Text="Accept" runat="server" OnClick="btnAccept_Click" CssClass="btn btn-success btn-md" />
                            <asp:Button ID="btnReject" Text="Reject" runat="server" OnClick="btnReject_Click" CssClass="btn btn-danger btn-md" />
                        </div>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <br />
        <!--------------------------------------Already accepted citizens------------------------------------------------------>
        <div class="section">
            <h2 class="col-md-auto">All Citizens</h2>
            <div class="table-wrapper row justify-content-center">
                <div class="col-10">
                    <asp:Repeater ID="rptManageR" runat="server">
                        <HeaderTemplate>
                            <table id="datatable" class="table  table-bordered" 
                                >
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
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lblfName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, ("FirstName")) %>'></asp:Label>
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
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                            </tbody>
                        </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <br />
        <!---------------------------------------- Resume Table ----------------------------------------------->
        <div class="section">
            <h2 class="col-md-auto">Resumes</h2>
            <div class="table-wrapper row justify-content-center">
                <div class="col-10">
                    <asp:Repeater ID="rptResumes" runat="server">
                        <HeaderTemplate>
                            <table id="datatable" class="table  table-bordered" 
                                >
                                <thead>
                                    <tr>

                                        <th>Email
                                        </th>
                                        <th>Resume
                                        </th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, ("Email")) %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblResume" runat="server" Text=' <%# DataBinder.Eval(Container.DataItem, ("ResumeTitle")) %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:LinkButton ID="lnkType" runat="server" class="btn btn-large btn-primary" Text="View" OnClick="lnkView_Click"></asp:LinkButton>
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
        </div>
    </div>
</asp:Content>