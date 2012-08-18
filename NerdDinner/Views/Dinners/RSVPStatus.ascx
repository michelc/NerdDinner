<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<NerdDinner.Models.Dinner>" %>

<script type="text/javascript">
    $(document).ready(function() {

        $("#rsvpmsg a").click(function() {
            var url = $(this).attr("href");
            $("#rsvpmsg")
                .fadeOut()
                    .html($.ajax({
                        type: "POST",
                        url: url,
                        cache: false,
                        async: false
                    }).responseText)
                    .fadeIn();
            return false;
        });

    });
   
</script>

<% if (Request.IsAuthenticated)
{ %>
    <% if (Model.IsUserRegistered(Context.User.Identity.Name))
{ %>
        <p>You are registered for this event!</p>
    <% }
else
{ %>
        <p id="rsvpmsg">
            <%=Html.ActionLink("RSVP for this event", "Register", "RSVP", new { id = Model.DinnerID }, null)%>
        </p>
    <% } %>
<% }
else
{ %>
    <p><a href="/Account/Logon">Logon</a> to RSVP for this event.</p>
<% } %>