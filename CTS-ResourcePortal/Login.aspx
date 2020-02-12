<%@ Page Title="" Language="C#" MasterPageFile="~/Guest.master" AutoEventWireup="true" CodeBehind="MobileLogin.aspx.cs" Inherits="CTS_ResourcePortal.MobileLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <link href="css.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <div class="container">
        <div class="row" id="h2">
            <div class="col"></div>
            <div class="col-md-auto">
                <h2>Sign In</h2>
            </div>
            <div class="col"></div>
        </div>

        <br />
        <div class="section">
            <br />
            <div class="row">
                <div class="col"></div>
                <div class="col-md-auto">
                    <asp:Label runat="server" Font-Bold="true">Email:</asp:Label>
                </div>
                <div class="col-md-auto">
                    <p>
                        <asp:TextBox ID="txtEmail" Placeholder="" runat="server"></asp:TextBox>
                    </p>
                </div>
                <div class="col"></div>
            </div>
            <br />
            <div class="row">
                <div class="col"></div>
                <div class="col-md-auto">
                    <asp:Label runat="server" Font-Bold="true">Password:</asp:Label>
                </div>
                <div class="col-md-auto">
                    <p>
                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
                    </p>
                </div>
                <div class="col"></div>
            </div>

            <div class="row justify-content-center align-items-center  text-center">
                <div class="col-md-4">
                    <asp:Button runat="server" ID="btnSubmitLogin" Text="Submit" class="btn btn-large btn-info" OnClick="btnSubmitLogin_Click"/>
                </div>
            </div>
        </div>
        <br />
        <div class="section justify-content-center align-items-center  text-center">
            <div class="row">
                <div class="col"></div>
                <div class="col-md-auto">
                    <asp:LinkButton runat="server" ID="btnForgotPassword" Text="Forgot Password?" OnClick="btnForgotPassword_Click"></asp:LinkButton>
                </div>
                <div class="col"></div>
            </div>
            <hr />
            <div class="row ">
                <div class="col"></div>
                <div class="col-md-auto">
                    <asp:Label runat="server" ID="lblError" Visible="false"></asp:Label>
                    <br />
                    <asp:Label runat="server" ID="UserRegistrationError" Visible="false"></asp:Label> 
                    <p>Don't Have an account? <asp:LinkButton runat="server" ID="btnSignUpLogin" Text="Sign Up" OnClick="btnSignUpLogin_Click"></asp:LinkButton></p>
                </div>
                <div class="col"></div>
            </div>
        </div>
    </div>
</asp:Content>