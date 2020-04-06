<%@ Page Title="" Language="C#" MasterPageFile="~/Citizen.master" AutoEventWireup="true" CodeBehind="CitizenSettings.aspx.cs" Inherits="CTS_ResourcePortal.CitizenSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

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

    <div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog modal-xl">
            <!-- Modal content-->
            <div class="modal-content container">
                <div class="modal-body">

                    <br />
                    <div class="row  justify-content-center align-items-center text-center">
                        <div class="col"></div>
                        <div class="col-md-4">
                            <asp:Label runat="server" ID="lblStatus"></asp:Label>
                        </div>
                        <div class="col"></div>
                    </div>
                    <br />
                </div>
            </div>
        </div>
    </div>

    <link href="css.css" rel="stylesheet" />

    <div class="container">
        <div class="section">
            <div class="row">
                <div class="col"></div>
                <div class="col-md-4">
                    <h3>Account Settings</h3>
                </div>
                <div class="col"></div>
            </div>
            <br />
            <div class="row d-flex justify-content-center">
                <div class="col-1"></div>
                <asp:LinkButton ID="lnkBtnUpdateSubscriber" CssClass="buttonClass m-2 btn  btn-block btn-dark col" runat="server" OnClick="lnkBtnUpdateSubscriber_Click">Update Subscriber Status</asp:LinkButton>

                <asp:LinkButton ID="lnkBtnUpdatePassword" CssClass="buttonClass m-2 btn  btn-block btn-dark col" runat="server" OnClick="lnkBtnUpdatePassword_Click">Update Password</asp:LinkButton>

                <asp:LinkButton ID="lnkBtnUploadResume" CssClass="buttonClass m-2 btn   btn-block btn-dark col" runat="server" OnClick="lnkBtnUploadResume_Click">Upload Resume</asp:LinkButton>

                <asp:LinkButton ID="lnkBtnDeleteAccount" CssClass="buttonClass btn m-2 btn-block btn-dark col" runat="server" OnClick="lnkBtnDeleteAccount_Click">Deactivate Account</asp:LinkButton>
                <div class="col-1"></div>
            </div>
            <br />

            <!--Subscribe/Unsubscribe-->
            <div class="" visible="false" runat="server" id="UpdateSubscriber">
                <div class="row">
                    <div class="col"></div>
                    <div class="col-lg-3 d-flex justify-content-center">Subscribe to our newsletters?</div>
                    <div class="col-lg-3 d-flex justify-content-center">
                        <div class="row">
                            <div class="col-sm-6">
                                <asp:RadioButtonList ID="rdoSubscribe" runat="server" RepeatLayout="Flow" class="btn-group btn-group-toggle" data-toggle="buttons">                                    
                                    <asp:ListItem class="btn btn-outline-success" Value="Yes">Yes</asp:ListItem>
                                    <asp:ListItem class="btn btn-outline-danger" Value="No">No</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <asp:Label runat="server" Text="" ID="lblCitizenID" Visible="False"></asp:Label>
                    </div>
                    <div class="col"></div>
                </div>
                <br />
                <div class="row ">
                    <div class="col"></div>
                    <asp:Button runat="server" ID="btnUpdateSubscribe" CssClass="btn btn-primary" Text="Submit" OnClick="btnUpdateSubscribe_Click"></asp:Button>
                    <div class="col"></div>

                </div>
            </div>

            <!--UpdatePassword-->
            <div class="" visible="false" runat="server" id="UpdatePassword">
                <div class="row">
                    <div class="col-1"></div>
                    <div class="col-lg-10 form-group row d-flex justify-content-center">
                        <label for="currentPassword" class="col-form-label col-lg-4">Current Password</label>
                        <div class="col-lg-4">
                            <asp:TextBox runat="server" ID="txtCurrentPassword" required="true" class="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row">
                    <div class="col-1"></div>
                    <div class="col-lg-10 form-group row d-flex justify-content-center">
                        <label for="newPassword" class="col-form-label col-lg-4">New Password</label>
                        <div class="col-lg-4">
                            <asp:TextBox runat="server" ID="txtNewPassword" required="true" class="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row">
                    <div class="col-1"></div>
                    <div class="col-lg-10 form-group row d-flex justify-content-center">
                        <label for="confirmPassword" class="col-form-label col-lg-4">Confirm Password</label>
                        <div class="col-lg-4">
                            <asp:TextBox runat="server" ID="txtConfirmPassword" required="true" class="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-1"></div>
                </div>
                <br />
                <div class="row ">
                    <div class="col"></div>
                    <div class="col-6 d-flex justify-content-center">
                        <asp:Button runat="server" CssClass="btn btn-primary" ID="btnUpdatePassword" Text="Update Password" OnClick="btnUpdatePassword_Click" />
                    </div>
                    <div class="col"></div>
                </div>
            </div>

            <!--Upload More Resumes-->
            <div class="" visible="false" runat="server" id="UploadResume">

                <div class="row justify-content-center align-items-center">
                    <div class="col-lg-4 d-flex justify-content-center">
                        <asp:Label runat="server" ID="lblResume">Would you like to upload another resume?</asp:Label>
                    </div>
                </div>
                <br />
                <div class="row ">
                    <div class="col"></div>
                    <div class="col-6 d-flex justify-content-center">
                        <asp:FileUpload ID="ResumeUploadSettings" runat="server"/>
                    </div>
                    <div class="col"></div>
                </div>
                <br />
                <div class="row ">
                    <div class="col"></div>

                    <div class="col-md-auto">
                        <asp:Button runat="server" Text="Upload Resume" ID="ResumeUpload" class="btn btn-primary" OnClick="ResumeUpload_Click" />
                    </div>
                    <div class="col-md-auto">
                        <asp:Button runat="server" Text="View Resumes" ID="ResumeTable" class="btn btn-outline-primary" OnClick="ResumeTable_Click" />
                    </div>
                    <div class="col"></div>

                </div>
            </div>
            <div class="row ">
                <div class="col"></div>
                <div class="col-6 d-flex justify-content-center">
                    <!-- -->
                    <asp:Repeater ID="rptResumes" runat="server" Visible="false">
                        <HeaderTemplate>
                            <table id="datatable" class="table table-striped table-bordered" border="0" cellpadding="0"
                                cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Resume Name
                                        </th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lblName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, ("ResumeTitle")) %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" OnClick="lnkDelete_Click"></asp:LinkButton>
                                    <asp:LinkButton ID="lnkView" runat="server" Text="View" OnClick="lnkView_Click"></asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                            </tbody></table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <div class="col"></div>
            </div>

            <!--Delete Account-->
            <div class="" visible="false" runat="server" id="deleteAccount">
                <div class="row">
                    <div class="col"></div>
                    <div class="col-lg-auto row">
                        <label class="col-md-auto">Would you like to deactivate your account?   Type "yes" if you are sure. </label>
                        <div class="col-md-auto text-center">
                            <asp:TextBox runat="server" ID="txtConfirmDeactivate" Style="text-transform: lowercase;" required="true" class="form-control" onkeyup="this.value = this.value.toLowerCase();"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col"></div>
                </div>
                <br />
                <div class="row ">
                    <div class="col"></div>
                    <div class="col-6 d-flex justify-content-center">
                        <asp:Button Text="Deactivate" ID="btnDeactivate" runat="server" class="btn btn-primary" OnClick="btnDeactivate_Click" />
                    </div>
                    <div class="col"></div>
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