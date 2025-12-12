// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "controllers"
import "custom/sprinkles"
  

import "trix"
import "@rails/actiontext"
import  'popper' 
  
import  'bootstrap' 
  
import  'tom-select'
addEventListener("turbo:load", (event) => {
  console.log('page loaded');
  document.querySelectorAll('.select-advanced').forEach((el)=>{
    let settings = {};
    new TomSelect(el,settings);
  });
})  

  
