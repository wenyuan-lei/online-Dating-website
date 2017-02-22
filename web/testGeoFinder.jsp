<%-- 
    Document   : testGeoFinder
    Created on : Dec 2, 2014, 12:12:40 PM
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?v=3&key=AIzaSyC5PhkfM7zqb-zb79-1oRXSCaHiXmZiv3I&sensor=false">
            var place =  "New York";
            geocoder = new GClientGeocoder();
            geocoder.getLatLng(place, function(point) {
            if (!point) {
                alert(place + " not found");
            } else {
                var info = "<h3>"+place+"</h3>Latitude: "+point.y+"  Longitude:"+point.x;
                var marker = new GMarker(point);
                map.addOverlay(marker);
                marker.openInfoWindowHtml(info);
            }
});
        </script>

    </body>
</html>
