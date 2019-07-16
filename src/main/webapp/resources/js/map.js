    /* ==============================================
    MAP -->
    =============================================== */
    (function($) {
        "use strict";
        var locations=[ ['<div class="infobox"><h3 class="title"><a href="#">OUR OFFICE</a><span> +82 2-532-6500</span></h3><span>서울특별시 서초구 서초4동 1303-37 서초W타워 13층</span></div>',
        37.502581,
        127.024859,
        2]];
        var map=new google.maps.Map(document.getElementById('map'), {
            zoom: 16, minZoom:10, scrollwheel: false, navigationControl: true, mapTypeControl: true, scaleControl: false, draggable: true, styles: [ {
                "featureType": "administrative", "elementType": "labels.text.fill", "stylers": [{"featureType":"poi.business","elementType":"geometry.fill","stylers":[{"visibility":"on"}]}]
            }
            ], center: new google.maps.LatLng(37.502581, 127.024859), mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        
        );
        var infowindow=new google.maps.InfoWindow();
        var marker,
        i;
        for (i=0;
        i < locations.length;
        i++) {
            marker=new google.maps.Marker( {
                position: new google.maps.LatLng(locations[i][1], locations[i][2]), map: map, icon: '/jamong/resources/images/apple-touch-icon.png'
            }
            );
            google.maps.event.addListener(marker, 'click', (function(marker, i) {
                return function() {
                    infowindow.setContent(locations[i][0]);
                    infowindow.open(map, marker);
                }
            }
            )(marker, i));
        }
    })(jQuery);