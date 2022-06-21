import 'package:flutter/material.dart';
import 'package:flutter_learn_project/202/cache/shared_learn_cache.dart';
import 'package:flutter_learn_project/202/cache/shared_manager.dart';
import 'package:flutter_learn_project/202/cache/user_cache/user_cache_manager.dart';
import 'package:flutter_learn_project/202/cache/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({Key? key}) : super(key: key);

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends LoadingStatefull<SharedListCache> {
  late final UserCacheManager _manager;
  List<User> _users = [];
  @override
  void initState() {
    super.initState();
    initializeAndSave();
  }

  Future<void> initializeAndSave() async {
    changeLoading();
    final SharedManager manager = SharedManager();
    await manager.init();

    _manager = UserCacheManager(manager);
    _users = _manager.getItems() ?? [];
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isLoading
            ? CircularProgressIndicator(color: Theme.of(context).indicatorColor)
            : null,
        actions: isLoading
            ? null
            : [
                IconButton(
                    onPressed: () async {
                      changeLoading();
                      await _manager.saveItems(_users);
                      changeLoading();
                    },
                    icon: Icon(Icons.download_outlined)),
                IconButton(onPressed: () {}, icon: Icon(Icons.remove_outlined)),
              ],
      ),
      body: _UserListView(
        users: _users,
      ),
    );
  }
}

class _UserListView extends StatelessWidget {
  _UserListView({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(users[index].name ?? ''),
            subtitle: Text(users[index].description ?? ''),
            trailing: Text(users[index].url ?? '',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(decoration: TextDecoration.underline)),
          ),
        );
      },
    );
  }
}
