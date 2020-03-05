import "bootstrap";
import "../components/chartfunctions";
import "../components/sidebar";
import "../components/navbar";
import "../components/card";
// import { initUpdateNavbarOnScroll } from '../components/navbar';
// initUpdateNavbarOnScroll();
// to move cards on the pages of the dashboard
import Sortable from 'sortablejs';

// $(document).ready(function() {
        // Transition effect for navbar
        // $(window).scroll(function() {
        //   // checks if window is scrolled more than 500px, adds/removes solid class
        //   if($(this).scrollTop() > 500) {
        //       $('.navbar').addClass('solid');
        //   } else {
        //       $('.navbar').removeClass('solid');
        //   }
        // });
// });

const initUpdateNavbarOnScroll = () => {
  const navbar = document.getElementById('navbar');
  if (navbar) {
    window.addEventListener("scroll", () => {
      if (window.scrollY > 200) {
       navbar.classList.add("navbar-fenix-solid");
       navbar.classList.remove("navbar-fenix")
      } else {
        navbar.classList.add("navbar-fenix");
        navbar.classList.remove("navbar-fenix-solid");
      }
    });
  }
}

if(window.sortableKpi){
  Sortable.create(sortableKpi, {
    handle: '.card-kpi',
    animation: 150
  });
  Sortable.create(sortableCharts, {
    handle: '.card-chart',
    animation: 150
  });
}

// to move cards on the pages of the consulting HUB
// Sortable.create(listReceivedRequests, {
//   handle: '.card-service-hidden',
//   animation: 150
// });



// TRANSPARANT TO SOLID NAVBAR
