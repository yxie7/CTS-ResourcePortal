<%@ Page Title="" Language="C#" MasterPageFile="~/Guest.master" AutoEventWireup="true" CodeBehind="MobileTraining.aspx.cs" Inherits="CTS_ResourcePortal.MobileTraining" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <link href="css.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <div class="container">
        <div class="row" id="h2">
            <div class="col"></div>
            <div class="col-md-auto">
                <h2>CDL Classes</h2>
            </div>
            <div class="col"></div>
        </div>
        <div class="section">
            <div class="row" id="job">
                <div class="col-md-3">
                    <b>Hosted By:</b>
                </div>
                <div class="col-1"></div>

                <div class="col-md-8">
                    <p>
                        Community College of Philadelphia
                    </p>
                </div>
            </div>
        </div>

        <div class="section">
            <div class="row" id="title62">
                <div class="col-md-3">
                    <b>
                        Training Description:
                    </b>
                </div>
                <div class="col-1"></div>

                <div class="col-md-8">
                    <p>
                        This course is designed to provide students with a working knowledge of a 
                        tractor and trailer and preparation for the road CDL test. Included in this 
                        course is pre-trip inspection, basic driver skill training, backing 
                        a tractor trailer combination, and post trip inspection. Students will 
                        take the North Dakota CDL Driving test to demonstrate their driving knowledge
                        and skills. Students will be required to complete 28 hours of hands on training.
                        Students will also have a chance to complete a 2 day 1000 mile road trip where 
                        the students will trip plan the whole trip and meet with industry leaders about jobs.
                    </p>
                    <p>
                        Hours: 40/week
                    </p>
                    <p>
                        Length of Time: Three Months
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
                        10/27/2019
                    </p>
                </div>
            </div>
        </div>

        <div class="section">
            <div class="row" id="title2">
                <div class="col-md-3 ">
                    <b>
                        From - To::
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
            <div class="row" id="">
                <div class="col-md-3">
                    <b>
                       Knowledge, Skills and Other Requirements:
                    </b>
                </div>
                <div class="col-1"></div>

                <div class="col-md-8">
                    <p>
                        Must be atleast 21 years of age.
                    </p>
                    <p>
                        Must have a valid driver's license in the state of Pennslyvania.
                    
                    </p>
                </div>
            </div>
        </div>


        <br />

        <div class="row justify-content-center align-items-center  text-center">
            <div class="col-md-4">
                <a class="btn btn-large btn-info"  href="templates/home.html">Apply Here</a>
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