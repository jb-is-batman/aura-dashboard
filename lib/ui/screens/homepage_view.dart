import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'homepage_viewmodel.dart';

class HomePageView extends StatelessWidget {
  HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      builder: (BuildContext context, HomePageViewModel model, Widget? child) {
        return Scaffold(
          body: Column(
            children: [
              ListTile(
                title: Row(
                  children: [
                    Expanded(child: Text("Name")),
                    Expanded(child: Text("Mobile")),
                    Expanded(child: Text("Device")),
                    Expanded(child: Text("Timestamp")),
                    Expanded(child: Text("Location")),
                    Expanded(child: Text("Client")),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){},
                title: Row(
                  children: [
                    Expanded(child: Text("JB van der Merwe")),
                    Expanded(child: Text("+27 71 653 1337")),
                    Expanded(child: Text("Phone")),
                    Expanded(child: Text("Fri, 13 May 2022 06:58:30 GMT")),
                    Expanded(child: Text("-26.111709, 28.281188")),
                    Expanded(child: DropdownButton(
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
                        // model.dropdownvalue = newValue!;
                      },
                    ))
                  ],
                ),
              ),
              ListTile(
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){},
                title: Row(
                  children: [
                    Expanded(child: Text("Handri Fourie")),
                    Expanded(child: Text("+27 84 205 7889")),
                    Expanded(child: Text("Panic Button")),
                    Expanded(child: Text("Thursday, 12 May 2022 07:00:30 GMT")),
                    Expanded(child: Text("-26.111709, 28.281188")),
                    // Expanded(child: ,// _dropdownButton(model),
                    Expanded(child: DropdownButton(
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
                    ))
                  ],
                ),
              )
            ],
          )
        );
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



// ListView.builder(itemBuilder: (BuildContext context, int index) {
//             return Card(
//               child: Row(
//                 children: [
//                   Text("JB van der Merwe"),
//                   Text("Mobile"),
//                   Text("+27 71 491 1337"),
//                   Text("Timestamp")
//                 ],
//               ),
//               color: Colors.green.shade100,
//             );
//           }),
//         );