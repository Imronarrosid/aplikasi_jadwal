class Jadwal {
  final int? id;
  final String hari;
  final String mapel1;
  final String mapel2;
  final String mapel3;
  final String mapel4;

  Jadwal(
      {this.id,
      required this.hari,
      required this.mapel1,
      required this.mapel2,
      required this.mapel3,
      required this.mapel4});

  factory Jadwal.fromMap(Map<String, dynamic> json) => Jadwal(
        id: json['id'],
        hari: json['hari'],
        mapel1: json['mapel1'],
        mapel2: json['mapel2'],
        mapel3: json['mapel3'],
        mapel4: json['mapel4'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hari': hari,
      'mapel1': mapel1,
      'mapel2': mapel2,
      'mapel3': mapel3,
      'mapel4': mapel4
    };
  }
}
