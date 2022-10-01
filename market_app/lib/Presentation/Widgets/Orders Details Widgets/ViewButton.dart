import 'package:flutter/material.dart';
import 'package:market_app/Presentation/Widgets/PopUs/ChooseTimePopUp/ChooseTimePopUp.dart';
import 'package:market_app/Presentation/Widgets/PopUs/DeclinePopUp/DeclinePopUp.dart';

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      height: 30,
                      width: 30,
                      child: Image.asset("assets/200w.gif")),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Text("Order will canceled in x mins")),
                ],
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
                            child: ElevatedButton(
                              onPressed: () {
                                _showAlertDialog(context, ChoosTimePopUp());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.visibility),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("View"),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 246, 19, 19)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
