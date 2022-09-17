import 'package:flutter/material.dart';
import 'package:market_app/Screens/Orders.dart';
import 'package:market_app/Widgets/PopUs/ChooseDriverPopUp/ChooseDriverPopUp.dart';
import 'package:market_app/Widgets/PopUs/ChooseTimePopUp/ChooseTimeContentPopUp.dart';
import 'package:market_app/Widgets/PopUs/FilterPopUp/PopUpContent.dart';
import 'package:duration_picker/duration_picker.dart';

class ChoosTimePopUp extends StatefulWidget {
  const ChoosTimePopUp({super.key});

  @override
  State<ChoosTimePopUp> createState() => _ChoosTimePopUpState();
}

class _ChoosTimePopUpState extends State<ChoosTimePopUp> {
  void _showAlertDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChooseDriverPopUp();
      },
    );
  }

  Duration? _selectedDuration = Duration(minutes: 0);

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  _presentDurationPicker() async {
    var resultingDuration = await showDurationPicker(
      context: context,
      initialTime: Duration(minutes: 30),
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text('Chose duration: ${_printDuration(resultingDuration!)}')));

    setState(() {
      _selectedDuration = resultingDuration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      scrollable: true,
      // title: Text('Filter'),
      content: Padding(
          padding: const EdgeInsets.all(8.0), child: ChooseTimePopUpContent()),
      actions: <Widget>[
        Center(
            child: Builder(
                builder: (BuildContext context) => TextButton(
                      onPressed: _presentDurationPicker,
                      child: Text(
                        "${_printDuration(_selectedDuration!)}",
                        style: TextStyle(fontSize: 40),
                      ),
                    ))),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.05,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ElevatedButton(
                child: Text('Save'),
                onPressed: () {
                  _showAlertDialog(context);
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
