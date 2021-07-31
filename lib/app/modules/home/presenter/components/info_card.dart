import 'package:flutter/material.dart';

import '../../../../shared/data/extensions.dart';
import '../../domain/entities/nasa_data_entity.dart';

class InfoCard extends StatelessWidget {
  final NasaDataEntity nasaData;

  const InfoCard({
    Key? key,
    required this.nasaData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size1 = context.constSize1;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: size1 * 30),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: context.width,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    height: size1 * 360,
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
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('TITLE: ${nasaData.title}'),
            Text('Date: ${nasaData.date}'),
          ],
        ),
      ),
    );
  }
}
