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
<div id="containerColumn" style="min-width: 300px; height: 400px; margin: 0 auto">
</div>
<div id="containerPie" style="min-width: 300px; height: 400px; margin: 0 auto">
</div>
<div class="btn-group" style="display: table; width: auto;margin-left: auto;
margin-right: auto;" ></div>
  

</body>
<script>
function getCharColAlarmNumJSON()
{
	  $.get("getCharColAlarmNumJSON.do",function (data) {
		  
		    "{1,2,3}|{5,6,7}";
		  
		  dataArray = data.split('|');
		  initColumnChart(eval(dataArray[0]),eval(dataArray[1]))
		  
		  var a = "1";
		  var b = "2";
		  alert(eval(a+b));
	    });
}
	
function getChartPieDeviceNumJSON()
{
	  $.get("getChartPieDeviceNumJSON.do",function (data) {
		  initPieChart(eval(data))
	    });
	}
	
function initColumnChart(myJsonArray,jsonType)
{
	 $('#containerColumn').highcharts({
	        chart: {
	            type: 'column',
	            options3d: {
	                enabled: true,
	                alpha: 15,
	                beta: 15,
	                viewDistance: 25,
	                depth: 40
	            },
	            marginTop: 80,
	            marginRight: 40
	        },
	        title: {
	            text: '各科室正常使用设备和待检测设备分布情况'
	        },
	        xAxis: {
	            categories: jsonType
	        },
	        yAxis: {
	            allowDecimals: false,
	            min: 0,
	            title: {
	                text: '设备数量'
	            }
	        },
	        tooltip: {
	            headerFormat: '<b>{point.key}</b><br>',
	            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
	        },
	        plotOptions: {
	            column: {
	                stacking: 'normal',
	                depth: 40
	            }
	        },
	        series:myJsonArray
	    });
	}

function initPieChart(pieJSON)
{
	  $('#containerPie').highcharts({
	        chart: {
	            type: 'pie',
	            options3d: {
	                enabled: true,
	                alpha: 45
	            }
	        },
	        title: {
	            text: '各科室设备数量'
	        },
	        subtitle: {
	            text: '分布图'
	        },
	        plotOptions: {
	            pie: {
	                innerSize: 100,
	                depth: 45
	            }
	        },
	        series:pieJSON 
	    });
	}

$(document).ready(function(){
	getCharColAlarmNumJSON();
	getChartPieDeviceNumJSON();
	
});
</script>
</html>