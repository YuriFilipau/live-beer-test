import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_beer/app/design/design_tokens.dart';
import 'package:live_beer/gen/assets.gen.dart';
import 'package:live_beer/shared/widgets/button.dart';
import 'package:live_beer/shared/widgets/text_input_field.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController nameTextEditingController = TextEditingController(
    text: "Дмитрий",
  );
  final TextEditingController birthdayTextEditingController =
      TextEditingController(text: "16.02.2005");
  final TextEditingController phoneTextEditingController =
      TextEditingController(text: "+7 (924) 444-44-44");
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DT.bgWhite,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: DT.s9, vertical: DT.s7),
        color: DT.bgWhite,
        child: Column(
          spacing: DT.s3,
          mainAxisSize: MainAxisSize.min,
          children: [
            Button(title: "Сохранить", onTap: () {}),
            const Text(
              "Версия приложения 1.0.7",
              style: TextStyle(
                color: DT.textLiteGrey,
                fontSize: DT.s6,
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
              padding: const EdgeInsets.symmetric(horizontal: DT.s9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Профиль",
                    style: TextStyle(
                      fontSize: DT.s11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: DT.s7),
                    child: TextInputField(
                      title: "Ваше имя",
                      controller: nameTextEditingController,
                      hintText: "Введите имя",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: DT.s3),
                    child: TextInputField(
                      title: "Дата рождения",
                      controller: birthdayTextEditingController,
                      hintText: "ДД.ММ.ГГ",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: DT.s3, bottom: DT.s2),
                    child: TextInputField(
                      title: "Номер телефона",
                      enabled: false,
                      controller: phoneTextEditingController,
                      hintText: "+7",
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: DT.textLiteGrey,
                        fontSize: DT.s6,
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
                                color: DT.textLink,
                                fontSize: DT.s6,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: DT.s9),
                    child: Divider(
                      color: DT.profileLargeDivider,
                      thickness: DT.s3,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Смс-уведомления",
                        style: TextStyle(
                          fontSize: DT.s8,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      CupertinoSwitch(
                        activeTrackColor: DT.textLink,
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
                    padding: EdgeInsets.only(bottom: DT.s3),
                    child: Divider(color: DT.profileDivider, thickness: 0.5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Выйти из аккаунта",
                        style: TextStyle(
                          fontSize: DT.s8,
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
                  const Divider(color: DT.profileDivider, thickness: 0.5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
