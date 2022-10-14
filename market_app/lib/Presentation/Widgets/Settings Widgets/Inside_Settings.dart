import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/business_logic/cubits/Local/local_cubit.dart';
import 'package:market_app/data/Shared/AppLocalizations.dart';
import '../../../data/Shared/AppLocalizations.dart';

class insideSettings extends StatefulWidget {
  insideSettings({super.key});

  @override
  State<insideSettings> createState() => _insideSettingsState();
}

class _insideSettingsState extends State<insideSettings> {
  // static const List<String> values1 = ["Available", "Busy", "Closed"];
  // static const List<String> values2 = ["Delivery", "Pickup"];
  // static const List<String> values3 = ["English", "العربية"];
  String selectedValue1 = 'non';
  String selectedValue2 = 'non';
  String selectedValue3 = 'non';

  Widget myinsideSettings(List myList, int index, context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.only(bottom: 10, top: 5),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: myList.map((listItem) {
          return RadioListTile<String>(
            value: listItem, //
            groupValue: index == 0 ? selectedValue1 : selectedValue2,

            title: Text(listItem,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            onChanged: ((value) {
              setState(() {
                // listItem = value!;
                if (index == 0) {
                  selectedValue1 = value!;
                } else if (index == 1) {
                  selectedValue2 = value!;
                }
                // print(listItem);
                //  print(myselected);
                print(value);
              });
            }),
          );
        }).toList()

        // Text(
        //   metaa,
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        // ),
        // Text(
        //   dataa,
        //   style: TextStyle(fontSize: 15),
        // )
        ,
      ),
    );
  }

  @override
  void initState() {
    LocalCubit.get(context).getSavedLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          ExpansionTile(
              title: Row(
                children: [
                  SizedBox(height: 30, child: Image.asset("assets/market.png")),
                  Text(
                    "Market status".tr(context),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              children: [
                myinsideSettings([
                  // AppLocalizations.of(context)!.translate("All"),
                  "All".tr(context),
                  "Busy".tr(context),
                  "Closed".tr(context)
                ], 0, context),
                // myinsideSettings(values2, selectedValue2, context)
              ]),
          ExpansionTile(
              title: Row(
                children: [
                  SizedBox(height: 30, child: Image.asset("assets/qq.png")),
                  Text(
                    "Recive method".tr(context),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              children: [
                myinsideSettings(
                    ["Delivery".tr(context), "Pick up".tr(context)],
                    1,
                    context),
                // myinsideSettings(values2, selectedValue2, context)
              ]),
          BlocListener<LocalCubit, LocalState>(
            // عشان اول ما ادخل الاقيه ع القيمه اللي هو فيها
            listener: (context, state) {
              if (state is ChangeLocaleState) {
                if (state.local.languageCode == "en") {
                  selectedValue3 = "English";
                } else {
                  selectedValue3 = "العربية";
                }
              }
            },
            child: ExpansionTile(
                title: Row(
                  children: [
                    SizedBox(height: 30, child: Icon(Icons.language)),
                    Text(
                      "Language".tr(context),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                children: [
                  BlocBuilder<LocalCubit, LocalState>(
                    builder: (context, state) {
                      return state is ChangeLocaleState
                          ? Container(
                              padding: EdgeInsets.only(left: 10),
                              margin: EdgeInsets.only(bottom: 10, top: 5),
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children:
                                    ["English", "العربية"].map((listItem) {
                                  return RadioListTile<String>(
                                    value: listItem, //
                                    groupValue: selectedValue3,
                                    title: Text(listItem,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),

                                    onChanged: ((value) {
                                      selectedValue3 = value!;
                                      String langCode =
                                          selectedValue3 == "English"
                                              ? 'en'
                                              : 'ar';
                                      LocalCubit.get(context)
                                          .changeLanguage(langCode);
                                    }),
                                  );
                                }).toList(),
                              ),
                            )
                          : SizedBox();
                    },
                  )
                ]),
          ),
        ],
      ),
    );
    ;
  }
}
