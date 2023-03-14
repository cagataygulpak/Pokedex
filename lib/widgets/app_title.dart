import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';

class AppTitle extends StatelessWidget {
  AppTitle({Key? key}) : super(key: key);
  String _fotoUrl = "assets/images/pokeball.png";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getAppTitleHeightWidget(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.defaultPadding(),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  Constants.appTitle,
                  style: Constants.getAppTitleTextStyle(),
                )),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                _fotoUrl,
                width: ScreenUtil().orientation == Orientation.portrait
                    ? 0.2.sh
                    : 0.2.sw,
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }
}
