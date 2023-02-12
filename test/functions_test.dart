
import 'package:etiya_project/pages/classes/functions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  
  test('is label true', () {
   const davinci = 'Simplicity is the ultimate Sophistication';
   final post = Functions();

   expect(post.returnpost(),davinci );
  });
}