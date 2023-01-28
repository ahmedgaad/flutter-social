// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_print

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../layout/social_layout.dart';
import '../../shared/components_manager.dart';
import 'cubit/register_cubit.dart';
import 'cubit/register_states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is CreateUserSuccessState) {
            showToast(
                text: "Register Successfully", state: ToastStates.SUCCESS);
            Future.delayed(Duration(seconds: 1)).then((value) {
              navigateAndFinish(context, SocialLayout());
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 24.0,
                  color: Colors.black,
                ),
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
              ),
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: Padding(
              padding: EdgeInsets.all(10.0.sp),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Jannah',
                                color: Colors.black,
                              ),
                        ),
                        Text(
                          'Register now to browse our list of highest trending products.',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                  // fontSize: 30.0,
                                  ),
                        ),
                        SizedBox(
                          height: 25.0.h,
                        ),
                        //User Name
                        defaultFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          labelText: 'User Name',
                          prefix: Icons.person,
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        //Email Address
                        defaultFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            labelText: 'Email Address',
                            prefix: Icons.email),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        //Password
                        defaultFormField(
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is too short';
                              }
                              return null;
                            },
                            onSubmit: (value) {},
                            labelText: 'Password',
                            prefix: Icons.password),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        //Phone Number
                        defaultFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.number,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                          labelText: 'Phone Number',
                          prefix: Icons.phone,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (BuildContext context) => defaultButton(
                            text: 'register',
                            radius: 10.0.sp,
                            function: () {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  phone: _phoneController.text,
                                );
                              }
                            },
                          ),
                          fallback: (BuildContext context) =>
                              Center(child: CircularProgressIndicator()),
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
