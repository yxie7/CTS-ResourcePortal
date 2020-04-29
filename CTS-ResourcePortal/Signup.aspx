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
                                    
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                        ErrorMessage="Please Input Only Letters" ControlToValidate="txtFirstName"
                                        SetFocusOnError="True"
                                        ValidationExpression="^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <div class="col-sm-6">
                                    <label>Last Name<span class="requiredRed">*</span></label>
                                    <asp:TextBox ID="txtLastName" required="true" CssClass="form-control" runat="server"></asp:TextBox>

                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                                        ErrorMessage="Please Input Only Letters" ControlToValidate="txtLastName"
                                        SetFocusOnError="True"
                                        ValidationExpression="^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
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
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                                        ErrorMessage="Please Input Only Letters" ControlToValidate="txtCity"
                                        SetFocusOnError="True"
                                        ValidationExpression="^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <br>
                            <div class="row">

                                <div class="col-sm-6">
                                    <asp:Label ID="lblState" runat="server"><span class="requiredRed">*</span>State: </asp:Label><br />
                                    <asp:DropDownList ID="ddlState" class="form-control" runat="server">
                                        <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                        <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                        <asp:ListItem Value="NY">New York</asp:ListItem>
                                        <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-sm-6">
                                    <label>Zipcode<span class="requiredRed">*</span></label>
                                    <asp:TextBox ID="txtZip" required="true" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ControlToValidate="txtZip" ErrorMessage="Zip Code is Required"
                                        SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>

                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                        ErrorMessage="Invalid Zip Code" ControlToValidate="txtZip"
                                        SetFocusOnError="True"
                                        ValidationExpression="^[0-9]{5}([- /]?[0-9]{4})?$" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <br>
                            <div class="row">

                                <div class="col-sm-6">
                                    <label>Cell Phone<span class="requiredRed">*</span></label>
                                    <asp:TextBox ID="txtCellPhone" required="true" CssClass="form-control" runat="server" placeholder="###-###-####"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        ControlToValidate="txtCellPhone" ErrorMessage="Cell Phone is required"
                                        SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>

                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                        ErrorMessage="Please Enter A Valid Cell Phone Number" ControlToValidate="txtCellPhone"
                                        SetFocusOnError="True"
                                        ValidationExpression="^[2-9]\d{2}-\d{3}-\d{4}$" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <div class="col-sm-6">
                                    <label>Email Address<span class="requiredRed">*</span></label>
                                    <asp:TextBox ID="txtEmail" required="true" CssClass="form-control" runat="server" placeholder="email@example.com" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="txtEmail" ErrorMessage="Email is required"
                                        SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>

                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                        ErrorMessage="Invalid Email Format" ControlToValidate="txtEmail"
                                        SetFocusOnError="True"
                                        ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
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
                            <div class="row justify-content-center">
                                <asp:CompareValidator ID="comparePasswords" runat="server"
                                    SetFocusOnError="True"
                                    ControlToCompare="txtPassword"
                                    ControlToValidate="txtCPassword"
                                    ForeColor="Red"
                                    ErrorMessage="Your passwords do not match up!"
                                    Display="Dynamic" />
                            </div>
                            <div class="row justify-content-center">
                                <asp:RegularExpressionValidator ID="RGX_txtPassword" runat="server"
                                    ErrorMessage="Password must be at least 6 alphanumeric characters with at least 1 number, 1 upper case, and 1 lower casee letter."
                                    ControlToValidate="txtPassword"
                                    SetFocusOnError="True"
                                    ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"
                                    ForeColor="Red"
                                    Display="Dynamic">
                                </asp:RegularExpressionValidator>
                            </div>
               
                            <br>
                            <div class="row text-center">
                                <div class="col">
                                </div>
                                <div class="col-sm-auto">
                                    <label>Would you like to receive Newsletters?<span class="requiredRed">*</span></label>
                                    <br />
                                    <asp:RadioButtonList ID="rdoSubscribe" runat="server" RepeatLayout="Flow" class="btn-group btn-group-toggle" data-toggle="buttons" >
                                        <asp:ListItem class="btn btn-outline-success" Value="Yes" Selected="True">Yes</asp:ListItem>
                                        <asp:ListItem class="btn btn-outline-danger" Value="No">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                        ControlToValidate="rdoSubscribe" ErrorMessage="Please indicate if you want Newsletters"
                                        SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
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
