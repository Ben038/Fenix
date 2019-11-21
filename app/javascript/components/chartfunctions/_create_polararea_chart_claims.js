
// var polarArea1 = document.getElementById('ReinsComm');

// var RCChart = new Chart(polarArea1, {
//     data = {
//     datasets: [{
//         data: [10, 20, 30]
//     }],

//     // These labels appear in the legend and in the tooltips when hovering different arcs
//     labels: [
//         'Red',
//         'Yellow',
//         'Blue'
//     ]
//     };
//     type: 'polarArea',
//     options: options {
//       backgroundColor:
//         'rgba(41, 52, 98, 1)',
//         'rgba(41, 52, 98, 0.8)',
//         'rgba(41, 52, 98, 0.6)',
//     }
//   });

var polarArea1= document.getElementById('reinsComm');

// 1. parse the data-country

//2. parse the data-process
//3. transform into abs the values in data-process


if (polarArea1) {
  var reinsComm = new Chart(polarArea1, {
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


  var polarArea2= document.getElementById('brokerComm');

  var brokerComm = new Chart(polarArea2, {
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

