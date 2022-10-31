import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/business_logic/cubits/Local/local_cubit.dart';
import 'package:market_app/business_logic/cubits/settings_cubit/settings_cubit.dart';
import 'package:market_app/data/Shared/AppLocalizations.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';
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
            groupValue: index == 0
                ? BlocProvider.of<SettingsCubit>(context).selectedValue1
                : BlocProvider.of<SettingsCubit>(context)
                    .selectedValue2, //احتياطية

            title: AutoSizeText(listItem,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            onChanged: ((value) {
              setState(() {
                // listItem = value!;
                if (index == 0) {
                  BlocProvider.of<SettingsCubit>(context).selectedValue1 =
                      value!;
                } else if (index == 1) {
                  BlocProvider.of<SettingsCubit>(context).selectedValue2 =
                      value!;
                }
                // print(listItem);
                //  print(myselected);
                print(value);
              });
            }),
          );
        }).toList()

        // AutoSizeText(
        //   metaa,
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        // ),
        // AutoSizeText(
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
    BlocProvider.of<SettingsCubit>(context)
        .getMarketStatus(apiToken: CacheHelper.getFromShared('token'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          BlocConsumer<SettingsCubit, SettingsState>(
            listener: (context, state) {
              if (state is SettingsSuccess) {
                if (state.myModel.data!.marketStatus == 0) {
                  BlocProvider.of<SettingsCubit>(context).selectedValue1 =
                      "Availavle".tr(context);
                } else if (state.myModel.data!.marketStatus == 1) {
                  BlocProvider.of<SettingsCubit>(context).selectedValue1 =
                      "Closed".tr(context);
                } else if (state.myModel.data!.marketStatus == 2) {
                  BlocProvider.of<SettingsCubit>(context).selectedValue1 =
                      "Busy".tr(context);
                }

                if (state.myModel.data!.receiveMethod.delivery == 1) {
                  BlocProvider.of<SettingsCubit>(context).check1 = true;
                } else {
                  BlocProvider.of<SettingsCubit>(context).check1 = false;
                }

                if (state.myModel.data!.receiveMethod.pickup == 1) {
                  BlocProvider.of<SettingsCubit>(context).check2 = true;
                } else {
                  BlocProvider.of<SettingsCubit>(context).check2 = false;
                }
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  ExpansionTile(
                      title: Row(
                        children: [
                          SizedBox(
                              height: 30,
                              child: Image.asset("assets/market.png")),
                          AutoSizeText(
                            "Market status".tr(context),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      children: [
                        myinsideSettings([
                          // AppLocalizations.of(context)!.translate("All"),
                          "Available".tr(context),
                          "Busy".tr(context),
                          "Closed".tr(context)
                        ], 0, context),
                        // myinsideSettings(values2, selectedValue2, context)
                      ]),
                  ExpansionTile(
                      title: Row(
                        children: [
                          SizedBox(
                              height: 30, child: Image.asset("assets/qq.png")),
                          AutoSizeText(
                            "Recive method".tr(context),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          margin: EdgeInsets.only(bottom: 10, top: 5),
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ListTile(
                                  title: AutoSizeText(
                                    "Delivery".tr(context),
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  leading: Checkbox(
                                      value: BlocProvider.of<SettingsCubit>(
                                              context)
                                          .check1,
                                      onChanged: (newVal) {
                                        setState(() {
                                          BlocProvider.of<SettingsCubit>(
                                                  context)
                                              .check1 = newVal!;
                                        });
                                      })),
                              ListTile(
                                  title: AutoSizeText(
                                    "Pick up".tr(context),
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  leading: Checkbox(
                                      value: BlocProvider.of<SettingsCubit>(
                                              context)
                                          .check2,
                                      onChanged: (newval) {
                                        setState(() {
                                          BlocProvider.of<SettingsCubit>(
                                                  context)
                                              .check2 = newval!;
                                        });
                                      }))
                            ],
                          ),
                        ),
                      ]),
                ],
              );
            },
          ),
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
                    AutoSizeText(
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
                                    title: AutoSizeText(listItem,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),

                                    onChanged: ((value) {
                                      selectedValue3 = value!;
                                      String langCode =
                                          selectedValue3 == "English"
                                              ? 'en'
                                              : 'ar';
                                      LocalCubit.get(context)
                                          .changeLanguage(langCode);
                                      BlocProvider.of<SettingsCubit>(context)
                                          .getMarketStatus(
                                              apiToken:
                                                  CacheHelper.getFromShared(
                                                      'token'));
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
