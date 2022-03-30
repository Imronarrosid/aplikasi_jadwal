import 'package:aplikasi_jadwal/database/dbhelper.dart';
import 'package:aplikasi_jadwal/database/models.dart';
import 'package:aplikasi_jadwal/ui/home.dart';
import 'package:flutter/material.dart';

class TambahJAdwal extends StatefulWidget {
  const TambahJAdwal({Key? key}) : super(key: key);

  @override
  _TambahJAdwalState createState() => _TambahJAdwalState();
}

class _TambahJAdwalState extends State<TambahJAdwal> {
  final _formKey = GlobalKey<FormState>();
  int? selectedId;
  final hariController = TextEditingController();
  final mapel1 = TextEditingController();
  final mapel2 = TextEditingController();
  final mapel3 = TextEditingController();
  final mapel4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('Tambah Jadwal',
              style: TextStyle(color: Colors.black)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Hari',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        const Text('SAVE'),
                        IconButton(
                          icon: const Icon(
                            Icons.save_sharp,
                            color: Colors.grey,
                            size: 30,
                          ),
                          onPressed: () async {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                            await DatabaseHelper.instance.add(
                              Jadwal(
                                  hari: hariController.text,
                                  mapel1: mapel1.text,
                                  mapel2: mapel2.text,
                                  mapel3: mapel3.text,
                                  mapel4: mapel4.text),
                            );
                            setState(() {
                              hariController.clear();
                              mapel1.clear();
                              mapel2.clear();
                              mapel3.clear();
                              mapel4.clear();
                              selectedId = null;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                    controller: hariController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Masukan hari',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)))),
                const SizedBox(height: 20),
                const Text('Tambah Mapel',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: mapel1,
                  decoration: const InputDecoration(
                      hintText: 'Mapel 1',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: mapel2,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      hintText: 'Mapel 2',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: mapel3,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      hintText: 'Mapel 3',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: mapel4,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      hintText: 'Mapel 4',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: const Text('Batal')),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
