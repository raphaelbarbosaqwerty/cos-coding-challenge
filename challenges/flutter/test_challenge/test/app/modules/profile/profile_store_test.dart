import 'package:flutter_test/flutter_test.dart';
import 'package:test_challenge/app/modules/profile/profile_store.dart';
 
void main() {
  late ProfileStore store;

  setUpAll(() {
    store = ProfileStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}