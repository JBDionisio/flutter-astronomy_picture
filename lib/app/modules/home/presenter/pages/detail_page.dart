import 'package:flutter/material.dart';

import '../../../../shared/data/extensions.dart';
import '../../domain/entities/nasa_data_entity.dart';

class DetailPage extends StatefulWidget {
  final NasaDataEntity obj;

  const DetailPage({
    Key? key,
    required this.obj,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final nasaData = widget.obj;
    final size1 = context.constSize1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size1 * 400,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    nasaData.url,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size1 * 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('DATE: ${nasaData.date.formatDate}'),
                  Text('TITLE: ${nasaData.title}'),
                  Text(
                    'EXPLANATION: ${nasaData.explanation}',
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
