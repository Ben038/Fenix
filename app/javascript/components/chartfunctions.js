import './chartfunctions/create_bar_chart'



var kpi1 = document.getElementById('kpiCommissions');
var kpiCommissions = new Chart(kpi1, {
    type: 'line',
    data: {
        labels: ["'16", "'17", "'18"],
        datasets: [{
            label: '',
            data: [-10, -15, -5],
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


var ctx = document.getElementById('premiumChart').getContext('2d');
var premiumChart = new Chart(ctx)

var ctx = document.getElementById('premiumChart');
var premiumChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: JSON.parse(ctx.dataset.years),
        datasets: [{
            label: 'Premium',
            data: JSON.parse(ctx.dataset.processJson),
            backgroundColor: [
                'rgba(180, 96, 76, 0.5)',
                'rgba(41, 52, 98, 0.5)',
                'rgba(247, 190, 22, 0.5)',
            ],
            borderColor: [
                'rgba(180, 96, 76, 1)',
                'rgba(41, 52, 98, 1)',
                'rgba(247, 190, 22, 1)',
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
        }
    }
});

var balance = document.getElementById('balanceChart');
var balanceChart = new Chart(balance, {
    type: 'bar',
    data: {
        labels: ['2017', '2018', '2019'],
        datasets: [{
            label: 'Balance',
            data: [120, 110, 100],
            backgroundColor: [
                'rgba(180, 96, 76, 0.5)',
                'rgba(41, 52, 98, 0.5)',
                'rgba(247, 190, 22, 0.5)',
            ],
            borderColor: [
                'rgba(180, 96, 76, 1)',
                'rgba(41, 52, 98, 1)',
                'rgba(247, 190, 22, 1)',
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
        }
    }
});

