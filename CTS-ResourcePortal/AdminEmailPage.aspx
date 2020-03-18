<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AdminEmailPage.aspx.cs" Inherits="CTS_ResourcePortal.AdminEmailPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <link href="AdminEmailPage.css" rel="stylesheet" />
    <div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content" style="margin-top: 55%; }">

                <h4 class="modal-title"></h4>

                <div class="modal-body" style="color: black">
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" ID="close" class="btn btn-danger" data-dismiss="modal"/>
                </div>
            </div>
        </div>
    </div>
<style>
</style>

    <div class="container contact">
	<div class="row">
		<div class="col-md-3" style="background-color: #435d7d;">
			<div class="contact-info">
				<img src="https://image.ibb.co/kUASdV/contact-image.png" alt="image" style="margin-left: 31%;"/>
				<h2>Edit Automated Email</h2>
			</div>
		</div>
		<div class="col-md-9">
			<div class="contact-form">
				
				<div class="form-group">
				  
				  <div class="col-sm-10">        
                      <asp:DropDownList ID="DdlMonths" runat="server" class="form-control"  name="lname" OnSelectedIndexChanged="DdlMonths_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Enabled="true" Text="Type" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Accept Citizen" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Reject Citizen" Value="2"></asp:ListItem>
                    </asp:DropDownList>
				  </div>
				</div>

                <div class="form-group">
				  
				  <div class="col-sm-10">        
                       <asp:TextBox ID="txtSubject" class="form-control" runat="server" placeholder="Subject"></asp:TextBox>
				  </div>
				</div>

				<div class="form-group">
				  
				  <div class="col-lg-10">

                     <asp:TextBox ID="txtComment" class="form-control" style="height:150px;" Wrap="True"  TextMode="MultiLine" runat="server"></asp:TextBox>

                            <%--<asp:TextBox ID="txtComment" Style="height: 150px; width: 585px;" Wrap="True" TextMode="MultiLine" runat="server"></asp:TextBox>--%>

                            <!--<textarea class="form-control" rows="5" id="comment" placeholder="Reason"></textarea>-->
                        </div>
                    </div>
                    <div class="row justify-content-start align-items-center">
                        <div class="col-md-2">
                            <asp:Button ID="btnCreate" runat="server" Text="Update" class="btn btn-dark" OnClick="btnCreate_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>