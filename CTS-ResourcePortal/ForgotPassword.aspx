<%@ Page Title="" Language="C#" MasterPageFile="~/Guest.master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="CTS_ResourcePortal.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="css.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog modal-xl">
            <!-- Modal content-->
            <div class="modal-content container">
                <div class="modal-body">

                    <br />
                    <div class="row  justify-content-center align-items-center text-center">
                        <div class="col"></div>
                        <div class="col-md-4">
                             <asp:Label runat="server" ID="lblStatus" Font-Bold="True"></asp:Label>
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
        <div class="row">
            <div class="col"></div>
            <div class="col-md-4">
                <h3>Forgot Password</h3>
            </div>
            <div class="col"></div>
        </div>
        <br />
       
        <br />
        
            <!--UpdatePassword-->
            <div class="section" runat="server" id="UpdatePassword">
                <div class="row">
                    <!--<div class="col-1"></div>-->
                    <div class="col-lg-10 form-group row d-flex justify-content-center">
                        <asp:Label runat="server" class="col-form-label col-lg-4">Enter Email</asp:Label>
                        <div class="col-lg-4">
                            <asp:TextBox runat="server" ID="txtEmail" required="true"  class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-1"></div>
                </div>
               
                <br />
                <div class="row ">
                    <div class="col"></div>
                    <div class="col-6 d-flex justify-content-center">
                        <asp:Button runat="server" CssClass="btn btn-primary" ID="btnSendEmail" Text="Send Email" onclick="btnSendEmail_Click"/>
                    </div>
                    <div class="col"></div>
                </div>
            </div>
           
            <br />          
            
        </div>
        <br />

    <script type="text/javascript">
         function ShowPopup(title, body) {
             $("#MyPopup .modal-title").html(title);
             $("#MyPopup .modal-body").html(body);
             $("#MyPopup").modal("show");
         }
    </script>

</asp:Content>
