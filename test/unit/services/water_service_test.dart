import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:water_reminder/features/home/domain/repositories/water_repository.dart';

void main() {
  group('WaterRepository Tests', () {
    late FakeFirebaseFirestore fakeFirestore;
    late MockFirebaseAuth mockAuth;
    late WaterRepository waterRepository;
    late String userId;

    setUp(() {
      fakeFirestore = FakeFirebaseFirestore();
      mockAuth = MockFirebaseAuth(
        mockUser: MockUser(
          uid: 'test-user-id',
          email: 'test@example.com',
        ),
        signedIn: true,
      );
      userId = mockAuth.currentUser!.uid;
      waterRepository = WaterRepository(
        firestore: fakeFirestore,
        auth: mockAuth,
      );
    });

    group('Add Water Record', () {
      test('should add water record successfully', () async {
        // Arrange
        const amount = 250;
        final date = DateFormat('yyyy-MM-dd').format(DateTime.now());

        // Act
        final result = await waterRepository.addWaterRecord(amount: amount);

        // Assert
        expect(result.isRight(), true);

        // Verify in Firestore
        final snapshot = await fakeFirestore
            .collection('water_records')
            .where('userId', isEqualTo: userId)
            .where('date', isEqualTo: date)
            .get();

        expect(snapshot.docs.length, 1);
        expect(snapshot.docs.first.data()['amount'], amount);
      });

      test('should return error for invalid amount (zero)', () async {
        // Arrange
        const amount = 0;

        // Act
        final result = await waterRepository.addWaterRecord(amount: amount);

        // Assert
        expect(result.isLeft(), true);
      });

      test('should return error for invalid amount (negative)', () async {
        // Arrange
        const amount = -100;

        // Act
        final result = await waterRepository.addWaterRecord(amount: amount);

        // Assert
        expect(result.isLeft(), true);
      });

      test('should add multiple water records', () async {
        // Arrange
        const amounts = [250, 500, 350];

        // Act
        for (final amount in amounts) {
          await waterRepository.addWaterRecord(amount: amount);
        }

        // Assert
        final snapshot = await fakeFirestore
            .collection('water_records')
            .where('userId', isEqualTo: userId)
            .get();

        expect(snapshot.docs.length, amounts.length);
      });
    });

    group('Delete Water Record', () {
      test('should delete water record successfully', () async {
        // Arrange - Add a record first
        final docRef = await fakeFirestore.collection('water_records').add({
          'userId': userId,
          'amount': 250,
          'timestamp': Timestamp.now(),
          'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
        });

        // Act
        final result = await waterRepository.deleteWaterRecord(docRef.id);

        // Assert
        expect(result.isRight(), true);

        // Verify deletion
        final doc = await fakeFirestore
            .collection('water_records')
            .doc(docRef.id)
            .get();
        expect(doc.exists, false);
      });

      test('should return error for non-existent record', () async {
        // Arrange
        const nonExistentId = 'non-existent-id';

        // Act
        final result = await waterRepository.deleteWaterRecord(nonExistentId);

        // Assert
        expect(result.isLeft(), true);
      });
    });

    group('Get Water Records for Date', () {
      test('should retrieve water records for specific date', () async {
        // Arrange
        final today = DateTime.now();
        final dateStr = DateFormat('yyyy-MM-dd').format(today);

        await fakeFirestore.collection('water_records').add({
          'userId': userId,
          'amount': 250,
          'timestamp': Timestamp.fromDate(today),
          'date': dateStr,
        });

        await fakeFirestore.collection('water_records').add({
          'userId': userId,
          'amount': 500,
          'timestamp': Timestamp.fromDate(today),
          'date': dateStr,
        });

        // Act
        final snapshot = await fakeFirestore
            .collection('water_records')
            .where('userId', isEqualTo: userId)
            .where('date', isEqualTo: dateStr)
            .get();

        // Assert
        expect(snapshot.docs.length, 2);
        expect(snapshot.docs[0].data()['amount'], 250);
        expect(snapshot.docs[1].data()['amount'], 500);
      });

      test('should return empty list for date with no records', () async {
        // Arrange
        final yesterday = DateTime.now().subtract(const Duration(days: 1));
        final dateStr = DateFormat('yyyy-MM-dd').format(yesterday);

        // Act
        final snapshot = await fakeFirestore
            .collection('water_records')
            .where('userId', isEqualTo: userId)
            .where('date', isEqualTo: dateStr)
            .get();

        // Assert
        expect(snapshot.docs.length, 0);
      });

      test('should only return records for current user', () async {
        // Arrange
        final today = DateTime.now();
        final dateStr = DateFormat('yyyy-MM-dd').format(today);

        // Add record for current user
        await fakeFirestore.collection('water_records').add({
          'userId': userId,
          'amount': 250,
          'timestamp': Timestamp.fromDate(today),
          'date': dateStr,
        });

        // Add record for different user
        await fakeFirestore.collection('water_records').add({
          'userId': 'other-user-id',
          'amount': 500,
          'timestamp': Timestamp.fromDate(today),
          'date': dateStr,
        });

        // Act
        final snapshot = await fakeFirestore
            .collection('water_records')
            .where('userId', isEqualTo: userId)
            .where('date', isEqualTo: dateStr)
            .get();

        // Assert
        expect(snapshot.docs.length, 1);
        expect(snapshot.docs.first.data()['userId'], userId);
      });
    });

    group('Calculate Daily Total', () {
      test('should calculate correct daily total', () async {
        // Arrange
        final today = DateTime.now();
        final dateStr = DateFormat('yyyy-MM-dd').format(today);
        const amounts = [250, 500, 350];

        for (final amount in amounts) {
          await fakeFirestore.collection('water_records').add({
            'userId': userId,
            'amount': amount,
            'timestamp': Timestamp.fromDate(today),
            'date': dateStr,
          });
        }

        // Act
        final snapshot = await fakeFirestore
            .collection('water_records')
            .where('userId', isEqualTo: userId)
            .where('date', isEqualTo: dateStr)
            .get();

        final total = snapshot.docs.fold<int>(
          0,
          (sum, doc) => sum + (doc.data()['amount'] as int),
        );

        // Assert
        expect(total, 1100); // 250 + 500 + 350
      });

      test('should return zero for day with no records', () async {
        // Arrange
        final yesterday = DateTime.now().subtract(const Duration(days: 1));
        final dateStr = DateFormat('yyyy-MM-dd').format(yesterday);

        // Act
        final snapshot = await fakeFirestore
            .collection('water_records')
            .where('userId', isEqualTo: userId)
            .where('date', isEqualTo: dateStr)
            .get();

        final total = snapshot.docs.fold<int>(
          0,
          (sum, doc) => sum + (doc.data()['amount'] as int),
        );

        // Assert
        expect(total, 0);
      });
    });

    group('Water Records Stream', () {
      test('should emit water records when added', () async {
        // Arrange
        final today = DateTime.now();
        final dateStr = DateFormat('yyyy-MM-dd').format(today);

        final stream = fakeFirestore
            .collection('water_records')
            .where('userId', isEqualTo: userId)
            .where('date', isEqualTo: dateStr)
            .snapshots();

        // Act
        await fakeFirestore.collection('water_records').add({
          'userId': userId,
          'amount': 250,
          'timestamp': Timestamp.fromDate(today),
          'date': dateStr,
        });

        // Assert
        await expectLater(
          stream,
          emits(predicate<QuerySnapshot>((snapshot) => snapshot.docs.isNotEmpty)),
        );
      });
    });
  });
}
