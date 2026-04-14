import '/flutter_flow/flutter_flow_util.dart';
import 'create_task_widget.dart' show CreateTaskWidget;
import 'package:flutter/material.dart';

class CreateTaskModel extends FlutterFlowModel<CreateTaskWidget> {
  ///  Local state fields for this component.

  DateTime? dueDate;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for AddTitle widget.
  FocusNode? addTitleFocusNode;
  TextEditingController? addTitleTextController;
  String? Function(BuildContext, String?)? addTitleTextControllerValidator;
  String? _addTitleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Title is required';
    }

    if (val.length > 50) {
      return 'Title is too long';
    }

    return null;
  }

  // State field(s) for AddDescription widget.
  FocusNode? addDescriptionFocusNode;
  TextEditingController? addDescriptionTextController;
  String? Function(BuildContext, String?)?
      addDescriptionTextControllerValidator;
  String? _addDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Description is required';
    }

    if (val.length > 150) {
      return 'Description is too long';
    }

    return null;
  }

  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    addTitleTextControllerValidator = _addTitleTextControllerValidator;
    addDescriptionTextControllerValidator =
        _addDescriptionTextControllerValidator;
  }

  @override
  void dispose() {
    addTitleFocusNode?.dispose();
    addTitleTextController?.dispose();

    addDescriptionFocusNode?.dispose();
    addDescriptionTextController?.dispose();
  }
}
