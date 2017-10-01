// var weatherData = function(info) {
function weatherData (info) {
  Highcharts.chart('container', {
      title: {
        text: 'Weather Data: ' + info['start_date'] + ' to ' + info['end_date']
      },
      subtitle: {
        text: 'Source: http://weather.ggy.uga.edu'
      },
      xAxis: {
        categories: info['categories']
      },
      yAxis: {
        title: {
          text: 'Weather Readings'
        }
      },
      legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle'
      },
      series: info['data']
  });
}
