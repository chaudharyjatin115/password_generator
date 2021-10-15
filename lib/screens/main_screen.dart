import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:password_generator/utils/pass_field.dart';
import 'package:password_generator/widgets/bottom_container.dart';
import 'package:password_generator/widgets/header.dart';
import 'package:password_generator/widgets/reusableWidget.dart';

import 'package:password_generator/utils/pass_provider.dart';

final passprovider = ChangeNotifierProvider((ref) => PassProvider());

class PassGen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final pass = watch(passprovider);
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
              child: PassField(pass.password),
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
                  child:
                      // child: Consumer(
                      //   builder: (context, watch, child) {
                      // final slidpro = watch(passprovider);
                      // return
                      Slider(
                          value: pass.length,
                          min: 8,
                          max: 32,
                          onChanged: (double slidValue) {
                            pass.setLength(slidValue);
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
                value: pass.includeUpperCase,
                onChanged: (bool newValue) {
                  pass.toggup(newValue);
                }),
          ),
          ReusableCard(
            child: SwitchListTile(
                title: Text('Include Lowercase'),
                value: pass.includeLowercase,
                onChanged: (bool ewValue) {
                pass.togglower(ewValue);
                }),
          ),
          ReusableCard(
            child: SwitchListTile(
              title: Text('Include Special'),
              value: pass.includeSpecial,
              onChanged: (bool trueValue) {
                pass.toggspe(trueValue);
              },
            ),
          ),
          ReusableCard(
            child: SwitchListTile(
                title: Text('Include Numbers'),
                value: pass.includeNumbers,
                onChanged: (bool newValue) {
                  pass.toggnum(newValue);
                }),
          ),
          SizedBox(
            height: 30.0,
          ),
          BottomButton(
            TextButton(
                onPressed: () {
                  context.read(passprovider).getPass();
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
