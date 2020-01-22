<%@ Page Title="" Language="C#" MasterPageFile="~/Citizen.master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="CTS_ResourcePortal.MobileFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <link href="css.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


    <div class="container">
        <div class="row" id="h2">
            <div class="col"></div>
            <div class="col-md-auto">
                <h2>Feedback</h2>
            </div>
            <div class="col"></div>
        </div>


        <div class="section">
            <div class="row" >
                <div class="col-md-3">
                    <b>Name:</b>
                </div>
                <div class="col-1"></div>

                <div class="col-md-8">
                    <p>
                        Isabella Christensen
                    </p>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="row">
                <div class="col-md-3">
                    <b>Job Title:</b>
                </div>
                <div class="col-1"></div>

                <div class="col-md-8">
                   <asp:TextBox ID="txtResourceTitle" Placeholder="Entry Level Contractor" text="Entry Level Contractor" runat="server" ReadOnly="True"></asp:TextBox>
                </div>
            </div>
        </div>
                <div class="section">
            <div class="row">
                <div class="col-md-3">
                    <b>Feedback:</b>
                </div>
                <div class="col-1"></div>

                <div class="col-md-8">
                   <asp:TextBox ID="txtFeedback" style="height:150px; width:90%;" Wrap="True"  TextMode="MultiLine" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <br />

        <div class="row justify-content-center align-items-center  text-center">
            <div class="col-md-4">
                <a class="btn btn-large btn-info" href="ResourceList.aspx">Back To Resources</a>
            </div>
        </div>
        <br />
        <div class="row  justify-content-center align-items-center text-center">
            <div class="col"></div>
            <div class="col-md-4">
                <a class="btn btn-large btn-info" href="MobileFeedback.aspx">Submit Feedback</a>
            </div>
            <div class="col"></div>
        </div>

    </div>
</asp:Content>

