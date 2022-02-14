class QuizEntity {
  String audio;
  String foto;

  QuizEntity({
    this.audio,
    this.foto,
  });

  factory QuizEntity.fromJson(Map<String, dynamic> parsedJson) {
    return QuizEntity(
      foto: parsedJson['foto'],
      audio: parsedJson['audio'],
    );
  }
}
