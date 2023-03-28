import 'dart:convert';

import 'package:alquran/app/data/models/detail_surah.dart';
import 'package:alquran/app/data/models/surah.dart';
import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse("https://api.quran.gading.dev/surah");
  var res = await http.get(url);

  List data = (json.decode(res.body) as Map<String, dynamic>)["data"];

  // print(data[113]);

  // data dari API (raw) ubah ke bentuk -> Model
  Surah surrahAnnas = Surah.fromJson(data[113]);

  // print(surrahAnnas.toJson());
  // print(surrahAnnas.name);
  // print(surrahAnnas.number);
  // ==========================
  // print(surrahAnnas.name?.long);
  // print(surrahAnnas.number);

  Uri urlAnnas =
      Uri.parse("https://api.quran.gading.dev/surah/${surrahAnnas.number}");
  var resAnnas = await http.get(urlAnnas);

  Map<String, dynamic> dataAnnas =
      (jsonDecode(resAnnas.body) as Map<String, dynamic>)["data"];

  DetailSurah annas = DetailSurah.fromJson(dataAnnas);
  print(annas.name?.long);
  print(annas.verses![0].text?.arab);
}
