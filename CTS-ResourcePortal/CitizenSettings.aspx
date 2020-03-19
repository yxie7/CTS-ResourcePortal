<%@ Page Title="" Language="C#" MasterPageFile="~/Citizen.master" AutoEventWireup="true" CodeBehind="CitizenSettings.aspx.cs" Inherits="CTS_ResourcePortal.CitizenSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

   
    <div id="MyPopup" class="modal" role="dialog">
        <div class="modal-dialog modal-xl">
            <!-- Modal content-->
            <div class="modal-content container">
                <div class="modal-body">

                    <br />
                    <div class="row  justify-content-center align-items-center text-center">
                        <div class="col"></div>
                        <div class="col-md-4">
                          <asp:Label runat="server" ID="lblStatus" Visible="false"></asp:Label>
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
            <asp:LinkButton ID="lnkBtnUpdateSubscriber" CssClass="buttonClass m-2 btn  btn-block btn-light col" runat="server" OnClick="lnkBtnUpdateSubscriber_Click">Update Subscriber Status</asp:LinkButton>

            <asp:LinkButton ID="lnkBtnUpdatePassword" CssClass="buttonClass m-2 btn  btn-block btn-light col" runat="server" OnClick="lnkBtnUpdatePassword_Click">Update Password</asp:LinkButton>

            <asp:LinkButton ID="lnkBtnUploadResume" CssClass="buttonClass m-2 btn   btn-block btn-light col" runat="server" OnClick="lnkBtnUploadResume_Click">Upload Resume</asp:LinkButton>

            <asp:LinkButton ID="lnkBtnDeleteAccount" CssClass="buttonClass btn m-2 btn-block btn-light col" runat="server" OnClick="lnkBtnDeleteAccount_Click">Delete Account</asp:LinkButton>
            <div class="col-1"></div>
        </div>
        <br />
        <div class="section">
            <div class="section" visible="false" runat="server" id="UpdateSubscriber">
                <div class="row">
                    <div class="col"></div>
                    <div class="col-lg-3 d-flex justify-content-center">Subscribe to our newsletters?</div>
                    <div class="col-lg-3 d-flex justify-content-center">
                        <div class="row">
                            <div class="col-sm-6">
                                <asp:RadioButtonList ID="rdoSubscribe" runat="server" RepeatLayout="Flow">
                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                    <asp:ListItem Value="No">No</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <asp:Label runat="server" Text="" ID="lblCitizenID" Visible="False"></asp:Label>

                        <div class="form-group">
                            <asp:Button runat="server" ID="btnUpdateSubscribe" class="btn btn-success" Text="Submit" OnClick="btnUpdateSubscribe_Click"></asp:Button>
                        </div>
                    </div>
                    <div class="col"></div>
                </div>
            </div>
            <div class="section" visible="false" runat="server" id="UpdatePassword">
                <div class="row">
                    <div class="col-1"></div>
                    <div class="col-lg-10 form-group row d-flex justify-content-center">
                        <label for="currentPassword" class="col-form-label col-lg-4">Current Password</label>
                        <div class="col-lg-4">
                            <asp:TextBox runat="server" ID="txtCurrentPassword" required="true" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row">
                    <div class="col-1"></div>
                    <div class="col-lg-10 form-group row d-flex justify-content-center">
                        <label for="newPassword" class="col-form-label col-lg-4">New Password</label>
                        <div class="col-lg-4">
                            <asp:TextBox runat="server" ID="txtNewPassword" required="true" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row">
                    <div class="col-1"></div>
                    <div class="col-lg-10 form-group row d-flex justify-content-center">
                        <label for="confirmPassword" class="col-form-label col-lg-4">Confirm Password</label>
                        <div class="col-lg-4">
                            <asp:TextBox runat="server" ID="txtConfirmPassword" required="true" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-1"></div>
                </div>
                <br />
                <div class="row ">
                    <div class="col"></div>
                    <div class="col-6 d-flex justify-content-center">
                        <asp:Button runat="server" CssClass="btn btn-light" ID="btnUpdatePassword" Text="Update Password" />
                    </div>
                    <div class="col"></div>
                </div>
            </div>

            <div class="section" visible="false" runat="server" id="UploadResume">

                <div class="row justify-content-center align-items-center">
                    <div class="col-lg-4 d-flex justify-content-center">
                        <asp:Label runat="server" ID="lblResume">Would you like to load/reupload resume?</asp:Label>
                    </div>
                </div>
                <br />
                <div class="row ">
                    <div class="col"></div>
                    <div class="col-6 d-flex justify-content-center">
                        <asp:FileUpload ID="ResumeUploadSettings" runat="server" />
                    </div>
                    <div class="col"></div>
                </div>
                <br />
                <div class="row ">
                    <div class="col"></div>
                    <div class="col-6 d-flex justify-content-center">
                        <asp:Button runat="server" Text="Upload Resume" ID="ResumeUpload" class="btn btn-light" OnClick="ResumeUpload_Click" />
                    </div>
                    <div class="col"></div>
                </div>
            </div>
            <div class="row ">
                <div class="col"></div>
                <div class="col-6 d-flex justify-content-center">
               </div>
                <div class="col"></div>
            </div>
            <div class="section" visible="false" runat="server" id="deleteAccount">
                <div class="row">
                    <div class="col"></div>
                    <div class="col-lg-auto row">
                        <label class="col-md-auto">Would you like to delete your account?</label>
                        <div class="col-md-auto text-center">
                            <asp:Button Text="Delete" runat="server" class="btn btn-light" OnClick="Delete_Click" />
                        </div>
                    </div>
                    <div class="col"></div>
                </div>
            </div>
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