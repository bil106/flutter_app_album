import 'package:flutter_app/src/dataloader.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
 group('dataloader', () {
    const userId = 0;
    const id = 0;
    const title = '';
    var album = Album(userId: userId, id: id, title: title);
    
    testWidgets('A new id should be added', (tester) async {
     var id=101;
   
     album.add(id);
     expect(album.items.contains(id), true);
    });
    test('An id should be removed', () {
      var id = 10;
      album.add(id);
      expect(album.items.contains(id), true);
      album.remove(id);
      expect(album.items.contains(id), false);
    });
 });
}