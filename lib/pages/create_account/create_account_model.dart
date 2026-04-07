import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_account_widget.dart' show CreateAccountWidget;
import 'package:flutter/material.dart';

class CreateAccountModel extends FlutterFlowModel<CreateAccountWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Create-Email widget.
  FocusNode? createEmailFocusNode;
  TextEditingController? createEmailTextController;
  String? Function(BuildContext, String?)? createEmailTextControllerValidator;
  String? _createEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Not a valid Email';
    }
    return null;
  }

  // State field(s) for Create-Password widget.
  FocusNode? createPasswordFocusNode;
  TextEditingController? createPasswordTextController;
  late bool createPasswordVisibility;
  String? Function(BuildContext, String?)?
      createPasswordTextControllerValidator;
  String? _createPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    if (val.length < 7) {
      return 'Requires at least 7 characters.';
    }

    return null;
  }

  // State field(s) for Create-Confirm-Passowrd widget.
  FocusNode? createConfirmPassowrdFocusNode;
  TextEditingController? createConfirmPassowrdTextController;
  late bool createConfirmPassowrdVisibility;
  String? Function(BuildContext, String?)?
      createConfirmPassowrdTextControllerValidator;
  String? _createConfirmPassowrdTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password comfirmation is required';
    }

    if (val.length < 7) {
      return 'Requires at least 7 characters.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    createEmailTextControllerValidator = _createEmailTextControllerValidator;
    createPasswordVisibility = false;
    createPasswordTextControllerValidator =
        _createPasswordTextControllerValidator;
    createConfirmPassowrdVisibility = false;
    createConfirmPassowrdTextControllerValidator =
        _createConfirmPassowrdTextControllerValidator;
  }

  @override
  void dispose() {
    createEmailFocusNode?.dispose();
    createEmailTextController?.dispose();

    createPasswordFocusNode?.dispose();
    createPasswordTextController?.dispose();

    createConfirmPassowrdFocusNode?.dispose();
    createConfirmPassowrdTextController?.dispose();
  }
}
