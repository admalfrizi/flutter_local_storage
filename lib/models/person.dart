class Person {

  final String? name;
  final String? kelas;
  final String? nim;
  final String? jurusan;

  Person({
    required this.name,
    required this.kelas,
    required this.nim,
    required this.jurusan
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      nim: json['nim'],
      name: json['nama'],
      kelas: json['kelas'],
      jurusan: json['jurusan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nim': nim,
      'name': name,
      'kelas': kelas,
      'jurusan': jurusan,
    };
  }

}