<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<NerdDinner.Models.Dinner>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Dinner : <%= Html.Encode(Model.Title) %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details</h2>

    <p>
        <strong>When:</strong>
        <%= Model.EventDate.ToShortDateString() %>
        <strong>@</strong>
        <%= Model.EventDate.ToShortTimeString() %>
    </p>
    <p>
        <strong>Where:</strong>
        <%= Html.Encode(Model.Address) %>
        <%= Html.Encode(Model.Country) %>
    </p>
    <p>
        <strong>Description:</strong>
        <%= Html.Encode(Model.Description) %>
    </p>
    <p>
        <strong>Organizer:</strong>
        <%= Html.Encode(Model.HostedBy) %>
        (<%= Html.Encode(Model.ContactPhone) %>)
    </p>

    <%=Html.ActionLink("Edit", "Edit", new { id=Model.DinnerID }) %> |
    <%=Html.ActionLink("Back to List", "Index") %>

</asp:Content>