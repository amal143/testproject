import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../controller/test_project_controller.dart';

class FileWidget extends StatelessWidget {
  const FileWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<TestController>(builder: (context, testController, child) {
      return Container(
        padding: EdgeInsets.only(top: 10.h, bottom: 10.h, right: 05.w),
        // width: 120.w,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(08.r)),
        child: Row(
          children: [
            Image.asset(
              "assets/images/pdfimage.png",
              width: 50.w,
              height: 40.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(testController.messageList[index]["fileName"],
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w400)),
                Text('${testController.messageList[index]["fileSize"]}',
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w400))
              ],
            )
          ],
        ),
      );
    });
  }
}
