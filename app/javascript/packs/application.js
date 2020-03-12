import "bootstrap";
import flatpickr from "flatpickr";
import { initFlatpickr } from '../plugins/init_flatpickr';
import { initSwapFlatpickr } from '../plugins/init_swapflatpickr';

initFlatpickr();
initSwapFlatpickr();
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
initFlatpickr();
