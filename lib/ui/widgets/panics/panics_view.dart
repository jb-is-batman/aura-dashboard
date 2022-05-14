import 'package:aura_web_dashboard/models/panic_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/link.dart';

import 'panics_viewmodel.dart';

class PanicsView extends StatelessWidget {
  const PanicsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PanicsViewModel>.reactive(
      builder: (BuildContext context, PanicsViewModel model, Widget? child) {
        return Container(
          margin: EdgeInsets.all(8),
          child: model.isBusy ? const Center(child: CircularProgressIndicator()) : model.hasError ?  const Center(child: Text("ERROR"),) :
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Panics", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              SingleChildScrollView(
                child: SizedBox(
                  width: Get.width,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text("Name",        style: TextStyle(fontWeight: FontWeight.bold),)),
                      DataColumn(label: Text("Mobile",      style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("Address",     style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("Timestamp",   style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("Panic Type",  style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("Coordinates", style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("Location",    style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("Client",      style: TextStyle(fontWeight: FontWeight.bold))),
                    ], 
                    rows: List.generate(
                      model.panicModel == null ? 0 : model.panicModel!.panics.length, 
                      (index) {
                        return _getPanicDataRow(model.panicModel!.panics[index], model, index);
                      }
                    )
                  ),
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => PanicsViewModel(),
    );
  }

  DataRow _getPanicDataRow(Panics panics, PanicsViewModel model, int index) {
    return DataRow(
      selected: true,
      cells: [
        DataCell(Text("${panics.username}")),
        DataCell(Text("${panics.mobile}")),
        DataCell(Text("${panics.address}")),
        DataCell(Text("${DateTime.fromMillisecondsSinceEpoch(panics.timestamp!*1000).toLocal()}")),
        DataCell(Text("${panics.panictypename}")),
        DataCell(Text("${panics.lat}, ${panics.long}")),
        DataCell(Link(
          target: LinkTarget.blank,
          uri: Uri.parse("https://www.google.com/maps/@${panics.lat!},${panics.long!},17z,"),
          builder: (_, dynamic followLink) {
            return TextButton(onPressed: followLink, child: Text("Map"));
          },
        )),
        DataCell(DropdownButton(
          hint: const Text("Select client"),
          items: List.generate(model.clientsModel!.clients.length, (index) {
            return DropdownMenuItem(value: model.clientsModel!.clients[index].name,child: Text("${model.clientsModel!.clients[index].name}"),);
          }), 
          onChanged: (dynamic val) {
            model.onDropdownChange(val, index);
          },
          value: model.panicModel!.panics[index].clientName,
        ))
      ]
    );
  }
}