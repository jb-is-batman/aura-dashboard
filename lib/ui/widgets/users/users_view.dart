import 'package:aura_web_dashboard/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'users_viewmodel.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UsersViewModel>.reactive(
      builder: (BuildContext context, UsersViewModel model, Widget? child) {
        return Container(
          margin: EdgeInsets.all(16),
          child: model.isBusy ? const Center(child: CircularProgressIndicator()) : model.hasError ?  const Center(child: Text("ERROR"),) :
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Users", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text("Name", style: TextStyle(fontWeight: FontWeight.bold),)),
                      DataColumn(label: Text("Mobile", style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("Address", style: TextStyle(fontWeight: FontWeight.bold))),
                    ], 
                    rows: List.generate(
                      model.usersModel == null ? 0 : model.usersModel!.users.length, 
                      (index) {
                        return _getUsersDataRow(model.usersModel!.users[index]);
                      }
                    )
                  ),
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => UsersViewModel(),
    );
  }


  DataRow _getUsersDataRow(User user) {
    return DataRow(
      selected: true,
      cells: [
        DataCell(Text("${user.name}")),
        DataCell(Text("${user.mobile}")),
        DataCell(Text("${user.address}")),
      ]
    );
  }
}

