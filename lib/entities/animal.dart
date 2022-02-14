class AnimalEntity {
  String foto;
  String audio;

  AnimalEntity({
    this.foto,
    this.audio,
  });

  factory AnimalEntity.fromJson(Map<String, dynamic> parsedJson) {
    return AnimalEntity(
      foto: parsedJson['foto'],
      audio: parsedJson['audio'],
    );
  }
}
