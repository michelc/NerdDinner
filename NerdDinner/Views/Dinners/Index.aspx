<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<NerdDinner.Helpers.PaginatedList<NerdDinner.Models.Dinner>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Upcoming Dinner
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Upcoming Dinners</h2>
    
    <ul>
        <% foreach (var dinner in Model)
           { %>
           
           <li>
                <%= Html.ActionLink(dinner.Title, "Details", new { id=dinner.DinnerID }) %>
                on
                <%= Html.Encode(dinner.EventDate.ToShortDateString()) %>
                @
                <%= Html.Encode(dinner.EventDate.ToShortTimeString()) %>
          </li>
           
        <% } %>
    </ul>
    
    <p id="pagination">
    <% if (Model.HasPreviousPage) { %>
        <%= Html.RouteLink("<<<", "UpcomingDinners", new { page=(Model.PageIndex-1) }) %>
    <% } %>
    <% if (Model.HasNextPage) { %>
        <%= Html.RouteLink(">>>", "UpcomingDinners", new { page = (Model.PageIndex + 1) })%>
    <% } %>
    </p>

</asp:Content>

