import 'package:flutter/material.dart';
import 'package:mvvmproject/auth/RagisterPage.dart';
import 'package:mvvmproject/resource/StringResource.dart';
import 'package:mvvmproject/resource/Styleresorce.dart';
import 'package:mvvmproject/widget/Mybutton.dart';
import 'package:mvvmproject/widget/Mytextfield.dart';

class LoginPage extends StatefulWidget {


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginPage"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xff1f005c),
                Color(0xff5b0060),
                Color(0xff870160),
                Color(0xffac255e),
                Color(0xffca485c),
                Color(0xffe16b5c),
                Color(0xfff39060),
                Color(0xffffb56b),
              ],
              tileMode: TileMode.mirror,
            ),
            color: Colors.pink,
          ),

          child: Container(

            height: 200,
            color: Colors.cyan,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Text(StringResource.Username,style:TextStyle(color: Colors.black87),),
                Mytextfield(
                  controller: _name,
                  Textinputtype: TextInputType.text,
                  text: "NAME", obscureText: false,
                ),
                SizedBox(height: 20,),
                Text(StringResource.password,style:TextStyle(color: Colors.black87),),
                Mytextfield(
                  controller: _password,
                  text: "PASSWORD",
                  Textinputtype: TextInputType.text, obscureText: true,

                ),
                SizedBox(height: 30,),

                // ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       primary: Styleresorce.btncolor, //background color of button
                //       side: BorderSide(width:2, color:Colors.brown), //border width and color
                //       elevation: 3, //elevation of button
                //       shape: RoundedRectangleBorder( //to set border radius to button
                //           borderRadius: BorderRadius.circular(20)
                //       ),
                //       // padding: EdgeInsets.all(20) ,
                //       minimumSize: Size(300, 40),//content padding inside button
                //     ),
                //     onPressed: (){
                //       var name = _name.text.toString();
                //       var password =_password.text.toString();
                //
                //
                //       print(name);
                //       print(password);
                //       print("value Ragisted");
                //     },
                //     child: Text("Login",style:Styleresorce.btntextstyle)
                // ),
                Mybutton(
                  text: "Login",
                  onpress:  (){
                var name = _name.text.toString();
                var password =_password.text.toString();


                print(name);
                print(password);
                print("value Ragisted");
              },
                ),

                TextButton(
                    onPressed:(){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RagisterPage()));
                    },
                    child: Text("Ragister Page",style: Styleresorce.btntextstyle)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
