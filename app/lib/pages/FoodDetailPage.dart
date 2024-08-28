import 'package:app/bean/Food.dart';
import 'package:app/common/app_colors.dart';
import 'package:app/common/assets.dart';
import 'package:app/network/api/FoodApi.dart';
import 'package:app/network/dio_manager.dart';
import 'package:app/widget/common_totast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({super.key});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  late Food food;
  late int fridgeId;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final arguments = Get.arguments;
    if (arguments == null || arguments['food'] == null) {
      food = Food();
    } else {
      food = arguments['food'];
    }
    if(arguments == null || arguments['fridgeId'] == null){
      fridgeId = 0;
    }else{
      fridgeId = arguments['fridgeId'];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLineColor,
      body: _buildView(),
    );
  }

  Widget _buildView() {
    return Container(
        margin: const EdgeInsets.all(12),
        width: double.infinity,
        // 宽度充满屏幕
        height: double.infinity,
        // 高度充满屏幕
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 0.0), // 设置边框
          borderRadius: BorderRadius.circular(20.0), // 设置圆角
          color: AppColors.backgroundColor, // 设置背景颜色
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text("Food detail", style: TextStyle(fontSize: 36, color: Colors.black)),
              const Text(
                "food name",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Container(
                  height: 34,
                  width:  200,
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54, width: 0),
                      borderRadius: BorderRadius.circular(10.0), // 设置圆角
                      color: AppColors.backgroundLineColor),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Center(child: Text(food.name ?? "", style: const TextStyle(fontSize: 18, color: Colors.black))),
                    GestureDetector(
                        child:
                        Center(
                          child: Image.asset(
                            AssetsImages.penImg,
                            width: 22,
                            height: 22,
                            fit: BoxFit.contain,
                          ),
                        ),
                        onTap: (){
                          _showFoodNameEditDialog(context);
                        }),
                  ])),
              const Text(
                "Best before",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: food.openTime == null ? food.bestBefore ?? DateTime.now() : food.openTime!.add(const Duration(days: 3)),
                selectedDayPredicate: (day) {
                  return isSameDay(food.openTime == null ? food.bestBefore ?? DateTime.now() : food.openTime!.add(const Duration(days: 3)), day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    food.bestBefore = selectedDay;
                  });
                },
              ),
              Expanded(
                child:
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child:
                    Container(
                      height: 34,
                      width:  100,
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54, width: 0),
                          borderRadius: BorderRadius.circular(10.0), // 设置圆角
                          color: AppColors.backgroundLineColor),
                      child: const Center(child: Text("edit", style: TextStyle(fontSize: 18, color: Colors.black))),
                    ),
                    onTap: (){

                    },
                  ),
                  GestureDetector(
                    child:
                    Container(
                      height: 34,
                      width:  100,
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54, width: 0),
                          borderRadius: BorderRadius.circular(10.0), // 设置圆角
                          color: AppColors.backgroundLineColor),
                      child: const Center(child: Text("confirm", style: TextStyle(fontSize: 18, color: Colors.black))),
                    ),
                    onTap: (){
                      _showAddFoodDialog(context);
                    },
                  ),
                ],
              ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Row(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.end, children: [
                        GestureDetector(
                            child: Stack(
                              children: [
                                Container(
                                    margin: const EdgeInsets.fromLTRB(40, 0, 0, 20),
                                    child: const Text(
                                      "back",
                                      style: TextStyle(fontSize: 18, color: Colors.black),
                                    )),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(90, 15, 0, 0),
                                  child: Image.asset(
                                    AssetsImages.backHomeImg,
                                    width: 18,
                                    height: 18,
                                    fit: BoxFit.contain,
                                  ),
                                )
                              ],
                            ),
                            onTap: () {
                              //go to home
                              Get.back();
                            }),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void _showAddFoodDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text( food.id == null ? 'Add Food' : 'Edit Food'),
          content: Text( food.id == null ? 'Are you sure you want to Add this food?' : 'Are you sure you want to Edit this food?' ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                // Perform the add refrigerator action
                // request
                if(food.id == null){
                  await addFoodRequest(context, food);
                }else{
                  await editFoodTimeRequest(context, food);
                }
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _showFoodNameEditDialog(BuildContext context) {
    TextEditingController controller = TextEditingController(text: food.name ?? "");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Food Name'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter the Food\'s name:'),
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Food\'s Name',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                food.name = controller.text;
                Navigator.of(context).pop(); // Close the dialog
                // Perform the add refrigerator action
                setState(() {});
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  Future<void> editFoodTimeRequest(BuildContext context, Food food) async {
    Map<String, dynamic> data = {};
    data["foodId"] = food.id;
    data["foodName"] = food.name;
    data["qualityTime"] = food.bestBefore.toString();
    HttpResponse res = await editFood(data);
    if (res.statusCode == 200 && res.statusMessage == "操作成功") {
      Get.back();
      Get.back();
    }
  }

  Future<void> addFoodRequest(BuildContext context, Food food) async {
    if(fridgeId == 0){
      showCorrectToast("fridge no exist");
      return;
    }
    Map<String, dynamic> data = {};
    data["foodName"] = food.name;
    data["qualityTime"] = food.bestBefore.toString();
    data["fridgeId"] = fridgeId;
    HttpResponse res = await addFood(data);
    if (res.statusCode == 200 && res.statusMessage == "操作成功") {
      Get.back();
      Get.back();
    }
  }

}
