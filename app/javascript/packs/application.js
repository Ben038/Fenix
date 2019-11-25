import "bootstrap";
import "../components/chartfunctions";
import "../components/sidebar";
import "../components/navbar";

// to move cards on the pages of the dashboard
import Sortable from 'sortablejs';

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
window.addEventListener("scroll", (event) => {
  if (window.scrollY > 200) {
    document.querySelector(".navbar-fenix").classList.add("solid");
  }
  else {
    document.querySelector(".navbar-fenix").classList.remove("solid");
  }
});
