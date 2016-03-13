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

		<div class="row">
			<div class="col-md-6" id="secondShow" style="height: 400px"></div>
			<div class="col-md-6" id="thirdShow" style="height: 400px"></div>
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
				[ 
		          'echarts', 
		          'echarts/chart/line', 
		          'echarts/chart/bar',
		          'echarts/chart/pie',
		          'echarts/chart/radar'
				 ], 
		function(ec) {
			var myChart = ec.init(document.getElementById("lineShow"));//init方法可以传入Theme样式名称, 'macarons');
			var myChartPie = ec.init(document.getElementById("thirdShow")); //init方法可以传入Theme样式名称, 'macarons');
			
			var option = {
				title : {
					text : '未来一周气温变化',
					subtext : '纯属虚构'
				},
				tooltip : {
					trigger : 'axis'
				},
				legend : {
					data : [ '最高气温', '最低气温' ]
				},
				toolbox : {
					show : true,
					feature : {
						magicType : {
							show : true,
							type : [ 'line', 'bar' ]
						},
						restore : {show: true}
					}
				},
				calculable : true,
				xAxis : [ {
					type : 'category',
					boundaryGap : false,
					data : [ '周一', '周二', '周三', '周四', '周五', '周六', '周日' ]
				} ],
				yAxis : [ {
					type : 'value',
					axisLabel : {
						formatter : '{value} °C'
					}
				} ],
				series : [ {
					name : '最高气温',
					type : 'line',
					data : [ 11, 11, 15, 13, 12, 13, 10 ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
					markLine : {
						data : [ {
							type : 'average',
							name : '平均值'
						} ]
					}
				}, {
					name : '最低气温',
					type : 'line',
					data : [ 1, -2, 2, 5, 3, 2, 0 ],
					markPoint : {
						data : [ {
							name : '周最低',
							value : -2,
							xAxis : 1,
							yAxis : -1.5
						} ]
					},
					markLine : {
						data : [ {
							type : 'average',
							name : '平均值'
						} ]
					}
				} ]
			},
			optionRadar = {
				    title : {
				        text: '预算 vs 开销（Budget vs spending）',
				        subtext: '纯属虚构'
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				        orient : 'vertical',
				        x : 'right',
				        y : 'bottom',
				        data:['预算分配（Allocated Budget）','实际开销（Actual Spending）']
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            restore : {show: true},
				        }
				    },
				    polar : [
				       {
				           indicator : [
				               { text: '销售（sales）', max: 6000},
				               { text: '管理（Administration）', max: 16000},
				               { text: '信息技术( Internet)', max: 40000},
				               { text: '客服（Customer Support）', max: 38000},
				               { text: '研发（Development）', max: 52000},
				               { text: '市场（Marketing）', max: 25000}
				            ]
				        }
				    ],
				    calculable : true,
				    series : [
				        {
				            name: '预算 vs 开销（Budget vs spending）',
				            type: 'radar',
				            data : [
				                {
				                    value : [4300, 10000, 28000, 35000, 50000, 19000],
				                    name : '预算分配（Allocated Budget）'
				                },
				                 {
				                    value : [5000, 14000, 28000, 31000, 42000, 21000],
				                    name : '实际开销（Actual Spending）'
				                }
				            ]
				        }
				    ]
				},
			optionPie = {
					title : {
						text : '可了不得站点用户访问来源',
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
								//show : true,
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
							restore : {show: true}
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
			//这接写这一行也可以 但是还是选择优秀的方法吧
			//ec.init(document.getElementById("lineShow")).setOption(option);
			//代替了下面两行
			//var myChart = ec.init(document.getElementById("lineShow"));
			//myChart.setOption(option);
			ec.init(document.getElementById("secondShow")).setOption(optionRadar,"dark");
			//ec.init(document.getElementById("thirdShow"),'macarons').setOption(option);
			myChartPie.setOption(optionPie);
		});
	</script>
</body>
</html>