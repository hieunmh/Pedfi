import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/edit_tran/edit_tran_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class EditTranType extends GetView<EditTransactionController> {
  const EditTranType({super.key});

  @override
  Widget build(BuildContext context) {
    
    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

     return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: Text(
              'Type',
              style:  TextStyle(
                color:  color,
                fontWeight: FontWeight.w700,
                fontSize: 16
              ),
            ),
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Obx(() =>
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.trantype.value = 'income';
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: themeState.getDarkTheme ? 
                          controller.trantype.value == 'income' ? 
                          AppColor.bgDarkThemeColor : Colors.grey.shade900 
                          : controller.trantype.value == 'income' ? 
                          Colors.white : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: controller.trantype.value == 'income' ?
                            AppColor.incomeDarkColor : Colors.transparent,
                            width: 2.5
                          )
                          // border: BoxBorder()
                        ),
                        child: Center(
                          child: Text(
                            'Income',
                            style: TextStyle(
                              color: controller.trantype.value == 'income' ? 
                              AppColor.incomeDarkColor : color,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              
                  const SizedBox(width: 10),
              
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.trantype.value = 'expense';
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: themeState.getDarkTheme ? 
                          controller.trantype.value == 'expense' ? 
                          AppColor.bgDarkThemeColor : Colors.grey.shade900 
                          : controller.trantype.value == 'expense' ? 
                          Colors.white : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: controller.trantype.value == 'expense' ? 
                            AppColor.expenseDarkColor :Colors.transparent,
                            width: 2.5
                          )
                        ),
                        child: Center(
                          child: Text(
                            'Expense',
                            style: TextStyle(
                              color: controller.trantype.value == 'expense'
                              ? AppColor.expenseDarkColor : color,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}