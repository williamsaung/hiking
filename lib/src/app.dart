import 'configs/export_config.dart';
import 'widgets/export_widgets.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GlobalLoaderOverlay(
        overlayColor: AppTheme.black,
        overlayOpacity: 0.2,
        overlayWidget: Center(child: LoadingCustom.loadingOverlayWidget()),
        useDefaultLoading: false,
        child: GetMaterialApp(
          // initialRoute: Routes.bottomBarPages,
          initialRoute: Routes.login,
          getPages: Routes.getAll(),
        ),
      );
    });
  }
}

class Init {
  Init._();
  static final instance = Init._();
}
