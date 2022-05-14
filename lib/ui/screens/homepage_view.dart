import 'package:aura_web_dashboard/models/panic_model.dart';
import 'package:aura_web_dashboard/ui/widgets/panics/panics_view.dart';
import 'package:aura_web_dashboard/ui/widgets/users/users_view.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/link.dart';

import 'homepage_viewmodel.dart';

class HomePageView extends StatelessWidget {
  HomePageView({Key? key}) : super(key: key);

  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      builder: (BuildContext context, HomePageViewModel model, Widget? child) {
        return Scaffold(
          body: Column(
            children: [
              PanicsView(),
              UsersView()
            ],
          ),
        );
      },
      viewModelBuilder: () => HomePageViewModel(),
    );
  }
}