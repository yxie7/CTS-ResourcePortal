<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="NewsletterCreate.aspx.cs" Inherits="CTS_ResourcePortal.NewsletterCreate" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

    <!---->
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel runat="server" ID="UpdatePanel" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="rpt" EventName="ItemCommand" />
        </Triggers>
        <ContentTemplate>--%>
    <!---->
    <div class="modal fade" id="TheModal" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content container">
                <div class="modal-body align-content-center  text-center">
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="section">
            <div class="row">
                <div class="col"></div>
                <h2 class="col-md-auto">Create a Newsletter</h2>
                <div class="col"></div>
            </div>
            <br />
            <div class="row d-flex justify-content-center">
                <div class="accordion col-10">
                    <asp:Label ID="lblResourceSelect" runat="server" Text="Select Resources Type: "></asp:Label>
                    <br />
                    <div class="row">
                        <div class="col"></div>
                        <asp:Button Text="ALL" ID="btnAll" runat="server" class="col-2 btn btn-primary m-2" OnClick="btnAll_Click" />
                        <asp:Button Text="Jobs" ID="btnJob" runat="server" class="col-2 btn btn-primary m-2" OnClick="btnJob_Click" />
                        <asp:Button Text="Events" ID="btnEvent" runat="server" class="col-2 btn btn-primary m-2" OnClick="btnEvent_Click" />
                        <asp:Button Text="Training" ID="btnTraining" runat="server" class="col-2 btn btn-primary m-2" OnClick="btnTraining_Click" />
                        <div class="col"></div>
                    </div>
                    <br />
                    <asp:Repeater runat="server" ID="rpt" OnItemCommand="rpt_ItemCommand">
                        <HeaderTemplate>
                            <table id="datatable" class="table  table-hover">
                                <thead>
                                    <tr>
                                        <th class="col-2 rth">Resource Title</th>
                                        <th class="col-5 rth">Comments</th>
                                        <th class="col-1 rth">Add</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td data-header="Resource Title:" class="rtd">
                                    <asp:Label ID="lblName" Text='<%# Eval("ResourceName") %>' runat="server" />
                                    <asp:HiddenField runat="server" ID="hfID" Value='<%# Eval("ResourcesID") %>' />
                                </td>
                                <td data-header="Comment:" class="rtd">
                                    <asp:TextBox runat="server" ID="txtComment" CssClass="form-control" TextMode="multiline" Rows="3" placeholder="(Optional) Enter comments, tips, or other information here..."></asp:TextBox>
                                </td>
                                <td class="rtd">
                                    <asp:Button ID="btnAdd" CssClass="btn btn-success" Text="Add" runat="server" OnClientClick="" UseSubmitBehavior="false" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody></table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <br />
        <div class="section">
            <div class="row d-flex justify-content-center">
                <div class="tableSelection col-10">
                    <label>Current Newsletter Items:</label><br />
                    <asp:GridView ID="Selections" CssClass="table table-hover" runat="server" AutoGenerateColumns="false" DataKeyNames="ResourceID" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="ResourceName" HeaderText="Resource Title" HeaderStyle-CssClass="col-2" />
                            <asp:BoundField DataField="Comment" HeaderText="Comment" HeaderStyle-CssClass="col-5" />
                            <asp:TemplateField HeaderStyle-CssClass="col-1" HeaderText="Remove">
                                <ItemTemplate>
                                    <asp:Button Text="Remove" runat="server" ID="btnRemove" CssClass="btn btn-danger" OnClick="btnRemove_Click" UseSubmitBehavior="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>No Selections</EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
            <hr />
            <div class="row d-flex justify-content-end">
                <div>
                    <asp:Button runat="server" class="btn btn-primary" Text="Preview Newsletter" ID="btnPreview" OnClick="btnPreview_Click"></asp:Button>
                </div>
                <div class="col-1"></div>
            </div>
        </div>
    </div>
    <!---->
    <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
    <!---->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="js" runat="server">
    <script type="text/javascript">
    </script>
</asp:Content>