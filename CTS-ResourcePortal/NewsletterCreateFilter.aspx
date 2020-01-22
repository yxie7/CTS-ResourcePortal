<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="NewsletterCreateFilter.aspx.cs" Inherits="Empty_Project_Template.NewsletterCreateFilter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server"><link href="css.css" rel="stylesheet" />
    <div class="container">
        <div class="row">
            <div class="col"></div>
            <div class="col-md-4">
                <h3>Create a Newsletter</h3>
            </div>
            <div class="col"></div>
        </div>
        <br />
        <div class="section">
            <br />
            <div class="row justify-content-center align-items-center">
                <div class="col"></div>
                <div class="col-lg-2 d-flex justify-content-center ">Resource Types:</div>
                <div class="col-lg-4 d-flex justify-content-center ">
                    <asp:CheckBox Text="Job Opportunity" runat="server" CssClass="aspl" />
                    <asp:CheckBox Text="Event" runat="server" CssClass="aspl" />
                    <asp:CheckBox Text="Training" runat="server" CssClass="aspl" />
                </div>
                <div class="col"></div>
            </div>
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
                    <asp:Button runat="server" CssClass="btn btn-light" ID="btnChange" Text="Update Password"/>
                </div>
                <div class="col"></div>
            </div>
            <br />
        </div>
    </div>
</asp:Content>
