// Charts used in the Claims
// --> is it necessary to keep it separate. I would rather integrate it in the file with all Polar_Area_charts.

var polarArea1= document.getElementById('claimsPaid');

// 1. parse the data-country
//2. parse the data-process
//3. transform into abs the values in data-process
if (polarArea1) {
  var claimsPaid = new Chart(polarArea1, {
    type: 'polarArea',
    data : {
      labels: JSON.parse(polarArea1.dataset.countries),
      datasets: [{
        data: JSON.parse(polarArea1.dataset.processJson),
        backgroundColor: [ "#00818a", "#f7be16", "#293462", "#fad875", "#005c63", "#4659a7", "#cb9907", "#e5e8f4", "#216583", "#929ed1"],
      }],
    },
    options: {
      legend: {
        display: false,
      }
    }
  });


  var polarArea2= document.getElementById('claimsRes');

  var claimsRes = new Chart(polarArea2, {
    type: 'polarArea',
    data : {
      labels: JSON.parse(polarArea2.dataset.countries),
      datasets: [{
        data: JSON.parse(polarArea2.dataset.processJson),
          backgroundColor: [ "#00818a", "#f7be16", "#293462", "#fad875", "#005c63", "#4659a7", "#cb9907", "#e5e8f4", "#216583", "#929ed1"],
      }],
    },
    options: {
      legend: {
        display: false,
      }
    }
  });
}

