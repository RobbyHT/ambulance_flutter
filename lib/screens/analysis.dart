import 'package:ambulance_flutter/models/count_data.dart';
import 'package:ambulance_flutter/utils/dispatch_util.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'login/login_screen.dart';

class Analysis extends StatefulWidget {
  @override
  _AnalysisState createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  List<CountData> _chartData;
  TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            '車趟統計',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          toolbarHeight: 60.0,
          backgroundColor: Color.fromRGBO(31, 60, 136, 1)),
      body: SafeArea(
        child: Scaffold(
          body: SfCircularChart(
            title: ChartTitle(text: '月份總趟數'),
            legend: Legend(
                isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            tooltipBehavior: _tooltipBehavior,
            series: <PieSeries<CountData, String>>[
              PieSeries<CountData, String>(
                dataSource: _chartData,
                xValueMapper: (CountData data, _) => data.key,
                yValueMapper: (CountData data, _) => data.count,
                dataLabelMapper: (CountData data, _) =>
                    data.key + ': ' + (data.count).toString() as String,
                radius: '60%',
                dataLabelSettings: DataLabelSettings(
                  margin: const EdgeInsets.all(0),
                  isVisible: true,
                  labelPosition: ChartDataLabelPosition.outside,
                  connectorLineSettings: const ConnectorLineSettings(
                      type: ConnectorType.curve, length: '20%'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getChartData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getDispatchCount().then((val) => setState(() {
            _chartData = val;
          }));
    });
  }

  // List<CountData> getChartData() {
  //   final List<CountData> chartData = [
  //     CountData(key: 'Oceania', count: 1600),
  //     CountData(key: 'Africa', count: 2490),
  //     CountData(key: 'S America', count: 2900),
  //     CountData(key: 'Europe', count: 23050),
  //     CountData(key: 'N America', count: 24880),
  //     CountData(key: 'Asia', count: 34390),
  //   ];

  //   return chartData;
  // }
}
