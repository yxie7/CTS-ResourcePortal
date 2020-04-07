<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AdminEmailPage.aspx.cs" Inherits="CTS_ResourcePortal.AdminEmailPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <link href="AdminEmailPage.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

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
            <div class="row">
                <div class="col-md-12">
                    <div class="contact-form">

                        <div class="form-group">

                            <div class="col-sm-10">
                                <asp:DropDownList ID="DdlEmail" runat="server" class="form-control" name="lname" AutoPostBack="True" OnSelectedIndexChanged="DdlEmail_SelectedIndexChanged">
                                    <asp:ListItem Enabled="true" Text="Type" Value="-1"></asp:ListItem>
                                    <asp:ListItem Text="Accept Citizen" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Reject Citizen" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group">

                            <div class="col-sm-10">
                                <asp:TextBox ID="txtSubject" class="form-control" runat="server" placeholder="Subject"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">

                            <div class="col-lg-10">

                                <asp:TextBox ID="txtComment" class="form-control" Style="height: 150px;" Wrap="True" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row justify-content-start align-items-center">
                            <div class="col-md-2">
                                <asp:Button ID="btnCreate" runat="server" Text="Update" class="btn btn-success" OnClick="btnCreate_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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