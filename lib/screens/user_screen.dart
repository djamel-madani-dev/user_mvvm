// lib/screens/user_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/user_view_model.dart';
import '../widgets/user_widget.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final userViewModel = Provider.of<UserViewModel>(context, listen: false);
      userViewModel.fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (viewModel.errorMessage != null) {
          return Center(child: Text('Erreur : ${viewModel.errorMessage!}'));
        }

        return ListView.builder(
          itemCount: viewModel.users.length,
          itemBuilder: (context, index) {
            return UserWidget(user: viewModel.users[index]);
          },
        );
      },
    );
  }
}
