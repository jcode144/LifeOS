import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';



import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NpsRecord extends FirestoreRecord {
  NpsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "improvement" field.
  String? _improvement;
  String get improvement => _improvement ?? '';
  bool hasImprovement() => _improvement != null;

  // "feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  bool hasFeedback() => _feedback != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _rating = castToType<double>(snapshotData['rating']);
    _improvement = snapshotData['improvement'] as String?;
    _feedback = snapshotData['feedback'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('NPS');

  static Stream<NpsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NpsRecord.fromSnapshot(s));

  static Future<NpsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NpsRecord.fromSnapshot(s));

  static NpsRecord fromSnapshot(DocumentSnapshot snapshot) => NpsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NpsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NpsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NpsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NpsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNpsRecordData({
  DocumentReference? user,
  double? rating,
  String? improvement,
  String? feedback,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'rating': rating,
      'improvement': improvement,
      'feedback': feedback,
    }.withoutNulls,
  );

  return firestoreData;
}

class NpsRecordDocumentEquality implements Equality<NpsRecord> {
  const NpsRecordDocumentEquality();

  @override
  bool equals(NpsRecord? e1, NpsRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.rating == e2?.rating &&
        e1?.improvement == e2?.improvement &&
        e1?.feedback == e2?.feedback;
  }

  @override
  int hash(NpsRecord? e) => const ListEquality()
      .hash([e?.user, e?.rating, e?.improvement, e?.feedback]);

  @override
  bool isValidKey(Object? o) => o is NpsRecord;
}
