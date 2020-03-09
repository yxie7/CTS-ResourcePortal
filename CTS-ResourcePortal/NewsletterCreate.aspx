﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="NewsletterCreate.aspx.cs" Inherits="CTS_ResourcePortal.NewsletterCreate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <link href="css.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/popper.js"></script>
    <script src="Scripts/bootstrap.js"></script>

    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
        function toasted() {
            $('.toast').toast('show');
            alert("No selections were made... You can't continue!");
        }

        $(function () {
            bindDataTable(); // bind data table on first page load
            // bind data table on every UpdatePanel refresh
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDataTable);
        });

        function bindDataTable() {
            $('[id*=datatable]').DataTable({
            });
            $('#<%= Selections.ClientID %>').DataTable({
                "bFilter": false,
                "bLengthChange": false,
                stateSave: true,
                rowReorder: true
            });
        }
        <%--$(document).ready(function () {
            $('[id*=datatable]').DataTable({
            });
            $('#<%= Selections.ClientID %>').DataTable({
                "bFilter": false,
                "bLengthChange": false,
                stateSave: true,
                rowReorder: true
            });
        });--%>
</script>
    <!---->
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel runat="server" ID="UpdatePanel" UpdateMode="Conditional" ChildrenAsTriggers="true" >
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="rpt" EventName="ItemCommand" />
        </Triggers>
        <ContentTemplate>--%>
            <!---->
            <div class="container">
                <div class="toast" role="alert" data-delay="5000" data-autohide="true">
                    <div id="toastMessage" class="toast-body">
                        Hello, world! This is a toast message.
                    </div>
                </div>
                <div class="row">
                    <div class="col"></div>
                    <h2 class="col-md-auto">Create a Newsletter</h2>
                    <div class="col"></div>
                </div>
                <br />
                <div class="section">
                    <br />
                    <div class="row d-flex justify-content-center">
                        <div class="accordion col-10">
                            <br />
                            <asp:Label ID="lblResourceSelect" runat="server" Text="Select Resources Type: "></asp:Label>

                            <br />

                            <div class="row">
                                <div class="col"></div>
                                <asp:Button Text="ALL" ID="btnAll" runat="server" class="col-2 btn btn-dark m-2" OnClick="btnAll_Click" />
                                <asp:Button Text="Jobs" ID="btnJob" runat="server" class="col-2 btn btn-dark m-2" OnClick="btnJob_Click" />
                                <asp:Button Text="Events" ID="btnEvent" runat="server" class="col-2 btn btn-dark m-2" OnClick="btnEvent_Click" />
                                <asp:Button Text="Training" ID="btnTraining" runat="server" class="col-2 btn btn-dark m-2" OnClick="btnTraining_Click" />
                                <div class="col"></div>
                            </div>
                            <br />
                            <asp:Repeater runat="server" ID="rpt" OnItemCommand="rpt_ItemCommand">
                                <HeaderTemplate>
                                    <table id="datatable" class="table">
                                        <thead>
                                            <tr>
                                                <th>Resource Title</th>
                                                <th>Comments</th>
                                                <th>Add</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblName" Text='<%# Eval("ResourceName") %>' runat="server" />
                                            <asp:HiddenField runat="server" ID="hfID" Value='<%# Eval("ResourcesID") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtComment" TextMode="multiline" Columns="50" Rows="3" placeholder="Enter comments, tips, or other information you would like to give to citizens here..."></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Button ID="btnAdd" Text="Add" runat="server"/>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </tbody></table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <br />

                    <div class="row d-flex justify-content-center">
                        <div class="tableSelection col-10">
                            <label>Current Newsletter Items:</label><br />
                            <asp:GridView ID="Selections" class="dataTable" runat="server" AutoGenerateColumns="false" DataKeyNames="ResourceID">
                                <Columns>
                                    <asp:BoundField DataField="ResourceName" HeaderText="Resource Title" />
                                    <asp:BoundField DataField="Comment" HeaderText="Comment" />
                                </Columns>
                                <EmptyDataTemplate>No Selections</EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                    <br />
                    <div class="row justify-content-end align-items-end">
                        <div class="col-md-auto">
                            <asp:Button runat="server" class="btn btn-dark" Text="Preview Newsletter" ID="btnPreview"></asp:Button>
                        </div>
                        <div class="col-1"></div>
                    </div>
                    <br />
                </div>
            </div>
            <!---->
        <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
    <!---->
</asp:Content>