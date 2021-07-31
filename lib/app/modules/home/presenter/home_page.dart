import 'package:astronomy_picture/app/modules/home/presenter/components/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../shared/components/theme_text_field.dart';
import '../../../shared/data/extensions.dart';
import '../../../shared/utils/app_state.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    final size1 = context.constSize1;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Astronomy Pictures',
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size1 * 35),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: ThemeTextField(
                    hintText: 'Search Item by title',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                RxBuilder(builder: (_) {
                  final state = controller.store.fetchState;
                  switch (state) {
                    case AppState.error:
                      return _onError();
                    case AppState.success:
                      return _imagesList(size1);
                    default:
                      return _onLoading();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _imagesList(var size1) {
    final list = controller.store.list;
    return (list.isNotEmpty)
        ? ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final obj = list[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: InfoCard(nasaData: obj),
              );
            },
          )
        : Center(
            child: Text('Não foram encontrados clientes.'),
          );
  }

  Widget _onLoading() => Center(
        child: CircularProgressIndicator(),
      );

  Widget _onError() => Center(
        child: Text(
          'Ocorreu um erro ao trazer os clientes.\nTente novamente mais tarde',
          textAlign: TextAlign.center,
        ),
      );
}
