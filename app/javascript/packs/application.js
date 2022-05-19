// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import { initFlatpickr } from "../plugins/flatpickr";

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"

window.addEventListener("turbolinks:load", function() {
  initFlatpickr();
})

// active navbar link
const sections = document.querySelectorAll(".section");

window.addEventListener("scroll", function (event) {
  sections.forEach((section) => {
    let top = window.scrollY + 250;
    let offset = section.offsetTop;
    let height = section.offsetHeight;
    let id = section.getAttribute("id");

    if (top >= offset && top < offset + height) {
      document.querySelectorAll(".active").forEach((a) => {
        a.classList.remove("active");
      });

      document.querySelector("[href*=" + id + "]").classList.add("active");
    }
  });
});
