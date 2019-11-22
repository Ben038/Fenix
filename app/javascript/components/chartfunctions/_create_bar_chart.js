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
              backgroundColor: [ "#00818a", "#293462", "#f7be16", "#929ed1", "#f9ce4f", "#216583"],
              borderColor: [ "#00818a", "#293462", "#f7be16", "#929ed1", "#f9ce4f", "#216583"],
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
              backgroundColor: [ "#00818a", "#293462", "#f7be16", "#929ed1", "#f9ce4f", "#216583"],
              borderColor: [ "#00818a", "#293462", "#f7be16", "#929ed1", "#f9ce4f", "#216583"],
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
