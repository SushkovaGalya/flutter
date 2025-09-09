import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/historyCubit.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('История')),
      body: BlocBuilder<HistoryCubit, dynamic>(
        builder: (ctx, state) {
          if (state is HistoryLoaded) {
            return ListView(
              children: [
                ListTile(title: Text('Погода:'), tileColor: Colors.grey[200]),
                ...state.weatherHistory
                    .map((c) => ListTile(title: Text(c)))
                    .toList(),
                Divider(),
                ListTile(title: Text('УФ индексы:'), tileColor: Colors.grey[200]),
                ...state.uvHistory.map((e) {
                  final time = DateTime.parse(e['time']).toLocal();
                  return ListTile(
                    title: Text('UV ${e['uv']} — риск ${e['risk']}'),
                    subtitle: Text('${time.day}.${time.month}.${time.year} ${time.hour}:${time.minute}'),
                  );
                }).toList(),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}