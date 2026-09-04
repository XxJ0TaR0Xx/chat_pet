import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/presentation/pages/contacts/cubit/contacts_cubit.dart';
import 'package:chat_pet/presentation/pages/contacts/widgets/contact_item.dart';
import 'package:chat_pet/presentation/pages/contacts/widgets/search_text_filed.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/common_widgets/loading_widget.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectContactPage extends StatefulWidget {
  const SelectContactPage({super.key});

  @override
  State<SelectContactPage> createState() => _SelectContactPageState();
}

class _SelectContactPageState extends State<SelectContactPage> {
  late final ContactsCubit cubit;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    cubit = getIt<ContactsCubit>();
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
                onChange: cubit.searchContacts,
                onClearTap: () => cubit.searchContacts(''),
                onArrowBack: GoRouter.of(context).pop,
              ).paddingHorizontal(SpacingFoundation.horizontalSpacing24).sliver,
              SpacingFoundation.verticalSpace30.sliver,
              BlocBuilder<ContactsCubit, ContactsState>(
                builder: (context, state) => state.when(
                  loading: () => const SliverFillRemaining(
                    hasScrollBody: false,
                    child: LoadingWidget(),
                  ),
                  error: (message) => SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        message,
                        style: theme?.carosTextTheme.medium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  loaded: (contacts) {
                    final flat = contacts.values.expand((e) => e).toList();
                    if (flat.isEmpty) {
                      return SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(
                            S.of(context).NoOneWasFound,
                            style: theme?.carosTextTheme.medium,
                          ),
                        ),
                      );
                    }

                    return SliverList.separated(
                      itemCount: flat.length,
                      separatorBuilder: (_, __) => SpacingFoundation.verticalSpace8,
                      itemBuilder: (_, index) => ContactItem.my(
                        user: flat[index],
                        onTap: (userId) => GoRouter.of(context).pop(userId),
                      ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
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
