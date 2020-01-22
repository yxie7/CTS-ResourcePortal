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
                    <b>Username:</b>
                </div>
                <div class="col-md-auto">
                    <p>
                        <asp:TextBox ID="txtUsername" Placeholder="" runat="server"></asp:TextBox>
                    </p>
                </div>
                <div class="col"></div>
            </div>
            <br />
            <div class="row">
                <div class="col"></div>
                <div class="col-md-auto">
                    <b>Password:</b>
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
                    <a class="btn btn-large btn-info" href="ResourceList.aspx">Submit</a>
                </div>
            </div>
        </div>
        <br />
        <div class="section justify-content-center align-items-center  text-center">
            <div class="row">
                <div class="col"></div>
                <div class="col-md-auto">
                    <a href="ResourceList.aspx">Forgot Password?</a>
                </div>
                <div class="col"></div>
            </div>
            <hr />
            <div class="row ">
                <div class="col"></div>
                <div class="col-md-auto">
                    <p>Don't Have an account? <a href="Signup.aspx">Sign Up </a></p>
                </div>
                <div class="col"></div>
            </div>
        </div>
    </div>
</asp:Content>