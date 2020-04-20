<%@ Page Title="" Language="C#" MasterPageFile="~/Guest.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="CTS_ResourcePortal.Signup" %>

<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">

    <div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog modal-xl">
            <!-- Modal content-->
            <div class="modal-content container">
                <div class="modal-body">

                    <br />
                    <div class="row  justify-content-center align-items-center text-center">
                        <div class="col"></div>
                        <div class="col-md-4">
                            <asp:Label runat="server" ID="lblStatusSignUp" Font-Bold="True"></asp:Label>
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
            <div id="Container" class="Container">
                <div id="border" class="signup-form">
                    <h2 class="" id="h2">Create an Account</h2>
                    <br />
                    <div class="info-form">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-6">
                                    <label>First Name<span class="requiredRed">*</span></label>
                                    <asp:TextBox ID="txtFirstName" required="true" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-sm-6">
                                    <label>Last Name<span class="requiredRed">*</span></label>
                                    <asp:TextBox ID="txtLastName" required="true" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">

                                <div class="col-sm-6">
                                    <label>Street Address<span class="requiredRed">*</span></label>
                                    <asp:TextBox ID="txtAddress" required="true" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-sm-6">
                                    <label>City<span class="requiredRed">*</span></label>
                                    <asp:TextBox ID="txtCity" required="true" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <br>
                            <div class="row">

                                <div class="col-sm-6">
                                    <label>State<span class="requiredRed">*</span></label>
                                    <asp:TextBox ID="txtState" required="true" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-sm-6">
                                    <label>Zipcode<span class="requiredRed">*</span></label>
                                    <asp:TextBox ID="txtZip" required="true" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <br>
                            <div class="row">

                                <div class="col-sm-6">
                                    <label>Cell Phone<span class="requiredRed">*</span></label>
                                    <asp:TextBox ID="txtCellPhone" required="true" CssClass="form-control" runat="server" placeholder="(###)###-####"></asp:TextBox>
                                </div>
                                <div class="col-sm-6">
                                    <label>Email Address<span class="requiredRed">*</span></label>
                                    <asp:TextBox ID="txtEmail" required="true" CssClass="form-control" runat="server" placeholder="email@example.com"></asp:TextBox>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-6">
                                    <label>Password<span class="requiredRed">*</span></label>
                                    <asp:TextBox ID="txtPassword" required="true" type="password" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-sm-6">
                                    <label>Confirm Password<span class="requiredRed">*</span></label>
                                    <asp:TextBox ID="txtCPassword" required="true" type="password" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <br>
                            <div class="row text-center">
                                <div class="col">
                                </div>
                                <div class="col-sm-auto">
                                    <label>Would you like to receive Newsletters?</label>
                                    <br />
                                    <asp:RadioButtonList ID="rdoSubscribe" runat="server" RepeatLayout="Flow" class="btn-group btn-group-toggle" data-toggle="buttons">
                                        <asp:ListItem class="btn btn-outline-success" Value="Yes" Selected="True" >Yes</asp:ListItem>
                                        <asp:ListItem class="btn btn-outline-danger" Value="No">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="col">
                                </div>
                            </div>
                            <br>
                            <div class="row text-center">
                                <div class="col"></div>
                                <div class="col-sm-6">
                                    <%--<input type="file" name="myFile" />--%>
                                    <label>Upload Your Resume:</label>
                                    <br />
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </div>
                                <div class="col"></div>
                            </div>
                            <br>
                        </div>
                        <div class="form-group">
                            <div class="row text-center">
                                <div class="col">
                                </div>
                                <div class="col-md-auto">
                                    <asp:Button runat="server" ID="finishSignUp" class="btn btn-primary" Text="Submit" OnClick="finishSignUp_Click"></asp:Button>
                                </div>
                                <div class="col">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="section">
            <asp:Label runat="server" ID="lblStatus"></asp:Label>
            <div class="col-sm-12" style="text-align: center;">
                <p>Already Have an Account? </p>
                <hr />
                <a href="Login.aspx">Login</a>
            </div>
        </div>
    </div>
</asp:Content>