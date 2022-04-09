import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med/social_app/constants.dart';
import 'package:med/social_app/cubit.dart';
import 'package:med/social_app/edit_profile.dart';
import 'package:med/social_app/state.dart';


class Profile extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc,AppState>(
      listener: (context, state) {},
      builder: (context, state) {

        var usermodel = AppBloc.get(context).user;

        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.teal,
                  child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                    '${usermodel!.image}'
                  ),
                ),
                ),
                  
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Name : ${usermodel!.username}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
    
              )
            ),
            SizedBox(
              height:15
            ),
             Text(
              'Email : ${usermodel!.email}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
    
              )
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Blood Type',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
    
              )
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                    height: 42.0,
                    width: double.infinity,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                    ),
                    child: MaterialButton(
                      height: 42.0,
                      onPressed: () {
                        navigateTo(context, EditProfile());
                      },
                      child:  const Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
            
        ],
      ),
          ),
        );
      },
    );
  }
}

