// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PasscodeSegmentStruct extends FFFirebaseStruct {
  PasscodeSegmentStruct({
    List<int>? digits,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _digits = digits,
        super(firestoreUtilData);

  // "digits" field.
  List<int>? _digits;
  List<int> get digits => _digits ?? const [];
  set digits(List<int>? val) => _digits = val;

  void updateDigits(Function(List<int>) updateFn) {
    updateFn(_digits ??= []);
  }

  bool hasDigits() => _digits != null;

  static PasscodeSegmentStruct fromMap(Map<String, dynamic> data) =>
      PasscodeSegmentStruct(
        digits: getDataList(data['digits']),
      );

  static PasscodeSegmentStruct? maybeFromMap(dynamic data) => data is Map
      ? PasscodeSegmentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'digits': _digits,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'digits': serializeParam(
          _digits,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static PasscodeSegmentStruct fromSerializableMap(Map<String, dynamic> data) =>
      PasscodeSegmentStruct(
        digits: deserializeParam<int>(
          data['digits'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'PasscodeSegmentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PasscodeSegmentStruct &&
        listEquality.equals(digits, other.digits);
  }

  @override
  int get hashCode => const ListEquality().hash([digits]);
}

PasscodeSegmentStruct createPasscodeSegmentStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PasscodeSegmentStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PasscodeSegmentStruct? updatePasscodeSegmentStruct(
  PasscodeSegmentStruct? passcodeSegment, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    passcodeSegment
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPasscodeSegmentStructData(
  Map<String, dynamic> firestoreData,
  PasscodeSegmentStruct? passcodeSegment,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (passcodeSegment == null) {
    return;
  }
  if (passcodeSegment.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && passcodeSegment.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final passcodeSegmentData =
      getPasscodeSegmentFirestoreData(passcodeSegment, forFieldValue);
  final nestedData =
      passcodeSegmentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = passcodeSegment.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPasscodeSegmentFirestoreData(
  PasscodeSegmentStruct? passcodeSegment, [
  bool forFieldValue = false,
]) {
  if (passcodeSegment == null) {
    return {};
  }
  final firestoreData = mapToFirestore(passcodeSegment.toMap());

  // Add any Firestore field values
  mapToFirestore(passcodeSegment.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPasscodeSegmentListFirestoreData(
  List<PasscodeSegmentStruct>? passcodeSegments,
) =>
    passcodeSegments
        ?.map((e) => getPasscodeSegmentFirestoreData(e, true))
        .toList() ??
    [];
