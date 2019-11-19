
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

var reinsComm = new Chart(polarArea1, {
type: 'polarArea',
data : {
    labels: ['Red', 'Yellow', 'Blue'],
    datasets: [{
        data: [10, 20, 30],
        backgroundColor: [
                  'rgba(41, 52, 98, 0.6)',
                  'rgba(41, 52, 98, 0.8)',
                  'rgba(41, 52, 98, 1)',
              ]
    }],

  },
});


var polarArea2= document.getElementById('brokerComm');

var brokerComm = new Chart(polarArea2, {
type: 'polarArea',
data : {
    labels: ['Red', 'Yellow', 'Blue'],
    datasets: [{
        data: [10, 20, 30],
        backgroundColor: [
                  'rgba(41, 52, 98, 0.6)',
                  'rgba(41, 52, 98, 0.8)',
                  'rgba(41, 52, 98, 1)',
              ]
    }],

  },
});
