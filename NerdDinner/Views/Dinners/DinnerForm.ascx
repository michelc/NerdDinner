<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<NerdDinner.Controllers.DinnerFormViewModel>" %>

    <%= Html.ValidationSummary("Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="Title">Dinner Title:</label>
                <%= Html.TextBox("Title", Model.Dinner.Title)%>
                <%= Html.ValidationMessage("Title", "*") %>
            </p>
            <p>
                <label for="EventDate">EventDate:</label>
                <%= Html.TextBox("EventDate", String.Format("{0:g}", Model.Dinner.EventDate))%>
                <%= Html.ValidationMessage("EventDate", "*") %>
            </p>
            <p>
                <label for="Description">Description:</label>
                <%= Html.TextArea("Description", Model.Dinner.Description)%>
                <%= Html.ValidationMessage("Description", "*") %>
            </p>
            <p>
                <label for="Address">Address:</label>
                <%= Html.TextBox("Address", Model.Dinner.Address)%>
                <%= Html.ValidationMessage("Address", "*") %>
            </p>
            <p>
                <label for="Country">Country:</label>
                <%= Html.DropDownList("Country", Model.Countries) %>
                <%= Html.ValidationMessage("Country", "*") %>
            </p>
            <p>
                <label for="ContactPhone">ContactPhone:</label>
                <%= Html.TextBox("ContactPhone", Model.Dinner.ContactPhone)%>
                <%= Html.ValidationMessage("ContactPhone", "*") %>
            </p>
            <p>
                <label for="Latitude">Latitude:</label>
                <%= Html.TextBox("Latitude", String.Format("{0:F}", Model.Dinner.Latitude))%>
                <%= Html.ValidationMessage("Latitude", "*") %>
            </p>
            <p>
                <label for="Longitude">Longitude:</label>
                <%= Html.TextBox("Longitude", String.Format("{0:F}", Model.Dinner.Longitude))%>
                <%= Html.ValidationMessage("Longitude", "*") %>
            </p>
            <p>
                <input type="submit" value="Save" />
                &nbsp;
                <% if (Model.Dinner.DinnerID > 0)
                   { %>
                   <%= Html.ActionLink("Cancel", "Details", new { id = Model.Dinner.DinnerID }) %>
                <% }
                   else
                   { %>
                   <%=Html.ActionLink("Cancel", "Index") %>
                <% } %>
            </p>
        </fieldset>

    <% } %>
