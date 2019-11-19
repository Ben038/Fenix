

var kpi1 = document.getElementById('kpiCommissions');
if (kpi1){


  var kpiCommissions = new Chart(kpi1, {
      type: 'line',
      data: {
          labels: JSON.parse(kpi1.dataset.years),
          datasets: [{
              label: '',
              data: JSON.parse(kpi1.dataset.processJson),
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
          },
          legend: {
            display: false,
          }
      }
  });

  var kpi2 = document.getElementById('kpiClaims');
  var kpiClaims = new Chart(kpi2, {
      type: 'line',
      data: {
          labels: JSON.parse(kpi2.dataset.years),
          datasets: [{
              label: '',
              data: JSON.parse(kpi2.dataset.processJson),
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
          },
          legend: {
            display: false,
          }
      }
  });

  var kpi3 = document.getElementById('kpiBalance');
  var kpiBalance = new Chart(kpi3, {
      type: 'line',
      data: {
          labels: JSON.parse(kpi3.dataset.years),
          datasets: [{
              label: '',
              data: JSON.parse(kpi3.dataset.processJson),
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
          },
          legend: {
            display: false,
          }
      }
  });
}
