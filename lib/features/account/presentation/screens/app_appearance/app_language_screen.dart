import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lumody/core/core.dart';
import 'package:lumody/core/shared/presentation/widgets/lmd_app_bar.dart';
import 'package:lumody/core/shared/presentation/widgets/lmd_divider.dart';

class AppLanguageScreen extends StatelessWidget {
  const AppLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, 'language'.tr()),
      body: SingleChildScrollView(
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
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: lmdSupportedLanguages.length,
                  itemBuilder: (context, index) {
                    void onChangeLanguage(Language language) {
                      context.setLocale(Locale(language.code!));
                    }

                    final language = lmdSupportedLanguages[index];

                    if (index < lmdSupportedLanguages.length - 1) {
                      return Column(
                        children: [
                          buildListTile(
                            context,
                            language: language,
                            onChangeLanguage: onChangeLanguage,
                          ),
                          const LmdDivider(),
                        ],
                      );
                    } else {
                      return buildListTile(
                        context,
                        language: language,
                        onChangeLanguage: onChangeLanguage,
                      );
                    }
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

  Widget buildListTile(
    BuildContext context, {
    required Language language,
    required void Function(Language) onChangeLanguage,
  }) {
    return LmdMaterial(
      borderRadius: BorderRadius.circular(8),
      color: context.cardColor,
      onTap: () => onChangeLanguage(language),
      child: Padding(
        padding: 8.edgeInsetsH + 16.edgeInsetsV,
        child: Row(
          children: [
            Text(language.name!.tr(), style: context.bodyMedium),
            if (context.locale.languageCode == language.code) ...[
              const Spacer(),
              Icon(Icons.check, color: context.primaryColor),
            ]
          ],
        ),
      ),
    );
  }
}
