import "bootstrap";
import flatpickr from "flatpickr";
import 'mapbox-gl/dist/mapbox-gl.css';
import 'select2/dist/css/select2.css';
import { initFlatpickr } from '../plugins/init_flatpickr';
import { initSwapFlatpickr } from '../plugins/init_swapflatpickr';
import { initMapbox } from '../plugins/init_mapbox';
import { materialDesign } from '../plugins/init_landing';
import { initScrollFunc } from '../plugins/init_scroll_up_button';
import { initSelect2 } from '../plugins/init_select2';


initFlatpickr();
initSwapFlatpickr();
initMapbox();
materialDesign();
initScrollFunc();
initSelect2();
console.log(888)
