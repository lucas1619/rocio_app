import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocio_app/components/app_bar/only_back_app_bar.dart';
import 'package:rocio_app/components/navigation_bar/navigation_bar.dart';
import 'package:rocio_app/store/auth.dart';
import 'package:rocio_app/store/report.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

// convert to statefull

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  //hook on close

  @override
  void dispose() {
    Provider.of<ReportStore>(context).reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authStoreOff = Provider.of<AuthStore>(context, listen: false);
    final reportStore = Provider.of<ReportStore>(context);

    reportStore.getFields(authStoreOff.user.id);

    return Scaffold(
      appBar: const OnlyBackAppBar(),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Center(
              child: Text(
                'Reporte',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20.0),
            DropdownSearch(
              items: reportStore.fields,
              itemAsString: (item) => item.name,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Campo",
                  hintText: "Campo",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              onChanged: (value) {
                reportStore.getCrops(value!.id);
              },
            ),
            const SizedBox(height: 20.0),
            DropdownSearch(
              itemAsString: (item) => item.name,
              items: reportStore.crops,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Cultivo",
                  hintText: "Cultivo",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              onChanged: (value) {
                reportStore.getReport(value!.id);
              },
            ),
            const SizedBox(height: 20.0),
            SfCartesianChart(
                title: ChartTitle(
                  text: 'Uso del agua en rocio vs sistema tradicional',
                ),
                legend: Legend(
                  isVisible: true, // para mostrar la leyenda
                  position: LegendPosition.bottom, // ubicación de la leyenda
                  overflowMode: LegendItemOverflowMode
                      .wrap, // para envolver los elementos de la leyenda en varias líneas
                  textStyle: const TextStyle(
                      fontSize: 12), // estilo de texto para la leyenda
                ),
                primaryXAxis: CategoryAxis(
                  labelStyle:
                      const TextStyle(fontSize: 12, color: Colors.black),
                ),
                series: <ChartSeries>[
                  // Renders spline chart
                  SplineSeries<ChartData, String>(
                    dataSource: reportStore.traditionalData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    color: const Color(0xff0AABE4),
                    name: 'Tradicional',
                    markerSettings: const MarkerSettings(
                      isVisible: true,
                      shape: DataMarkerType.circle,
                      color: Color(0xff0AABE4),
                      borderWidth: 2,
                    ),
                  ),
                  SplineSeries<ChartData, String>(
                    dataSource: reportStore.rocioData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    color: const Color(0xff61C02C),
                    name: 'Rocio',
                    markerSettings: const MarkerSettings(
                      isVisible: true,
                      shape: DataMarkerType.circle,
                      color: Color(0xff61C02C),
                      borderWidth: 2,
                    ),
                  ),
                ]),
            const SizedBox(height: 10.0),
            Card(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Indicadores',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                          '- Has ahorrado un ${reportStore.ahorro.toInt()}% de agua'),
                      const SizedBox(height: 10.0),
                      Text(
                          '- Consumo de ${reportStore.consumoRocio}L de agua en esta semana'),
                    ]),
              ),
            ))
          ]),
        ),
      ),
      bottomNavigationBar: const RocioNavigationBar(selectedIndex: 3),
    );
  }
}
