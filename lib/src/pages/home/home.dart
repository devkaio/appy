import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../data/models/design_pattern_category.dart';
import '../../data/repositories/design_pattern_categories_repository.dart';
import 'widgets/home_menu_card.dart';
import 'widgets/home_menu_header.dart';

class Home extends StatelessWidget {
  final DesignPatternCategoriesRepository repository =
      DesignPatternCategoriesRepository();

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Constants.large),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const MainMenuHeader(),
              FutureBuilder<List<DesignPatternCategory>>(
                future: repository.get(),
                initialData: const [],
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(
                          top: Constants.large,
                        ),
                        child: HomeMenuCard(
                          category: snapshot.data![index],
                        ),
                      ),
                    );
                  }
                  return CircularProgressIndicator(
                    backgroundColor: Constants.defaultBackGroundColor,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.black.withOpacity(0.65),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
