
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/profile/profile_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/routes/routes.dart';
import 'package:pedfi/widgets/profile/foward_button.dart';
import 'package:pedfi/widgets/profile/setting_item.dart';
import 'package:pedfi/widgets/profile/settting_switch.dart';
import 'package:provider/provider.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
    
    final Color bgcolor = themeState.getDarkTheme ? 
    AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: bgcolor,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Text(
            'Profile',
            style:  TextStyle(
              color: color,
              fontSize: 36,
              fontWeight: FontWeight.w500,
            ),
          ),  
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(() =>
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                
                SizedBox(
                  child: controller.isLoggedin.value ? (
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset('assets/images/meo.jpg', width: 70, height: 70),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.userEmail.value,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: color
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Join ${controller.joinDate.value}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        ForwardButton(
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.PROFILE_DETAIL,
                              parameters: {
                                'userEmail': controller.userEmail.value,
                                'joinDate': controller.joinDate.value
                              }
                            );
                          }
                        )
                      ],
                    )
                  ) : (
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset('assets/images/placeholder.jpg', width: 70, height: 70),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sign in | Sign up',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: color
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Sign in to save your data',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        ForwardButton(
                          onTap: () async {
                            var data = await Get.toNamed(AppRoutes.AUTH);
                            controller.isLoggedin.value = data['isLoggedIn'];
                            controller.userEmail.value = data['userEmail'] ?? '';
                            controller.joinDate.value = data['joinDate'] ?? '';
                          }
                        )
                      ],
                    )
                  )
                ),
                
                const SizedBox(height: 40),
                
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: color
                  ),
                ),
                
                const SizedBox(height: 20),
                
                SettingItem(
                  title: 'Virtual Stock',
                  icon: CupertinoIcons.waveform_path_ecg,
                  iconColor: themeState.getDarkTheme? Colors.white : Colors.black87,
                  value: '',
                  onTap: () {
                    
                  },
                ),
                
                const SizedBox(height: 20),
                
                SettingItem(
                  title: 'Currency',
                  icon: CupertinoIcons.money_dollar,
                  iconColor: themeState.getDarkTheme? Colors.white : Colors.black87,
                  value: 'USD',
                  onTap: () {
                    
                  },
                ),
                
                const SizedBox(height: 20),
                
                SettingSwitch(
                  title: 'Dark mode', 
                  iconColor: themeState.getDarkTheme ? 
                  const Color.fromRGBO(201, 215, 216, 1) : Colors.orange, 
                  icon: themeState.getDarkTheme ? 
                  CupertinoIcons.moon_fill : CupertinoIcons.sun_max_fill, 
                  value: themeState.getDarkTheme, 
                  onTap: (bool value) {
                    themeState.setDarkTheme = value;
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}