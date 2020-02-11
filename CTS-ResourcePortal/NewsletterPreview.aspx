﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="NewsletterPreview.aspx.cs" Inherits="CTS_ResourcePortal.NewsletterPreview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

    <link href="css.css" rel="stylesheet" />
    <div class="container">
        <h2>Preview Newsletter</h2>
        <br />
        <div class="section">
            <br />
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

                                    <asp:Label runat="server" ID="lblStartDate" Text='<%# Eval("StartDate")==null ? String.Empty:Eval("StartDate") %>' Visible='<%# Eval("StartDate") == null ? false: true %>' />
                                </div>
                                <div class="row col-10 desc " visible='<%# Eval("EndDate") == null ? false: true %>'>
                                    <asp:Label Text='<%# Eval("ResourceTypeID").ToString() == "1" ? "Expiration Date: ": (Eval("ResourceTypeID").ToString() == "2" ? "Registration Deadline: ":"Registration Deadline: ")  %>' runat="server" ID="preEndDate" />

                                    <asp:Label runat="server" ID="lblEndDate" Text='<%# Eval("EndDate")==null ? String.Empty:Eval("EndDate") %>' Visible='<%# Eval("EndDate") == null ? false: true %>' />
                                </div>
                                <div class="row col-10 desc " visible='<%# Eval("StartTime") == null ? false: true %>'>
                                    <asp:Label Text="Start Time:" runat="server" ID="preStartTime" />

                                    <asp:Label runat="server" ID="lblStartTime" Text='<%# Eval("StartTime")==null ? String.Empty:Eval("StartTime") %>' Visible='<%# Eval("StartTime") == null ? false: true %>' />
                                </div>
                                <div class="row col-10 desc " visible='<%# Eval("EndTime") == null ? false: true %>'>
                                    <asp:Label Text="End Time:" runat="server" ID="preEndTime" />
                                    <asp:Label runat="server" ID="lblEndTime" Text='<%# Eval("EndTime")==null ? String.Empty:Eval("EndTime") %>' Visible='<%# Eval("EndTime") == null ? false: true %>' />
                                </div>
                                <div class="row col-10 desc ">
                                    <asp:Label Text="Company/Orginization:" runat="server" ID="preCompany" />

                                    <asp:Label runat="server" ID="lblCompany" Text='<%# Eval("Company")==null ? String.Empty:Eval("Company") %>' Visible='<%# Eval("Company") == null ? false: true %>' />
                                </div>
                                <div class="row col-10 desc " visible='<%# Eval("ContactFirstName") == null ? false: true %>'>
                                    <asp:Label Text="Contact Name:" runat="server" ID="preContactName" />

                                    <asp:Label runat="server" ID="lblContactName" Text='<%# String.Concat(Eval("ContactFirstName")==null ? String.Empty:Eval("ContactFirstName")," ",Eval("ContactLastName")==null ? String.Empty:Eval("ContactLastName"))%>' />
                                </div>
                                <div class="row col-10 desc " visible='<%# Eval("ContactPhoneNumber") == null ? false: true %>'>
                                    <asp:Label Text="Contact Number:" runat="server" ID="preContactNumber" />

                                    <asp:Label runat="server" ID="lblContactNumber" Text='<%# Eval("ContactPhoneNumber") ==null ? String.Empty:Eval("ContactPhoneNumber") %>' Visible='<%# Eval("ContactPhoneNumber") == null ? false: true %>' />
                                </div>
                                <div class="row col-10 desc " visible='<%# Eval("ContactEmail") == null ? false: true %>'>
                                    <asp:Label Text="Contact Email:" runat="server" ID="preContactEmail" />

                                    <asp:Label runat="server" ID="lblContactEmail" Text='<%# Eval("ContactEmail") ==null ? String.Empty:Eval("ContactEmail") %>' Visible='<%# Eval("ContactEmail") == null ? false: true %>' />
                                </div>
                                <div class="row col-10 desc " visible='<%# Eval("AddressLine") == null ? false: true %>'>
                                    <asp:Label Text="Location:" runat="server" ID="preLocation" />

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

                                        <asp:Label runat="server" ID="lblWeeklyHours" Text='<%# Eval("WeeklyHours")==null ? String.Empty:Eval("WeeklyHours") %>' Visible='<%# Eval("WeeklyHours") == null ? false: true %>' />
                                    </div>
                                    <div class="row col-10 desc " visible='<%# Eval("Length") == null ? false: true %>'>
                                        <asp:Label Text="Length:" runat="server" ID="preLength" />

                                        <asp:Label runat="server" ID="lblLength" Text='<%# Eval("Length") ==null ? String.Empty:Eval("Length") %>' Visible='<%# Eval("Length") == null ? false: true %>' />
                                    </div>
                                    <div class="row col-10 desc " visible='<%# String.IsNullOrEmpty(Eval("Attire").ToString()) ? false: true %>'>
                                        <asp:Label Text="Attire:" runat="server" ID="preAttire" />

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

                                    <asp:Label runat="server" ID="lblLink" Text='<%# Eval("Link") ==null ? String.Empty:Eval("Link") %>' Visible='<%# Eval("Link") == null ? false: true %>' />
                                </div>
                                <br />
                                <asp:Label Text="Comments:" runat="server" ID="preComments" Visible='<%# Eval("Comments") == null ? false: true %>' />
                                <br />
                                <div class="row col-10 desc " visible='<%# String.IsNullOrEmpty( Eval("Comments").ToString())? false: true %>'>
                                    <asp:Label runat="server" ID="lblComments" Text='<%# Eval("Comments")==null ? String.Empty:Eval("Comments") %>' Visible='<%# String.IsNullOrEmpty( Eval("Comments").ToString()) ? false: true %>' />
                                    <br />
                                </div>
                                <br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="col-1"></div>
                <br />
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