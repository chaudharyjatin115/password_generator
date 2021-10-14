import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:password_generator/utils/pass_field.dart';
import 'package:password_generator/widgets/bottom_container.dart';
import 'package:password_generator/widgets/header.dart';
import 'package:password_generator/widgets/reusableWidget.dart';

import 'package:password_generator/utils/pass_provider.dart';

final passprovider = ChangeNotifierProvider((ref) => PassProvider());

class PassGen extends StatelessWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
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
              child: Consumer(builder: (context, watch, chile) {
                final pass = watch(passprovider);
                return PassField(pass.password);
              }),
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
                    child: Consumer(builder: (context, watch, child) {
                      final slidpro = watch(passprovider);
                      return Slider(
                          value: slidpro.length,
                          min: 8,
                          max: 32,
                          onChanged: (double slidValue) {
                            context.read(passprovider).setLength(slidValue);
                          });
                    })),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text('32'),
                  ),
                )
              ],
            ),
          ),
          Consumer(builder: (context, watch, child) {
            final upcasepr = watch(passprovider);
            return ReusableCard(
              child: SwitchListTile(
                  title: Text('Include UpperCase'),
                  value: upcasepr.includeUpperCase,
                  onChanged: (bool newValue) {
                    context.read(passprovider).toggup(newValue);
                  }),
            );
          }),
          Consumer(builder: (context, watch, child) {
            final lowecasepr = watch(passprovider);
            return ReusableCard(
              child: SwitchListTile(
                  title: Text('Include Lowercase'),
                  value: lowecasepr.includeLowercase,
                  onChanged: (bool ewValue) {
                    context.read(passprovider).togglower(ewValue);
                  }),
            );
          }),
          Consumer(builder: (context, watch, child) {
            final speproc = watch(passprovider);
            return ReusableCard(
              child: SwitchListTile(
                title: Text('Include Special'),
                value: speproc.includeSpecial,
                onChanged: (bool trueValue) {
                  context.read(passprovider).toggspe(trueValue);
                },
              ),
            );
          }),
          Consumer(builder: (context, watch, child) {
            final inclNpro = watch(passprovider);
            return ReusableCard(
              child: SwitchListTile(
                  title: Text('Include Numbers'),
                  value: inclNpro.includeNumbers,
                  onChanged: (bool newValue) {
                    context.read(passprovider).toggnum(newValue);
                  }),
            );
          }),
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
