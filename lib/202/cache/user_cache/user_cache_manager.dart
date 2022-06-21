import 'dart:convert';

import 'package:flutter_learn_project/202/cache/shared_manager.dart';

import '../shared_learn_cache.dart';
import '../user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  Future<void> saveItems(List<User> items) async {
    //UI İçin pahalı işlemlerdir.
    //Compute
    final _items =
        items.map((element) => jsonEncode(element.toJson())).toList();
    await sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  List<User>? getItems() {
    final _itemsString = sharedManager.getStringItems(SharedKeys.users);
    if (_itemsString?.isNotEmpty ?? false) {
      return _itemsString!.map((e) {
        final json = jsonDecode(e);
        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        }
        return User('', '', '');
      }).toList();
    }
    return null;
  }
}
