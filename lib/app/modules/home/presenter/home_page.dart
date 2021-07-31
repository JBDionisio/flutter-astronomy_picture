import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../shared/components/theme_text_field.dart';
import '../../../shared/data/extensions.dart';
import '../../../shared/utils/app_state.dart';
import 'components/info_card.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  late final ScrollController scrollController;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController(text: '');

    scrollController = ScrollController();
    scrollController.addListener(() {
      var maxScrollExtent = scrollController.position.maxScrollExtent;
      var offset = scrollController.offset;

      if (offset == maxScrollExtent &&
          _searchController.text.isEmpty &&
          !controller.store.isUpdating) {
        controller.fetchNasaData(isUpdate: true);
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size1 = context.constSize1;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Astronomy Pictures'),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () => controller.resetData(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size1 * 35),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: ThemeTextField(
                      controller: _searchController,
                      hintText: 'Search Item by title',
                      prefixIcon: Icon(Icons.search),
                      onChanged: (value) {
                        controller.filterImagesByTitle(value);
                      },
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
                  SizedBox(height: size1 * 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _imagesList(var size1) {
    final list = controller.store.filteredList;
    return (list.isNotEmpty)
        ? ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final obj = list[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: InfoCard(nasaData: obj),
              );
            },
          )
        : Center(
            child: Text('No images found.'),
          );
  }

  Widget _onLoading() => Center(
        child: CircularProgressIndicator(),
      );

  Widget _onError() => Center(
        child: Text(
          'There was an error\nTry again later.',
          textAlign: TextAlign.center,
        ),
      );
}
