import 'package:flutter/material.dart';
import 'package:market_app/Presentation/Widgets/PopUs/ChooseTimePopUp/ChooseTimePopUp.dart';
import 'package:market_app/Presentation/Widgets/PopUs/DeclinePopUp/DeclinePopUp.dart';
import '../../../data/Shared/AppLocalizations.dart';

class ViewButton extends StatelessWidget {
  ViewButton({super.key});
  void _showAlertDialog(context, Widget myWidget) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return myWidget;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SizedBox(
                      height: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.visibility,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "View".tr(context),
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
