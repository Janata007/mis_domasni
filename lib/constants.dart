import 'package:shared_preferences/shared_preferences.dart';

var dateList = [
  DateTime(2022, 1, 22, 13).toString(),
  DateTime(2022, 1, 21, 14).toString(),
  DateTime(2022, 1, 20, 13).toString(),
  DateTime(2022, 1, 22, 18).toString(),
];
var trueDateList = [
  DateTime(2022, 1, 22, 13),
  DateTime(2022, 1, 21, 14),
  DateTime(2022, 1, 20, 13),
  DateTime(2022, 1, 22, 18),
];
var predmetiList = [
  'МиС',
  'БнП',
  'ТП',
  'Аипс',
];

getSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs;
}

/*
 DateTime(2021, 1, 22, 08).toString(),
  DateTime(2021, 1, 20, 3).toString(),
  DateTime(2021, 1, 21, 16).toString(),
  DateTime(2021, 1, 23, 11).toString(),
  DateTime(2021, 1, 21, 09).toString(),
  DateTime(2021, 1, 20, 3).toString(),
  DateTime(2021, 1, 23, 15).toString(),
  DateTime(2021, 1, 23, 18).toString()

'Иб',
  'Скит',
  'Днич',
  'Ввмн',
  'В',
  'Мм',
  'Дм',
  'Сп'

 */
