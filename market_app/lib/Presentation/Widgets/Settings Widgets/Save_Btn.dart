import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/business_logic/cubits/settings_cubit/settings_cubit.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';
import '../../../data/Shared/AppLocalizations.dart';

class SaveBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return state is! SettingsLoading
            ? Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 0, blurRadius: 20),
                  ],
                ),
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    child: BottomAppBar(
                      child: SizedBox(
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, bottom: 10, top: 10),
                          child: SizedBox(
                            height: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<SettingsCubit>(context)
                                      .postMarketStatus(
                                    apiToken:
                                        CacheHelper.getFromShared("token"),
                                    market_status:
                                        BlocProvider.of<SettingsCubit>(context)
                                                    .selectedValue1 ==
                                                "Available".tr(context)
                                            ? 0
                                            : BlocProvider.of<SettingsCubit>(
                                                            context)
                                                        .selectedValue1 ==
                                                    "Closed".tr(context)
                                                ? 1
                                                : 2,
                                    delivery:
                                        BlocProvider.of<SettingsCubit>(context)
                                                    .check1 ==
                                                true
                                            ? 1
                                            : 0,
                                    pickup:
                                        BlocProvider.of<SettingsCubit>(context)
                                                    .check2 ==
                                                true
                                            ? 1
                                            : 0,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 237, 25, 25)),
                                child: Text("Save".tr(context)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
