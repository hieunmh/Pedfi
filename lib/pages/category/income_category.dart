import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/category/category_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class IncomeCategory extends GetView<CategoryController> {
  const IncomeCategory({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
    
    // final Color bgcolor = themeState.getDarkTheme ? 
    // AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: ListView.builder(
          itemCount: controller.incomeList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                controller.setCategory(
                  controller.incomeList[index]['icon'], 
                  controller.incomeList[index]['name']
                );
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    bottom: BorderSide(
                      width: 0.2,
                      color: Colors.grey
                    )
                  )
              
                ),
                child: Obx(() =>
                  Row(
                    children: [
                      Icon(
                        controller.incomeList[index]['icon'],
                        color: Colors.grey,
                      ),
              
                      const SizedBox(width: 20),
              
                      Text(
                        controller.incomeList[index]['name'],
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.w500
                        ),
                      )
              
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      
    );
  }
}