<%@ Page Title="" Language="C#" MasterPageFile="~/Guest.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="CTS_ResourcePortal.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="signup-form.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">

    <div id="MyPopup" class="modal" role="dialog">
        <div class="modal-dialog modal-xl">
            <!-- Modal content-->
            <div class="modal-content container">
                <div class="modal-body">

                    <br />
                    <div class="row  justify-content-center align-items-center text-center">
                        <div class="col"></div>
                        <div class="col-md-4">
                            <asp:Label runat="server" Text="Thank you for signing up!" ID="lblThanks" Font-Bold="True"></asp:Label>
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
        <div id="cover">
            <div id="cover-caption">
                <div id="Container" class="Container">
                    <div id="border" class="signup-form">
                        <h2 class="display-4" id="h2">Create an Account</h2>
                        <br />
                        <br />
                        <div class="info-form">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <label>First Name</label>
                                        <asp:TextBox ID="txtFirstName" required="true" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-6">
                                        <label>Last Name</label>
                                        <asp:TextBox ID="txtLastName" required="true" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <br>

                                <br />
                                <div class="row">

                                    <div class="col-sm-6">
                                        <label>Street Address</label>
                                        <asp:TextBox ID="txtAddress" required="true" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                   <div class="col-sm-6">
                                        <label>City</label>
                                        <asp:TextBox ID="txtCity" required="true" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                                </div>
                                <br>

                                <br>
                                 <div class="row">

                                     <div class="col-sm-6">
                                        <label>State</label>
                                        <asp:TextBox ID="txtState" required="true" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-6">
                                        <label>Zipcode</label>
                                        <asp:TextBox ID="txtZip" required="true" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                                 </div>
                                <br>

                                <br>
                                <div class="row">

                                    <div class="col-sm-6">
                                        <label>Cell Phone:</label>
                                        <asp:TextBox ID="txtCellPhone" required="true" CssClass="form-control" runat="server" placeholder="(123)456-7890"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-6">
                                        <label>Email Address</label>
                                        <asp:TextBox ID="txtEmail" required="true" CssClass="form-control" runat="server" placeholder="email@example.com"></asp:TextBox>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <label>Password: </label>
                                        <asp:TextBox ID="txtPassword" required="true" type="password" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-6">
                                        <label>Confirm Password:</label>
                                        <asp:TextBox ID="txtCPassword" required="true" type="password" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <br>

                                <br>
                                <div class="row">
                                    <div class="col-sm-4">
                                    </div>
                                    <div class="col-sm-4">
                                        <label>Would you like to receive Newsletters?</label>
                                        <br />
                                        <asp:RadioButtonList ID="rdoSubscribe" runat="server" RepeatLayout="Flow">
                                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                            <asp:ListItem Value="No">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-4">
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-sm-4">
                                    </div>
                                    <div class="col-sm-6">
                                        <%--<input type="file" name="myFile" />--%>
                                        <label>Upload Your Resume:</label>
                                        <br />
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                    </div>
                                </div>
                                <br>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-4">
                                    </div>
                                    <div class="col-sm-4; align-content-center; justify-content-center; text-justify">
                                        &nbsp&nbsp&nbsp
                                                <asp:Button runat="server" ID="finishSignUp" class="btn btn-success" Text="Submit" OnClick="finishSignUp_Click"></asp:Button>
                                    </div>
                                    <div class="col-sm-4">
                                    </div>
                                </div>
                            </div>
                            <asp:Label runat="server" ID="lblStatus"></asp:Label>
                            <div class="col-sm-12" style="text-align: center;">
                                <p>Already Have an Account? </p>
                                <a href="Login.aspx">Login</a>
                            </div>
                        </div>
                        <br>

                        <div class="row" id="fd4" style="text-align: center;">

                            <div class="col-xs-6">
                            </div>

                            <div class="col-xs-6">
                            </div>
                        </div>
                        <br>

                        <%--<div class="row text-black">
                        <div class="col-sm-6 offset-sm-3 text-center">
                        </div>
                    </div>--%>
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