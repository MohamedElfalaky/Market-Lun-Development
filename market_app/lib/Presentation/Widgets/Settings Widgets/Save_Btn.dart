import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/business_logic/cubits/settings_cubit/settings_cubit.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';
import 'package:market_app/data/Shared/Simplify.dart';
import '../../../data/Shared/AppLocalizations.dart';
import 'package:sizer/sizer.dart';

class SaveBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return state is! SettingsLoading
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.sp),
                      topLeft: Radius.circular(30.sp)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 0, blurRadius: 20),
                  ],
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.sp),
                        topLeft: Radius.circular(10.sp)),
                    child: BottomAppBar(
                      child: SizedBox(
                        height: Simplify.hightClc(context, 70),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Simplify.hightClc(context, 10),
                            horizontal: Simplify.widthClc(context, 10),
                          ),
                          child: SizedBox(
                            height: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.sp),
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
                                child: AutoSizeText(
                                  "Save".tr(context),
                                  style: TextStyle(fontSize: 14),
                                ),
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
