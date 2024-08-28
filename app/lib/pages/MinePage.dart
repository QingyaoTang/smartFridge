import 'package:app/bean/Food.dart';
import 'package:app/bean/Fridge.dart';
import 'package:app/common/app_colors.dart';
import 'package:app/common/assets.dart';
import 'package:app/network/api/FridgeApi.dart';
import 'package:app/network/api/UserApi.dart';
import 'package:app/network/dio_manager.dart';
import 'package:app/utils/sp_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  TextEditingController accountNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
          const Center(
            child: Text(
              "Account",
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
          const SizedBox(height: 56),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10),
              const SizedBox(
                width: 200,
                child: Text(
                  "account",
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
              Container(
                width: 150,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(15),
                    right: Radius.circular(15),
                  ),
                ),
                child: TextField(
                  controller: accountNameController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    hintText: "username",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10),
              const SizedBox(
                width: 200,
                child: Text(
                  "email",
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
              Container(
                width: 150,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(15),
                    right: Radius.circular(15),
                  ),
                ),
                child: TextField(
                  controller: emailController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    hintText: "email",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
            ],
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
              _showConfirmBindEmailDialog(context);
            },
          ),
          const SizedBox(height: 20),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 30),
              Text(
                "my Fridge",
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
              SizedBox(width: 10),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(25, 15, 0, 0),
                  itemCount: fridgeList.length,
                  itemBuilder: (context, index) {
                    final fridge = fridgeList[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 42,
                            width: 300,
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 23),
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54, width: 2),
                                borderRadius: BorderRadius.circular(10.0), // 设置圆角
                                color: AppColors.backgroundLineColor),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Center(child: Text(fridge.name ?? "", style: const TextStyle(fontSize: 24, color: Colors.black))),
                              GestureDetector(
                                  child:
                                  Center(
                                    child: Image.asset(
                                      AssetsImages.editImg,
                                      width: 22,
                                      height: 22,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  onTap: () {
                                    _showNameEditDialog(context, index);
                                  }),
                            ])),
                        Container(
                            height: 50,
                            width: 60,
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 23),
                            child: Center(
                                child: GestureDetector(
                                  child: Image.asset(
                                    AssetsImages.delImg,
                                    width: 22,
                                    height: 22,
                                    fit: BoxFit.contain,
                                  ),
                                  onTap: () {
                                    _showDelFridgeDialog(context, index);
                                  },
                                )
                            )),
                      ],
                    );
                  })),
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // 中间图标
                      GestureDetector(
                        child:
                        Container(
                            width: 80.0, // 宽度
                            height: 80, // 高度
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
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            child: Stack(
                              children: [
                                Container(
                                    margin: const EdgeInsets.fromLTRB(0, 0, 40, 30),
                                    child:
                                    const Text(
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
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Row(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.start, children: [
                    Image.asset(
                      AssetsImages.homePageTopBg,
                      width: 150,
                      height: 188,
                      fit: BoxFit.contain,
                    ),
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
                await addFridgeRequest(context, Fridge(name: "fridge${fridgeList.length + 1}"));
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _showDelFridgeDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Fridge'),
          content: const Text('Are you sure you want to delete this fridge?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await delFridgeRequest(context, fridgeList[index].id);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _showNameEditDialog(BuildContext context, int index) {
    TextEditingController controller = TextEditingController(text: fridgeList[index].name ?? "");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Fridge Name'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter the fridge\'s name:'),
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'fridge\'s Name',
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
                fridgeList[index].name = controller.text;
                editFridgeRequest(context, fridgeList[index]);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _showConfirmBindEmailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Bind Email'),
          content: const Text('Are you sure you want to Bind this Email?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await bindEmailRequest(context, accountNameController.text, emailController.text);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  Future<void> initData() async {
    // get username email
    var username = await AuthManager.getUsername();
    var email = await AuthManager.getEmail();
    accountNameController.text = username ?? "";
    emailController.text = email ?? "";
    await getFridgeListRequest();
  }

  Future<void> getFridgeListRequest() async {
    HttpResponse res = await getFridgeList();
    if (res.statusCode == 200 && res.data != null) {
      fridgeList.clear();
      for (Map map in res.data) {
        Fridge fridge = Fridge.fromMap(map);
        fridgeList.add(fridge);
      }
      setState(() {});
    }
  }

  Future<void> addFridgeRequest(BuildContext context, Fridge fridge) async {
    Map<String, dynamic> data = {};
    data["fridgeName"] = fridge.name;
    HttpResponse res = await addFridge(data);
    if (res.statusCode == 200 && res.statusMessage == "操作成功") {
      Get.back(); // Close the dialog
      // Perform the add refrigerator action
      setState(() {});
      getFridgeListRequest();
    }
  }

  Future<void> delFridgeRequest(BuildContext context, int ?id) async {
    HttpResponse res = await delFridge(id);
    if (res.statusCode == 200 && res.statusMessage == "操作成功") {
      Get.back(); // Close the dialog
      // Perform the add refrigerator action
      setState(() {});
      getFridgeListRequest();
    }
  }

  Future<void> editFridgeRequest(BuildContext context, Fridge fridge) async {
    Map<String, dynamic> data = {};
    data["fridgeId"] = fridge.id;
    data["fridgeName"] = fridge.name;
    HttpResponse res = await editFridge(data);
    if (res.statusCode == 200 && res.statusMessage == "操作成功") {
      Get.back(); // Close the dialog
      // Perform the add refrigerator action
      setState(() {});
      getFridgeListRequest();
    }
  }

  Future<void> bindEmailRequest(BuildContext context, String username, String email) async {
    Map<String, dynamic> data = {};
    data["username"] = username;
    data["email"] = email;
    HttpResponse res = await bindEmail(data);
    if (res.statusCode == 200 && (res.statusMessage == "email edit success" || res.statusMessage == "注册成功")) {
      AuthManager.setEmail(email);
      AuthManager.setUsername(username);
      Get.back(); // Close the dialog
      // Perform the add refrigerator action
      setState(() {});
    }
  }

}