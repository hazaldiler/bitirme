class OrganEntity {
  String foto;
  String audio;

  OrganEntity({
    this.foto,
    this.audio,
  });

  factory OrganEntity.fromJson(Map<String, dynamic> parsedJson) {
    return OrganEntity(
      foto: parsedJson['foto'],
      audio: parsedJson['audio'],
    );
  }
}
