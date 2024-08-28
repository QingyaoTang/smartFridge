
import 'package:app/bean/Fridge.dart';
import 'package:app/common/app_colors.dart';
import 'package:app/common/assets.dart';
import 'package:app/network/api/FridgeApi.dart';
import 'package:app/network/dio_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Fridge> fridgeList = [];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initData();
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
          Row(children: [
            Image.asset(
              AssetsImages.homePageTopBg,
              width: 267,
              height: 327,
              fit: BoxFit.contain,
            ),
          ]),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 30),
              const Text(
                "View my Fridge",
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
              const SizedBox(width: 10),
              Image.asset(
                AssetsImages.listImg,
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(25, 23, 0, 0),
                  itemCount: fridgeList.length,
                  itemBuilder: (context, index) {
                    final fridge = fridgeList[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 42,
                            width: 167,
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 23),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0), // 设置圆角
                                color: AppColors.backgroundLineColor),
                            child: Center(child: Text(fridge.name ?? "", style: const TextStyle(fontSize: 24, color: Colors.black)))),
                        GestureDetector(
                            child:
                            Container(
                                height: 50,
                                width: 60,
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 23),
                                child: Center(
                                  child: Image.asset(
                                    AssetsImages.fragItemImg,
                                    width: 44.84,
                                    height: 51,
                                    fit: BoxFit.contain,
                                  ),
                                )),
                            onTap: () {
                              Get.toNamed("/fridge_detail", arguments: {"fridge": fridge});
                            }),
                      ],
                    );
                  })),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 中间图标
                    GestureDetector(
                      child:
                      Container(
                          width: 80.0, // 宽度
                          height: 80.0, // 高度
                          decoration: const BoxDecoration(
                            color: AppColors.backgroundLineColor, // 背景颜色
                            shape: BoxShape.circle, // 形状为圆形
                          ),
                          child: Center(
                              child: SizedBox(
                                  width: 55,
                                  height: 55,
                                  child: Image.asset(
                                    AssetsImages.addImg,
                                    fit: BoxFit.contain,
                                  )))),
                      onTap: () {
                        _showConfirmationDialog(context);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    GestureDetector(
                        child:
                        Image.asset(
                          AssetsImages.personImg,
                          width: 37.5,
                          height: 41.67,
                          fit: BoxFit.contain,
                        ),
                        onTap: () {
                          //go to person
                          Get.toNamed("/mine");
                        }),
                    const SizedBox(width: 40.25)
                  ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Refrigerator'),
          content: const Text('Are you sure you want to add this refrigerator?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await addFridgeRequest(context, Fridge(name:"fridge${fridgeList.length + 1}"));
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  Future<void> initData() async {
    await getFridgeListRequest();
  }

  Future<void> getFridgeListRequest() async {
    HttpResponse res = await getFridgeList();
    if(res.statusCode == 200 && res.data != null){
      fridgeList.clear();
      for(Map map in res.data){
        Fridge fridge = Fridge.fromMap(map);
        fridgeList.add(fridge);
      }
      setState(() {});
    }
  }

  Future<void> addFridgeRequest(BuildContext context,Fridge fridge) async {
    Map<String, dynamic> data = {};
    data["fridgeName"] = fridge.name;
    HttpResponse res = await addFridge(data);
    if(res.statusCode == 200 && res.statusMessage == "操作成功"){
      Get.back(); // Close the dialog
      // Perform the add refrigerator action
      setState(() {});
      Get.snackbar('Success', 'Refrigerator added successfully');
      getFridgeListRequest();
    }
  }


}
