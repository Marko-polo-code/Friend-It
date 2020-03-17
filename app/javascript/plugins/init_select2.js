import $ from 'jquery';
import 'select2';


const initSelect2 = () => {
  console.log("Hello")
  $('.select2').select2({tags: true});
};

export { initSelect2 };