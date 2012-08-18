<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Dinner Deleted
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Dinner Deleted</h2>
    
    <p>Your dinner was successfully deleted.</p>
    
    <p><%=Html.ActionLink("Click for Upcoming Dinners", "Index") %></p>

</asp:Content>
