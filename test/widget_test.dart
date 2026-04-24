import 'package:flutter_test/flutter_test.dart';
import 'package:listview_app/main.dart';

void main() {
  testWidgets('Navigasi ke Profile Page berhasil',
      (WidgetTester tester) async {

    // 1️⃣ Jalankan aplikasi
    await tester.pumpWidget(const MyApp());

    // 2️⃣ Pastikan HomePage tampil
    expect(find.text('Menu Utama'), findsOneWidget);

    // 3️⃣ Tap tombol "Ke Profile"
    await tester.tap(find.text('Ke Profile'));

    // 4️⃣ Tunggu navigasi selesai
    await tester.pumpAndSettle();

    // 6️⃣ Cek data profile (ini yang paling penting)
    expect(find.text('Muhammad Ryan Hidayat'), findsOneWidget);

    // 7️⃣ Tombol edit profile harus ada
    expect(find.text('Edit Profile'), findsOneWidget);
  });
}