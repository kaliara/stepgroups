var _lat;
var _lng;

function loadGoogleMap(lat, lng, callback) {
  _lat = lat;
  _lng = lng;
  var callback = (callback == undefined) ? 'showMap' : callback;
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyBGHysY1xS3V8oUhsHAzeV0KhG4ZGRkl_U&sensor=false&callback=" + callback;
  document.body.appendChild(script);
}

function showMap() {
  var latlng = new google.maps.LatLng(_lat, _lng);
  var myOptions = {
    zoom: 15,
    panControl: false,
    streetViewControl: false,
    mapTypeControlOptions: { style: google.maps.MapTypeControlStyle.DROPDOWN_MENU},
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("google_map"), myOptions)
  var marker = new google.maps.Marker({
    position: latlng,
    map: map
  });
}

function refreshMap() {
  updateMap($('#meeting_address_street1').val().replace(/\s/,'+') + '+' + $('#meeting_address_city').val().replace(/\s/,'+') + ',+' + $('#meeting_address_state').val().replace(/\s/,'+') + ',+' + $('#meeting_address_zip_code').val().replace(/\s/,'+'));
}

function updateMap(address) {
  var geocoder = new google.maps.Geocoder;
  var latlng;
  var myOptions = {
    zoom: 15,
    panControl: false,
    streetViewControl: false,
    mapTypeControlOptions: { style: google.maps.MapTypeControlStyle.DROPDOWN_MENU},
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("google_map"), myOptions)
  var marker = new google.maps.Marker({
    position: latlng,
    map: map
  });

  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      $('#google_maps_address_lat').val(results[0].geometry.location.lat());
      $('#google_maps_address_lng').val(results[0].geometry.location.lng());
      map.setCenter(results[0].geometry.location);
      marker.setPosition(results[0].geometry.location);
    }
  });
}
