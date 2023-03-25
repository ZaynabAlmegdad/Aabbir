import 'package:flutter/foundation.dart';
import  'package:flutter/material.dart';
import  'package:keyboard_actions/keyboard_actions.dart';
import 'package:untitled2/widget/common.dart';



/// A quick example "keyboard" widget for counter value.
class CounterKeyboard extends StatelessWidget
    with KeyboardCustomPanelMixin<String>
    implements PreferredSizeWidget {
  final ValueNotifier<String> notifier;
  CounterKeyboard({Key? key, required this.notifier}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(200);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      child: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: notifier,
              builder: (con,val,wid){
                return CustomText(text: notifier.value,);
              },),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      int value = int.tryParse(notifier.value) ?? 0;
                      value--;
                      updateValue(value.toString());
                    },
                    child: FittedBox(
                      child: Text(
                        "-",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      int value = int.tryParse(notifier.value) ?? 0;
                      value++;
                      updateValue(value.toString());
                    },
                    child: FittedBox(
                      child: Text(
                        "+",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}