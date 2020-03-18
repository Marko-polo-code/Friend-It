export function toggleMap() {
  const togglers = document.querySelectorAll(".map-toggler")
  const map = document.querySelector("#map")

 if (togglers.length) {
   togglers.forEach(toggler => {
    toggler.addEventListener('click', e => {
      map.classList.toggle("d-none")
    })  
   })
 }
}