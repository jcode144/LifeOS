import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in dashboard widget.
  List<HabitsRecord>? habitAI;
  // Stores action output result for [Firestore Query - Query a collection] action in dashboard widget.
  List<TasksRecord>? taskAI;
  // Stores action output result for [AI Agent - Send Message to LifeOS generalize habits due] action in dashboard widget.
  String? habitAIResponse;
  // Stores action output result for [AI Agent - Send Message to LifeOS generalize tasks due] action in dashboard widget.
  String? taskAIResponse;
  // Stores action output result for [AI Agent - Send Message to LifeOS suggest tasks and habits] action in dashboard widget.
  String? suggestionsAI;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
