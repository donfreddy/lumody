import 'package:flutter/material.dart';
import 'package:lumody/features/account/presentation/widgets/app_divider.dart';
import 'package:lumody/shared/presentation/widgets/app_bar.dart';
import 'package:lumody/shared/presentation/widgets/divider_bar.dart';

class AppAppearanceScreen extends StatelessWidget {
  const AppAppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, 'App Appearance'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    buildListTile(
                      title: 'Theme',
                      value: 'Light',
                      onTap: () {
                        showChooseThemeModalBottomSheet(context);
                      },
                    ),
                    const AppDivider(),
                    buildListTile(
                      title: 'App Language',
                      value: 'System Default',
                      onTap: () {
                        Navigator.pushNamed(context, '/app-language');
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

  Widget buildListTile({
    required String title,
    required String value,
    required Function onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap as void Function()?,
        borderRadius: BorderRadius.circular(8),
        splashColor: Colors.blue.withOpacity(0.1),
        hoverColor: Colors.blue.withOpacity(0.1),
        overlayColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.1)),
        // splashColor: Colors.blue.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
  String selectedTheme = 'system';

  void onThemeChange(String value) {
    setState(() {
      selectedTheme = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const DividerBar(width: 40),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Choose Theme',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const AppDivider(indent: 0),
            const SizedBox(height: 16),
            ThemeOption(
              displayText: 'System Default',
              value: 'system',
              currentTheme: selectedTheme,
              onThemeChange: onThemeChange,
            ),
            ThemeOption(
              displayText: 'Light',
              value: 'light',
              currentTheme: selectedTheme,
              onThemeChange: onThemeChange,
            ),
            ThemeOption(
              displayText: 'Dark',
              value: 'dark',
              currentTheme: selectedTheme,
              onThemeChange: onThemeChange,
            ),
            const SizedBox(height: 16),
            const AppDivider(indent: 0),
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
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
  final String value;
  final String currentTheme;
  final ValueChanged<String>? onThemeChange;

  const ThemeOption({
    required this.displayText,
    required this.value,
    required this.currentTheme,
    this.onThemeChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () => onThemeChange!(value),
        borderRadius: BorderRadius.circular(8),
        splashColor: Colors.black.withOpacity(0.04),
        hoverColor: Colors.black.withOpacity(0.04),
        overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(0.04)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
          child: Row(
            children: [
              Radio<String>(
                value: value,
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
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
