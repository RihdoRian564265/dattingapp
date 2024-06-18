import 'package:dattingapp/res/component/costume_iconbutton.dart';
import 'package:dattingapp/view/profile/profile_screen.dart';
import 'package:dattingapp/view_model/edit/edit_controler.dart';
import 'package:dattingapp/view_model/services/session_manager.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final dbref = FirebaseDatabase.instance.ref('User');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF333333),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined,
              color: const Color.fromARGB(255, 255, 255, 255)),
          onPressed: () => Navigator.of(context).pop(
            PageTransition(
              child: ProfileScreen(),
              type: PageTransitionType.rightToLeft,
            ),
          ),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (_) => EditControler(),
        child: Consumer<EditControler>(
          builder: (context, provider, child) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: StreamBuilder(
                  stream: dbref
                      .child(SessionController().userId.toString())
                      .onValue,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
                      return Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Column(
                          children: [
                            ReusableRow(
                                title: 'UserName',
                                iconData: Icons.person,
                                value: map['UserName'],
                                customIconButton: CustomIconButton(onPressed: (){
                                  provider.pickUserName(context);
                                }, icon: Icons.edit),),
                            ReusableRow(
                                title: 'Phone',
                                iconData: Icons.phone_outlined,
                                value: map['Phone'] == ''
                                    ? 'xxx-xxx-xxxxx'
                                    : map['Phone'],
                                customIconButton: CustomIconButton(onPressed: (){
                                  provider.pickPhone(context);
                                }, icon: Icons.edit),),
                            ReusableRow(
                                title: 'Email',
                                iconData: Icons.email_outlined,
                                value: map['Email'],
                                customIconButton: CustomIconButton(onPressed: (){
                                  provider.pickEmail(context);
                                }, icon: Icons.edit),),
                          ],
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(
                          'Something want Wrong',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      );
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  final IconData iconData;
  final CustomIconButton customIconButton;
  const ReusableRow({
    Key? key,
    required this.title,
    required this.iconData,
    required this.value,
    required this.customIconButton
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              iconData,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(child: Text(title)),
            Text(value),
            customIconButton,
          ],
        ),
        Divider(
          color: Color.fromARGB(190, 255, 255, 255),
        )
      ],
    );
  }
}
