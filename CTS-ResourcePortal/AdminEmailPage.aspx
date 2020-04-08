<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AdminEmailPage.aspx.cs" Inherits="CTS_ResourcePortal.AdminEmailPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content" style="margin-top: 55%; }">

                <h4 class="modal-title"></h4>

                <div class="modal-body" style="color: black">
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" ID="close" Text="Close" class="btn btn-danger" data-dismiss="modal" />
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="section">
            <h2>Edit Automated Email</h2>
            <div class="row justify-content-center">
                <div class="contact-form col-8">
                    <div class="">
                        <br />
                        <asp:DropDownList ID="DdlEmail" runat="server" class="form-control" name="lname" AutoPostBack="True" OnSelectedIndexChanged="DdlEmail_SelectedIndexChanged">
                            <asp:ListItem Enabled="true" Text="Type" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="Accept Citizen" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Reject Citizen" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">

                        <asp:TextBox ID="txtSubject" class="form-control" runat="server" placeholder="Subject"></asp:TextBox>
                    </div>

                    <div class="form-group">

                        <asp:TextBox ID="txtComment" class="form-control" Style="height: 150px;" Wrap="True" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>
                    <div class="row justify-content-start">
                        <asp:Button ID="btnCreate" runat="server" Text="Update" class="btn btn-success" OnClick="btnCreate_Click" CssClass="btn btn-primary btn-lg" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>