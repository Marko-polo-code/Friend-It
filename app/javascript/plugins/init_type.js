// Can also be included with a regular script tag
import Typed from 'typed.js';


const iniType = () => {

  const welcome = document.getElementById("welcome")

  const options = {
    strings: ['Welcome back ', welcome.dataset.name],
    typeSpeed: 40,
    loop: true
  };

  new Typed('#welcome', options);
}

export { iniType };
