export function toggleMap() {
  const toggler = document.querySelector(".map-toggler")
  const map = document.querySelector("#map")

 if (toggler) {
   toggler.addEventListener('click', e => {
     map.classList.toggle("d-none")
   })
 }
}