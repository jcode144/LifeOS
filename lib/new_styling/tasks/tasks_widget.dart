import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_styling/create_task/create_task_widget.dart';
import '/new_styling/empty_list_tasks_completed/empty_list_tasks_completed_widget.dart';
import '/new_styling/empty_list_tasks_current/empty_list_tasks_current_widget.dart';
import '/new_styling/task_description_comp/task_description_comp_widget.dart';
import '/new_styling/taskcomplete/taskcomplete_widget.dart';
import '/new_styling/taskcurrent/taskcurrent_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tasks_model.dart';
export 'tasks_model.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  static String routeName = 'tasks';
  static String routePath = '/tasks';

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget>
    with TickerProviderStateMixin {
  late TasksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TasksModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'tasks'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    animationsMap.addAll({
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Tasks',
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
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
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 400.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                unselectedLabelStyle:
                                    FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          font: GoogleFonts.plusJakartaSans(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                indicatorColor: Color(0xFF4CB963),
                                tabs: [
                                  Tab(
                                    text: 'Current',
                                  ),
                                  Tab(
                                    text: 'Completed',
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [() async {}, () async {}][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child:
                                              StreamBuilder<List<TasksRecord>>(
                                            stream: queryTasksRecord(
                                              queryBuilder: (tasksRecord) =>
                                                  tasksRecord
                                                      .where(
                                                        'user',
                                                        isEqualTo:
                                                            currentUserReference,
                                                      )
                                                      .where(
                                                        'completed',
                                                        isEqualTo: false,
                                                      )
                                                      .orderBy('due_time'),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<TasksRecord>
                                                  listViewTasksRecordList =
                                                  snapshot.data!;
                                              if (listViewTasksRecordList
                                                  .isEmpty) {
                                                return Center(
                                                  child:
                                                      EmptyListTasksCurrentWidget(),
                                                );
                                              }

                                              return ListView.separated(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 12.0),
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewTasksRecordList
                                                        .length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 12.0),
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewTasksRecord =
                                                      listViewTasksRecordList[
                                                          listViewIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'TASKS_PAGE_Container_dmkvztbj_ON_TAP');
                                                      logFirebaseEvent(
                                                          'taskcurrent_bottom_sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  TaskDescriptionCompWidget(
                                                                taskDoc:
                                                                    listViewTasksRecord,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    onLongPress: () async {
                                                      logFirebaseEvent(
                                                          'TASKS_Container_dmkvztbj_ON_LONG_PRESS');
                                                      logFirebaseEvent(
                                                          'taskcurrent_alert_dialog');
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Task Delete'),
                                                                    content: Text(
                                                                        'Delete this task?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'Cancel'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            'Confirm'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        logFirebaseEvent(
                                                            'taskcurrent_backend_call');
                                                        await listViewTasksRecord
                                                            .reference
                                                            .delete();
                                                      }
                                                    },
                                                    child: TaskcurrentWidget(
                                                      key: Key(
                                                          'Keydmk_${listViewIndex}_of_${listViewTasksRecordList.length}'),
                                                      taskDoc:
                                                          listViewTasksRecord,
                                                      checkAction: () async {
                                                        logFirebaseEvent(
                                                            'TASKS_PAGE_Container_dmkvztbj_CALLBACK');
                                                        logFirebaseEvent(
                                                            'taskcurrent_backend_call');

                                                        await listViewTasksRecord
                                                            .reference
                                                            .update(
                                                                createTasksRecordData(
                                                          completed: true,
                                                          timeCompleted:
                                                              getCurrentTimestamp,
                                                        ));
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: Container(
                                              width: 60.0,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF4CB963),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'TASKS_PAGE_Icon_eajn6oz6_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Icon_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              CreateTaskWidget(),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));

                                                  logFirebaseEvent(
                                                      'Icon_google_analytics_event');
                                                  logFirebaseEvent(
                                                      'task_creation_initiated');
                                                },
                                                child: Icon(
                                                  Icons.add_task,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 32.0,
                                                ),
                                              ).animateOnActionTrigger(
                                                animationsMap[
                                                    'iconOnActionTriggerAnimation']!,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: StreamBuilder<
                                                List<TasksRecord>>(
                                              stream: queryTasksRecord(
                                                queryBuilder: (tasksRecord) =>
                                                    tasksRecord
                                                        .where(
                                                          'completed',
                                                          isEqualTo: true,
                                                        )
                                                        .where(
                                                          'user',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        )
                                                        .orderBy(
                                                            'time_completed',
                                                            descending: true),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<TasksRecord>
                                                    listViewTasksRecordList =
                                                    snapshot.data!;
                                                if (listViewTasksRecordList
                                                    .isEmpty) {
                                                  return Center(
                                                    child:
                                                        EmptyListTasksCompletedWidget(),
                                                  );
                                                }

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewTasksRecordList
                                                          .length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 12.0),
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewTasksRecord =
                                                        listViewTasksRecordList[
                                                            listViewIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'TASKS_PAGE_Container_i7xecvyy_ON_TAP');
                                                        logFirebaseEvent(
                                                            'taskcomplete_bottom_sheet');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    TaskDescriptionCompWidget(
                                                                  taskDoc:
                                                                      listViewTasksRecord,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      child: TaskcompleteWidget(
                                                        key: Key(
                                                            'Keyi7x_${listViewIndex}_of_${listViewTasksRecordList.length}'),
                                                        taskDoc:
                                                            listViewTasksRecord,
                                                        actionCallback:
                                                            () async {
                                                          logFirebaseEvent(
                                                              'TASKS_PAGE_Container_i7xecvyy_CALLBACK');
                                                          logFirebaseEvent(
                                                              'taskcomplete_backend_call');

                                                          await listViewTasksRecord
                                                              .reference
                                                              .update(
                                                                  createTasksRecordData(
                                                            completed: false,
                                                          ));
                                                        },
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 12.0)).around(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
