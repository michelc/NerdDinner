<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<NerdDinner.Models.Dinner>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	You Don't Own This Dinner
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Error Accessing Dinner</h2>
    
    <p>Sorry - but only the host of a Dinner can edit or delete it.</p>
    
    <p><%= Html.ActionLink("Back", "Details", new { id = Model.DinnerID }) %></p>

</asp:Content>
