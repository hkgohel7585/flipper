import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flipper/couchbase.dart';
import 'package:flipper/generated/i18n.dart';
import 'package:flipper/locator.dart';
import 'package:flipper/routes/router.gr.dart';
import 'package:flipper/services/analytics_service.dart';
import 'package:flipper/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:logger/logger.dart';
import 'package:redux/redux.dart';
import 'package:stacked_services/stacked_services.dart';

import 'data/respositories/branch_repository.dart';
import 'data/respositories/business_repository.dart';
import 'data/respositories/general_repository.dart';
import 'data/respositories/user_repository.dart';
import 'domain/redux/app_actions/app_action_middleware.dart';
import 'domain/redux/app_reducer.dart';
import 'domain/redux/app_state.dart';
import 'domain/redux/authentication/auth_actions.dart';
import 'domain/redux/authentication/auth_middleware.dart';
import 'domain/redux/branch/branch_middleware.dart';
import 'domain/redux/business/business_actions.dart';
import 'domain/redux/business/business_middleware.dart';
import 'domain/redux/permission/permission_middleware.dart';
import 'domain/redux/push/push_actions.dart';
import 'domain/redux/push/push_middleware.dart';
import 'domain/redux/user/user_middleware.dart';
import 'home/selling/selling_middleware.dart';



class FlipperApp extends StatefulWidget {
  const FlipperApp({Key key}) : super(key: key);

  @override
  _FlipperAppState createState() => _FlipperAppState();
}

class _FlipperAppState extends State<FlipperApp> {

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  final Logger log = Logging.getLogger('Firestore service ....');

  Store<AppState> store;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();
  final UserRepository userRepo = UserRepository();
  final BusinessRepository businessRepo = BusinessRepository();
  final BranchRepository branchRepo = BranchRepository();
  final GeneralRepository generalRepo = GeneralRepository();
  final AppDatabase instance = AppDatabase.instance;
  @override
  void initState() {
    super.initState();
    store = Store<AppState>(
      appReducer,
      initialState: AppState.init(),
      middleware: createAuthenticationMiddleware(
          userRepo, businessRepo, branchRepo, generalRepo, _navigatorKey)
        ..addAll(createBusinessMiddleware(_navigatorKey, businessRepo))
        ..addAll(permissionMiddleware(_navigatorKey))
        ..addAll(sellMiddleware(_navigatorKey))
        ..addAll(AppActionMiddleware(_navigatorKey, generalRepo))
        ..addAll(userMiddleware(userRepo, _navigatorKey))
        ..addAll(createBranchMiddleware(_navigatorKey, branchRepo, generalRepo))
        ..addAll(
          createPushMiddleware(
            userRepo,
            _firebaseMessaging,
          ),
        ),
    );
    store.dispatch(
      VerifyAuthenticationState(),
    );
    store.dispatch(
      ShouldLoadBusiness(),
    );
    // _firebaseMessaging.configure(onBackgroundMessage: backgroundMessageHandler);
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
        log.i('Settings registered: $settings');
    });
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      if (token != null) {
        log.i('Push Messaging token: $token');

        store.dispatch(UpdateUserTokenAction(token, store));
      }
    });
    _firebaseMessaging.subscribeToTopic('all');
  }

  @override
  Widget build(BuildContext context) {
    // ignore: always_specify_types
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        store.dispatch(OnPushNotificationReceivedAction(message));
      },
      onLaunch: (Map<String, dynamic> message) async {
        store.dispatch(OnPushNotificationOpenAction(message));
      },
      onResume: (Map<String, dynamic> message) async {
        store.dispatch(OnPushNotificationOpenAction(message));
      },
    );
    
    // ignore: always_specify_types
    return StoreProvider(
      store: store,
      child: MaterialApp(
        navigatorObservers: <NavigatorObserver>[observer,locator<AnalyticsService>().getAnalyticsObserver()],
        debugShowCheckedModeBanner: false,
        // ignore: prefer_const_literals_to_create_immutables, always_specify_types
        localizationsDelegates: [S.delegate],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Flipper',
        navigatorKey: locator<NavigationService>().navigatorKey, //slowly use mvm stacked architecture
        // theme: buildLightThemeData(mainTextStyle, headerTextStyle),
        // darkTheme: buildDarkThemeData(mainTextStyle, headerTextStyle),
        initialRoute: Routing.splashScreen,
        onGenerateRoute: Routing.onGenerateRoute,
      ),
    );
  }

  @override
  // ignore: avoid_void_async
  void dispose() async {
    await instance.logout();
    super.dispose();
  }
}

// enable analytics on debuging device
// adb shell setprop debug.firebase.analytics.app rw.flipper