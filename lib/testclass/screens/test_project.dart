import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testproject/testclass/controller/test_project_controller.dart';
import 'package:testproject/testclass/widgets/common_text_field.dart';
import 'package:testproject/testclass/widgets/message_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    super.initState();
    var testController = Provider.of<TestController>(context, listen: false);
    controller = TabController(length: 2, vsync: this);
    controller!.addListener(() {
      testController.onTabChanged(controller!.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<TestController>(builder: (context, testController, child) {
      return DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                toolbarHeight: size.height * 0.08,
                leading: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF842e80),
                  size: 30,
                ),
                title: Text(
                  "Announcement",
                  style: TextStyle(
                      color: const Color(0xFF842e80),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold),
                ),
                bottom: TabBar(
                  dividerColor: Colors.white,
                  controller: controller,
                  unselectedLabelColor: Colors.grey,
                  labelColor: const Color(0xFF842e80),
                  indicatorColor: const Color(0xFF842e80),
                  isScrollable: true,
                  tabs: [
                    Tab(
                        child: Text('Announcement',
                            style: TextStyle(
                                color: testController.selectedIndex == 0
                                    ? const Color(0xFF842e80)
                                    : Colors.grey,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500))),
                    Tab(
                        child: Text('Notes',
                            style: TextStyle(
                                color: testController.selectedIndex == 1
                                    ? const Color(0xFF842e80)
                                    : Colors.grey,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500))),
                  ],
                ),
              ),
              body: TabBarView(
                controller: controller,
                children: <Widget>[
                  testController.isButtonClicked
                      ? const Column(
                          children: [
                            //!--Announcement List
                            MessageList(),

                            //!--Announcement creating text form field
                            CreateAnnouncementTextField(),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "you can create announcement to your class",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                testController.onCreateButtonClick();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF842e80),
                                  borderRadius: BorderRadius.circular(08),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.w),
                                  child: Text(
                                    "Create announcement",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Text("Name",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400)),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                )
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.15,
                            ),
                            Row(
                              children: [
                                Text("Date",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400)),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: const Color(0xFF842e80),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: testController.messageList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 08.w),
                              child: SizedBox(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      child: Image.asset(
                                        "assets/images/pdfimage.png",
                                        width: size.width * 0.03,
                                        height: 20.h,
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.2,
                                      child: Text(
                                          testController.messageList[index]
                                              ["fileName"],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.02,
                                    ),
                                    Text("may 02 2023",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis),
                                    SizedBox(
                                      width: size.width * 0.02,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 07.w, vertical: 3.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(08.r),
                                        color: Color(0xfff7f7f7),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.link,
                                            color: Color(0xFF089dde),
                                            size: 15,
                                          ),
                                          Text("Copy link",
                                              style: TextStyle(
                                                  color: Color(0xFF089dde),
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.02,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 07.w, vertical: 3.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(08.r),
                                        color: Color(0xfff7f7f7),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.share,
                                            color: Color(0xFF089dde),
                                            size: 15,
                                          ),
                                          Text("Share",
                                              style: TextStyle(
                                                  color: Color(0xFF089dde),
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.02,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 07.w, vertical: 3.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(08.r),
                                        color: Color(0xfff7f7f7),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.arrow_downward,
                                            color: Color(0xFF5ed690),
                                            size: 15,
                                          ),
                                          Text("Download",
                                              style: TextStyle(
                                                  color: Color(0xFF5ed690),
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              )));
    });
  }
}
