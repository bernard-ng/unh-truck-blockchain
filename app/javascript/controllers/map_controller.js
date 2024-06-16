import {Controller} from "@hotwired/stimulus"
import L from 'leaflet'
import 'leaflet-routing-machine'
import 'leaflet.markercluster'

const tiles = {
    openstreetmap: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    mapbox: 'https://api.mapbox.com/styles/v1/mapbox/navigation-day-v1/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoiMWNhbnNhIiwiYSI6ImNsdzZ5cHp3bTFheWUydHJ6dHA4empteWEifQ.a3bODguIOY5HqhsVIvW48Q'
}

export default class MapController extends Controller {
    static values = {start: String, destination: String }

    initialize() {
        this.markers = new L.markerClusterGroup()
        this.map = L.map('map', {center: [-11.6, 27.4], zoom: 13})

        L.tileLayer(tiles.mapbox, {
            maxZoom: 19,
            attribution: '&copy; <a href="https://mapbox.com">Mapbox</a>'
        }).addTo(this.map);
        super.initialize();
    }

    connect() {
        const start = this.startValue.split(',').map(c => parseFloat(c))
        const destination = this.destinationValue.split(',').map(c => parseFloat(c))

        this.markers.addLayers([
            L.marker(start).bindPopup('Swala').openPopup(),
            L.marker(destination).bindPopup('Destination').openPopup()
        ])

        this.map.addLayer(this.markers)
        this.map.fitBounds(new L.LatLngBounds([start, destination]))
    }
}
