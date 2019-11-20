// const kpi = document.querySelector(".card-kpi");
// console.log(kpi);


// var ctx = document.getElementById('premiumChart').getContext('2d');
// var premiumChart = new Chart(ctx)

var ctx = document.getElementById('premiumChart');

if (ctx){


  var premiumChart = new Chart(ctx, {
      type: 'bar',
      data: {
          labels: JSON.parse(ctx.dataset.years),
          datasets: [{
              label: 'Premium',
              data: JSON.parse(ctx.dataset.processJson),
              backgroundColor: [
                  'rgba(41, 52, 98, 1)',
                  'rgba(41, 52, 98, 1)',
                  'rgba(41, 52, 98, 1)',
              ],
              borderColor: [
                   'rgba(41, 52, 98, 1)',
                  'rgba(41, 52, 98, 1)',
                  'rgba(41, 52, 98, 1)',
              ],
              borderWidth: 1
          }]
      },
      options: {
          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero: true
                  }
              }]
          },
          legend: {
            display: false,
          }
      }
  });

  var balance = document.getElementById('balanceChart');
  var balanceChart = new Chart(balance, {
      type: 'bar',
      data: {
          labels: JSON.parse(ctx.dataset.years),
          datasets: [{
              label: 'Balance',
              data: JSON.parse(balance.dataset.processJson),
              backgroundColor: [
                   'rgba(41, 52, 98, 1)',
                  'rgba(41, 52, 98, 1)',
                  'rgba(41, 52, 98, 1)',
              ],
              borderColor: [
                   'rgba(41, 52, 98, 1)',
                  'rgba(41, 52, 98, 1)',
                  'rgba(41, 52, 98, 1)',
              ],
              borderWidth: 1
          }]
      },
      options: {
          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero: true
                  }
              }]
          },
          legend: {
            display: false,
          }
      }
  });
}
