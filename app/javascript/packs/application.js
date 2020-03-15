import "bootstrap";
import flatpickr from "flatpickr";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initFlatpickr } from '../plugins/init_flatpickr';
import { initSwapFlatpickr } from '../plugins/init_swapflatpickr';
import { initMapbox } from '../plugins/init_mapbox';
// import { initScrollFunc } from '../plugins/init_scroll_up_button';

initFlatpickr();
initSwapFlatpickr();
initMapbox();
// initScrollFunc();

