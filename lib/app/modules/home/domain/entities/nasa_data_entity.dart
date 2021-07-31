class NasaDataEntity {
  final String title;
  final String url;
  final String explanation;
  final DateTime date;
  final String? copyright;

  NasaDataEntity({
    required this.title,
    required this.url,
    required this.explanation,
    required this.date,
    this.copyright,
  });
}
