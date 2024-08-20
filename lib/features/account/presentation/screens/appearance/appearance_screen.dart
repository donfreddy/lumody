import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumody/core/core.dart';

import '../../../account.dart';

class AppearanceScreen extends StatelessWidget {
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LmdAppBar(
        title: UtilsHelper.trans('account.appearance.name'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: 16.edgeInsetsH,
          child: Column(
            children: [
              height20,
              Container(
                decoration: BoxDecoration(
                  color: context.cardColor,
                  borderRadius: 8.borderRadiusA,
                ),
                child: Column(
                  children: [
                    BlocConsumer<LmdThemeCubit, ThemeMode>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return AccountListItem(
                          title: UtilsHelper.trans('account.appearance.theme'),
                          showIcon: false,
                          showValue: true,
                          value: UtilsHelper.trans('account.appearance.${state.name}'),
                          onTap: () => showChooseThemeModalBottomSheet(context),
                        );
                      },
                    ),
                    const LmdDivider(),
                    AccountListItem(
                      title: UtilsHelper.trans('account.appearance.language'),
                      showIcon: false,
                      showValue: true,
                      value: UtilsHelper.getCurrentLang(context),
                      onTap: () => context.pushNamed('/change-language'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
