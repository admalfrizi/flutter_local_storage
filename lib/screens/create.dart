import 'package:flutter/material.dart';
import 'package:local_storage_tutorial/screens/widget/custom_btn.dart';
import 'package:local_storage_tutorial/screens/widget/edit_text.dart';

import '../models/person.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({
    super.key,
    this.person
  });

  final Person? person;

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  final TextEditingController _nim = TextEditingController();
  final TextEditingController _kelas = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _jurusan = TextEditingController();


  getMhs() {
    return Person(
        name: _name.text,
        kelas: _kelas.text,
        nim: _nim.text,
        jurusan: _jurusan.text
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Buat Data"
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              EditText(
                  nameEdtTxt: "Nama",
                  txtEdt: _name,
                  txtType: TextInputType.text,
                  hintTxt: "Masukan Nama"
              ),
              const SizedBox(
                height: 10,
              ),
              EditText(
                  nameEdtTxt: "NIM",
                  txtEdt: _nim,
                  txtType: TextInputType.text,
                  hintTxt: "Masukan NIM"
              ),
              const SizedBox(
                height: 10,
              ),
              EditText(
                  nameEdtTxt: "Kelas",
                  txtEdt: _kelas,
                  txtType: TextInputType.text,
                  hintTxt: "Masukan Kelas"
              ),
              const SizedBox(
                height: 10,
              ),
              EditText(
                  nameEdtTxt: "Jurusan",
                  txtEdt: _jurusan,
                  txtType: TextInputType.text,
                  hintTxt: "Masukan Jurusan"
              ),
              const SizedBox(
                height: 16,
              ),
              CustomBtn(
                  txtColor: Colors.white,
                  nameBtn: "Masukan Data",
                  btnColor: Colors.blue,
                  btnAction: (){
                    Navigator.pop(context, getMhs());
                  },
              )
            ],
          ),
        ),
      ),
    );
  }
}
