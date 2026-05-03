import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'nps_widget.dart' show NpsWidget;
import 'package:flutter/material.dart';

class NpsModel extends FlutterFlowModel<NpsWidget> {
  ///  Local state fields for this page.

  double rating = 5.0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for Improvement widget.
  FocusNode? improvementFocusNode;
  TextEditingController? improvementTextController;
  String? Function(BuildContext, String?)? improvementTextControllerValidator;
  String? _improvementTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Improvement is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }

    return null;
  }

  // State field(s) for OptionalFeedback widget.
  FocusNode? optionalFeedbackFocusNode;
  TextEditingController? optionalFeedbackTextController;
  String? Function(BuildContext, String?)?
      optionalFeedbackTextControllerValidator;

  @override
  void initState(BuildContext context) {
    improvementTextControllerValidator = _improvementTextControllerValidator;
  }

  @override
  void dispose() {
    improvementFocusNode?.dispose();
    improvementTextController?.dispose();

    optionalFeedbackFocusNode?.dispose();
    optionalFeedbackTextController?.dispose();
  }
}
