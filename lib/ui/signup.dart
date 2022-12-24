import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mycompta/constants/constants.dart';
import 'package:mycompta/ui/Common/widgets.dart';
import 'package:mycompta/ui/widgets/confirmation.dart';
import 'package:mycompta/ui/widgets/custom_shape.dart';
import 'package:mycompta/ui/widgets/customappbar.dart';
import 'package:mycompta/ui/widgets/homepage.dart';
import 'package:mycompta/ui/widgets/responsive_ui.dart';
import 'package:mycompta/ui/widgets/textformfield.dart';

import 'package:image_picker/image_picker.dart';


class SignUpScreen extends StatefulWidget {
  @override
  
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
   void _showScaffold(String message) {

    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(
    SnackBar(
      content: Text(message),
    ));
  }
  bool checkBoxValue = false;
  double _height;
  double _width;  
  double _pixelRatio;
  bool _large;
   String pathi;
  bool _medium;
  var lident = [];
 TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   TextEditingController mobileController = TextEditingController();
  TextEditingController firstController = TextEditingController();
   TextEditingController lastController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    void funt(){
  Navigator.push(context,MaterialPageRoute(builder: (context)=>Confirmation()));
       
}
    return Material(
      
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
         margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88,child: CustomAppBar()),
                clipShape(),
                form(),
                acceptTermsTextRow(),
                SizedBox(height: _height/35,),
                button(),
                //buttonCustom(funt,context,_height,_large,_medium,_width,"Sign Up")
                
               
                //signInTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large? _height/8 : (_medium? _height/7 : _height/6.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color1, color2],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large? _height/12 : (_medium? _height/11 : _height/10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color1, color2],
                ),
              ),
            ),
          ),
        ),
        Container(
          height: _height / 5.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 3.0,
                  color: Colors.black26,
                  offset: Offset(1.0, 10.0),
                  blurRadius: 20.0),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
              onTap: ()async {
                          
                        
                          final picker = ImagePicker();
                          final pickedFile = await picker.getImage(source: ImageSource.gallery);

                          if (pickedFile != null) {
                            setState(() {
                             
                            pathi=File(pickedFile.path).path;
                            });
                          }
                          
                  } ,

              child: Icon(Icons.add_a_photo, size: _large? 40: (_medium? 33: 31),color: color1,)),
        ),
      //  Positioned(
      //    top: _height/29,
      //    left: _width/2.75,
      //    child: Container(
      //      alignment: Alignment.center,
      //      height: _height/23,
      //      padding: EdgeInsets.all(5),
      //      decoration: BoxDecoration(
      //        shape: BoxShape.circle,
      //        color:  Colors.orange[100],
      //      ),
      //      child: GestureDetector(
      //          onTap: (){
      //            print('Adding photo');
      //          },
      //          child: Icon(Icons.add_a_photo, size: _large? 22: (_medium? 15: 13),)),
      //    ),
      //  ),
      ],
    );
  }

  Widget form() {
    return Container(
      
      child: Form(
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            lastNameTextFormField(),
            SizedBox(height: _height/ 60.0),
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            phoneTextFormField(),
            SizedBox(height: _height / 60.0),
            passwordTextFormField(),
             SizedBox(height: _height / 60.0),
            repasswordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    return CustomTextField(
      textEditingController: firstController,
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "Prénom",
    );
  }

  Widget lastNameTextFormField() {

    return CustomTextField(
      textEditingController: lastController,
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "Nom",
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      textEditingController: emailController,
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email,
      hint: "Adresse Email",
    );
  }

  Widget phoneTextFormField() {
    return CustomTextField(
      textEditingController: mobileController,
      keyboardType: TextInputType.number,
      icon: Icons.phone,
      hint: "Numero de Telephone",
    );
  }

  Widget passwordTextFormField() {
    return CustomTextField(
      textEditingController: passwordController,
      keyboardType: TextInputType.text,
      obscureText: true,
      icon: Icons.lock,
      hint: "Mot de Passe",
    );
  }
   Widget repasswordTextFormField() {
    return CustomTextField(
      textEditingController: repasswordController,
      keyboardType: TextInputType.text,
      obscureText: true,
      icon: Icons.lock,
      hint: "Ressaisir Votre Mot de Passe",
    );
  }

  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: myFirstcolor,
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
              }),
          Text(
            "J'accepte le conditions d'utilisation",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: _large? 12: (_medium? 11: 10)),
          ),
        ],
      ),
    );
  }

   Widget button() {
     return RaisedButton(
       elevation: 0,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      

onPressed: () async {
        var mail = emailController.text;
        var pass = passwordController.text;
         var phone = mobileController.text;
        var last = lastController.text;
         var first = firstController.text;
        var repass = repasswordController.text;
        if(mail.isNotEmpty & pass.isNotEmpty & phone.isNotEmpty & last.isNotEmpty & first.isNotEmpty & ( pass ==  repass))
        {
       
         
        
         lident.add(first);
        lident.add(last);
         lident.add(mail);
        lident.add(phone);
        lident.add(pass);
        lident.add(pathi);
        setState(() {
          ident=lident;
        });
        Navigator.push(context,MaterialPageRoute(builder: (context)=>SignInScren()));
        print(ident);

        }
        else 
         //  _showScaffold("Vous n'avez pas ecrire l'email");
         SnackBar(content: Text("hello"),);
        },




       textColor: Colors.white,  
            padding: EdgeInsets.all(0.0),
      child: Container(        alignment: Alignment.center,
      height: _height / 15,        width:_large? _width/4 : (_medium? _width/3.75: _width/3.5),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[color1, color2],
           ),
     ),
         padding: const EdgeInsets.all(12.0),
       child: Text('Creer un compte', style: TextStyle(fontSize: _large? 14: (_medium? 12: 10)),),
     ),
    );
 }

 

//   Widget socialIconsRow() {
//     return Container(
//       margin: EdgeInsets.only(top: _height / 80.0),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           CircleAvatar(
//             radius: 15,
            
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           CircleAvatar(
//             radius: 15,
            
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           CircleAvatar(
//             radius: 15,
            
//           ),
//         ],
//       ),
//     );
//   }

//   Widget signInTextRow() {
//     return Container(
//       margin: EdgeInsets.only(top: _height / 20.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             "Already have an account?",
//             style: TextStyle(fontWeight: FontWeight.w400),
//           ),
//           SizedBox(
//             width: 5,
//           ),
//           GestureDetector(
//             onTap: () {},
//             child: Text(
//               "Sign in",
//               style: TextStyle(
//                   fontWeight: FontWeight.w800, color: color1, fontSize: 19),
//             ),
//           )
//         ],
//       ),
//     );
//   }
 }
