
var progress1 = document.getElementById('renewalProgress')

if (progress) {
var renewalProgress = new Chart(progress1, {
    type: 'doughnut',
    data: {
      labels: ["Australia", ""],
      datasets: [{
        label: '',
        data: [98, 2]
      }]
    }
});

}
