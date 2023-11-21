import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../controller/test_project_controller.dart';

class CreateAnnouncementTextField extends StatelessWidget {
  const CreateAnnouncementTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TestController>(builder: (context, testController, child) {
      return Padding(
        padding: EdgeInsets.all(10.w),
        child: Container(
          padding:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 08.h, bottom: 08.h),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                  bottomLeft: Radius.circular(15.r))),
          child: Column(
            children: [
              TextFormField(
                controller: testController.announcementCtrl,
                maxLines: 4,
                decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: 'Enter your announcement here',
                    contentPadding:
                        const EdgeInsets.fromLTRB(20, 10.0, 20, 10.0),
                    hintStyle: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            topRight: Radius.circular(15.r),
                            bottomLeft: Radius.circular(15.r))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            topRight: Radius.circular(15.r),
                            bottomLeft: Radius.circular(15.r)))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      testController.pickFiles();
                    },
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(08),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(03.w),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.attach_file,
                                  color: Colors.black54,
                                ),
                                Text(
                                  "Attach file",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (testController.filePath.isNotEmpty)
                          Row(
                            children: [
                              SizedBox(
                                child: Image.asset(
                                  "assets/images/pdfimage.png",
                                  width: 30.w,
                                  height: 20.h,
                                ),
                              ),
                              Text(testController.filename,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.bold))
                            ],
                          )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      testController.uplaodAnnouncement();
                      log(DateFormat("dd MMM yyy kk:mm:a")
                          .format(DateTime.now()));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF842e80),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(05.w),
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                          )),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
