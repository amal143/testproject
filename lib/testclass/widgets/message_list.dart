import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:testproject/testclass/controller/test_project_controller.dart';
import 'package:testproject/testclass/widgets/file_widget.dart';

class MessageList extends StatelessWidget {
  const MessageList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TestController>(builder: (context, testController, child) {
      return Expanded(
          child: Padding(
        padding: EdgeInsets.all(10.h),
        child: ListView.builder(
            itemCount: testController.messageList.length,
            itemBuilder: (context, index) {
              return Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Container(
                        padding: EdgeInsets.all(10.h),
                        decoration: BoxDecoration(
                            color: const Color(0xfff2ebf3),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.r),
                                topRight: Radius.circular(15.r),
                                bottomLeft: Radius.circular(15.r))),
                        child: testController
                                .messageList[index]["filePath"].isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      testController.messageList[index]
                                          ["message"],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      //!-- File widget
                                      FileWidget(
                                        index: index,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(05.w),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.shade400),
                                        child: const Icon(
                                          Icons.arrow_downward,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 05.h,
                                  ),
                                  Row(
                                    children: [
                                      Text("25",
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(
                                        width: 05.w,
                                      ),
                                      const Icon(
                                        Icons.thumb_up,
                                        color: Colors.blueAccent,
                                      ),
                                      SizedBox(
                                        width: 05.w,
                                      ),
                                      Text("likes",
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w400))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("View all reply",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(
                                        width: 05.w,
                                      ),
                                      const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.reply,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 05.w,
                                      ),
                                      Text("Reply",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                      testController.messageList[index]
                                          ["message"],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                      DateFormat("dd MMM yyy kk:mm:a")
                                          .format(DateTime.now()),
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w400))
                                ],
                              ),
                      ),
                    ),
                    if (testController
                        .messageList[index]["filePath"].isNotEmpty)
                      SizedBox(
                        width: 05.w,
                      ),
                    if (testController
                        .messageList[index]["filePath"].isNotEmpty)
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text("Delete",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400)),
                              content: Text(
                                  "Would you like to remove this announcement?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400)),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Text("Cancel",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    testController.onAnnouncementDelete(index);
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.w, vertical: 0.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(08.r),
                                      color: const Color(0xFF842e80),
                                    ),
                                    child: Text("Delete",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                            padding: EdgeInsets.all(07.w),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade400),
                            child: Text("T",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400))),
                      )
                  ],
                ),
              );
            }),
      ));
    });
  }
}
