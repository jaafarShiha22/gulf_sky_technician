import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:gulf_sky_technician/core/utils/app_colors.dart';
import 'package:gulf_sky_technician/core/utils/show_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/field_validator/field_validator.dart';
import '../../../domain/usecases/auth/login_usecase.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_event.dart';
import '../../blocs/auth/auth_state.dart';
import '../../shared_widgets/custom_rounded_button.dart';
import '../../shared_widgets/text_fields/labeled_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocListener<AuthBloc, AuthState>(
            bloc: BlocProvider.of<AuthBloc>(context),
            listener: (context, state) async {
              if (state is LoginLoading || state is ChangeFCMTokenLoading) {
                EasyLoading.show(
                  status: AppLocalizations.of(context)!.loading,
                  maskType: EasyLoadingMaskType.black,
                );
              } else if (state is LoginFailed) {
                EasyLoading.dismiss();
                ToastUtils.showToast(state.errorMsg);
              } else if (state is ChangeFCMTokenSucceeded) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('user', jsonEncode(state.authResponseEntity.toMap())).then((value) {
                  EasyLoading.showSuccess(AppLocalizations.of(context)!.success, duration: const Duration(seconds: 1));
                  GoRouter.of(context).pushReplacement(AppRoutes.mainView);
                });
              } else if (state is ChangeFCMTokenFailed) {
                EasyLoading.dismiss();
                ToastUtils.showToast(state.errorMsg);
              }
            },
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.signIn,
                      style: AppTextStyle.interLargeBoldBlack,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LabeledTextField(
                      label: '${AppLocalizations.of(context)!.userName}: ',
                      isRequired: true,
                      fieldLabel: '',
                      fieldValidator: FieldValidator.notEmpty,
                      textEditingController: usernameController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LabeledTextField(
                      label: '${AppLocalizations.of(context)!.password}: ',
                      isRequired: true,
                      fieldLabel: '',
                      maxLines: 1,
                      fieldValidator: FieldValidator.password,
                      textEditingController: passwordController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomRoundedButton(
                      label: AppLocalizations.of(context)!.signIn,
                      onPressed: () {
                        if (!FieldValidator.notEmpty.isValid(usernameController.text) ||
                            !FieldValidator.password.isValid(passwordController.text)) {
                          ToastUtils.showToast(AppLocalizations.of(context)!.someFieldsNotValid);
                          return;
                        }
                        BlocProvider.of<AuthBloc>(context).add(
                          Login(
                            parameters:
                                LoginParameters(username: usernameController.text, password: passwordController.text),
                          ),
                        );
                      },
                      color: AppColors.orange,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
