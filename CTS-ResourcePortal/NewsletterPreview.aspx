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

                    <div id="newsletterPreview" class="newsletterPreview" runat="server">
                        <br />
                        <h2>October 21st, 2019 Newsletter</h2>

                        <h2 runat="server" id="H1"></h2>
                        <div class="row nls"></div>
                        <div class="row col-10">
                            <h3>Summary</h3>
                        </div>
                        <div id="nlSummaryList">
                            <ul>
                                <asp:Repeater ID="rptSummary" runat="server">
                                    <ItemTemplate>
                                        <li><%# Eval("ResourceName") %></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                        <asp:Repeater ID="rptNL" runat="server" OnItemDataBound="rptNL_ItemDataBound">
                            <ItemTemplate>
                                <div class="row nls"></div>
                                <div class="row col-10">
                                    <h4 class="resourceTitle"><%# Eval("ResourceName") %></h4>
                                </div>
                                <!-- Resource Details -->
                                <%--                                    <asp:HiddenField runat="server" ID="id" Value='<%# Eval("ResourceTypeID") %>' />--%>
                                <div class="row col-10 desc">
                                    <asp:Label Text='<%# Eval("ResourceTypeID").ToString() == "1" ? "Date Posted": (Eval("ResourceTypeID").ToString() == "2" ? "Event Posted":"Start Date")  %>' runat="server" ID="preStartDate" />
                                    &nbsp
                                    <asp:Label runat="server" ID="lblStartDate" Text='<%# Eval("StartDate")==null ? String.Empty:Eval("StartDate") %>' Visible='<%# Eval("StartDate") == null ? false: true %>' />
                                </div>
                                <div class="row col-10 desc " visible='<%# Eval("EndDate") == null ? false: true %>'>
                                    <asp:Label Text='<%# Eval("ResourceTypeID").ToString() == "1" ? "Expiration Date: ": (Eval("ResourceTypeID").ToString() == "2" ? "Registration Deadline: ":"Registration Deadline: ")  %>' runat="server" ID="preEndDate" />
                                    &nbsp
                                    <asp:Label runat="server" ID="lblEndDate" Text='<%# Eval("EndDate")==null ? String.Empty:Eval("EndDate") %>' Visible='<%# Eval("EndDate") == null ? false: true %>' />
                                </div>
                                <div class="row col-10 desc " visible='<%# Eval("StartTime") == null ? false: true %>'>
                                    <asp:Label Text="Start Time:" runat="server" ID="preStartTime" />
                                    &nbsp
                                    <asp:Label runat="server" ID="lblStartTime" Text='<%# Eval("StartTime")==null ? String.Empty:Eval("StartTime") %>' Visible='<%# Eval("StartTime") == null ? false: true %>' />
                                </div>
                                <div class="row col-10 desc " visible='<%# Eval("EndTime") == null ? false: true %>'>
                                    <asp:Label Text="End Time:" runat="server" ID="preEndTime" />
                                    <asp:Label runat="server" ID="lblEndTime" Text='<%# Eval("EndTime")==null ? String.Empty:Eval("EndTime") %>' Visible='<%# Eval("EndTime") == null ? false: true %>' />
                                </div>
                                <div class="row col-10 desc ">
                                    <asp:Label Text="Company/Orginization:" runat="server" ID="preCompany" />
                                    &nbsp
                                    <asp:Label runat="server" ID="lblCompany" Text='<%# Eval("Company")==null ? String.Empty:Eval("Company") %>' Visible='<%# Eval("Company") == null ? false: true %>' />
                                </div>
                                <div class="row col-10 desc " visible='<%# Eval("ContactFirstName") == null ? false: true %>'>
                                    <asp:Label Text="Contact Name:" runat="server" ID="preContactName" />
                                    &nbsp
                                    <asp:Label runat="server" ID="lblContactName" Text='<%# String.Concat(Eval("ContactFirstName")==null ? String.Empty:Eval("ContactFirstName")," ",Eval("ContactLastName")==null ? String.Empty:Eval("ContactLastName"))%>' />
                                </div>
                                <div class="row col-10 desc " visible='<%# Eval("ContactPhoneNumber") == null ? false: true %>'>
                                    <asp:Label Text="Contact Number:" runat="server" ID="preContactNumber" />
                                    &nbsp
                                    <asp:Label runat="server" ID="lblContactNumber" Text='<%# Eval("ContactPhoneNumber") ==null ? String.Empty:Eval("ContactPhoneNumber") %>' Visible='<%# Eval("ContactPhoneNumber") == null ? false: true %>' />
                                </div>
                                <div class="row col-10 desc " visible='<%# Eval("ContactEmail") == null ? false: true %>'>
                                    <asp:Label Text="Contact Email:" runat="server" ID="preContactEmail" />
                                    &nbsp
                                    <asp:Label runat="server" ID="lblContactEmail" Text='<%# Eval("ContactEmail") ==null ? String.Empty:Eval("ContactEmail") %>' Visible='<%# Eval("ContactEmail") == null ? false: true %>' />
                                </div>
                                <div class="row col-10 desc " visible='<%# Eval("AddressLine") == null ? false: true %>'>
                                    <asp:Label Text="Location:" runat="server" ID="preLocation" />
                                    &nbsp
                                    <asp:Label runat="server" ID="lblLocation" Text='<%# String.Concat(Eval("AddressLine")==null ? String.Empty:Eval("AddressLine")," ",Eval("LocationCity")==null ? String.Empty:Eval("LocationCity")," ", Eval("State")==null ? String.Empty:Eval("State")," ", Eval("LocationZip")==null ? String.Empty:Eval("LocationZip")) %>' />
                                </div>
                                <br />
                                <asp:Label Text='<%# Eval("ResourceTypeID").ToString() == "1" ? "Primary Responsibilites: ": (Eval("ResourceTypeID").ToString() == "2" ? "Event Description: ":"Training Description: ")  %>' runat="server" ID="preDescription" />
                                <br />
                                <div class="row col-10 desc " visible='<%# Eval("Description") == null ? false: true %>'>

                                    <asp:Label runat="server" ID="lblDecription" Text='<%# Eval("Description")==null ? String.Empty:Eval("Description") %>' Visible='<%# Eval("Description") == null ? false: true %>' />
                                    <br />
                                    <div class="row col-10 desc " visible='<%# Eval("WeeklyHours") == null ? false: true %>'>
                                        <asp:Label Text="Weekly Hours:" runat="server" ID="preWeeklyHours" />
                                        &nbsp
                                        <asp:Label runat="server" ID="lblWeeklyHours" Text='<%# Eval("WeeklyHours")==null ? String.Empty:Eval("WeeklyHours") %>' Visible='<%# Eval("WeeklyHours") == null ? false: true %>' />
                                    </div>
                                    <div class="row col-10 desc " visible='<%# Eval("Length") == null ? false: true %>'>
                                        <asp:Label Text="Length:" runat="server" ID="preLength" />
                                        &nbsp
                                        <asp:Label runat="server" ID="lblLength" Text='<%# Eval("Length") ==null ? String.Empty:Eval("Length") %>' Visible='<%# Eval("Length") == null ? false: true %>' />
                                    </div>
                                    <div class="row col-10 desc " visible='<%# Eval("Attire") == null ? false: true %>'>
                                        <asp:Label Text="Attire:" runat="server" ID="preAttire" />
                                        &nbsp
                                        <asp:Label runat="server" ID="lblAttire" Text='<%# Eval("Attire")==null ? String.Empty:Eval("Attire") %>' Visible='<%# Eval("Attire") == null ? false: true %>' />
                                    </div>
                                </div>
                                <br />
                                <asp:Label Text="Knowledge, Skills and Other Requirements:" runat="server" ID="preRequirements" Visible='<%# Eval("Requirements") == null ? false: true %>' />
                                <br />
                                <div class="row col-10 desc ">
                                    <asp:Label runat="server" ID="lblRequirements" Text='<%# Eval("Requirements")==null ? String.Empty:Eval("Requirements") %>' Visible='<%# Eval("Requirements") == null ? false: true %>' />
                                    <br />
                                </div>
                                <div class="row col-10 desc ">
                                    <asp:Label Text="Link:" runat="server" ID="preLink" />
                                    &nbsp
                                    <asp:Label runat="server" ID="lblLink" Text='<%# Eval("Link") ==null ? String.Empty:Eval("Link") %>' Visible='<%# Eval("Link") == null ? false: true %>' />
                                </div>
                                <br />
                                <asp:Label Text="Comments:" runat="server" ID="preComments" Visible='<%# Eval("Comments") == null ? false: true %>' />
                                <br />
                                <div class="row col-10 desc " visible='<%# Eval("Comments") == null ? false: true %>'>

                                    <asp:Label runat="server" ID="lblComments" Text='<%# Eval("Comments")==null ? String.Empty:Eval("Comments") %>' Visible='<%# Eval("Comments") == null ? false: true %>' />
                                    <br />
                                </div>
                                <br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
        </div>
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
                    <asp:Button runat="server" class="btn btn-dark" Text="Send Newsletter to Subscribers" ID="btnSend" OnClick="btnSend_Click" AutoPostBack="False"></asp:Button>
                </div>
            </div>
            <br />
        </div>
    </div>
</asp:Content>