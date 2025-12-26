import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_beer/app/constants/app_styles.dart';
import 'package:live_beer/gen/assets.gen.dart';
import 'package:live_beer/shared/widgets/button.dart';
import 'package:live_beer/shared/widgets/text_input_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController(
    text: "Дмитрий",
  );
  final TextEditingController birthdayController = TextEditingController(
    text: "24.09.1990",
  );
  final TextEditingController phoneController = TextEditingController(
    text: "+7 (924) 444-44-44",
  );
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgWhite,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppStyles.s24,
          vertical: AppStyles.s16,
        ),
        color: AppStyles.bgWhite,
        child: Column(
          spacing: AppStyles.s8,
          mainAxisSize: MainAxisSize.min,
          children: [
            Button(title: "Сохранить", onTap: () {}),
            const Text(
              "Версия приложения 1.0.7",
              style: TextStyle(
                color: AppStyles.textLiteGrey,
                fontSize: AppStyles.s14,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 250,
              width: double.infinity,
              child: SvgPicture.asset(
                Assets.icons.largeBerry,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 78),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppStyles.s24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Профиль",
                    style: TextStyle(
                      fontSize: AppStyles.s36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: AppStyles.s16),
                    child: TextInputField(
                      title: "Ваше имя",
                      controller: nameController,
                      hintText: "Введите имя",
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Поле обязательно для заполнения';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppStyles.s8),
                    child: TextInputField(
                      title: "Дата рождения",
                      controller: birthdayController,
                      hintText: "ДД.ММ.ГГ",
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Введите дату рождения';
                        }

                        final dateRegex = RegExp(
                          r"^(0[1-9]|[12][0-9]|3[01])\.(0[1-9]|1[0-2])\.\d{4}$",
                        );
                        if (!dateRegex.hasMatch(value)) {
                          return 'Формат: ДД.ММ.ГГГГ';
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: AppStyles.s8,
                      bottom: AppStyles.s6,
                    ),
                    child: TextInputField(
                      title: "Номер телефона",
                      enabled: false,
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      hintText: "+7",
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Введите номер телефона';
                        }

                        final digitsOnly = value.replaceAll(RegExp(r'\D'), '');

                        if (!digitsOnly.startsWith('7') &&
                            !digitsOnly.startsWith('8')) {
                          return 'Номер должен начинаться с 7 или 8';
                        }

                        if (digitsOnly.length != 11) {
                          return 'Номер должен содержать 11 цифр';
                        }

                        return null;
                      },
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: AppStyles.textLiteGrey,
                        fontSize: AppStyles.s14,
                      ),
                      children: [
                        const TextSpan(
                          text:
                              "Если вы хотите изменить номер телефона, то обратитесь в нашу ",
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: InkWell(
                            onTap: () {},
                            child: const Text(
                              "тех.поддержку",
                              style: TextStyle(
                                color: AppStyles.textLink,
                                fontSize: AppStyles.s14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: AppStyles.s24),
                    child: Divider(
                      color: AppStyles.profileLargeDivider,
                      thickness: AppStyles.s8,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Смс-уведомления",
                        style: TextStyle(
                          fontSize: AppStyles.s18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      CupertinoSwitch(
                        activeTrackColor: AppStyles.textLink,
                        value: isSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            isSelected = value ?? false;
                          });
                        },
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: AppStyles.s8),
                    child: Divider(
                      color: AppStyles.profileDivider,
                      thickness: 0.5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Выйти из аккаунта",
                        style: TextStyle(
                          fontSize: AppStyles.s18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SvgPicture.asset(
                        Assets.icons.logOut,
                        width: 44,
                        height: 44,
                      ),
                    ],
                  ),
                  const Divider(
                    color: AppStyles.profileDivider,
                    thickness: 0.5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
