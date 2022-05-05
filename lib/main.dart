import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/features/otp/view_model/otp_view_model.dart';
import 'package:test_project/utlities/app_router.dart';

import 'features/otp/otp_initial_view.dart';

void main() {
  runApp(const TestProject());
}

class TestProject extends StatefulWidget{
  const TestProject({Key? key}) : super(key: key);

  @override
  State<TestProject> createState() => _TestProjectState();
}

class _TestProjectState extends State<TestProject> {

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<OtpViewModel>(
          create: (_) => OtpViewModel(),
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: MaterialApp(
          title: "Dart",
          debugShowCheckedModeBanner: false,
          home: Navigator(
            key: _navigatorKey,
            initialRoute: OtpInitialView.route,
            onGenerateRoute: AppRouter.generateRoute,
          ),
        ),
      ),
    );
  }
}
