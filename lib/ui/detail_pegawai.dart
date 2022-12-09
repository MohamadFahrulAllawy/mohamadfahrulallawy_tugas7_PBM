// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:app/model/pegawai.dart';

class DetailPage extends StatelessWidget {
  final Pegawai? pegawai;

  DetailPage(this.pegawai);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Firs name : ${pegawai!.firstName}'),
            Text('Last name : ${pegawai!.lastName}'),
            Text('Mobile No : ${pegawai!.mobileNo}'),
            Text('Email : ${pegawai!.email}'),
          ],
        ),
      ),
    );
  }
}
