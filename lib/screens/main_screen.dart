import 'package:flutter/material.dart';

import 'package:password_generator/utils/pass_field.dart';
import 'package:password_generator/widgets/bottom_container.dart';
import 'package:password_generator/widgets/header.dart';
import 'package:password_generator/widgets/reusableWidget.dart';
import 'package:provider/provider.dart';
import 'package:password_generator/utils/pass_provider.dart';

class PassGen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Header(),
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff091642),
                  borderRadius: BorderRadius.circular(10.0)),
              height: 100.0,
              child: Center(
                child: PassField(Provider.of<PassProvider>(context).password),
              ),
            ),
          ),
          ReusableCard(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('8'),
                  ),
                ),
                Container(
                  width: 330.0,
                  child: Slider(
                      value: Provider.of<PassProvider>(context).length,
                      min: 8,
                      max: 32,
                      onChanged: (double slidValue) {
                        Provider.of<PassProvider>(context, listen: false)
                            .setLength(slidValue);
                      }),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text('32'),
                  ),
                )
              ],
            ),
          ),
          ReusableCard(
            child: SwitchListTile(
                title: Text('Include UpperCase'),
                value: Provider.of<PassProvider>(context, listen: false)
                    .includeUpperCase,
                onChanged: (bool newValue) {
                  print(newValue);
                  Provider.of<PassProvider>(context, listen: false)
                      .toggup(newValue);
                }),
          ),
          ReusableCard(
            child: SwitchListTile(
                title: Text('Include Lowercase'),
                value: Provider.of<PassProvider>(context).includeLowercase,
                onChanged: (bool ewValue) {
                  print(ewValue);
                  Provider.of<PassProvider>(context, listen: false)
                      .togglower(ewValue);
                }),
          ),
          ReusableCard(
            child: SwitchListTile(
              title: Text('Include Special'),
              value: Provider.of<PassProvider>(context).includeSpecial,
              onChanged: (bool trueValue) {
                Provider.of<PassProvider>(context, listen: false)
                    .toggspe(trueValue);
              },
            ),
          ),
          ReusableCard(
            child: SwitchListTile(
                title: Text('Include Numbers'),
                value: Provider.of<PassProvider>(context).includeNumbers,
                onChanged: (bool newValue) {
                  Provider.of<PassProvider>(context, listen: false)
                      .toggnum(newValue);
                }),
          ),
          SizedBox(
            height: 30.0,
          ),
          BottomButton(
            TextButton(
                onPressed: () {
                  Provider.of<PassProvider>(context, listen: false).getPass();
                },
                child: Text(
                  'Generate Password',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}
