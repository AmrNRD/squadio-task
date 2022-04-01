import 'dart:developer';

import 'package:flutter/foundation.dart' show kIsWeb,kReleaseMode;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:squadio/core/theme/app_colors.dart';

class CoreUtility{

  static void safePrint(dynamic value) {
    if (kReleaseMode) return;
    // ignore: avoid_print
    log(value.toString());
  }




  static Future<PersistentBottomSheetController> showBottomSheet({required BuildContext context,required Widget child,bool fractionallySizedBox=false,double factor=0.9,double corners=20,required GlobalKey<ScaffoldState> scaffoldKey,bool showTopBar=true}) async {
   return scaffoldKey.currentState!.showBottomSheet(
     (builder) {
        if(fractionallySizedBox) {
          return  FractionallySizedBox(
            heightFactor: factor,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: showTopBar?AppColors.lightGrey:Colors.transparent,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.only(
                        topRight: Radius.circular(corners),
                        topLeft: Radius.circular(corners),
                      ),
                      color: Theme.of(context).cardColor,
                    ),

                    width: MediaQuery.of(context).size.width,
                    child: child,
                  ),
                ),
              ],
            ),
          );
        } else{
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                height: 5,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: AppColors.lightGrey,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: Theme.of(context).cardColor,
                ),

                width: MediaQuery.of(context).size.width,
                child: child,
              ),
            ],
          );
        }
      },
    );
  }

  static void showModelBottomSheet({required BuildContext context,required Widget child,bool fractionallySizedBox=false,double factor=0.9,double corners=20}){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (builder) {
        if(fractionallySizedBox) {
          return  StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 100,
                      height: 5,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: AppColors.lightGrey,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*factor,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.only(
                          topRight: Radius.circular(corners),
                          topLeft: Radius.circular(corners),
                        ),
                        color: Theme.of(context).cardColor,
                      ),

                      width: MediaQuery.of(context).size.width,
                      child: child,
                    ),
                  ],
                );
              },

              );
        } else{
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                height: 5,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: AppColors.lightGrey,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: Theme.of(context).cardColor,
                ),

                width: MediaQuery.of(context).size.width,
                child: child,
              ),
            ],
          );
        }
      },
    );
  }

  static void benchmark(String name, void Function() test) {
    final int ms = DateTime.now().millisecondsSinceEpoch;
    test();
    CoreUtility.safePrint("Benchmark: $name == ${DateTime.now().millisecondsSinceEpoch - ms}ms");
  }

}
class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}




