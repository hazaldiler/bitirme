class EmotionEntity {
  String foto;
  String audio;

  EmotionEntity({
    this.foto,
    this.audio,
  });

  factory EmotionEntity.fromJson(Map<String, dynamic> parsedJson) {
    return EmotionEntity(
      foto: parsedJson['foto'],
      audio: parsedJson['audio'],
    );
  }
}
