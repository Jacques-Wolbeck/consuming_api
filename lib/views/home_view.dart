import 'package:consuming_api/models/user_model.dart';
import 'package:consuming_api/services/api_service.dart';
import 'package:consuming_api/widgets/status_snackbar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<User>> data;
  @override
  void initState() {
    _loadUsers();
    super.initState();
  }

  _loadUsers() {
    data = ApiService.api.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing API'),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: (() async {
          User user = User(
            username: 'noOne',
            email: 'noone@gmail.com',
            phone: '123456',
          );
          await ApiService.api.createUser(user);
        }),
        child: const Icon(Icons.add),
      ),
    );
  }

  _body() {
    return FutureBuilder<List<User>>(
        future: data,
        builder: (context, snapshot) {
          List<User> users = snapshot.data == null ? [] : snapshot.data!;
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (users == []) {
            return const Center(
              child: Text('No users'),
            );
          }
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: ((context, index) {
              var user = users[index];
              return Card(
                child: ListTile(
                  title: Text(user.username!),
                  subtitle: Text(user.email!),
                ),
              );
            }),
          );
        });
  }
}
