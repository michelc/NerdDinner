<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<NerdDinner.Models.Dinner>" %>

<script src="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.2" type="text/javascript"></script>
<script src="/Scripts/Map.js" type="text/javascript"></script>

<div id="theMap"></div>

<script type="text/javascript">

    $(document).ready(function() {
        var latitude = <%= Model.Latitude.ToString(System.Globalization.CultureInfo.InvariantCulture) %>;
        var longitude = <%= Model.Longitude.ToString(System.Globalization.CultureInfo.InvariantCulture) %>;

        if ((latitude == 0) || (longitude == 0))
            LoadMap();
        else
            LoadMap(latitude, longitude, mapLoaded);
    });

    function mapLoaded() {
        var title = "<%= Html.Encode(Model.Title) %>";
        var address = "<%= Html.Encode(Model.Address) %>";
        
        LoadPin(center, title, address);
        map.SetZoomLevel(14);
    }

</script>