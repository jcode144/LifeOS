import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_styling/create_habit/create_habit_widget.dart';
import '/new_styling/empty_list_habits/empty_list_habits_widget.dart';
import '/new_styling/habit_default/habit_default_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'habits_model.dart';
export 'habits_model.dart';

class HabitsWidget extends StatefulWidget {
  const HabitsWidget({super.key});

  static String routeName = 'habits';
  static String routePath = '/habits';

  @override
  State<HabitsWidget> createState() => _HabitsWidgetState();
}

class _HabitsWidgetState extends State<HabitsWidget> {
  late HabitsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HabitsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'habits'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('FloatingActionButton pressed ...');
          },
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          elevation: 0.0,
          child: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Color(0xFF4CB963),
              shape: BoxShape.circle,
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
              ),
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('HABITS_PAGE_Icon_qhu21xc2_ON_TAP');
                logFirebaseEvent('Icon_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: CreateHabitWidget(),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: Icon(
                Icons.loop,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 32.0,
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: 400.0,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Habits',
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                font: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontStyle,
                              ),
                    ),
                    Expanded(
                      child: StreamBuilder<List<HabitsRecord>>(
                        stream: queryHabitsRecord(
                          queryBuilder: (habitsRecord) => habitsRecord.where(
                            'user_ref',
                            isEqualTo: currentUserReference,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<HabitsRecord> listViewHabitsRecordList =
                              snapshot.data!;
                          if (listViewHabitsRecordList.isEmpty) {
                            return Center(
                              child: EmptyListHabitsWidget(),
                            );
                          }

                          return ListView.separated(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            scrollDirection: Axis.vertical,
                            itemCount: listViewHabitsRecordList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 12.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewHabitsRecord =
                                  listViewHabitsRecordList[listViewIndex];
                              return HabitDefaultWidget(
                                key: Key(
                                    'Keyp80_${listViewIndex}_of_${listViewHabitsRecordList.length}'),
                                habitDoc: listViewHabitsRecord,
                                habitAction: () async {},
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 12.0))
                      .around(SizedBox(height: 12.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
