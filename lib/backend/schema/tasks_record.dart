import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';



import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  bool hasCompleted() => _completed != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "time_completed" field.
  DateTime? _timeCompleted;
  DateTime? get timeCompleted => _timeCompleted;
  bool hasTimeCompleted() => _timeCompleted != null;

  // "due_time" field.
  DateTime? _dueTime;
  DateTime? get dueTime => _dueTime;
  bool hasDueTime() => _dueTime != null;

  // "notified_1hr" field.
  bool? _notified1hr;
  bool get notified1hr => _notified1hr ?? false;
  bool hasNotified1hr() => _notified1hr != null;

  // "energy_level" field.
  String? _energyLevel;
  String get energyLevel => _energyLevel ?? '';
  bool hasEnergyLevel() => _energyLevel != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "is_essential" field.
  bool? _isEssential;
  bool get isEssential => _isEssential ?? false;
  bool hasIsEssential() => _isEssential != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _details = snapshotData['details'] as String?;
    _completed = snapshotData['completed'] as bool?;
    _user = snapshotData['user'] as DocumentReference?;
    _created = snapshotData['created'] as DateTime?;
    _timeCompleted = snapshotData['time_completed'] as DateTime?;
    _dueTime = snapshotData['due_time'] as DateTime?;
    _notified1hr = snapshotData['notified_1hr'] as bool?;
    _energyLevel = snapshotData['energy_level'] as String?;
    _category = snapshotData['category'] as String?;
    _isEssential = snapshotData['is_essential'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  String? title,
  String? details,
  bool? completed,
  DocumentReference? user,
  DateTime? created,
  DateTime? timeCompleted,
  DateTime? dueTime,
  bool? notified1hr,
  String? energyLevel,
  String? category,
  bool? isEssential,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'details': details,
      'completed': completed,
      'user': user,
      'created': created,
      'time_completed': timeCompleted,
      'due_time': dueTime,
      'notified_1hr': notified1hr,
      'energy_level': energyLevel,
      'category': category,
      'is_essential': isEssential,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.details == e2?.details &&
        e1?.completed == e2?.completed &&
        e1?.user == e2?.user &&
        e1?.created == e2?.created &&
        e1?.timeCompleted == e2?.timeCompleted &&
        e1?.dueTime == e2?.dueTime &&
        e1?.notified1hr == e2?.notified1hr &&
        e1?.energyLevel == e2?.energyLevel &&
        e1?.category == e2?.category &&
        e1?.isEssential == e2?.isEssential;
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([
        e?.title,
        e?.details,
        e?.completed,
        e?.user,
        e?.created,
        e?.timeCompleted,
        e?.dueTime,
        e?.notified1hr,
        e?.energyLevel,
        e?.category,
        e?.isEssential
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}
