import "bootstrap";
import flatpickr from "flatpickr";
import { initFlatpickr } from '../plugins/init_flatpickr';
import { initSwapFlatpickr } from '../plugins/init_swapflatpickr';
import { scrollToTop } from '../plugins/init_scroll_to_top_button';

initFlatpickr();
initSwapFlatpickr();
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
initFlatpickr();
scrollToTop();