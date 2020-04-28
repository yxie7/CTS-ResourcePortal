﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="ManageAdmins.aspx.cs" Inherits="CTS_ResourcePortal.ManageAdmins" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">

    <div id="info" class="modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <!-- Modal content-->
            <div class="modal-content container">
                <div class="modal-body">
                    <br />
                    <div class="row  justify-content-center align-items-center text-center">
                        <div class="col">
                            <asp:Label runat="server" ID="lblModalTXT"></asp:Label>
                        </div>
                    </div>
                    <br />
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="newAdmin" role="dialog">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content container">
                <div class="modal-header row justify-content-center">
                    <h3>Creating New Administrator</h3>
                </div>
                <div class="modal-body">
                    <div class="row justify-content-center">
                        <div class="row col-12">
                            <div class="col">
                                <label>First Name</label>
                                <asp:TextBox ID="txtFirstName" required="true" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col">
                                <label>Last Name</label>
                                <asp:TextBox ID="txtLastName" required="true" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row col-12">
                            <div class="col">
                                <label>Phone Number:</label>
                                <asp:TextBox ID="txtPhoneNumber" required="true" CssClass="form-control" runat="server" placeholder="(123)456-7890"></asp:TextBox>
                            </div>
                            <div class="col">
                                <label>Email Address</label>
                                <asp:TextBox type="email" ID="txtEmail" required="true" CssClass="form-control" runat="server" placeholder="email@example.com"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row col-12">
                        <div class="col">
                            <label>Password: </label>
                            <asp:TextBox ID="txtPassword" required="true" type="password" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col">
                            <label>Confirm Password:</label>
                            <asp:TextBox ID="txtCPassword" required="true" type="password" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:CompareValidator ID="comparePasswords"
                                runat="server"
                                SetFocusOnError="True"
                                ControlToCompare="txtPassword"
                                ControlToValidate="txtCPassword"
                                ForeColor="Red"
                                ErrorMessage="Your passwords do not match up!"
                                Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                ErrorMessage="Password must be 6 characters long and only contain letters and numbers." 
                                ControlToValidate="txtPassword"
                                SetFocusOnError="True"
                                ValidationExpression="^[a-zA-Z0-9]{6,}$"
                                ForeColor="Red">
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button Text="Cancel" runat="server" ID="btnCancel" CssClass="btn btn-danger" data-toggle="modal" data-target="#newAdmin" UseSubmitBehavior="false" />
                    <asp:Button Text="Create" runat="server" ID="btnCreation" OnClick="btnCreation_Click" CssClass="btn btn-success" UseSubmitBehavior="false" />
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="section">
            <h2>Manage Administrators</h2>
            <br />
            <div>
                <div>
                    Current Admins:
                </div>
                <div class="row justify-content-center">

                    <asp:Repeater runat="server" ID="admins" OnItemCommand="admins_ItemCommand">
                        <HeaderTemplate>
                            <table id="datatable" class="table  table-hover">
                                <thead>
                                    <tr>
                                        <th class="col-3 rth">First Name</th>
                                        <th class="col-3 rth">Last Name</th>
                                        <th class="col-3 rth">Email</th>
                                        <th class="col-3 rth">Phone Number</th>
                                        <th class="col-3 rth">Activate</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="rtd">
                                    <asp:Label ID="lblFirstName" Text='<%# Eval("FirstName") %>' runat="server" />
                                    <asp:HiddenField runat="server" ID="adminID" Value='<%# Eval("AdministratorID") %>' />
                                </td>
                                <td class="rtd">
                                    <asp:Label ID="lblLastName" Text='<%# Eval("LastName") %>' runat="server" />
                                </td>
                                <td class="rtd">
                                    <asp:Label ID="lblEmail" Text='<%# Eval("Email") %>' runat="server" />
                                </td>
                                <td class="rtd">
                                    <asp:Label ID="lblPhoneNumber" Text='<%# Eval("PhoneNumber") %>' runat="server" />
                                </td>
                                <td class="rtd">
                                    <asp:Button ID="btnInactivate" CssClass="btn btn-danger" Text="Inactivate" runat="server" UseSubmitBehavior="false" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody></table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <hr />
                <br />
                <div class="justify-content-center row">
                    <asp:Button Text="Create a New Administrator" runat="server" ID="btnCreateNewAdmin" OnClick="btnCreateNewAdmin_Click" CssClass="btn btn-lg btn-primary" UseSubmitBehavior="false" />
                </div>
            </div>
        </div>
        <br />
        <div class="section">
            <h2>Inactive Administrators</h2>
            <br />
            <div class="row justify-content-center ">
                <asp:Repeater runat="server" ID="inactiveAdmins" OnItemCommand="inactiveAdmins_ItemCommand">
                    <HeaderTemplate>
                        <table id="datatable" class="table  table-hover">
                            <thead>
                                <tr>
                                    <th class="col-3 rth">First Name</th>
                                    <th class="col-3 rth">Last Name</th>
                                    <th class="col-3 rth">Email</th>
                                    <th class="col-3 rth">Phone Number</th>
                                    <th class="col-3 rth">Inactivate</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="rtd">
                                <asp:Label ID="ilblFirstName" Text='<%# Eval("FirstName") %>' runat="server" />
                                <asp:HiddenField runat="server" ID="iadminID" Value='<%# Eval("AdministratorID") %>' />
                            </td>
                            <td class="rtd">
                                <asp:Label ID="ilblLastName" Text='<%# Eval("LastName") %>' runat="server" />
                            </td>
                            <td class="rtd">
                                <asp:Label ID="ilblEmail" Text='<%# Eval("Email") %>' runat="server" />
                            </td>
                            <td class="rtd">
                                <asp:Label ID="ilblPhoneNumber" Text='<%# Eval("PhoneNumber") %>' runat="server" />
                            </td>
                            <td class="rtd">
                                <asp:Button ID="ibtnActivate" CssClass="btn btn-success" Text="Activate" runat="server" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody></table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
        <br />
        <div class="section">
            <h2>Change My Password</h2>
            <br />
            <div class="row justify-content-center ">
                <div class="row col-12">
                    <div class="col">
                        <label>Password: </label>
                        <asp:TextBox ID="txtNewPassword" required="true" type="password" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col">
                        <label>Confirm Password:</label>
                        <asp:TextBox ID="txtCNewPassword" required="true" type="password" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:CompareValidator ID="compareChangePW"
                            runat="server"
                            SetFocusOnError="True"
                            ControlToCompare="txtNewPassword"
                            ControlToValidate="txtCNewPassword"
                            ErrorMessage="Your passwords do not match up!"
                            ForeColor="Red"
                            Display="Dynamic" />

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ErrorMessage="Password must be 6 characters long and only contain letters and numbers." ControlToValidate="txtNewPassword"
                            SetFocusOnError="True"
                            ValidationExpression="^[a-zA-Z0-9]{6,}$"
                            ForeColor="Red">
                        </asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <asp:Button ID="btnChangePW" CssClass="btn btn-primary" Text="Change Password" runat="server" UseSubmitBehavior="false" OnClick="btnChangePW_Click" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="js" runat="server">
</asp:Content>