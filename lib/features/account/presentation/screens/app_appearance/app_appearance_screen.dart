import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumody/core/core.dart';

class AppAppearanceScreen extends StatelessWidget {
  const AppAppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, 'appearance'.tr()),
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
                child: Column(
                  children: [
                    BlocConsumer<LmdThemeCubit, ThemeMode>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return buildListTile(
                          context,
                          title: 'theme'.tr(),
                          value: state.name.tr(),
                          onTap: () {
                            showChooseThemeModalBottomSheet(context);
                          },
                        );
                      },
                    ),
                    const LmdDivider(),
                    buildListTile(
                      context,
                      title: 'language'.tr(),
                      value: context.locale.languageCode == 'en'
                          ? 'english'.tr()
                          : 'french'.tr(),
                      onTap: () {
                        Navigator.pushNamed(context, '/app-language.dart');
                      },
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

  Widget buildListTile(
    BuildContext context, {
    required String title,
    required String value,
    required void Function() onTap,
  }) {
    return LmdMaterial(
      borderRadius: BorderRadius.circular(8),
      color: context.cardColor,
      onTap: onTap,
      child: Padding(
        padding: 8.edgeInsetsH + 16.edgeInsetsV,
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showChooseThemeModalBottomSheet(BuildContext context) =>
      showModalBottomSheet<Widget>(
          isScrollControlled: true,
          barrierColor: Colors.black38,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          context: context,
          builder: (_) {
            return const ChooseThemeModalBottomSheet();
          });
}

class ChooseThemeModalBottomSheet extends StatefulWidget {
  const ChooseThemeModalBottomSheet({super.key});

  @override
  State<ChooseThemeModalBottomSheet> createState() =>
      _ChooseThemeModalBottomSheetState();
}

class _ChooseThemeModalBottomSheetState
    extends State<ChooseThemeModalBottomSheet> {
  late LmdThemeCubit lmdThemeCubit;
  late ThemeMode selectedTheme;

  void onThemeChange(ThemeMode value) {
    setState(() {
      selectedTheme = value;
    });
  }

  @override
  void initState() {
    lmdThemeCubit = context.read<LmdThemeCubit>();
    selectedTheme = lmdThemeCubit.themeMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const LmdDividerBar(width: 40),
            Padding(
              padding: 16.edgeInsetsV,
              child: Text(
                'choose_theme'.tr(),
                style: context.bodyMedium.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const LmdDivider(indent: 0),
            const SizedBox(height: 16),
            ThemeOption(
              displayText: 'system'.tr(),
              themeMode: ThemeMode.system,
              currentTheme: selectedTheme,
              onThemeChange: onThemeChange,
            ),
            ThemeOption(
              displayText: 'light'.tr(),
              themeMode: ThemeMode.light,
              currentTheme: selectedTheme,
              onThemeChange: onThemeChange,
            ),
            ThemeOption(
              displayText: 'dark'.tr(),
              themeMode: ThemeMode.dark,
              currentTheme: selectedTheme,
              onThemeChange: onThemeChange,
            ),
            const SizedBox(height: 16),
            const LmdDivider(indent: 0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.1),
                          side: const BorderSide(color: Colors.transparent),
                        ),
                        onPressed: () => context.pop(),
                        child: Text(
                          'actions.cancel'.tr(),
                          style: context.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: FilledButton(
                        onPressed: () {
                          context.pop();
                          lmdThemeCubit.setThemeMode(selectedTheme);
                        },
                        child: Text(
                          'actions.ok'.tr(),
                          style: context.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ThemeOption extends StatelessWidget {
  final String displayText;
  final ThemeMode themeMode;
  final ThemeMode currentTheme;
  final ValueChanged<ThemeMode>? onThemeChange;

  const ThemeOption({
    required this.displayText,
    required this.themeMode,
    required this.currentTheme,
    this.onThemeChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LmdMaterial(
      onTap: () => onThemeChange!(themeMode),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        child: Row(
          children: [
            Radio<ThemeMode>(
              value: themeMode,
              groupValue: currentTheme,
              onChanged: (v) => onThemeChange!(v!),
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            const SizedBox(width: 10),
            Text(
              displayText,
              style: context.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
