// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpacingStruct extends FFFirebaseStruct {
  SpacingStruct({
    String? label,
    double? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _label = label,
        _value = value,
        super(firestoreUtilData);

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  set value(double? val) => _value = val;

  void incrementValue(double amount) => value = value + amount;

  bool hasValue() => _value != null;

  static SpacingStruct fromMap(Map<String, dynamic> data) => SpacingStruct(
        label: data['label'] as String?,
        value: castToType<double>(data['value']),
      );

  static SpacingStruct? maybeFromMap(dynamic data) =>
      data is Map ? SpacingStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'label': _label,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.double,
        ),
      }.withoutNulls;

  static SpacingStruct fromSerializableMap(Map<String, dynamic> data) =>
      SpacingStruct(
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'SpacingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SpacingStruct &&
        label == other.label &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([label, value]);
}

SpacingStruct createSpacingStruct({
  String? label,
  double? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SpacingStruct(
      label: label,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SpacingStruct? updateSpacingStruct(
  SpacingStruct? spacing, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    spacing
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSpacingStructData(
  Map<String, dynamic> firestoreData,
  SpacingStruct? spacing,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (spacing == null) {
    return;
  }
  if (spacing.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && spacing.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final spacingData = getSpacingFirestoreData(spacing, forFieldValue);
  final nestedData = spacingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = spacing.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSpacingFirestoreData(
  SpacingStruct? spacing, [
  bool forFieldValue = false,
]) {
  if (spacing == null) {
    return {};
  }
  final firestoreData = mapToFirestore(spacing.toMap());

  // Add any Firestore field values
  mapToFirestore(spacing.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSpacingListFirestoreData(
  List<SpacingStruct>? spacings,
) =>
    spacings?.map((e) => getSpacingFirestoreData(e, true)).toList() ?? [];
