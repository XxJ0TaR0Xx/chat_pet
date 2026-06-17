import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/presentation/pages/contacts/find_contact/cubit/find_contact_cubit.dart';
import 'package:chat_pet/presentation/pages/contacts/widgets/contact_item.dart';
import 'package:chat_pet/presentation/pages/contacts/widgets/search_text_filed.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/common_widgets/loading_widget.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FindContact extends StatefulWidget {
  const FindContact({super.key});

  @override
  State<FindContact> createState() => _FindContactState();
}

class _FindContactState extends State<FindContact> {
  late final FindContactCubit cubit;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    cubit = getIt<FindContactCubit>();
  }

  @override
  void dispose() {
    cubit.close();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return SafeArea(
      child: BlocProvider.value(
        value: cubit,
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SpacingFoundation.verticalSpace16.sliver,
              SearchTextFiled(
                controller: controller,
                onChange: (value) => cubit.search(value),
                onArrowBack: GoRouter.of(context).pop,
              ).paddingHorizontal(SpacingFoundation.horizontalSpacing24).sliver,
              SpacingFoundation.verticalSpace30.sliver,
              BlocBuilder<FindContactCubit, FindContactState>(
                builder: (context, state) => state.when(
                  error: (error) => SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        error,
                        style: theme?.carosTextTheme.medium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  loading: () => SliverFillRemaining(
                    hasScrollBody: false,
                    child: LoadingWidget(),
                  ),
                  loaded: (contacts) {
                    if (contacts.isEmpty) {
                      return SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(
                            S.of(context).NoOneWasFound,
                            style: theme?.carosTextTheme.medium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }

                    return SliverList.separated(
                      itemCount: contacts.length,
                      itemBuilder: (_, index) => ContactItem.other(
                        user: contacts[index],
                        onAddUser: cubit.sendRequest,
                        onDeleteUser: cubit.deleteContact,
                      ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                      separatorBuilder: (_, __) => SpacingFoundation.verticalSpace8,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
