﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Guest.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CTS_ResourcePortal.MobileLogin" %>

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
                            <asp:Label runat="server" ID="lblError" Font-Bold="True"></asp:Label>
                        </div>
                        <div class="col"></div>
                    </div>
                    <br />
                </div>
            </div>
        </div>
    </div>

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" />

    <div class="container">
        <div class="section">
            <div class="row" id="h2">
                <div class="col"></div>
                <div class="col-md-auto">
                    <h2>Sign In</h2>
                </div>
                <div class="col"></div>
            </div>

            <br />
            <div class="row">
                <div class="col"></div>
                <div class="col-sm-6">
                    <label>Email:</label>
                    <asp:TextBox ID="txtEmail" required="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col"></div>
            </div>
            <br />
            <div class="row">
                <div class="col"></div>

                <div class="col-sm-6">
                    <label>Password:</label>
                    <asp:TextBox ID="txtPassword" required="true" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                    <br>

                    <br>
                </div>
                <div class="col"></div>
            </div>

            <div class="row justify-content-center align-items-center  text-center">
                <div class="col-md-4">
                    <asp:Button runat="server" ID="btnSubmitLogin" Text="Submit" class="btn btn-large btn-primary" OnClick="btnSubmitLogin_Click" />
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
                    <p>Don't Have an account?
                        <asp:LinkButton runat="server" ID="btnSignUpLogin" Text="Sign Up" OnClick="btnSignUpLogin_Click"></asp:LinkButton></p>
                </div>
                <div class="col"></div>
            </div>
        </div>
    </div>
</asp:Content>