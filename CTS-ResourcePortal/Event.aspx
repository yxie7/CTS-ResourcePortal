<%@ Page Title="" Language="C#" MasterPageFile="~/Guest.master" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="CTS_ResourcePortal.MobileEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <link href="css.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <div class="container">
        <div class="row" id="h2">
            <div class="col"></div>
            <div class="col-md-auto">
                <h2>North Philadelphia Job Fair</h2>
            </div>
            <div class="col"></div>
        </div>
        <div class="section">
            <div class="row" id="event">
                <div class="col-md-3">
                    <b>Hosted By:</b>
                </div>
                <div class="col-1"></div>

                <div class="col-md-8">
                    <p>
                        Called To Serve
                    </p>
                </div>
            </div>
        </div>

        <div class="section">
            <div class="row" id="title62">
                <div class="col-md-3">
                    <b>
                        Event Description:
                    </b>
                </div>
                <div class="col-1"></div>

                <div class="col-md-8">
                    <p>
                        Job Fairs provide opportunities for students/alumni to learn about potential careers in industry sectors,
                                network with perspective employers, and often submit resumes to prospective employers (Note:
                                Some employers may require online submission of resumes and/or employment applications).
                    </p>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="row" id="title4">
                <div class="col-md-3 ">
                    <b>
                        Location:
                    </b>
                </div>
                <div class="col-1"></div>

                <div class="col-md-8">
                    <p>
                        123 N Main St. Philadelphia, PA 19140
                    </p>
                </div>
            </div>
        </div>

        <div class="section">
            <div class="row" id="title3">
                <div class="col-md-3 ">
                    <b>
                        Primary Contact:
                    </b>
                </div>
                <div class="col-1"></div>

                <div class="col-md-8">
                    <b>
                        Flaco@asapmob.com
                    </b>
                </div>
            </div>
        </div>

        <div class="section">
            <div class="row" id="title1">
                <div class="col-md-3 ">
                    <b>
                        Date Posted:
                    </b>
                </div>
                <div class="col-1"></div>

                <div class="col-md-8">
                    <p>
                        10/31/2019
                    </p>
                </div>
            </div>
        </div>

        <div class="section">
            <div class="row" id="title2">
                <div class="col-md-3 ">
                    <b>
                        From - To:
                    </b>
                </div>
                <div class="col-1"></div>

                <div class="col-md-8">
                    <p>
                        8:30am to 5:30pm
                    </p>
                </div>
            </div>
        </div>

        <div class="section">
        <div class="row" id="title51">

            <div class="col-md-3 ">
                <b>
                    Attire:
                </b>
            </div>
                <div class="col-1"></div>

                <div class="col-md-8">
                <p>
                    Formal
                </p>
            </div>
        </div>
        </div>

        <br />

        <div class="row justify-content-center align-items-center  text-center">
            <div class="col-md-4">
                <a class="btn btn-large btn-info"  href="templates/home.html">SignUp Here</a>
            </div>
        </div>
        <br />
        <div class="row  justify-content-center align-items-center text-center">
            <div class="col"></div>
            <div class="col-md-4">
                <a class="btn btn-large btn-info" href="MobileFeedback.aspx">Leave Feedback</a>
            </div>
            <div class="col"></div>
        </div>
    </div>
</asp:Content>