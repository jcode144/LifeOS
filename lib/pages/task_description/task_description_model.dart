import '/flutter_flow/flutter_flow_util.dart';
import 'task_description_widget.dart' show TaskDescriptionWidget;
import 'package:flutter/material.dart';

class TaskDescriptionModel extends FlutterFlowModel<TaskDescriptionWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for AddDescription widget.
  FocusNode? addDescriptionFocusNode;
  TextEditingController? addDescriptionTextController;
  String? Function(BuildContext, String?)?
      addDescriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    addDescriptionFocusNode?.dispose();
    addDescriptionTextController?.dispose();
  }
}
