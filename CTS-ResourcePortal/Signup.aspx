<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="CTS_ResourcePortal.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navli" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
<div class="container">
    <div id="cover">
        <div id="cover-caption">
            <div id="Container" class="Container">
                <div id="border">

                    <div class="row text-black">
                        <div class="col-sm-6 offset-sm-3 text-center">
                            <h2 class="display-4" id="h2">Create an Account</h2>

                            <br />
                            <div class="info-form">
                                <form action="" class="form-inline justify-content-center">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label>First Name</label>
                                                 <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-6">
                                                <label>Last Name</label>
                                               <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label>Email Address:</label>

                                            </div>
                                            <div class="col-sm-6">

                                               <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label>Street Address:</label>

                                            </div>
                                            <div class="col-sm-6">

                                                <input type="text" class="form-control">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label>City:</label>

                                            </div>
                                            <div class="col-sm-6">

                                                <input type="text" class="form-control">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label>State</label>
                                                <input type="text" class="form-control">
                                            </div>
                                            <div class="col-sm-6">
                                                <label>Zip Code</label>
                                                <input type="text" class="form-control">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label>Cell Phone</label>

                                            </div>
                                            <div class="col-sm-6">

                                                <input type="text" class="form-control">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label>Username:</label>

                                            </div>
                                            <div class="col-sm-6">

                                                <input type="text" class="form-control">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label>Password: </label>

                                            </div>
                                            <div class="col-sm-6">

                                                <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label>Confirm Password:</label>

                                            </div>
                                            <div class="col-sm-6">

                                                <asp:TextBox ID="txtCPassword" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label>Would you like to receive Newsletters?</label>

                                            </div>
                                            <div class="col-sm-6">
                                                <input type="checkbox" value="yes">
                                                Yes
                                        <input type="checkbox" value="no">
                                                No
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label>Upload Your Resume:</label>

                                            </div>
                                            <div class="col-sm-6">
                                                <%--<input type="file" name="myFile" />--%>
                                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                            </div>
                                        </div>
                                        <br>
                                    </div>
                                    <div class="form-group">
                                        <asp:Button runat="server" ID="finishSignUp" class="btn btn-success" Text="Submit" OnClick="finishSignUp_Click"></asp:Button>
                                    </div>
                                    <asp:Label runat="server" ID="lblStatus"></asp:Label>
                                    <div class="col-sm-12" style="text-align:center;">
                                        <p>Already Have an Account? </p><a href="MobileLogin.aspx">Login</a>
                                    </div>


                                </form>
                            </div>
                            <br>


                            <div class="row" id="fd4" style="text-align: center;">

                                <div class="col-xs-6">
                                </div>


                                <div class="col-xs-6">
                                </div>

                            </div>
                            <br>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>