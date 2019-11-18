
/* Set the width of the sidebar to 250px and the left margin of the page content to 250px */
function openNav(query) {
  document.getElementById("sidebar-main-js").style.marginLeft = "0";
  document.getElementById("id-container-all").style.marginLeft = "0";
  query.classList.add('open')
  const icon = document.getElementById("icon")
  icon.classList.add('fa-rotate-180')
}

/* Set the width of the sidebar to 0 and the left margin of the page content to 0 */
function closeNav(query) {
  document.getElementById("sidebar-main-js").style.marginLeft = "-150px";
  document.getElementById("id-container-all").style.marginLeft = "0";
  query.classList.remove('open')
  const icon = document.getElementById("icon")
  icon.classList.remove('fa-rotate-180')
}

const handleSidebarClick = () => {
  const query = document.querySelector(".sidebar-main")
  if (query.classList.contains('open')) {
  closeNav(query)
  } else {
    openNav(query)
  }
};

// const rotate = () => {
//   $( "" ).click(function() {
//     if (  $( this ).css( "transform" ) == 'none' ){
//         $(this).css("transform","rotate(180deg)");
//     } else {
//         $(this).css("transform","" );
//     }
//   });
// }

const sidebarclosebtn = document.getElementById("close-sidebar-btn-js")
sidebarclosebtn.addEventListener("click", handleSidebarClick);


