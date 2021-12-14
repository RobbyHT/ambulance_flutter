import 'package:ambulance_flutter/models/count_data.dart';
import 'package:ambulance_flutter/utils/dispatch_util.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ManagerAnalysisScreen extends StatefulWidget {
  @override
  _ManagerAnalysisScreenState createState() => _ManagerAnalysisScreenState();
}

class _ManagerAnalysisScreenState extends State<ManagerAnalysisScreen> {
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
          ),
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
}
