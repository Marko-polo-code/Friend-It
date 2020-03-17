import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const fitMapToMarkers = (map, markers) => {
  console.log(markers)
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    if (markers.length > 0) {

    
      markers.forEach((marker) => {

        // const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

        // Create a HTML element for your custom marker
        const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = `url('${marker.image_url}')`;
        element.style.backgroundSize = 'contain';
        element.style.width = '25px';
        element.style.height = '25px';
        element.style.borderRadius="50%"

        // Pass the element as an argument to the new marker
        new mapboxgl.Marker(element)
          .setLngLat([marker.lng, marker.lat])
          // .setPopup(popup)
          .addTo(map);
      });
    fitMapToMarkers(map, markers);
  }
}
};

export { initMapbox };
