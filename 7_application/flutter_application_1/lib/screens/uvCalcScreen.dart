import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/historyCubit.dart';

class UVScreen extends StatefulWidget {
  @override
  _UVScreenState createState() => _UVScreenState();
}

class _UVScreenState extends State<UVScreen> {
  final controller = TextEditingController();
  double? uvValue;
  int? risk;

  int calculateRisk(double uv) {
    if (uv < 3) return 1;
    if (uv < 6) return 2;
    if (uv < 8) return 3;
    if (uv < 11) return 4;
    return 5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('УФ индекс')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Введите УФ индекс'),
            ),
            ElevatedButton(
              onPressed: () {
                final val = double.tryParse(controller.text);
                if (val != null) {
                  final calcRisk = calculateRisk(val);
                  setState(() {
                    uvValue = val;
                    risk = calcRisk;
                  });
                  // Сохраняем в историю
                  context.read<HistoryCubit>().addUv(val, calcRisk);
                }
              },
              child: Text('Рассчитать и сохранить'),
            ),
            if (risk != null) Text('Уровень опасности: $risk'),
          ],
        ),
      ),
    );
  }
}