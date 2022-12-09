// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:app/ui/list_pegawai_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 7 PBM',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ListPegawaiPage(),
    );
  }
}
