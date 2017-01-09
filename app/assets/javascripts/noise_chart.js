$(function () {
    var len = 100;
    var base = Array.apply(null, {length: len}).map(Number.call, Number)
    var init_data = Array.apply(null, {length: len}).map(function(){return 0.1}, function(){return 0.1})
    Highcharts.chart('highcharts_container', {
        title: {
            text: 'Chart',
            x: -20 //center
        },
        xAxis: {
            categories: base
        },
        yAxis: {
            type: 'logarithmic',
            minorTickInterval: 0.1,
            min: 0.01,
            max: 2000,
            title: {
                text: 'Noise[-]'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '[-]'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        plotOptions: {
        line: {
            marker:{
                enabled: false
            }
        }
        },
        series: [{
            name: 'noise',
            data: init_data
        },
        {
            name: 'max',
            data: init_data
        }]
    });
});
