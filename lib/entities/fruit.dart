class FruitEntity {
  String foto;
  String audio;

  FruitEntity({
    this.foto,
    this.audio,
  });

  factory FruitEntity.fromJson(Map<String, dynamic> parsedJson) {
    return FruitEntity(
      foto: parsedJson['foto'],
      audio: parsedJson['audio'],
    );
  }
}
