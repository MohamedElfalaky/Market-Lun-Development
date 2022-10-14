import 'package:flutter/material.dart';
import '../../../data/Shared/AppLocalizations.dart';

class SaveBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 20),
        ],
      ),
      child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 237, 25, 25)),
                      child: Text("Save".tr(context)),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
