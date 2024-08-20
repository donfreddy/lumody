import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lumody/core/core.dart';

import '../../../account.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LmdAppBar(
        title: UtilsHelper.trans('account.appearance.language'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: context.cardColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: lmdSupportedLanguages.length,
                  itemBuilder: (context, index) {
                    final language = lmdSupportedLanguages[index];
                    return Column(
                      children: [
                        AccountListItem(
                            title: UtilsHelper.trans(
                                'account.appearance.lang.${language.name}'),
                            showIcon: false,
                            showArrow: false,
                            showCheck:
                                context.locale.languageCode == language.code,
                            onTap: () {
                              context.setLocale(Locale(language.code!));
                            }),
                        if (index < lmdSupportedLanguages.length - 1) ...[
                          const LmdDivider(),
                        ]
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
