<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${myappurl}resource/heighcharts/js/highcharts.js"></script>
<script src="${myappurl}resource/heighcharts/js/highcharts-3d.js"></script>
<script src="${myappurl}resource/heighcharts/js/modules/exporting.js"></script>


</head>
<body>
<div id="container" style="height: 500px;"></div>
<div class="btn-group" style="display: table; width: auto;margin-left: auto;
margin-right: auto;" ></div>
</body>
<script>
Highcharts.chart('container', {
    chart: {
        type: 'pie',
        options3d: {
            enabled: true,
            alpha: 45,
            beta: 0
        }
    },
    title: {
        text: '各科室待检修设备情况'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            depth: 35,
            dataLabels: {
                enabled: true,
                format: '{point.name}'
            }
        }
    },
    series: [{
        type: 'pie',
        name: '待检测设备',
        data: [
            ['外科', 45],
            ['内科', 26],
            {
                name: '核磁共振',
                y: 12,
                sliced: true,
                selected: true
            },
            ['眼科', 8],
            ['耳鼻喉科', 6],
            ['儿科', 7]
        ]
    }]
});
</script>
</html>