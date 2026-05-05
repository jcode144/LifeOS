import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:life_o_s/flutter_flow/flutter_flow_drop_down.dart';
import 'package:life_o_s/flutter_flow/flutter_flow_icon_button.dart';
import 'package:life_o_s/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:life_o_s/index.dart';
import 'package:life_o_s/main.dart';
import 'package:life_o_s/flutter_flow/flutter_flow_util.dart';
import 'package:shadcn_u_i_kit_v48jv9/app_state.dart'
    as shadcn_u_i_kit_v48jv9_app_state;

import 'package:provider/provider.dart';
import 'package:life_o_s/backend/firebase/firebase_config.dart';
import 'package:life_o_s/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
    shadcn_u_i_kit_v48jv9_app_state.FFAppState.reset();
    await shadcn_u_i_kit_v48jv9_app_state.FFAppState()
        .initializePersistedState();
  });

  testWidgets('Successfuly log in', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FFAppState(),
        ),
        ChangeNotifierProvider(
          create: (context) => shadcn_u_i_kit_v48jv9_app_state.FFAppState(),
        ),
      ],
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('Tab_662p')));
    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(const ValueKey('emailAddress_qw36')), 'testing@gmail.com');
    await tester.enterText(
        find.byKey(const ValueKey('password_xgmh')), '1234567');
    await tester.tap(find.byKey(const ValueKey('Button_l0ij')));
    await tester.pumpAndSettle();
    expect(find.text('Welcome,'), findsWidgets);
  });

  testWidgets('Successful Account Creation', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FFAppState(),
        ),
        ChangeNotifierProvider(
          create: (context) => shadcn_u_i_kit_v48jv9_app_state.FFAppState(),
        ),
      ],
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(const ValueKey('emailAddress_Create_l26n')),
        'unittest100@gmail.com');
    await tester.enterText(
        find.byKey(const ValueKey('password_Create_1ndk')), '1234567');
    await tester.enterText(
        find.byKey(const ValueKey('password_CreateConfirm_cr9f')), '1234567');
    await tester.tap(find.byKey(const ValueKey('Button_f5gy')));
    await tester.pumpAndSettle();
    expect(find.text('Create your Profile'), findsWidgets);
  });

  testWidgets('us3', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FFAppState(),
        ),
        ChangeNotifierProvider(
          create: (context) => shadcn_u_i_kit_v48jv9_app_state.FFAppState(),
        ),
      ],
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(const ValueKey('emailAddress_Create_l26n')),
        'unittest200@gmail.com');
    await tester.enterText(
        find.byKey(const ValueKey('password_Create_1ndk')), '1234567');
    await tester.enterText(
        find.byKey(const ValueKey('password_CreateConfirm_cr9f')), '1234567');
    await tester.tap(find.byKey(const ValueKey('Button_f5gy')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const ValueKey('yourName_edw2')), 'User');
    await tester.tap(find.byKey(const ValueKey('Button_zkhz')));
    expect(find.text('Welcome,'), findsWidgets);
  });

  testWidgets('us4', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FFAppState(),
        ),
        ChangeNotifierProvider(
          create: (context) => shadcn_u_i_kit_v48jv9_app_state.FFAppState(),
        ),
      ],
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('Tab_662p')));
    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(const ValueKey('emailAddress_qw36')), 'testing@gmail.com');
    await tester.enterText(
        find.byKey(const ValueKey('password_xgmh')), '1234567');
    await tester.tap(find.byKey(const ValueKey('Button_l0ij')));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.task_alt));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.cached));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.bar_chart_sharp));
    await tester.pumpAndSettle();
    expect(find.text('Progress'), findsWidgets);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }
  // Web-specific error when interacting with TextInputType.emailAddress
  if (error.contains('setSelectionRange') &&
      error.contains('HTMLInputElement')) {
    return true;
  }

  return false;
}
