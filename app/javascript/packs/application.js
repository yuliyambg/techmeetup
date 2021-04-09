// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

function getWeather() {
    navigator.geolocation.getCurrentPosition(onSuccess);    
  }
  
function onSuccess(pos) {
    const weatherText = document.getElementById('weather');
  
    
    const uri = `https://api.openweathermap.org/data/2.5/weather?lat=${pos.coords.latitude}&lon=${pos.coords.longitude}&appid=25179022956c5c92b9b92d55bbf284f3&units=imperial`
    fetch(uri).then(res => res.json())
        .then(data => {
          weatherText.innerHTML = data.name + ": " + data.main.temp + "&deg; F";
        })
  }
  
  document.addEventListener('DOMContentLoaded', getWeather);