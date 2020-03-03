
// function increaseWidthServiceIntegration {
//   document.getElementById("service-1").style.width = "100%";
//   document.getElementById("service-2").style.width = "0";
//   document.getElementById("service-3").style.width = "0";
// }

// const serviceIntegration = document.getElementById("service-1");
// const serviceAnalytics = document.getElementById("service-2");
// const serviceAudit = document.getElementById("service-3");

function openCard(query) {
  query.classList.add('open');
}

function closeCard(query) {
  query.classList.remove('open')
}

const handleCardSize = (e) => {
  const query = document.querySelector(".container-why-wrapper")
  console.log(query.classList.contains('open'))
  if (query.classList.contains('open')) {
    closeCard(query)
  } else {
    openCard(query)
  }
};

const cardOpenBtn = document.getElementById("btn-yellow-services-js")
if(cardOpenBtn){
  cardOpenBtn.addEventListener("click", handleCardSize);
}
