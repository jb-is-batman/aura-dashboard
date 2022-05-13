import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/link.dart';

import 'homepage_viewmodel.dart';

class HomePageView extends StatelessWidget {
  HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      builder: (BuildContext context, HomePageViewModel model, Widget? child) {
        return Scaffold(
          body: model.isBusy ? CircularProgressIndicator() : model.hasError ?  Center(child: Text("ERROR"),) :
          ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(child: Text(model.panicModel!.panics[index].username!)),
                    Expanded(child: Text(model.panicModel!.panics[index].mobile!)),
                    Expanded(child: Text(model.panicModel!.panics[index].address!)),
                    Expanded(child: Text("${model.panicModel!.panics[index].timestamp!}")),
                    Expanded(child: Text(model.panicModel!.panics[index].panictypename!)),
                    Expanded(child: Text("${model.panicModel!.panics[index].lat!}, ${model.panicModel!.panics[index].long!}")),
                    Link(
                      target: LinkTarget.blank,
                      uri: Uri.parse("https://www.google.com/maps/@${model.panicModel!.panics[index].lat!},${model.panicModel!.panics[index].long!},17z,"),
                      builder: (_, dynamic followLink) {
                        return TextButton(onPressed: followLink, child: Text("Map"));
                      },
                    )
                  ],
                ),
              );
            },
            itemCount: model.panicModel == null ? 0 : model.panicModel!.panics.length,
          )
        ) ;
      },
      viewModelBuilder: () => HomePageViewModel(),
    );
  }

  Widget _dropdownButton(HomePageViewModel model) {
    return
     DropdownButton(
      value: model.dropdownvalue,
        
      icon: const Icon(Icons.keyboard_arrow_down),    
        
      items: model.items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: (String? newValue) {
        model.setDropdownValue(newValue);
        model.dropdownvalue = newValue!;
      },
    );
  }
}