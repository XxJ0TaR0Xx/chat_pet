import 'dart:async';

import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/presentation/cubits/contact_request/contact_requests_cubit.dart';
import 'package:chat_pet/presentation/pages/contacts/cubit/contacts_cubit.dart';
import 'package:chat_pet/presentation/pages/contacts/widgets/contact_item.dart';
import 'package:chat_pet/presentation/pages/contacts/widgets/incoming_requests_section.dart';
import 'package:chat_pet/presentation/pages/contacts/widgets/search_text_filed.dart';
import 'package:chat_pet/presentation/route/app_routes.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/common_widgets/loading_widget.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  late final ContactsCubit _cubit;
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _cubit = getIt.get<ContactsCubit>();
  }

  @override
  void dispose() {
    _cubit.close();
    _searchController.dispose();
    super.dispose();
  }

  void _startSearch() => setState(() => _isSearching = true);

  void _stopSearch() {
    _searchController.clear();
    _cubit.searchContacts('');
    setState(() => _isSearching = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        backgroundColor: _isSearching ? null : theme?.colorScheme.darkNeutral,
        body: RefreshIndicator(
          onRefresh: _cubit.refresh,
          child: SafeArea(
            child: _isSearching
                ? _SearchBody(
                    controller: _searchController,
                    onStopSearch: _stopSearch,
                  )
                : _ContactsBody(
                    onSearchStart: _startSearch,
                    onAddContact: () => GoRouter.of(context).push(AppRoutes.findNewContacts),
                  ),
          ),
        ),
      ),
    );
  }
}

class _SearchBody extends StatelessWidget {
  const _SearchBody({
    required this.controller,
    required this.onStopSearch,
  });

  final TextEditingController controller;
  final VoidCallback onStopSearch;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return CustomScrollView(
      slivers: [
        SpacingFoundation.verticalSpace16.sliver,
        SearchTextFiled(
          controller: controller,
          onArrowBack: onStopSearch,
          onChange: (value) => context.read<ContactsCubit>().searchContacts(value),
          onClearTap: () => context.read<ContactsCubit>().searchContacts(''),
        ).paddingHorizontal(SpacingFoundation.horizontalSpacing24).sliver,
        SpacingFoundation.verticalSpace30.sliver,
        BlocBuilder<ContactsCubit, ContactsState>(
          builder: (context, state) => state.when(
            loading: () => const LoadingWidget().sliver,
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
                ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
              );
            },
            error: (message) => SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(message, style: theme?.carosTextTheme.medium),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactsBody extends StatelessWidget {
  const _ContactsBody({
    required this.onSearchStart,
    required this.onAddContact,
  });

  final VoidCallback onSearchStart;
  final VoidCallback onAddContact;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          flexibleSpace: UiKitHomeAppBar(
            onTap: onSearchStart,
            title: S.of(context).Contacts,
            action: GestureDetector(
              onTap: onAddContact,
              child: Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorsFoundation.borderColor,
                    width: 1.5.w,
                  ),
                ),
                child: ChatPetIcon.icon(
                  AppIcons.userAdd,
                  size: 24.w,
                  color: ColorsFoundation.surfaceBase,
                ).paddingAll(EdgeInsetsFoundation.all8),
              ),
            ),
          ),
        ),
        SpacingFoundation.verticalSpace30.sliver,
        DecoratedBox(
          decoration: BoxDecoration(
            color: theme?.colorScheme.surfaceBase,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SpacingFoundation.verticalSpace14,
              Center(
                child: Container(
                  width: 30.w,
                  height: 3.h,
                  decoration: BoxDecoration(
                    color: theme?.colorScheme.grayForegroundColor,
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(32),
                      right: Radius.circular(32),
                    ),
                  ),
                ),
              ),
              SpacingFoundation.verticalSpace24,
              BlocBuilder<ContactModelRequestsCubit, ContactModelRequestState>(
                builder: (context, state) {
                  if (!state.hasPending) return const SizedBox.shrink();
                  return IncomingRequestsSection(
                    requests: state.request,
                    onAcceptTap: (requestId) async {
                      await context.read<ContactModelRequestsCubit>().acceptRequest(requestId);
                      if (context.mounted) unawaited(context.read<ContactsCubit>().refresh());
                    },
                    onRejectTap: (requestId) {
                      context.read<ContactModelRequestsCubit>().rejectRequest(requestId);
                    },
                  );
                },
              ),
              Text(
                S.of(context).MyContact,
                style: theme?.carosTextTheme.medium,
              ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
              SpacingFoundation.verticalSpace20,
            ],
          ),
        ).sliver,
        BlocBuilder<ContactsCubit, ContactsState>(
          builder: (context, state) => state.when(
            loading: () => SliverFillRemaining(
              hasScrollBody: false,
              child: ColoredBox(
                color: theme?.colorScheme.surfaceBase ?? ColorsFoundation.lightSurface,
                child: Center(
                  child: LoadingWidget(color: theme?.colorScheme.surface),
                ),
              ),
            ),
            loaded: (contacts) {
              if (contacts.isEmpty) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: ColoredBox(
                    color: theme?.colorScheme.surfaceBase ?? Colors.white,
                    child: Center(
                      child: Text(
                        S.of(context).FindYourFirstFriends,
                        style: theme?.carosTextTheme.medium,
                        textAlign: TextAlign.center,
                      ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                    ),
                  ),
                );
              }
              return DecoratedSliver(
                decoration: BoxDecoration(color: theme?.colorScheme.surfaceBase ?? Colors.white),
                sliver: SliverMainAxisGroup(
                  slivers: [
                    for (final entry in contacts.entries) ...[
                      Text(
                            entry.key,
                            style: theme?.carosTextTheme.bold,
                          )
                          .paddingSymmetric(
                            horizontal: SpacingFoundation.horizontalSpacing24,
                            vertical: SpacingFoundation.verticalSpacing12,
                          )
                          .sliver,
                      SliverList.separated(
                        itemCount: entry.value.length,
                        separatorBuilder: (_, __) => SpacingFoundation.verticalSpace8,
                        itemBuilder: (_, index) => ContactItem.my(
                          user: entry.value[index],
                          onDeleteUser: (userId) {
                            context.read<ContactsCubit>().deleteContact(userId);
                          },
                        ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                      ),
                      SpacingFoundation.verticalSpace20.sliver,
                    ],
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: ColoredBox(
                        color: theme?.colorScheme.surfaceBase ?? Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
            error: (message) => SliverFillRemaining(
              hasScrollBody: false,
              child: ColoredBox(
                color: theme?.colorScheme.surfaceBase ?? Colors.white,
                child: Center(
                  child: Text(
                    message,
                    style: theme?.carosTextTheme.medium.copyWith(
                      color: ColorsFoundation.error,
                    ),
                  ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
