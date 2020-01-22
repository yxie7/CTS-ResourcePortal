<%@ Page Title="" Language="C#" MasterPageFile="~/Citizen.master" AutoEventWireup="true" CodeBehind="CitizenSettings.aspx.cs" Inherits="CTS_ResourcePortal.CitizenSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
        <div class="section">
            <br />
            <div class="row justify-content-center align-items-center">
                <div class="col"></div>
                <div class="col-lg-3 d-flex justify-content-center">Subscribe to our newsletters?</div>
                <div class="col-lg-3 d-flex justify-content-center">
                    <asp:RadioButtonList runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Yes" Value="Yes" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="col"></div>
            </div>
            <hr />
            <br />
            <div class="row">
                <div class="col-1"></div>
                <div class="col-lg-10 form-group row d-flex justify-content-center">
                    <label for="currentPassword" class="col-form-label col-lg-4">Current Password</label>
                    <div class="col-lg-4">
                        <asp:TextBox runat="server" ID="currentPassword" required="true" class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-lg-10 form-group row d-flex justify-content-center">
                    <label for="newPassword" class="col-form-label col-lg-4">New Password</label>
                    <div class="col-lg-4">
                        <asp:TextBox runat="server" ID="newPassword" required="true" class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-lg-10 form-group row d-flex justify-content-center">
                    <label for="confirmPassword" class="col-form-label col-lg-4">Confirm Password</label>
                    <div class="col-lg-4">
                        <asp:TextBox runat="server" ID="confirmPassword" required="true" class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
            <br />
            <div class="row ">
                <div class="col"></div>
                <div class="col-6 d-flex justify-content-center">
                    <asp:Button runat="server" CssClass="btn btn-light" ID="btnChange" Text="Update Password" />
                </div>
                <div class="col"></div>
            </div>
            <br />
        </div>
        <br />
        <div class="section">
            <br />
            <div class="row">
                <div class="col"></div>
                <div class="col-lg-auto row">
                    <label class="col-md-auto">Would you like to delete your account?</label>
                    <div class="col-md-auto text-center">
                        <asp:Button Text="Delete" runat="server" class="btn btn-light" OnClick="Unnamed_Click"/>
                    </div>
                </div>
                <div class="col"></div>
            </div>
            <br />
        </div>
        <br />
    </div>
</asp:Content>