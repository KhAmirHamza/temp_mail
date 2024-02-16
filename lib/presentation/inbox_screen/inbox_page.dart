import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail/data/models/inbox_response_model.dart';
import 'package:temp_mail/logic/cubits/inbox_cubit/inbox_cubit.dart';
import 'package:temp_mail/logic/cubits/inbox_cubit/inbox_state.dart';

import '../widgets/dialog.dart';

class InboxPage extends StatefulWidget {
  final String address;
  final String token;
  const InboxPage({required this.address, required this.token, super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {

    @override
  Widget build(BuildContext context) {
    context.read<InboxCubit>().fetchInboxes(widget.token);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Temp Mail",
         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),)),
        backgroundColor: Colors.green,
        
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<InboxCubit, InboxState>(
          listener: (context, state) {
            
            if(state is InboxSuccessState){
              //Navigator.pushNamed(context, '/inbox');
            }

            else if(state is InboxFailedState){
             //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("LogIn Failed!"),));
             CustomDialog.showGeneralDialog(context, "Inbox loading Failed!", state.message);
             print("Inbox failed state");
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
                    child:  Center(child: Text("Inbox Messages (${widget.address}):", style: const TextStyle(color: Colors.white, fontSize: 16),)),
                  ),
                  ColoredBox(
                    color: Colors.green,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only( topRight: Radius.circular(25)),
                        color: Colors.white
                        ),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
              children: [
                const SizedBox(height: 10,),
                if(state is InboxSuccessState)
                ListView.builder(
                  itemCount: state.inboxResponseModels.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    InboxResponseModel inbox = state.inboxResponseModels[index];
                  return Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Column(
                      children: [
                        const Text("From:"),
                        Text(inbox.from.address),
                        const SizedBox(height: 10,),
                        const Text("To:"),
                        Text(inbox.from.address),
                        const SizedBox(height: 10,),
                        const Text("Subject:"),
                        Text(inbox.subject),
                        const SizedBox(height: 10,),
                        const Text("Details:"),
                        Text(inbox.intro),
                      ],
                    ),
                  );
                }),
                if(state is InboxLoadingState)
                const Center(child: CircularProgressIndicator(),)
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