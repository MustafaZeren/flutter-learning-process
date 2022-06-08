import 'package:flutter/material.dart';
import 'package:flutter_learn_project/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({Key? key}) : super(key: key);

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user9 = PostModel8(body: 'user9 body');
  bool onPressed = false;
  @override
  void initState() {
    super.initState();
    final user1 = PostModel1()
      ..userId = 1
      ..title = 'user1 title';
    user1.body = 'user1 body';

    final user2 = PostModel2(1, 2, 'user2 title', 'user2 body');
    user2.body = 'User2 body';

    final user3 = PostModel3(1, 2, 'user3 title', 'user3 body');
    // user3.body='a';

    final user4 =
        PostModel4(userId: 1, id: 2, title: 'user4 title', body: 'user4 body');
    // user4.body='a';

    final user5 =
        PostModel5(userId: 1, id: 2, title: 'user5 title', body: 'user5 body');
    user5.userId;

    final user6 =
        PostModel6(userId: 1, id: 2, title: 'user6 title', body: 'user6 body');

    final user7 = PostModel7();

    //service
    final user8 = PostModel8(body: 'user8 body');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {

            user9=user9.copyWith(title: 'mz');

            // if (!onPressed) {
            //   user9 = PostModel8(title: 'OnPressed');
            //   onPressed=true;
            // } else {
            //   user9 = PostModel8(title: 'Not have any data');
            //   onPressed=false;
            // }
          });
        },
      ),
      appBar: AppBar(
        title: Text(user9.title ?? 'Not have any data'),
      ),
    );
  }
}
