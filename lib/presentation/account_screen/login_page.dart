import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:temp_mail/data/models/create_account_model.dart';
import 'package:temp_mail/logic/cubits/account_cubit/account_cubit.dart';
import 'package:temp_mail/logic/cubits/account_cubit/account_state.dart';
import 'package:temp_mail/presentation/widgets/dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    foregroundColor: Colors.white,
    backgroundColor: Colors.green.shade900
    );
 
  
  @override
  Widget build(BuildContext context) {
    bool _passwordVisible = false;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Temp Mail",
         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),)),
        backgroundColor: Colors.green,
        
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<AccountsCubit, AccountState>(
          listener: (context, state) {
            if (state is PasswordVisibilityState) {
              _passwordVisible = state.passwordVisibility;
            }
            else if(state is LoginSuccessState){
              Navigator.pushNamed(context, '/inbox');
            }

            else if(state is LoginFailedState){
             //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("LogIn Failed!"),));
             CustomDialog.showGeneralDialog(context, "Account Create Failed!", state.message);
            }
          },
          
          builder: (context, state) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                    decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),),
                            color: Colors.green
                            ),
                            //height: 20,
                    child: const Center(child: Text("Login using Address and Password...", style: TextStyle(color: Colors.white, fontSize: 16),)),
                  ),
                  ColoredBox(
                    color: Colors.green,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only( topRight: Radius.circular(25)),
                        color: Colors.white
                        ),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: [
                          FittedBox(
                                  alignment: Alignment.center,
                              fit: BoxFit.fitHeight,
                              child: SizedBox(
                                width: 250,
                                height: 250,
                                child: Lottie.asset('assets/image/signup2.json', ),)),
                          
                          
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            child: TextField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  border:  OutlineInputBorder(),
                                  labelText: 'Email',
                                  ),
                                ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            child: TextField(
                                obscureText: _passwordVisible,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                      color: Theme.of(context).primaryColorDark,
                                      ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      context.read<AccountsCubit>().passwordVisibility(!_passwordVisible);
                                    },
                                    ),
                                  ),
                                ),
                          ),
                            
                          const SizedBox(height: 15,),
                        AnimatedCrossFade(
                          duration: const Duration(seconds: 1),
                          firstChild: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: style,
                                onPressed: () {
                                  CreateAccountModel createAccountModel = CreateAccountModel(
                                    address: emailController.text, password: passwordController.text);
                                    context.read<AccountsCubit>().logInAccount(createAccountModel);
                                },
                                child: const Text('Log In'),
                              ),
                            ),
                          secondChild: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: CircularProgressIndicator(),),
                            ),
                            crossFadeState: state is! LoginLoadingState ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
          },
        ),
      ),
    );
  }

}