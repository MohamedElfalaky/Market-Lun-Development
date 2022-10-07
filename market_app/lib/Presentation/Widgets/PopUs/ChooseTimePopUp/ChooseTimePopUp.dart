import 'package:flutter/material.dart';
import 'package:market_app/Presentation/Widgets/PopUs/ChooseDriverPopUp/ChooseDriverPopUp.dart';
import 'package:market_app/Presentation/Widgets/PopUs/ChooseTimePopUp/ChooseTimeContentPopUp.dart';
import 'package:duration_picker/duration_picker.dart';

class ChoosTimePopUp extends StatefulWidget {
  final id;
  const ChoosTimePopUp(this.id);

  @override
  State<ChoosTimePopUp> createState() => _ChoosTimePopUpState();
}

class _ChoosTimePopUpState extends State<ChoosTimePopUp> {
  void _showAlertDialog(context, int myDuration) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChooseDriverPopUp(myDuration, widget.id);
      },
    );
  }

  int? _selectedDuration = 0;
  final _myController = TextEditingController();

  int _printDuration(Duration duration) {
    // String twoDigits(int n) => n.toString().padLeft(2, "0");
    // String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    // String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    // return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    int editedMinuts = duration.inMinutes;
    for (var i = 0; i < duration.inHours; i++) {
      editedMinuts--;
    }
    return duration.inHours + editedMinuts;
  }

  _presentDurationPicker() async {
    var resultingDuration = await showDurationPicker(
      context: context,
      initialTime: Duration(minutes: 30),
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Chose duration: ${_printDuration(resultingDuration!)} mins')));

    setState(() {
      _selectedDuration = _printDuration(resultingDuration);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      scrollable: true,
      content: Padding(
          padding: const EdgeInsets.all(8.0), child: ChooseTimePopUpContent()),
      actions: <Widget>[
        Center(
            child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.1,
                child: TextField(
                  controller: _myController,
                  keyboardType: TextInputType.number,
                  cursorHeight: 40,
                  // showCursor: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration.collapsed(
                      hintText: "50:00 Mins",
                      hintStyle:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                ))

            //  Builder(
            //     builder: (BuildContext context) => TextButton(
            //           onPressed: _presentDurationPicker,
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Text(
            //                 "${_selectedDuration!}",
            //                 style: TextStyle(fontSize: 40),
            //               ),
            //               Text(
            //                 "mins",
            //                 style: TextStyle(color: Colors.black),
            //               )
            //             ],
            //           ),
            //         ))

            ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.05,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ElevatedButton(
                child: Text('Save'),
                onPressed: () {
                  _showAlertDialog(context, int.parse(_myController.text));
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
    ;
  }
}
