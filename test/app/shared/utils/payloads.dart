class Payloads {
  static const List<Map<String, dynamic>> fetchNasaData = [
    {
      'date': '2021-07-30',
      'explanation':
          "Peering from the shadows, the Saturn-facing hemisphere of Mimas lies in near darkness alongside a dramatic sunlit crescent. The mosaic was captured near the Cassini spacecraft's final close approach on January 30, 2017. Cassini's camera was pointed in a nearly sunward direction only 45,000 kilometers from Mimas. The result is one of the highest resolution views of the icy, crater-pocked, 400 kilometer diameter moon. An enhanced version better reveals the Saturn-facing hemisphere of the synchronously rotating moon lit by sunlight reflected from Saturn itself. To see it, slide your cursor over the image (or follow this link). Other Cassini images of Mimas include the small moon's large and ominous Herschel Crater.",
      'hdurl': 'https://apod.nasa.gov/apod/image/1908/MimasPIA17213.jpg',
      'media_type': 'image',
      'service_version': 'v1',
      'title': 'Mimas in Saturnlight',
      'url': 'https://apod.nasa.gov/apod/image/1908/MimasPIA17213_fig1_1024.jpg'
    }
  ];

  static const List<Map<String, dynamic>> fetchNasaDataError = [
    {
      'date': '2021-07-30',
      'hdurl': 'https://apod.nasa.gov/apod/image/1908/MimasPIA17213.jpg',
      'media_type': 'image',
      'service_version': 'v1',
    }
  ];
}
