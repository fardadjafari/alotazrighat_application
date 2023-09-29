import 'package:alotazrighat_application/constants/constans_variable.dart';
import 'package:alotazrighat_application/pages/active_request/active_request.dart';
import 'package:alotazrighat_application/pages/cubit/navigation_cubit.dart';
import 'package:alotazrighat_application/pages/home_page/home_page.dart';
import 'package:alotazrighat_application/pages/request_page/request_page.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:alotazrighat_application/widget/shapes/bottom_shap_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Color _personColor = Colors.grey;
  Color _postColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: getHeight(context, 0.02)),
                  child: BlocBuilder<NavigationCubit, NavigationState>(
                    builder: (context, state) {
                      if (state.navbarItem == NavbarItem.home) {
                        return const HomePage();
                      } else if (state.navbarItem == NavbarItem.request) {
                        return const Request();
                      } else if (state.navbarItem == NavbarItem.activeRequest) {
                        return const ActiveRequest();
                      }
                      return Container();
                    },
                  )),
            ],
          ),
          bottomNavigationBar: Container(
            height: getHeight(context, 0.09),
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(size.width, getHeight(context, 0.4)),
                  painter: BnBCustomPainter(),
                ),
                Center(
                  heightFactor: 0.6,
                  child: FloatingActionButton(
                    backgroundColor: buttonColor,
                    elevation: 0.1,
                    onPressed: () {
                      setState(() {
                        _postColor = Colors.grey;
                        _personColor = Colors.grey;
                      });
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.home);
                    },
                    child: Icon(
                      Icons.home,
                      size: getWidth(context, 0.08),
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: getHeight(context, 0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _postColor = buttonColor;
                              _personColor = Colors.grey;
                            });
                            BlocProvider.of<NavigationCubit>(context)
                                .getNavBarItem(NavbarItem.request);
                          },
                          icon: Icon(
                            Icons.list_alt_rounded,
                            size: getWidth(context, 0.09),
                            color: _postColor,
                          )),
                      SizedBox(
                        width: getWidth(context, 0.2),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _postColor = Colors.grey;
                              _personColor = buttonColor;
                            });
                            BlocProvider.of<NavigationCubit>(context)
                                .getNavBarItem(NavbarItem.activeRequest);
                          },
                          icon: Icon(
                            Icons.notifications_active,
                            size: getWidth(context, 0.09),
                            color: _personColor,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
