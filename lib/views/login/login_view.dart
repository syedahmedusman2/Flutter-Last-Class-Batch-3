import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lastclass/controllers/loginconrollers/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  LoginController loginControl = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: loginControl.emailcontroller,
                ),
                TextField(
                  controller: loginControl.passwordcontroller,
                ),
                ElevatedButton(
                    onPressed: () {
                      loginControl.login();
                    },
                    child: Text("Login")),
                ElevatedButton(
                    onPressed: () {
                      loginControl.getsharedpreferences();
                    },
                    child: Text("get email")),
                GetBuilder(
                    init: loginControl,
                    builder: (context) {
                      return Text(
                        "${loginControl.email}",
                        style: TextStyle(fontSize: 33),
                      );
                    }),
                Obx(() => loginControl.loading.value == true
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: loginControl.products.length,
                        itemBuilder: ((context, index) => ListTile(
                              title:
                                  Text("${loginControl.products[index].name}"),
                            ))))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
