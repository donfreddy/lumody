import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/core.dart';

class ChooseTheme extends HookWidget {
  const ChooseTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final lmdThemeCubit = useContext().read<LmdThemeCubit>();
    final selectedTheme = useState(lmdThemeCubit.themeMode);

    void onThemeChange(ThemeMode? value) {
      selectedTheme.value = value!;
    }

    return ModalBottomSheetLayout(
      headerText: UtilsHelper.trans('account.appearance.choose_theme'),
      content: [
        LmdRadio<ThemeMode>(
          label: UtilsHelper.trans('account.appearance.system'),
          value: ThemeMode.system,
          groupValue: selectedTheme.value,
          onChanged: onThemeChange,
        ),
        LmdRadio<ThemeMode>(
          label: UtilsHelper.trans('account.appearance.light'),
          value: ThemeMode.light,
          groupValue: selectedTheme.value,
          onChanged: onThemeChange,
        ),
        LmdRadio<ThemeMode>(
          label: UtilsHelper.trans('account.appearance.dark'),
          value: ThemeMode.dark,
          groupValue: selectedTheme.value,
          onChanged: onThemeChange,
        ),
      ],
      onConfirmed: () {
        context.pop();
        lmdThemeCubit.setThemeMode(selectedTheme.value);
      },
    );
  }
}

void showChooseThemeModalBottomSheet(BuildContext context) {
  showModalBottomSheet<Widget>(
    shape: RoundedRectangleBorder(
      borderRadius: 12.borderRadiusTLTR,
    ),
    context: context,
    builder: (_) => const ChooseTheme(),
  );
}
