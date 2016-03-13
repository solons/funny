<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Echarts折线图展示</title>
<link rel="shortcut icon" href="../ico/Lightning.png">
<link rel="stylesheet" href="../bootstrap/bootstrap.min.css">
</head>
<body>
	<div class="container">

		<div class="row">
			<div class="col-md-12" id="lineShow" style="height: 400px;"></div>
		</div>

	</div>
	<script type="text/javascript" src="../bootstrap/jquery-1.12.0.min.js"></script>
	<script type="text/javascript" src="../echarts/echarts.js"></script>
	<script type="text/javascript">
		require.config({
			paths : {
				echarts : '../echarts'
			}
		});
		require(
				[ 'echarts', 
				  'echarts/chart/line', 
				  'echarts/chart/bar',
				  'echarts/chart/pie'
				],
				function(ec) {
					var myChart = ec.init(document.getElementById("lineShow")); //init方法可以传入Theme样式名称, 'macarons');
					option = {
						title : {
							text : '某站点用户访问来源',
							subtext : '纯属虚构',
							x : 'center'
						},
						tooltip : {
							trigger : 'item',
							formatter : "{a} <br/>{b} : {c} ({d}%)"
						},
						legend : {
							orient : 'vertical',
							x : 'left',
							data : [ '直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎' ]
						},
						toolbox : {
							show : true,
							feature : {
								magicType : {
									show : true,
									type : [ 'pie' ],
									option : {
										funnel : {
											x : '25%',
											width : '50%',
											funnelAlign : 'left',
											max : 1548
										}
									}
								},
							}
						},
						calculable : true,
						series : [ {
							name : '访问来源',
							type : 'pie',
							radius : '55%',
							center : [ '50%', '60%' ],
							data : [ {
								value : 335,
								name : '直接访问'
							}, {
								value : 310,
								name : '邮件营销'
							}, {
								value : 234,
								name : '联盟广告'
							}, {
								value : 135,
								name : '视频广告'
							}, {
								value : 1548,
								name : '搜索引擎'
							} ]
						} ]
					};
					myChart.setOption(option);
				});
	</script>
</body>
</html>