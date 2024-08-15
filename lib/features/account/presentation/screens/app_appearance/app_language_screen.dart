import 'package:flutter/material.dart';
import 'package:lumody/features/account/presentation/widgets/app_divider.dart';
import 'package:lumody/shared/presentation/widgets/app_bar.dart';

class AppLanguageScreen extends StatelessWidget {
  const AppLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: simpleAppBar(context, 'App Language'),
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
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    if (index < languages.length - 1) {
                      return Column(
                        children: [
                          buildListTile(
                            language: languages[index],
                            isSelected: index == 0?true: false,
                            onTap: () {},
                          ),
                          const AppDivider(),
                        ],
                      );
                    } else {
                      return buildListTile(
                        language: languages[index],
                        isSelected: index == 0?true: false,
                        onTap: () {},
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile({
    required String language,
    required bool isSelected,
    required Function onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap as void Function()?,
        borderRadius: BorderRadius.circular(8),
        splashColor: Colors.black.withOpacity(0.04),
        hoverColor: Colors.black.withOpacity(0.04),
        overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(0.04)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            children: [
              Text(
                language,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if(isSelected)...[
                const Spacer(),
                const Icon(
                  Icons.check,
                  color: Colors.green,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

const languages = [
  'System Default',
  'English',
  'Spanish',
  'French',
  'German',
  'Italian',
  'Portuguese',
  'Russian',
  'Chinese',
  'Japanese',
  'Korean',
  'Arabic',
  'Hindi',
  'Bengali',
  'Punjabi',
  'Urdu',
  'Turkish',
  'Vietnamese',
  'Thai',
  'Swahili',
];
