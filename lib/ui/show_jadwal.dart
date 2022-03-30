import 'dart:convert';
import 'dart:io';

import 'package:aplikasi_jadwal/database/dbhelper.dart';
import 'package:aplikasi_jadwal/database/models.dart';
import 'package:aplikasi_jadwal/ui/tambah_jadwal.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_jadwal/ui/home.dart';

class ShowJadwal extends StatefulWidget {
  const ShowJadwal({Key? key}) : super(key: key);

  @override
  _ShowJadwalState createState() => _ShowJadwalState();
}

class _ShowJadwalState extends State<ShowJadwal> {
  int? selectedId;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder<List<Jadwal>>(
            future: DatabaseHelper.instance.getJadwal(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Jadwal>> snapshot) {
              return snapshot.hasData
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = snapshot.data![index];

                        return Container(
                          height: 1000,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(width: 13),
                                  Text(item.hari,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17)),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.grey),
                                    onPressed: () {
                                      setState(() {
                                        DatabaseHelper.instance
                                            .remove(item.id!);
                                      });
                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                              Text(item.mapel1,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Text(item.mapel2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Text(item.mapel3,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Text(item.mapel4,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ],
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            }));
  }
}


// GridView.count(
//         scrollDirection: Axis.vertical,
//         shrinkWrap: true,
//         primary: false,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//         crossAxisCount: 2,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 color: Colors.lightBlue,
//                 borderRadius: BorderRadius.circular(20)),
//             padding: const EdgeInsets.all(8),
//             child: Column(
//               children: [
//                 Text("Hari"),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Text('mapel')
//               ],
//             ),
//           )
//         ],
//       ),