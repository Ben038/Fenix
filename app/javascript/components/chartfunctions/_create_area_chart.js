// area chart is made of a combination of the linear chart and the fill option add to it.

Chart.defaults.global.elements.line.fill = false;

var totalCostClaim = document.getElementById('claimsAndRes');
var totalClaimPaid = document.getElementById('claimsPaid2');
if (totalCostClaim){


  var claimsAndRes = new Chart(totalCostClaim, {
      type: 'line',
      data: {
          labels: JSON.parse(totalCostClaim.dataset.years),
          datasets: [{
              label: 'Claims Paid & Res',
              data: JSON.parse(totalCostClaim.dataset.processJson),
              showLines: true,
              borderColor: "#00818a",
              fill: 'origin',
          }]
      },
      options: {
          maintainAspectRatio: false,
          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero: true
                  }
              }]
          },
          legend: {
            display: true,
          }
      }
  });



};
