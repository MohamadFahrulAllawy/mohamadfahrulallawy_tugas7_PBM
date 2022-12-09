// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, deprecated_member_use, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:app/db/db_helper.dart';
import 'package:app/model/pegawai.dart';

class FormPegawai extends StatefulWidget {
  final Pegawai? pegawai;

  FormPegawai({this.pegawai});

  @override
  _FormPegawaiState createState() => _FormPegawaiState();
}

class _FormPegawaiState extends State<FormPegawai> {
  DbHelper db = DbHelper();

  TextEditingController? firstName;
  TextEditingController? lastName;
  TextEditingController? mobileNo;
  TextEditingController? email;

  @override
  void initState() {
    firstName = TextEditingController(
        text: widget.pegawai == null ? '' : widget.pegawai!.firstName);
    lastName = TextEditingController(
        text: widget.pegawai == null ? '' : widget.pegawai!.lastName);
    mobileNo = TextEditingController(
        text: widget.pegawai == null ? '' : widget.pegawai!.mobileNo);
    email = TextEditingController(
        text: widget.pegawai == null ? '' : widget.pegawai!.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        primary: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pegawai'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: firstName,
            decoration: InputDecoration(
                labelText: 'FirstName',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          TextField(
            controller: lastName,
            decoration: InputDecoration(
                labelText: 'LastName',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          TextField(
            controller: mobileNo,
            decoration: InputDecoration(
                labelText: 'Mobile No',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          ElevatedButton(
            child: (widget.pegawai == null)
                ? Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  )
                : Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
            style: style,
            onPressed: () {
              upsertPegawai();
            },
          )
        ],
      ),
    );
  }

  Future<void> upsertPegawai() async {
    if (widget.pegawai != null) {
      //insert

      await db.updatePegawai(Pegawai.fromMap({
        'id': widget.pegawai!.id,
        'firstName': firstName!.text,
        'lastName': lastName!.text,
        'mobileNo': mobileNo!.text,
        'email': email!.text,
      }));
      Navigator.pop(context, 'update');
    } else {
      //update
      await db.savePegawai(Pegawai(
        firstName: firstName!.text,
        lastName: lastName!.text,
        mobileNo: mobileNo!.text,
        email: email!.text,
      ));
      Navigator.pop(context, 'save');
    }
  }
}
