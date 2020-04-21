<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="ManageR.aspx.cs" Inherits="CTS_ResourcePortal.ManageR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div id="MyPopup" class="modal fade" role="dialog">
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

    <div id="MyPopup1" class="modal fade" role="dialog">
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

    <div id="MyPopup2" class="modal fade" role="dialog">
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

    <div id="MyPopup3" class="modal fade" role="dialog">
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
            <h2>Manage Resources</h2>
            <div class="row d-flex justify-content-center">
                <div class="accordion col-10" id="resources">
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
                <asp:Button ID="btnViewR" runat="server" OnClick="btnViewR_Click" Text="View" CssClass="btn btn-primary btn-sm" />
                    &nbsp
                <asp:Button ID="btnAllResources" runat="server" OnClick="btnAllResources_Click" Text="View All Resources" CssClass="btn btn-primary btn-sm" />

                    <br />
                    <br />
                    <asp:Repeater ID="rptManageR" runat="server" OnItemCommand="rptManageR_ItemCommand">
                        <HeaderTemplate>
                            <table id="datatable" class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>
                                            <asp:CheckBox ID="chkHeader" runat="server" /></th>
                                        <th style="display:none">ID
                                        </th>
                                        <th>Resource Title
                                        </th>
                                        <th style="display:none">Resource Type ID
                                        </th>
                                        <th>Current Status
                                        </th>
                                        <th>Address
                                        </th>
                                        <th>City
                                        </th>
                                        <th>Date Posted
                                        </th>
                                        <th>Edit Resource</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chkRow" runat="server" /></td>
                                <td style="display:none">
                                    <asp:Label runat="server" ID="lblResID" Text='<%# DataBinder.Eval(Container.DataItem, ("ResourcesID")) %>' Visible="false" > </asp:Label>
                                </td>
                                <td>
                                    <%# DataBinder.Eval(Container.DataItem, ("ResourceName")) %>
                                </td>
                                <td style="display:none">
                                    <asp:Label runat="server" ID="lblResTypeID" Text='<%# DataBinder.Eval(Container.DataItem, ("ResourceTypeID")) %>' Visible="false"> </asp:Label>
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
                                    <%# DataBinder.Eval(Container.DataItem, "StartDate", "{0:MM/dd/yyyy}") %>
                                   
                                </td>
                                <td>
                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary btn-md" />
                                </td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                            </tbody></table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <br />
                    <div class="row justify-content-center align-items-center">
                        <div class="col-md-2">
                            <asp:Button ID="btnActivate" runat="server" Text="Activate Resource(s)" OnClick="btnActivate_Click" CssClass="btn btn-primary btn-md" />
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-2">
                            <asp:Button ID="btnInactivate" Text="Inactivate Resource(s)" runat="server" OnClick="btnInactivate_Click" CssClass="btn btn-primary btn-md" />
                        </div>
                        <div class="col-md-1"></div>
                        <%--<div class="col-md-2">
                            <asp:Button ID="btnEdit" Text="Edit Resource" runat="server" OnClick="btnEdit_Click" CssClass="btn btn-primary btn-md" />
                        </div>--%>
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
</asp:Content>