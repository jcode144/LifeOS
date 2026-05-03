import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_task_widget.dart' show CreateTaskWidget;
import 'package:flutter/material.dart';

class CreateTaskModel extends FlutterFlowModel<CreateTaskWidget> {
  ///  Local state fields for this component.

  DateTime? dueDate;

  String selectedEnergyLevel = 'High';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for taskName widget.
  FocusNode? taskNameFocusNode;
  TextEditingController? taskNameTextController;
  String? Function(BuildContext, String?)? taskNameTextControllerValidator;
  // State field(s) for taskDescription widget.
  FocusNode? taskDescriptionFocusNode;
  TextEditingController? taskDescriptionTextController;
  String? Function(BuildContext, String?)?
      taskDescriptionTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    taskNameFocusNode?.dispose();
    taskNameTextController?.dispose();

    taskDescriptionFocusNode?.dispose();
    taskDescriptionTextController?.dispose();
  }
}
