import 'package:flutter/material.dart';
import 'package:market_app/Presentation/Widgets/PopUs/ChooseDriverPopUp/ChooseDriverPopUp.dart';
import 'package:market_app/Presentation/Widgets/PopUs/ChooseTimePopUp/ChooseTimePopUp.dart';
import 'package:market_app/Presentation/Widgets/PopUs/DeclinePopUp/DeclinePopUp.dart';

class CancelButton extends StatelessWidget {
  CancelButton({super.key});
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 25,
                      width: 25,
                      child: Image.asset("assets/cooking.gif")),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text("Order will be ready in x mins")),
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
                          child: OutlinedButton(
                            onPressed: () {
                              _showAlertDialog(context, DeclinePopUp());
                            },
                            child: Text("Cancel"),
                            style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 245, 243, 243),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                side: BorderSide(color: Colors.red),
                                primary: Color.fromARGB(255, 246, 19, 19)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Driver not assigned yet? "),
                      InkWell(
                        onTap: () {
                          _showAlertDialog(context, ChooseDriverPopUp());
                        },
                        child: Text(
                          "Assign now",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 247, 6, 6)),
                        ),
                      ),
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
