import 'package:flutter/material.dart';
import 'package:gerenciador_estados/widgets/imc_gauge_range.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcGauge extends StatelessWidget {
  final double imc;

  const ImcGauge({super.key, required this.imc});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          showLabels: false,
          showAxisLine: false,
          showTicks: false,
          minimum: 12.5,
          maximum: 47.5,
          ranges: [
            ImcGaugeRange(
                color: Colors.blue, start: 12.5, end: 18.5, label: 'Magreza'),
            ImcGaugeRange(
                color: Colors.green, start: 18.5, end: 24.5, label: 'Normal'),
            ImcGaugeRange(
                color: Colors.yellow.shade600,
                start: 24.5,
                end: 29.9,
                label: 'Sobrepeso'),
            ImcGaugeRange(
                color: Colors.red.shade500,
                start: 29.59,
                end: 39.9,
                label: 'Obesidade'),
            ImcGaugeRange(
                color: Colors.red.shade900,
                start: 39.9,
                end: 47.5,
                label: 'Obesidade Grave')
          ],
          pointers: [
            NeedlePointer(
              value: imc,
              enableAnimation: true,
            )
          ],
        )
      ],
    );
  }
}
