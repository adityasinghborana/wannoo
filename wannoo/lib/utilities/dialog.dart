import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Categoryplaces/presentationlayer/categoryplacesscreen.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/utilities/extension.dart';

Future<void> showMyDialog(BuildContext context, List<String> items) async {
  // A list to keep track of checkbox states
  List<bool> checkedStates = List<bool>.filled(items.length, false);

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: const Text('Add To Itinerary'),
            content: SingleChildScrollView(
              child: ListBody(
                children: List<Widget>.generate(items.length, (index) {
                  return CheckboxListTile(
                    title: Text(items[index]),
                    value: checkedStates[index],
                    onChanged: (bool? value) {
                      setState(() {
                        checkedStates[index] = value ?? false;
                      });
                    },
                  );
                }),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Process checkedStates if needed
                },
              ),
            ],
          );
        },
      );
    },
  );
}

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}




Future<void> showMyModalBottomSheet(BuildContext context, List<String> items) async {
  // Initialize a list of bool values to track the checked state of each item.
  List<bool> checkedStates = List<bool>.filled(items.length, false);

  await showModalBottomSheet(
    backgroundColor: themeColor.colorscafold,
    context: context,
    isScrollControlled: true,  // Ensures the bottom sheet can expand
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return ConstrainedBox(
              constraints: BoxConstraints(
              maxHeight: Get.height * 0.75,),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Text(
                    'Add To Itinerary',
                    style:CustomTextStyles.fontXlSemiBold,
                  ),
                  const SizedBox(height: 16),
                  // Wrap ListView.builder inside an Expanded to allow scrolling
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          title: Text(items[index],style: CustomTextStyles.fontMdMedium,),
                          value: checkedStates[index],
                          onChanged: (bool? value) {
                            setState(() {
                              checkedStates[index] = value ?? false;
                            });
                          },
                        );
                      },
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      );
    },
  );
}

