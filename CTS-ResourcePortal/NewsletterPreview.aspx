<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="NewsletterPreview.aspx.cs" Inherits="CTS_ResourcePortal.NewsletterPreview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <link href="css.css" rel="stylesheet" />
    <div class="container">
        <h2>Preview Newsletter</h2>
        <br />
        <div class="section">
            <div class="row justify-content-center align-items-center ">
                <div class="col-1"></div>
                <div class="row d-flex justify-content-center col-md-auto">
                    <div class="newsletterPreview">
                        <br />
                        <h2>October 21st, 2019 Newsletter</h2>
                        <div class="row nls"></div>
                        <div class="row col-10">
                            <h3>Summary</h3>
                        </div>
                        <div id="summaryList">
                            <ul>
                                <li>Entry Level Contractor</li>
                                <li>CDL Classes</li>
                                <li>North Philly Job Fair</li>
                            </ul>
                        </div>
                        <div class="row nls"></div>
                        <div class="row col-10">
                            <h4 class="resourceTitle">Entry Level Contractor</h4>
                        </div>
                        <div class="row col-10 desc ">
                            <p class="">
                                
                                Date Posted: 10/27/ 2019<br />
                                Expiry Date: 10/31/2019<br />
                                Primary Contact: flaco@asapmob.com<br />
                                Location: 123 N Main St. New York City, NY 12345<br />
                                <br />
                                <b>Primary Responsibilities:</b><br />
                                The role of the Contractor is to own the project from development through construction, and up until the close out of the home. This includes working with the sales team, the Construction Managers, working with architects and engineers, and zoning attorneys for all entitlement and zoning needs.<br />
                                Hours: 40/week<br />
                                Length of Time:  Three Months<br />
                                <br />
                                <b>Knowledge, Skills and Other Requirements:</b><br />
                                General knowledge of building maintenance, general carpentry, plumbing, electrical, and custodial skills required.<br />
                                Must have the ability to work safely, efficiently and effectively both independently and in team situations.<br />
                                Must be able to maintain professional boundaries with all other employees and volunteers.<br />
                                Must have the ability to communicate and establish effective working relationships with all types of people.<br />
                                Must be able to climb a ladder and lift up to 50 lbs.<br />
                            </p>
                        </div>
                        <div class="row nls"></div>
                        <div class="row col-10">
                            <h4 class="resourceTitle">CDL Classes</h4>
                        </div>
                        <div class="row col-10 desc ">
                            <p class="">
                              
                                Date: 10/31/2019<br />
                                Starting Time: 5:30pm
                            <br />
                                Primary Contact: flaco@asapmob.com<br />
                                Location: 123 N Main St. Philadelphia, PA 19140<br />
                                <br />
                                <b>Training Description:</b><br />
                                Job Fairs provide opportunities for students/alumni to learn about potential careers in industry sectors, network with perspective employers, and often submit resumes to prospective employers (Note:  Some employers may require online submission of resumes and/or employment applications).
                            <br />
                                Attire: Suit
                            <br />
                            </p>
                        </div>
                        <div class="row nls"></div>
                        <div class="row col-10">
                            <h4 class="resourceTitle">North Philadelphia Job Fair</h4>
                        </div>
                        <div class="row col-10 desc ">
                            <p class="">
                                
                                Date Posted: 10/27/ 2019<br />
                                Expiry Date: 10/31/2019<br />
                                Primary Contact: flaco@asapmob.com<br />
                                Location: 123 N Main St. New York City, NY 12345<br />
                                <br />
                                <b>Primary Responsibilities:</b><br />
                                The role of the Contractor is to own the project from development through construction, and up until the close out of the home. This includes working with the sales team, the Construction Managers, working with architects and engineers, and zoning attorneys for all entitlement and zoning needs.<br />
                                Hours: 40/week<br />
                                Length of Time:  Three Months<br />
                                <br />
                                <b>Knowledge, Skills and Other Requirements:</b><br />
                                General knowledge of building maintenance, general carpentry, plumbing, electrical, and custodial skills required.<br />
                                Must have the ability to work safely, efficiently and effectively both independently and in team situations.<br />
                                Must be able to maintain professional boundaries with all other employees and volunteers.<br />
                                Must have the ability to communicate and establish effective working relationships with all types of people.<br />
                                Must be able to climb a ladder and lift up to 50 lbs.<br />
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
            <br />
            <div class="row justify-content-center align-items-center text-center">
                <div class="col-md-4">
                    <asp:Button runat="server" class="btn btn-dark" Text="Send Newsletter to Subscribers" ID="btnSend" OnClick="btnSend_Click"></asp:Button>
                </div>
            </div>
            <br />
        </div>
    </div>
</asp:Content>