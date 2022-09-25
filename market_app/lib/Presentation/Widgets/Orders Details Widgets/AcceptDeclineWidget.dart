import 'package:flutter/material.dart';
import 'package:market_app/Presentation/Widgets/PopUs/ChooseTimePopUp/ChooseTimePopUp.dart';
import 'package:market_app/Presentation/Widgets/PopUs/DeclinePopUp/DeclinePopUp.dart';

class AcceptDecline extends StatelessWidget {
  AcceptDecline({super.key});
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
                              child: Text("Accept"),
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 60, 238, 60)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            _showAlertDialog(context, DeclinePopUp());
                          },
                          child: Text("Decline"),
                          style: OutlinedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 245, 240, 240),
                              side: BorderSide(color: Colors.red, width: 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                        ),
                      ),
                    )
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