import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/ui/home/exchange_history.dart';
import 'package:prediction_app/ui/home/notification.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: non_constant_identifier_names
Container buildApp_bar(Size size, BuildContext context) {
  return Container(
    height: size.height * .170,
    width: size.width,
    decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            spreadRadius: 10,
            color: AppColors.background_color1,
            //offset: Offset(1.0, 1.0),
            blurRadius: 5.0,
          ),
        ],
        color: AppColors.primery_color,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
    child: Container(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 28,
                child: Image.asset(
                  "assets/images/pic 2.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Icon(
                Icons.arrow_back,
                size: 18,
                color: Colors.white,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    "1000",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: size.width * .01,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0XFFD87FE2),
                          Color(0xff8987F2),
                          Color(0XFFD87FE2)
                        ],
                        begin: Alignment(-1, -1),
                        end: Alignment(2, 2),
                      ),
                    ),
                    // child: IconButton(
                    //   icon: Icon(
                    //     Icons.add,
                    //     color: Colors.white,
                    //   ),
                    //   onPressed: () {},
                    // ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "Get Credit",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    AppRoutes.push(context, Notifications());
                  },
                  child: Image.asset("assets/images/appbar_notification.png")),
              SizedBox(height: 10.h),
              GestureDetector(
                  onTap: () {
                    AppRoutes.push(context, ExchangeHistory());
                  },
                  child: InkWell(
                    child: CircleAvatar(
                      radius: 13,
                      backgroundColor: Color(0xffBBA608),
                      child: Image.asset("assets/images/dollar.png"),
                    ),
                    onTap: () {},
                  ))
            ],
          )
        ],
      ),
    )),
  );
}

// ignore: non_constant_identifier_names
Container buildApp_only_title_bar(
    Size size, BuildContext context, String title, Color color) {
  return Container(
    height: size.height * .095,
    width: size.width,
    decoration: BoxDecoration(
      // boxShadow: <BoxShadow>[
      //   BoxShadow(
      //     color: Colors.black,
      //     offset: Offset(7.0, 7.0),
      //     blurRadius: 40.0,
      //   ),
      // ],
      color: color,
      // borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
    ),
    child: Container(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 18,
              color: Colors.white,
            ),
            onPressed: () {
              AppRoutes.pop(context);
            },
          ),
          SizedBox(
            width: 75.w,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
          )
        ],
      ),
    )),
  );
}

AppBar appBarWithLogoutAndSwitchRole(context, scaffoldKey) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.white,
    leading: InkWell(
      onTap: () {
        scaffoldKey.currentState.openDrawer();
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 10, spreadRadius: 5, color: Colors.black12)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Image.asset(
          'assets/appIcons/menu.png',
          width: 50,
          height: 50,
        ),
      ),
    ),
  );
}

AppBar appBarwithbackIcon(BuildContext context, {String title = ""}) {
  return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      centerTitle: true,
      leading: Image.asset("assets/images/pic 2.png"));
}

AppBar appBarwithCenterTitle(BuildContext context, String title) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.white.withAlpha(150),
    leading: Image.asset("assets/images/pic 2.png"),
    centerTitle: true,
    title: Column(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(textStyle: buttonFontText),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(textStyle: buttonFontText),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(textStyle: buttonFontText),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(textStyle: buttonFontText),
        ),
      ],
    ),
  );
}

Widget appBarwithImageTitle(BuildContext context, String title) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: AppColors.white,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.grey,
      ),
      onPressed: () => Navigator.pop(context),
    ),
    centerTitle: false,
    title: Row(
      children: <Widget>[
        Container(
          child: CircleAvatar(
            // backgroundColor: AppColors.greyBackColor,
            radius: 30,
            // child: Icon(Icons.person),
            backgroundImage: AssetImage('assets/appIcons/image47.png'),
          ),
        ),
        SizedBox(width: 15),
        Text(
          title,
          style: GoogleFonts.poppins(textStyle: buttonFontText),
        ),
      ],
    ),
  );
}
