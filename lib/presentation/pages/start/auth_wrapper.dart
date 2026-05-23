import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/pages/home/home_page.dart';
import 'package:chat_pet/presentation/pages/start/start_page.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/common_widgets/loading_widget.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/snack_bar/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserStateError) {
            CustomSnackBar(context, text: state.errorMessage).showErrorMessage();
          }
        },
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, userState) {
            return userState.when(
              initial: LoadingWidget.new,
              loading: LoadingWidget.new,
              error: (_) => StartPage(),
              loaded: (_) => HomePage(),
            );
          },
        ),
      ),
    );
  }
}
