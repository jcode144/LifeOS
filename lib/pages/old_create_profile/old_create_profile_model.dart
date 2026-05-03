import '/flutter_flow/flutter_flow_util.dart';
import 'old_create_profile_widget.dart' show OldCreateProfileWidget;
import 'package:flutter/material.dart';

class OldCreateProfileModel extends FlutterFlowModel<OldCreateProfileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_profilephoto = false;
  FFUploadedFile uploadedLocalFile_profilephoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_profilephoto = '';

  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateTextController;
  String? Function(BuildContext, String?)?
      emailAddressCreateTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressCreateFocusNode?.dispose();
    emailAddressCreateTextController?.dispose();
  }
}
