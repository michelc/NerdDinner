<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<NerdDinner.Models.Dinner>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete Confirmation
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete Confirmation</h2>
    
    <p>
    Please confirm you want to cancel the dinner titled:
    <em><%= Html.Encode(Model.Title) %> ?</em>
    </p>
    
    <% using (Html.BeginForm()) { %>
        <input type="submit" value="Delete" />
        &nbsp;
        <%= Html.ActionLink("Cancel", "Details", new { id = Model.DinnerID }) %>
    <% } %>

</asp:Content>
