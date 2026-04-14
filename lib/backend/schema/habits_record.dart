import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';



import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HabitsRecord extends FirestoreRecord {
  HabitsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "frequency" field.
  String? _frequency;
  String get frequency => _frequency ?? '';
  bool hasFrequency() => _frequency != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "completed_dates" field.
  List<String>? _completedDates;
  List<String> get completedDates => _completedDates ?? const [];
  bool hasCompletedDates() => _completedDates != null;

  // "completionratep" field.
  double? _completionratep;
  double get completionratep => _completionratep ?? 0.0;
  bool hasCompletionratep() => _completionratep != null;

  // "current_streak" field.
  int? _currentStreak;
  int get currentStreak => _currentStreak ?? 0;
  bool hasCurrentStreak() => _currentStreak != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _frequency = snapshotData['frequency'] as String?;
    _startDate = snapshotData['start_date'] as DateTime?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _completedDates = getDataList(snapshotData['completed_dates']);
    _completionratep = castToType<double>(snapshotData['completionratep']);
    _currentStreak = castToType<int>(snapshotData['current_streak']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('habits');

  static Stream<HabitsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HabitsRecord.fromSnapshot(s));

  static Future<HabitsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HabitsRecord.fromSnapshot(s));

  static HabitsRecord fromSnapshot(DocumentSnapshot snapshot) => HabitsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HabitsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HabitsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HabitsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HabitsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHabitsRecordData({
  String? name,
  String? description,
  String? frequency,
  DateTime? startDate,
  DateTime? createdAt,
  DocumentReference? userRef,
  double? completionratep,
  int? currentStreak,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'frequency': frequency,
      'start_date': startDate,
      'created_at': createdAt,
      'user_ref': userRef,
      'completionratep': completionratep,
      'current_streak': currentStreak,
    }.withoutNulls,
  );

  return firestoreData;
}

class HabitsRecordDocumentEquality implements Equality<HabitsRecord> {
  const HabitsRecordDocumentEquality();

  @override
  bool equals(HabitsRecord? e1, HabitsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.frequency == e2?.frequency &&
        e1?.startDate == e2?.startDate &&
        e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.completedDates, e2?.completedDates) &&
        e1?.completionratep == e2?.completionratep &&
        e1?.currentStreak == e2?.currentStreak;
  }

  @override
  int hash(HabitsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.frequency,
        e?.startDate,
        e?.createdAt,
        e?.userRef,
        e?.completedDates,
        e?.completionratep,
        e?.currentStreak
      ]);

  @override
  bool isValidKey(Object? o) => o is HabitsRecord;
}
