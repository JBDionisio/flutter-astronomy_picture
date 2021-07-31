class GetNasaDataParams {
  final DateTime startDate;
  final DateTime endDate;

  GetNasaDataParams({
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toBodyRequest() => {
        'start_date': '${startDate.year}-${startDate.month}-${startDate.day}',
        'end_date': '${endDate.year}-${endDate.month}-${endDate.day}',
      };
}
