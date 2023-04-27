import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_poc/model.dart/user_model.dart';

import 'package:provider_poc/view_model/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserListViewModel>(context, listen: false).getUserList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: const Text("USER DETAILS"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Consumer<UserListViewModel>(
          builder: (context, value, child) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final UserModel userData = value.userList.elementAt(index);
                return GestureDetector(
                  onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(userData.title),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text('User Id  ${userData.userId}  |'),
                              const SizedBox(width: 10,),
                              Text('Id  ${userData.id}'),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Text('Body - ${userData.body}'),
                        ],
                      ),
                    ),
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    margin: const EdgeInsets.all(10),
                    elevation: 7,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            value.userList.elementAt(index).title,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: value.userList.length,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<UserListViewModel>(context, listen: false)
              .shuffleUserList();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
