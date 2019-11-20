import "bootstrap";
import "../components/chartfunctions";
import "../components/sidebar";
import "../components/navbar";
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




window.addEventListener("scroll", (event) => {
  if (window.scrollY > 200) {
    document.querySelector(".navbar-fenix").classList.add("solid");
  }
  else {
    document.querySelector(".navbar-fenix").classList.remove("solid");
  }
});
