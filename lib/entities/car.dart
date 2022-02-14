class CarEntity {
  String foto;
  String audio;

  CarEntity({
    this.foto,
    this.audio,
  });

  factory CarEntity.fromJson(Map<String, dynamic> parsedJson) {
    return CarEntity(
      foto: parsedJson['foto'],
      audio: parsedJson['audio'],
    );
  }
}
