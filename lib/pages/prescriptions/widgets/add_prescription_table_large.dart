import 'package:data_table_2/data_table_2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsquare_web/components/ScrollableWidget.dart';
import 'package:medsquare_web/components/customTextfield.dart';
import 'package:medsquare_web/components/custom_dialog.dart';
import 'package:medsquare_web/components/custom_text.dart';
import 'package:medsquare_web/constants/controllers.dart';
import 'package:medsquare_web/constants/style.dart';
import 'package:medsquare_web/helpers/utils.dart';
import 'package:medsquare_web/models/presc.dart';

class AddPrescTableLarge extends StatefulWidget {
  @override
  State<AddPrescTableLarge> createState() => _AddPrescTableLargeState();
}

class _AddPrescTableLargeState extends State<AddPrescTableLarge> {
  TextEditingController c1 = TextEditingController(text: '');

  TextEditingController c2 = TextEditingController(text: '');

  TextEditingController c3 = TextEditingController(text: '');

  final tablecontroller = Get.put(Controllerclass());
  bool tableisfull = false;
  String? _chosenvalue;
  final homeController = Get.put(HomeController());
  List<String> items = ['Tablet', 'Syrup', 'Injection'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CustomText(
                text: "Add New Prescription",
                color: lightGrey,
                weight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 64,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildTextField(text: 'Name', controller: c1),
              buildTextField(text: 'Duration', controller: c2),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  hint: Text(
                    'Select a type',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  value: _chosenvalue,
                  onChanged: (value) {
                    setState(() {
                      _chosenvalue = value as String;
                    });
                  },
                  buttonHeight: 40,
                  buttonWidth: 200,
                  itemHeight: 40,
                ),
              ),
              SizedBox(
                width: 100,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              // child: Obx(() => DropdownButton(
              //       hint: Text(
              //         'Book Type',
              //       ),
              //       onChanged: (String? newValue) {
              //         dropdowncontroller.setSelected(newValue!);
              //       },
              //       value: dropdowncontroller.selected.value,
              //       items: dropdowncontroller.items.map((selectedType) {
              //         return DropdownMenuItem(
              //           child: new Text(
              //             selectedType,
              //           ),
              //           value: selectedType,
              //         );
              //       }).toList(),
              //     )),

              // ),
              buildTextField(text: 'Description', controller: c3),
              FloatingActionButton(
                onPressed: () {
                  tablecontroller.addtotable(c1, c2, c3, _chosenvalue);
                  setState(() {
                    tableisfull = true;
                  });
                },
                heroTag: 'add',
                tooltip: 'Add Prescription',
                backgroundColor: Colors.teal,
                child: Icon(Icons.add),
              ),
            ],
          ),
          Obx(() => Container(
              width: double.infinity,
              child: SingleChildScrollView(
                  child: ScrollableWidget(child: buildDateTable())))),
          SizedBox(
            height: MediaQuery.of(context).size.height / 7,
          ),
          tableisfull
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton(
                          title: 'Add',
                          callback: () {
                            tablecontroller.cleartable();
                            Get.snackbar('Done!', 'Prescription is added',
                                barBlur: 30,
                                icon: Icon(Icons.check),
                                shouldIconPulse: true);
                            c1.clear();
                            c2.clear();
                            c3.clear();
                          },
                          color: Colors.teal),
                      buildButton(
                          title: 'Delete',
                          callback: () {
                            if (tablecontroller.allprescs.length != 0)
                              tablecontroller.clearrow();
                            else
                              return showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return CustomDialog(
                                    callback: () {},
                                    child: Text('No more items !'),
                                    buttontext: 'Back',
                                    title: 'Warning',
                                  );
                                },
                              );
                          },
                          color: Colors.redAccent),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Container buildButton({title, callback, color}) {
    return Container(
      width: 150,
      height: 40,
      child: ElevatedButton(
        onPressed: callback,
        child: Text(title),
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(5),
            backgroundColor: MaterialStateProperty.all(color)),
      ),
    );
  }

  List<DataRow> getRows(List<Prescription> prescs) =>
      prescs.map((Prescription presc) {
        final cells = [presc.name, presc.duration, presc.type, presc.desc];
        return DataRow(
            cells: Utils.modelBuilder(cells, (index, cell) {
          return DataCell(Text('$cell'), onTap: () {});
        }));
      }).toList();

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(label: Text(column));
    }).toList();
  }

  Widget buildDateTable() {
    final columns = ['Name', 'Duration', 'Type', 'Description'];

    return DataTable(
      headingTextStyle: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17),
      columnSpacing: 180,
      horizontalMargin: 20,
      columns: getColumns(columns),
      rows: getRows(tablecontroller.allprescs),
    );
  }

  Expanded buildTextField({text, controller}) {
    return Expanded(
      child: Row(
        children: [
          Text(text),
          SizedBox(
            width: 10,
          ),
          CustomTextFeild(
            c: controller,
          ),
        ],
      ),
    );
  }
}
