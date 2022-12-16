import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/data/cubit/cubit.dart';
import 'package:payment/data/cubit/cubitStates.dart';
import 'package:payment/presintison/toggelScreen.dart';

class RegisterScreen extends StatelessWidget {
 final TextEditingController _firestNameController =TextEditingController();
 final TextEditingController _lastNameController =TextEditingController();
 final TextEditingController _emailController =TextEditingController();
 final TextEditingController _phoneController =TextEditingController();
 final TextEditingController _priceController =TextEditingController();
 final formKey =GlobalKey<FormState>();
 bool isto=false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>PaymentCubit(),
      child: BlocConsumer<PaymentCubit,PaymentState>(
        listener: (context,state){
         if(state is paymentTokenSuccess){
           Navigator.of(context).
           pushReplacement(MaterialPageRoute(builder: (_)=>ToggellScreen()));
           isto=false;
         }
        },
        builder: (context,stat){
          return  SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                backgroundColor: Colors.blueGrey,
                centerTitle: true,
                title: const Text("Payment",style:
                TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: _firestNameController,
                          keyboardType: TextInputType.name,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please enter your name";
                            }
                            return null;
                          },
                          decoration:InputDecoration(
                              label: Text("FirestName"),
                              hintText: "FirestName",
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              )
                          ),

                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: _lastNameController,
                          keyboardType: TextInputType.name,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please enter your name";
                            }
                            return null;
                          },
                          decoration:InputDecoration(
                              label: Text("LastName"),
                              hintText: "LastName",
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              )
                          ),

                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please enter your email";
                            }
                            return null;
                          },
                          decoration:InputDecoration(
                              label: Text("Email"),
                              hintText: "email",
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              )
                          ),

                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please enter your phone number";
                            }
                            return null;
                          },
                          decoration:InputDecoration(
                              label: Text("Phone"),
                              hintText: "phone",
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              )
                          ),

                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: _priceController,
                          keyboardType: TextInputType.phone,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please enter your name";
                            }
                            return null;
                          },
                          decoration:InputDecoration(
                              label: Text("Price"),
                              hintText: "price",
                              prefixIcon: Icon(Icons.price_change_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              )
                          ),

                        ),
                        SizedBox(height: 20,),
                         isto?
                          Center(child: CircularProgressIndicator()):
                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.redAccent,
                          ),
                          child: MaterialButton(
                            onPressed: (){

                              if(formKey.currentState!.validate()){
                                PaymentCubit.get(context).getFirestToken(
                                  _priceController.text,
                                  _firestNameController.text,
                                  _lastNameController.text,
                                  _emailController.text,
                                  _phoneController.text,

                                );
                                isto=true;

                              }

                            },
                            child: Text("Pay",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
