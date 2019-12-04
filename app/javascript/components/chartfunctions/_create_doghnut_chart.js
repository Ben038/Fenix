var pieChart1 = document.getElementById("ClaimPaid");
if (pieChart1) {
var ClaimPaid = new Chart(pieChart1, {
  type: 'pie',
  data: {
    datasets: [{
      data: JSON.parse(pieChart1.dataset.processJson),
      backgroundColor: [ "#00818a", "#293462", "#f7be16", "#929ed1", "#f9ce4f", "#216583"],
      borderColor: [ "#00818a", "#293462", "#f7be16", "#929ed1", "#f9ce4f", "#216583"],
      borderWidth: 1
    }]
  },
  options: {
    maintainAspectRatio: false,
    cutoutPercentage: 40,
    responsive: false,
    legend: {
      display: false,
    }
  }
});
}
