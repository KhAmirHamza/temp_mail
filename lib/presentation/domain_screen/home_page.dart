
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail/logic/cubits/domain_cubit/domain_state.dart';
import 'package:temp_mail/presentation/widgets/dialog.dart';

import '../../logic/cubits/domain_cubit/domain_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Temp Mail",
         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),)),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [

          Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                    decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),),
                            color: Colors.green
                            ),
                            //height: 20,
                    // child: const Center(child: Text("Create Account using Address and Password...", style: TextStyle(color: Colors.white, fontSize: 16),)),
                  ),

          ColoredBox(
            color: Colors.green,
            child: Container(
              decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only( topRight: Radius.circular(25)),
                          color: Colors.white
                          ),
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: BlocConsumer<DomainCubit, DomainState>(
                listener: (context, state){
                if(state is DomainErrorState){
                     CustomDialog.showGeneralDialog(context, "Oops!", state.message);
                  }
                },
                builder: (context, state) {
                  if (state is DomainLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is DomainGotState) {
                    return Column(
                      children: [
                        const Center(child: Text("Available Domains", 
                        style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),)),
                        const SizedBox( height: 10,),
                        const Text("Click to Create or Login"),
                        const SizedBox( height: 5,),
                        ListView.builder(
                            itemCount: state.domainModels.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, '/create_account', arguments: {'domain': state.domainModels[index].domain});
                                },
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.mail,
                                        size: 20,
                                        color: Colors.green,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(state.domainModels[index].domain)
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ],
                    );
                  }
                  return Container(height: 20,);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
