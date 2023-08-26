import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
 

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController(); 
  var emailController = TextEditingController(); 
  var passwordController = TextEditingController();
  var isObsecure = true.obs; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(builder: (context, cons) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: cons.maxHeight,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [

                //login scrren header
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 285,
                  child: Image.asset(
                    "assets/image/2.jpg"),

                ),
                // sign up scrren sigin in form
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.all(
                        Radius.circular(60),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.black26,
                          offset: Offset(0, -3),
                        )
                      ]
                    ),
                 child: Padding(
                   padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                   child: Column(
                    children: [
                      Form(key: formKey,
                      child: Column(
                        children: [
                          //name
                          TextFormField(
                            controller: nameController,
                            validator: (val) => val == "" ? "Please write name" : null,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              hintText: "name...",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30) ,
                                borderSide: const BorderSide(color: Colors.white60)
                                ),
                                enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30) ,
                                borderSide: const BorderSide(color: Colors.white60)
                                ),
                                focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30) ,
                                borderSide: const BorderSide(color: Colors.white60)
                                ),
                                disabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30) ,
                                borderSide: const BorderSide(color: Colors.white60)
                                ),
                             
                             contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                             ),
                             fillColor: Colors.white,
                             filled: true,
                             
                            ),
                          ),
                            const   SizedBox(height: 18,),
                          
                          
                          //email


                          TextFormField(
                            controller: emailController,
                            validator: (val) => val == "" ? "Please write email" : null,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              hintText: "Email...",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30) ,
                                borderSide: const BorderSide(color: Colors.white60)
                                ),
                                enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30) ,
                                borderSide: const BorderSide(color: Colors.white60)
                                ),
                                focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30) ,
                                borderSide: const BorderSide(color: Colors.white60)
                                ),
                                disabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30) ,
                                borderSide: const BorderSide(color: Colors.white60)
                                ),
                             
                             contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                             ),
                             fillColor: Colors.white,
                             filled: true,
                             
                            ),
                          ),
                               const   SizedBox(height: 18,),
                     //password
                       Obx(
                        () =>              TextFormField(
                            controller: passwordController,
                            obscureText: isObsecure.value,
                            validator: (val) => val == "" ? "Please write password" : null,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.vpn_key_sharp,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                               
                              suffixIcon: Obx(() => GestureDetector(
                                onTap: (){
                                 isObsecure.value= ! isObsecure.value; 
                                },
                                child: Icon(
                                  isObsecure.value? Icons.visibility_off : Icons.visibility,
                                  color: Colors.black,
                                ),
                              )),
                              hintText: "Password...",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30) ,
                                borderSide: const BorderSide(color: Colors.white60)
                                ),
                                enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30) ,
                                borderSide: const BorderSide(color: Colors.white60)
                                ),
                                focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30) ,
                                borderSide: const BorderSide(color: Colors.white60)
                                ),
                                disabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30) ,
                                borderSide: const BorderSide(color: Colors.white60)
                                ),
                             
                             contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                             ),
                             fillColor: Colors.white,
                             filled: true,
                             
                            ),
                          ),
                          
                      ),
                          const   SizedBox(height: 18,),
                               
                          Material(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                            child: InkWell(
                              onTap: () {
                                
                              },
                              borderRadius: BorderRadius.circular(30) ,
                              child: const Padding(padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 28,
                              ),
                              child: Text(
                                "SingUp",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              ),
                              
                            ),
                          )
                      ],
                      
                     
                      ),
                      ),
                  const      SizedBox(height: 16,),

                      //already have an account button -button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an Account?"),
                           TextButton(onPressed: (){
                            Get.to(LoginScreen());
                           }
                           , child: const Text(
                            "Login Here",
                           style: TextStyle(
                            color: Colors.amber,
                           ),),
                           ),
                        ],
                      ),
          

                    ],
                   ),
                               ),
                                ),
                )
              ],
            ),
          ), );
        
      },),
      
            );
         
    
    
  }
}