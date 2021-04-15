import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrollListViewPage extends StatelessWidget {
  static String routerName = '/scroll_list_view';
  var indices = List.generate(100, (index) => index);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        designSize: Size(800, 1024));
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll List'),
      ),
      body: Column(
        children: [
          Container(
            height: 380.h,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(100, (index) => index).map((index) {
                  return Container(
                    margin: EdgeInsets.all(10.r),
                    height: 50.h,
                    width: ScreenUtil().screenWidth,
                    color: Colors.red,
                    child: Text('Oi $index'),
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
            color: Colors.blue[100],
            height: 150.h,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(100, (index) => index).map((index) {
                  return Container(
                    margin: EdgeInsets.all(10.r),
                    height: 50.h,
                    width: 200.w,
                    color: Colors.red,
                    child: Text('Oi $index'),
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
            height: 380.h,
            child: ListView.builder(
                itemCount: indices.length,
                itemBuilder: (_, index) {
                  print(index);
                  return Container(
                    margin: EdgeInsets.all(10.r),
                    height: 50.h,
                    width: 200.w,
                    color: Colors.red,
                    child: Text('Oi ${indices[index]}'),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
