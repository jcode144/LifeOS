import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  static String routeName = 'dashboard';
  static String routePath = '/dashboard';

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'dashboard'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DASHBOARD_PAGE_dashboard_ON_INIT_STATE');
      logFirebaseEvent('dashboard_firestore_query');
      _model.habitAI = await queryHabitsRecordOnce(
        queryBuilder: (habitsRecord) => habitsRecord.where(
          'user_ref',
          isEqualTo: currentUserReference,
        ),
      );
      logFirebaseEvent('dashboard_firestore_query');
      _model.taskAI = await queryTasksRecordOnce(
        queryBuilder: (tasksRecord) => tasksRecord.where(
          'user',
          isEqualTo: currentUserReference,
        ),
      );
      logFirebaseEvent('dashboard_a_i_agent');
      clearAiChat('aIHabit', 'GOOGLE');
      logFirebaseEvent('dashboard_a_i_agent');
      clearAiChat('aITask', 'GOOGLE');
      logFirebaseEvent('dashboard_a_i_agent');
      clearAiChat('aiSuggest', 'GOOGLE');
      logFirebaseEvent('dashboard_a_i_agent');
      await callAiAgent(
        context: context,
        prompt: functions.updateHabitJSON(_model.habitAI!.toList()),
        threadId: 'aIHabit',
        agentCloudFunctionName: 'lifeOSGeneralizeHabitsDue',
        provider: 'GOOGLE',
        agentJson:
            '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"lifeOSGeneralizeHabitsDue\",\"key\":\"2b0iy\"},\"name\":\"LifeOS generalize habits due\",\"description\":\"Habit Summary Agent\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-flash-lite\",\"parameters\":{\"temperature\":{\"inputValue\":0.6},\"maxTokens\":{\"inputValue\":65535},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\" Limit the response to a maximum of 200 characters. Do not use bullets.\\nIf there are no habits given, state that there are currently no habits and that the user can create some by navigating to the habits page. A string with no habits is a string that it empty. If the string is empty, do not fabricate habits for the user to make. An example of an empty string is: \\\" \\\".\\n To check if a habit has been completed, look at completed_dates and see if today\'s date is there. Today\'s date can be found at the start of the input text. Do not accuse a person not  completing habits that are, in reality, completed.\\nGenerate a clear and concise summary of the user’s habits that are due today or within the current week. Group similar habits together when possible and generalize them into simple categories (e.g., health, productivity, personal growth). Highlight what needs attention and maintain a motivating tone. Encourage the user to complete their habits.\\nIf all habits are completed today, congratulate the user. \\nAbove all, make sure you are friendly, encouraging, and maybe even a bit humorous.\\n\\nYou will get a string with habit json files in it. An example of a habit json file wrapped in paretheses is the following:\\n(\\n{\\n  \\\"name\\\": \\\"Walk dog\\\",\\n  \\\"description\\\": \\\"Walk dog\\\",\\n  \\\"frequency\\\": \\\"Daily\\\",\\n  \\\"start_date\\\": \\\"2026-04-13T00:00:00-04:00\\\",\\n  \\\"created_at\\\": \\\"2026-04-13T11:24:27-04:00\\\",\\n  \\\"user_ref\\\": \\\"users/wrvR2MAEz9X3v5KvVDPPWholg0q2\\\",\\n  \\\"completed_dates\\\": [\\n    \\\"2026-04-13\\\"\\n  ],\\n  \\\"completionratep\\\": 1.0,\\n  \\\"current_streak\\\": 1\\n}\\n)\\n\\\"start_date\\\",  \\\"created_at\\\",  and \\\"completed_dates\\\" all use the datetime time format defined by FlutterFlow.\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
        responseType: 'PLAINTEXT',
      ).then((generatedText) {
        safeSetState(() => _model.habitAIResponse = generatedText);
      });

      logFirebaseEvent('dashboard_a_i_agent');
      await callAiAgent(
        context: context,
        prompt: functions.allTaskJSON(_model.taskAI!.toList()),
        threadId: 'aITask',
        agentCloudFunctionName: 'lifeOSGeneralizeTasksDue',
        provider: 'GOOGLE',
        agentJson:
            '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"lifeOSGeneralizeTasksDue\",\"key\":\"stald\"},\"name\":\"LifeOS generalize tasks due\",\"description\":\"Task Summary Agent\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-flash-lite\",\"parameters\":{\"temperature\":{\"inputValue\":0.6},\"maxTokens\":{\"inputValue\":65535},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\" Limit the response to a maximum of 200 characters. Do not use bullets.\\nIf there are no tasks given, state that there are currently no tasks and that the user can create some by navigating to the task page. A string with no tasks is a string that it empty. If the string is empty, do not fabricate tasks for the user to make. An example of an empty string is: \\\" \\\".\\n To check if a task has been completed, look at the completed boolean and see if is true. Today\'s date can be found at the start of the input text. Do not accuse a person not not completing tasks that are completed.\\nGenerate a clear and concise summary of the user’s tasks that are due today or within the current week. Group similar tasks together when possible and generalize them into simple categories (e.g., health, productivity, personal growth). Highlight what needs attention and maintain a motivating tone. Prioritize talking about tasks that are due soon. Encourage the user to complete their tasks.\\nIf all tasks are completed today, congratulate the user. \\nAbove all, make sure you are friendly, encouraging, and maybe even a bit humorous.\\n\\nYou will get a string with task json files in it. An example of a task json file wrapped in paretheses is the following:\\n(\\n{\\n  \\\"tasks\\\": {\\n    \\\"title\\\": \\\"string\\\",\\n    \\\"details\\\": \\\"string\\\",\\n    \\\"completed\\\": \\\"boolean\\\",\\n    \\\"user\\\": \\\"doc_reference(users)\\\",\\n    \\\"created\\\": \\\"datetime\\\",\\n    \\\"time_completed\\\": \\\"datetime\\\",\\n    \\\"due_time\\\": \\\"datetime\\\",\\n    \\\"notified_1hr\\\": \\\"boolean\\\",\\n    \\\"energy_level\\\": \\\"string\\\",\\n    \\\"category\\\": \\\"string\\\",\\n    \\\"is_essential\\\": \\\"boolean\\\"\\n  }\\n}\\n)\\n\\\"created\\\",  \\\"due_time\\\",  and \\\"time_completed\\\" all use the datetime time format defined by FlutterFlow.\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
        responseType: 'PLAINTEXT',
      ).then((generatedText) {
        safeSetState(() => _model.taskAIResponse = generatedText);
      });

      logFirebaseEvent('dashboard_a_i_agent');
      await callAiAgent(
        context: context,
        prompt: functions.allTasksAndHabitsJSONs(
            _model.habitAI!.toList(), _model.taskAI!.toList()),
        threadId: 'aiSuggest',
        agentCloudFunctionName: 'lifeOSSuggestTasksAndHabits',
        provider: 'GOOGLE',
        agentJson:
            '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"lifeOSSuggestTasksAndHabits\",\"key\":\"hjb30\"},\"name\":\"LifeOS suggest tasks and habits\",\"description\":\"Task and Habit suggestion agent\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-flash-lite\",\"parameters\":{\"temperature\":{\"inputValue\":0.8},\"maxTokens\":{\"inputValue\":65535},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\" Limit the response to a maximum of 200 characters. Do not use bullets.\\nIf there are no tasks or habits given, state that there are currently no tasks or habits and that the user can create some by navigating to the tasks and habits page. A string with no tasks or habits is a string that is empty. If the string is empty, do not fabricate tasks habits for the user to make. An example of an empty string is: \\\" \\\".\\n\\nYou will first receive a list of habit JSONs, and then a list of task JSONs.\\n\\nGenerate at least one task and habit suggestion based on the previous tasks and habits the user has created. Try not to make suggestions based on one task or habit. Look for repeated tasks that could possibly be turned into habits. Above all, make sure you are friendly, encouraging, and maybe even a bit humorous.\\n\\nAn example of a habit JSON wrapped in parentheses is the following:\\n(\\n{\\n \\\"type\\\": habit,\\n  \\\"name\\\": \\\"Walk dog\\\",\\n  \\\"description\\\": \\\"Walk dog\\\",\\n  \\\"frequency\\\": \\\"Daily\\\",\\n  \\\"start_date\\\": \\\"2026-04-13T00:00:00-04:00\\\",\\n  \\\"created_at\\\": \\\"2026-04-13T11:24:27-04:00\\\",\\n  \\\"user_ref\\\": \\\"users/wrvR2MAEz9X3v5KvVDPPWholg0q2\\\",\\n  \\\"completed_dates\\\": [\\n    \\\"2026-04-13\\\"\\n  ],\\n  \\\"completionratep\\\": 1.0,\\n  \\\"current_streak\\\": 1\\n}\\n)\\n\\\"start_date\\\",  \\\"created_at\\\",  and \\\"completed_dates\\\" all use the datetime time format defined by FlutterFlow.\\n\\nAn example of a task json file wrapped in paretheses is the following:\\n(\\n{\\n  \\\"tasks\\\": {\\n    \\\"type\\\": \\\"task\\\",\\n    \\\"title\\\": \\\"string\\\",\\n    \\\"details\\\": \\\"string\\\",\\n    \\\"completed\\\": \\\"boolean\\\",\\n    \\\"user\\\": \\\"doc_reference(users)\\\",\\n    \\\"created\\\": \\\"datetime\\\",\\n    \\\"time_completed\\\": \\\"datetime\\\",\\n    \\\"due_time\\\": \\\"datetime\\\",\\n    \\\"notified_1hr\\\": \\\"boolean\\\",\\n    \\\"energy_level\\\": \\\"string\\\",\\n    \\\"category\\\": \\\"string\\\",\\n    \\\"is_essential\\\": \\\"boolean\\\"\\n  }\\n}\\n)\\n\\\"created\\\",  \\\"due_time\\\",  and \\\"time_completed\\\" all use the datetime time format defined by FlutterFlow.\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
        responseType: 'PLAINTEXT',
      ).then((generatedText) {
        safeSetState(() => _model.suggestionsAI = generatedText);
      });
    });

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 400.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Welcome,',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                            lineHeight: 2.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      valueOrDefault<String>(
                                        currentUserDisplayName,
                                        'user!',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                            lineHeight: 2.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        30.0, 0.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'DASHBOARD_PAGE_LOG_OUT_BTN_ON_TAP');
                                        logFirebaseEvent('Button_navigate_to');

                                        context.pushNamed(
                                            OnboardingWidget.routeName);
                                      },
                                      text: 'Log Out\n',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF4CB963),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.plusJakartaSans(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ].addToStart(SizedBox(width: 20.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                            "MMMMEEEEd", getCurrentTimestamp),
                                        'Date',
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                            lineHeight: 2.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ].addToStart(SizedBox(width: 20.0)),
                            ),
                          ],
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 10.0))
                        .around(SizedBox(height: 10.0)),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 400.0,
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0x754CB963),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8.0,
                                    color: Color(0x1A000000),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tasks Overview 🌱',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Divider(
                                      height: 1.0,
                                      thickness: 1.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 311.6,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              topRight: Radius.circular(10.0),
                                              bottomLeft: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0),
                                            ),
                                          ),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 4.0, 6.0, 4.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  _model.taskAIResponse,
                                                  'Analyzing your tasks...',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0x754CB963),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8.0,
                                    color: Color(0x1A000000),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Habit Overview 🌳',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Divider(
                                      height: 1.0,
                                      thickness: 1.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 311.6,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              topRight: Radius.circular(10.0),
                                              bottomLeft: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0),
                                            ),
                                          ),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 4.0, 6.0, 4.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  _model.habitAIResponse,
                                                  'Analyzing your habits...',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0x754CB963),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8.0,
                                    color: Color(0x1A000000),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Suggestions 💡',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Divider(
                                      height: 1.0,
                                      thickness: 1.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 311.6,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              topRight: Radius.circular(10.0),
                                              bottomLeft: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0),
                                            ),
                                          ),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 4.0, 6.0, 4.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  _model.suggestionsAI,
                                                  'Thinking of suggestions...',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
