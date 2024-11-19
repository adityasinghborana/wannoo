import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/large_button.dart';

import 'package:wannoo/Constants.dart';
import 'package:wannoo/utilities/dialog.dart';
import 'package:wannoo/utilities/extension.dart';

import '../widgets/savedcards.dart';

class Saved extends StatelessWidget {
  const Saved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Itinarary",style: CustomTextStyles.fontL2SemiBold,), centerTitle: true,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: 1, // Set the number of items you want
                itemBuilder: (BuildContext context, int index) => Container(

                  child: Column(
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: Get.width-50,
                                height: 30,child: LargeButton(label: " + Add New List", onPressed: (){}))
                          ],
                        ),
                      ),
                    ],
                  ),
                ).fadeIn(duration: Duration(seconds: 1)),
              )),
             
            ],
          ),
        ),
      ),
    );
  }
}


