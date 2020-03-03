var options = {
  chart: {
    type: 'line'
  },
  series: [{
    name: 'sales',
    data: [30,40,35,50,49,60,70,91,125]
  }],
  xaxis: {
    categories: [1991,1992,1993,1994,1995,1996,1997, 1998,1999]
  }
}

var chart = new ApexCharts(document.querySelector("#chart"), options);

chart.render();



    // class LineChart extends React.Component {

    //   constructor(props) {
    //     super(props);

    //     this.state = {
    //       options: {
    //         chart: {
    //               zoom: {
    //                   enabled: false
    //               }
    //           },
    //           dataLabels: {
    //               enabled: false
    //           },
    //           stroke: {
    //               curve: 'straight'
    //           },
    //           title: {
    //               text: 'Product Trends by Month',
    //               align: 'left'
    //           },
    //           grid: {
    //               row: {
    //                   colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
    //                   opacity: 0.5
    //               },
    //           },
    //           xaxis: {
    //               categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'],
    //           }
    //       },
    //       series: [{
    //           name: "claims",
    //           data: JSON.parse(totalCostClaim.dataset.processJson),
    //       }],
    //     }
    //   }

    // //   render() {

    // //     return (
    // //       <div id="chart-claims">
    // //         <ReactApexChart options={this.state.options} series={this.state.series} type="line" height="350"/>
    // //       </div>
    // //     );
    // //   }
    // // }

    // // const domContainer = document.querySelector('#app');
    // // ReactDOM.render(React.createElement(LineChart), domContainer);
