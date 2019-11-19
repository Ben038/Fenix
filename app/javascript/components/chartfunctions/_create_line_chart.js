

var kpi1 = document.getElementById('kpiCommissions');
if (kpi1){


  var kpiCommissions = new Chart(kpi1, {
      type: 'line',
      data: {
          labels: ["2016", "2017", "2018"],
          datasets: [{
              label: '',
              data: [-15, -12, -13.6],
              showLines: true
          }]
      },
      options: {

          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero: true
                  }
              }]
          }
      }
  });

  var kpi2 = document.getElementById('kpiClaims');
  var kpiClaims = new Chart(kpi2, {
      type: 'line',
      data: {
          labels: ["2016", "2017", "2018"],
          datasets: [{
              label: '',
              data: [-70, -65, -64.51],
              showLines: true
          }]
      },
      options: {
          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero: true
                  }
              }]
          }
      }
  });

  var kpi3 = document.getElementById('kpiBalance');
  var kpiBalance = new Chart(kpi3, {
      type: 'line',
      data: {
          labels: ["2016", "2017", "2018"],
          datasets: [{
              label: '',
              data: [-4, -15, -26.1],
              showLines: true
          }]
      },
      options: {
          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero: true
                  }
              }]
          }
      }
  });
}
