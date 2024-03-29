﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="NewsletterPreview.aspx.cs" Inherits="CTS_ResourcePortal.NewsletterPreview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="modal fade" id="sendPrompt" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content container">
                <div class="modal-body">
                    <b class="">Send the newsletter?</b>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnNoSend" Text="No" runat="server" data-dismiss="modal" CssClass="btn btn-danger" />
                    <asp:Button ID="btnYesSend" Text="Yes" runat="server" OnClick="btnYesSend_Click" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="sent" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content container justify-content-center align-items-center text-center">
                <div class="modal-body">
                    <label class="">Newsletter has been sent out</label>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="section">
            <h2>Preview Newsletter</h2>
            <br />
            <div class="row justify-content-center align-items-center ">
                <div id="newsletterPreview" class="newsletterPreview col-10" runat="server">
                    <br />
                    <h2 id="h2Date" runat="server"></h2>
                    <hr />
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
                            <hr />
                            <h4 class="resourceTitle text-left"><%# Eval("ResourceName") %></h4>
                            <!-- Resource Details -->
                            <div class="row col-10 desc">
                                <asp:Label Text='<%# Eval("ResourceTypeID").ToString() == "1" ? "Date Posted: ": (Eval("ResourceTypeID").ToString() == "2" ? "Event Posted":"Start Date: ")  %>' runat="server" ID="preStartDate" />
                                <asp:Label CssClass="dbdata" runat="server" ID="lblStartDate" Text='<%#  Eval("StartDate")==null ? String.Empty: DateTime.Parse(Eval("StartDate").ToString()).ToString("MM/dd/yyyy") %>' Visible='<%# Eval("StartDate") == null ? false: true %>' />
                            </div>
                            <div class="row col-10 desc " visible='<%# Eval("EndDate") == null ? false: true %>'>
                                <asp:Label Text='<%# Eval("ResourceTypeID").ToString() == "1" ? "Expiration Date: ": (Eval("ResourceTypeID").ToString() == "2" ? "Registration Deadline: ":"Registration Deadline: ")  %>' runat="server" ID="preEndDate" />
                                <asp:Label CssClass="dbdata" runat="server" ID="lblEndDate" Text='<%# Eval("EndDate")==null ? String.Empty: DateTime.Parse(Eval("EndDate").ToString()).ToString("MM/dd/yyyy") %>' Visible='<%# Eval("EndDate") == null ? false: true %>' />
                            </div>
                            <div class="row col-10 desc ">
                                <asp:Label Text="Start Time: " runat="server" ID="preStartTime" Visible='<%# String.IsNullOrEmpty(Eval("StartTime").ToString())? false: true %>' />
                                <asp:Label CssClass="dbdata" runat="server" ID="lblStartTime" Text='<%# String.IsNullOrEmpty(Eval("StartTime").ToString())? "null":DateTime.Parse(Eval("StartTime").ToString()).ToString("hh:mm tt") %>' Visible='<%# String.IsNullOrEmpty(Eval("StartTime").ToString())? false: true %>' />
                                <%--<asp:Label CssClass="dbdata" runat="server" ID="lblStartTime" Text='<%# Eval("StartTime")==null ? String.Empty: DateTime.Parse(Eval("StartTime").ToString()).ToString("hh:mm tt") %>' Visible='<%# Eval("StartTime") == null ? false: true %>' />--%>
                            </div>
                            <div class="row col-10 desc ">
                                <asp:Label Text="End Time:" runat="server" ID="preEndTime" Visible='<%# String.IsNullOrEmpty(Eval("EndTime").ToString())? false: true %>' />
                                <asp:Label CssClass="dbdata" runat="server" ID="lblEndTime" Text='<%# String.IsNullOrEmpty(Eval("EndTime").ToString())? "null":DateTime.Parse(Eval("EndTime").ToString()).ToString("hh:mm tt") %>' Visible='<%# String.IsNullOrEmpty(Eval("EndTime").ToString())? false: true %>' />
                                <%--<asp:Label CssClass="dbdata" runat="server" ID="lblEndTime" Text='<%# Eval("EndTime")==null ? String.Empty: DateTime.Parse(Eval("EndTime").ToString()).ToString("hh:mm tt") %>' Visible='<%# Eval("EndTime") == null ? false: true %>' />--%>
                            </div>
                            <div class="row col-10 desc ">
                                <asp:Label Text="Company/Orginization:" runat="server" ID="preCompany" />
                                <asp:Label CssClass="dbdata" runat="server" ID="lblCompany" Text='<%# Eval("Company")==null ? String.Empty: Eval("Company") %>' Visible='<%# Eval("Company") == null ? false: true %>' />
                            </div>
                            <div class="row col-10 desc ">
                                <asp:Label Text="Contact Name:" runat="server" ID="preContactName" Visible='<%# Eval("ContactFirstName") == null ? false: true %>' />
                                <asp:Label CssClass="dbdata" runat="server" ID="lblContactName" Text='<%# String.Concat(Eval("ContactFirstName")==null ? String.Empty: Eval("ContactFirstName")," ",Eval("ContactLastName")==null ? String.Empty: Eval("ContactLastName"))%>' />
                            </div>
                            <div class="row col-10 desc ">
                                <asp:Label Text="Contact Number:" runat="server" ID="preContactNumber" Visible='<%# Eval("ContactPhoneNumber") == null ? false: true %>' />
                                <asp:Label CssClass="dbdata" runat="server" ID="lblContactNumber" Text='<%# Eval("ContactPhoneNumber") ==null ? String.Empty: Eval("ContactPhoneNumber") %>' Visible='<%# Eval("ContactPhoneNumber") == null ? false: true %>' />
                            </div>
                            <div class="row col-10 desc ">
                                <asp:Label Text="Contact Email:" runat="server" ID="preContactEmail" Visible='<%# Eval("ContactEmail") == null ? false: true %>' />
                                <asp:Label CssClass="dbdata" runat="server" ID="lblContactEmail" Text='<%# Eval("ContactEmail") ==null ? String.Empty: Eval("ContactEmail") %>' Visible='<%# Eval("ContactEmail") == null ? false: true %>' />
                            </div>
                            <div class="row col-10 desc ">
                                <asp:Label Text="Location:" runat="server" ID="preLocation" Visible='<%# Eval("AddressLine") == null ? false: true %>' />
                                <asp:Label CssClass="dbdata" runat="server" ID="lblLocation" Text='<%# String.Concat(Eval("AddressLine")==null ? String.Empty: Eval("AddressLine")," ",Eval("LocationCity")==null ? String.Empty:Eval("LocationCity")," ", Eval("State")==null ? String.Empty:Eval("State")," ", Eval("LocationZip")==null ? String.Empty:Eval("LocationZip")) %>' />
                                <br />
                            </div>
                            <asp:Label Text='<%# Eval("ResourceTypeID").ToString() == "1" ? "Primary Responsibilites: ": (Eval("ResourceTypeID").ToString() == "2" ? "Event Description: ":"Training Description: ")  %>' runat="server" ID="preDescription" Visible='<%# Eval("Description") == null ? false: true %>' />
                            <div class="row col-10 desc ">
                                <asp:Label runat="server" ID="lblDecription" Text='<%# Eval("Description")==null ? String.Empty: Eval("Description") %>' Visible='<%# Eval("Description") == null ? false: true %>' />
                            </div>
                            <div class="row col-10 desc ">
                                <asp:Label Text="Weekly Hours:" runat="server" ID="preWeeklyHours" Visible='<%# Eval("WeeklyHours") == null ? false: true %>' />
                                <asp:Label CssClass="dbdata" runat="server" ID="lblWeeklyHours" Text='<%# Eval("WeeklyHours")==null ? String.Empty: Eval("WeeklyHours") %>' Visible='<%# Eval("WeeklyHours") == null ? false: true %>' />
                            </div>
                            <div class="row col-10 desc ">
                                <asp:Label Text="Length:" runat="server" ID="preLength" Visible='<%#  String.IsNullOrEmpty( Eval("Length").ToString()) ? false: true %>' />
                                <asp:Label CssClass="dbdata" runat="server" ID="lblLength" Text='<%# Eval("Length") ==null ? String.Empty: Eval("Length") %>' Visible='<%# Eval("Length") == null ? false: true %>' />
                            </div>
                            <div class="row col-10 desc ">
                                <asp:Label Text="Attire:" runat="server" ID="preAttire" Visible='<%# String.IsNullOrEmpty(Eval("Attire").ToString()) ? false: true %>' />
                                <asp:Label CssClass="dbdata" runat="server" ID="lblAttire" Text='<%# Eval("Attire")==null ? String.Empty: Eval("Attire") %>' Visible='<%# Eval("Attire") == null ? false: true %>' />
                            </div>
                            <asp:Label Text="Knowledge, Skills and Other Requirements:" runat="server" ID="preRequirements" Visible='<%# Eval("Requirements") == null ? false: true %>' />
                            <br />
                            <div class="row col-10 desc ">
                                <asp:Label runat="server" ID="lblRequirements" Text='<%# Eval("Requirements")==null ? String.Empty: Eval("Requirements") %>' Visible='<%# Eval("Requirements") == null ? false: true %>' />
                            </div>
                            <br />
                            <div class="row col-10 desc ">
                                <asp:Label Text="Link:" runat="server" ID="preLink" Visible='<%# Eval("Link") == null ? false: true %>' />
                                <asp:Label CssClass="dbdata" runat="server" ID="lblLink" Text='<%# Eval("Link") ==null ? String.Empty:Eval("Link") %>' Visible='<%# Eval("Link") == null ? false: true %>' />
                            </div>
                            <br />
                            <asp:Label Text="Comments:" runat="server" ID="preComments" Visible='<%# Eval("Comments").ToString() == "" ? false: true %>' />
                            <div class="row col-10 desc " visible='<%# String.IsNullOrEmpty( Eval("Comments").ToString())? false: true %>'>
                                <asp:Label CssClass="dbdata" runat="server" ID="lblComments" Text='<%# Eval("Comments")==null ? String.Empty: Eval("Comments") %>' Visible='<%# String.IsNullOrEmpty( Eval("Comments").ToString()) ? false: true %>' />
                            </div>
                            <br />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <br />
            <hr />
            <br />
            <div class="row justify-content-center align-items-center text-center">
                <div class="col-md-4">
                    <asp:Button Text="Return to Newsletter Creation" runat="server" ID="btnReturn" CssClass="btn btn-primary" OnClick="btnReturn_Click" />
                </div>
                <div class="col-md-4">
                    <asp:Button runat="server" class="btn btn-primary" Text="Send Newsletter to Subscribers" ID="btnSend" OnClick="btnSend_Click" AutoPostBack="False"></asp:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>