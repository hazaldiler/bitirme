class FamilyEntity {
  String foto;
  String audio;

  FamilyEntity({
    this.foto,
    this.audio,
  });

  factory FamilyEntity.fromJson(Map<String, dynamic> parsedJson) {
    return FamilyEntity(
      foto: parsedJson['foto'],
      audio: parsedJson['audio'],
    );
  }
}
