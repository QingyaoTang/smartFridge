import 'package:app/bean/Food.dart';
import 'package:app/bean/Fridge.dart';
import 'package:app/common/app_colors.dart';
import 'package:app/common/assets.dart';
import 'package:app/network/api/FoodApi.dart';
import 'package:app/network/dio_manager.dart';
import 'package:app/widget/common_totast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FridgeDetailPage extends StatefulWidget {
  const FridgeDetailPage({super.key});

  @override
  State<FridgeDetailPage> createState() => _FridgeDetailPageState();
}

class _FridgeDetailPageState extends State<FridgeDetailPage> {
  List<Food> foodList = [];
  List<Food> foodSelectList = [];

  late Fridge fridge;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final arguments = Get.arguments;
    fridge = arguments['fridge'];
    initData();

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Center(child: Text(fridge.name ?? "", style: const TextStyle(fontSize: 24, color: Colors.black))),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              AssetsImages.detailBgImg,
              width: 291,
              height: 301,
              fit: BoxFit.contain,
            ),
          ]),
          const SizedBox(height: 10),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 30),
              Text(
                "Food Name",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(width: 75),
              Text(
                "Whose",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
                  itemCount: foodList.length,
                  itemBuilder: (context, index) {
                    final food = foodList[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Container(
                              height: 42,
                              width: 100,
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black54, width: 2),
                                  borderRadius: BorderRadius.circular(10.0), // 设置圆角
                                  color: AppColors.backgroundLineColor),
                              child: Center(child: Text(food.name ?? "", style: const TextStyle(fontSize: 24, color: Colors.black)))),
                          onTap: () {
                            Get.toNamed("food_detail",arguments: {"food": food, "fridgeId": fridge.id});
                          },
                        ),
                        Container(
                            height: 42,
                            width: 150,
                            margin: const EdgeInsets.fromLTRB(31, 0, 0, 10),
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54, width: 2),
                                borderRadius: BorderRadius.circular(10.0), // 设置圆角
                                color: AppColors.backgroundLineColor),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Center(child: Text(food.username ?? "", style: const TextStyle(fontSize: 18, color: Colors.black))),
                              GestureDetector(
                                  child: Center(
                                    child: Image.asset(
                                      AssetsImages.editImg,
                                      width: 22,
                                      height: 22,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  onTap: () {
                                    _showWhoseEditDialog(context, index);
                                  }),
                            ])),
                        GestureDetector(
                          child: Container(
                              height: 50,
                              width: 40,
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Center(
                                child: Image.asset(
                                  AssetsImages.delImg,
                                  width: 22,
                                  height: 22,
                                  fit: BoxFit.contain,
                                ),
                              )),
                          onTap: () {
                            _showDelFoodDialog(context, index);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                              height: 50,
                              width: 40,
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Center(
                                child: Image.asset(
                                  food.isUsed == 0 ? AssetsImages.noUsedImg : AssetsImages.usedImg,
                                  width: 55,
                                  height: 55,
                                  fit: BoxFit.contain,
                                ),
                              )),
                          onTap: () {
                            if (food.isUsed == 0) {
                              _showUseFoodDialog(context, index);
                            } else {
                              showCorrectToast("The Food is used!");
                            }
                          },
                        ),
                      ],
                    );
                  })),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [

                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child:
                      Column(children: [
                        GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 44),
                              // 中间图标Center(
                              const Text(
                                "add",
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: Image.asset(
                                    AssetsImages.addMinImg,
                                    fit: BoxFit.contain,
                                  )),
                            ],
                          ),
                          onTap: () async {
                            showFoodChooseDialogWithList(context);
                            // //add food
                            // final res = await Get.toNamed("food_detail");
                            // // 判断是否返回了结果并执行相关操作
                            // if (res != null) {
                            //   foodList.add(res);
                            //   setState(() {});
                            // }
                          },
                        ),
                        GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 44),
                              // 中间图标Center(
                              const Text(
                                "customer add",
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: Image.asset(
                                    AssetsImages.addMinImg,
                                    fit: BoxFit.contain,
                                  )),
                            ],
                          ),
                          onTap: () async {
                            // //add food
                            Get.toNamed("food_detail",arguments: {"fridgeId": fridge.id})?.whenComplete(() =>  initData());
                          },
                        ),
                      ],),
                ),
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Row(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.end, children: [
                    GestureDetector(
                        child: Stack(
                          children: [
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 40, 30),
                                child: const Text(
                                  "back to home",
                                  style: TextStyle(fontSize: 18, color: Colors.black),
                                )),
                            Container(
                              margin: const EdgeInsets.fromLTRB(110, 20, 0, 0),
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
                          Get.offAllNamed("/home");
                        }),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDelFoodDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Food'),
          content: const Text('Are you sure you want to delete this food?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                editFoodFridgeRequest(context, foodList[index], -1);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _showUseFoodDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Use Food'),
          content: const Text('Are you sure you want to use this food?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                editFoodUseRequest(context, foodList[index]);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _showWhoseEditDialog(BuildContext context, int index) {
    TextEditingController controller = TextEditingController(text: foodList[index].username ?? "");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Whose'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter the owner\'s name:'),
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Owner\'s Name',
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
                editFoodWhoseRequest(context, foodList[index], controller.text.toString());
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void showFoodChooseDialogWithList(BuildContext context) {
    Get.dialog(AlertDialog(
      title: const Text('Select a food'),
      content: SizedBox(
          // 设置弹窗中的列表高度
          height: 200,
          width: 300,
          child: ListView.builder(
            itemCount: foodSelectList.length, // 列表项的数量
            itemBuilder: (BuildContext context, int index) {
              final selectFood = foodSelectList[index];
              return GestureDetector(
                  child: Container(
                      height: 42,
                      width: 100,
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54, width: 2),
                          borderRadius: BorderRadius.circular(10.0), // 设置圆角
                          color: AppColors.backgroundLineColor),
                      child: Center(child: Text(selectFood.name ?? "", style: const TextStyle(fontSize: 24, color: Colors.black)))),
                  onTap: () {
                    _showAddFoodDialog(context, selectFood);
                  });
            },
          )),
      actions: <Widget>[
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop(); // 关闭弹窗
          },
        ),
      ],
    ));
  }

  void _showAddFoodDialog(BuildContext context, Food food) {
    Get.dialog(AlertDialog(
      title: const Text('Add Food'),
      content: const Text('Are you sure you want to Add this food?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            // request
            await editFoodFridgeRequest(context, food, fridge.id);
          },
          child: const Text('Confirm'),
        ),
      ],
    ));
  }

  Future<void> editFoodFridgeRequest(BuildContext context, Food food, int? fridgeId) async {
    Map<String, dynamic> data = {};
    data["foodId"] = food.id;
    data["fridgeId"] = fridgeId;
    HttpResponse res = await editFood(data);
    if (res.statusCode == 200 && res.statusMessage == "操作成功") {
      await initData();
      if (fridgeId != -1) {
        Get.back(); // 关闭第一个对话框
        Get.back(); // 关闭第二个对话框
      } else {
        Get.back();
      }
    }
  }

  Future<void> editFoodUseRequest(BuildContext context, Food food) async {
    Map<String, dynamic> data = {};
    data["foodId"] = food.id;
    data["isUsed"] = 1;
    HttpResponse res = await editFood(data);
    if (res.statusCode == 200 && res.statusMessage == "操作成功") {
      await initData();
      Get.back();
    }
  }

  Future<void> editFoodWhoseRequest(BuildContext context, Food food, String username) async {
    Map<String, dynamic> data = {};
    data["foodId"] = food.id;
    data["ownerName"] = username;
    HttpResponse res = await editFood(data);
    if (res.statusCode == 200 && res.statusMessage == "操作成功") {
      await initData();
      Get.back();
    }
  }

  Future<void> initData() async {
    await getFoodListRequest();
    await getFoodSelectListRequest();
  }

  Future<void> getFoodListRequest() async {
    Map<String, dynamic> data = {};
    data["fridgeId"] = fridge.id;
    HttpResponse res = await getFoodList(data);
    if (res.statusCode == 200 && res.data != null) {
      foodList.clear();
      for (Map map in res.data) {
        Food food = Food.fromMap(map);
        foodList.add(food);
      }
      setState(() {});
    }
  }

  Future<void> getFoodSelectListRequest() async {
    Map<String, dynamic> data = {};
    data["fridgeId"] = -1;
    HttpResponse res = await getFoodList(data);
    if (res.statusCode == 200 && res.data != null) {
      foodSelectList.clear();
      for (Map map in res.data) {
        Food food = Food.fromMap(map);
        foodSelectList.add(food);
      }
      setState(() {});
    }
  }
}
