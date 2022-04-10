import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:med/social_app/constants.dart';
import 'package:med/social_app/cubit.dart';
import 'package:med/social_app/state.dart';

class EditProfile extends StatelessWidget {
  var namecont = TextEditingController();
  var emailcon = TextEditingController();

  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var usermodel = AppBloc.get(context).user;
          late var profileImage = AppBloc.get(context).profileImage;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Edit Profile'),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Center(
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 75,
                                backgroundColor: Colors.teal,
                                child: CircleAvatar(
                                  radius: 70,
                                  backgroundImage: usermodel?.image == null
                                      ? NetworkImage('${usermodel?.image}')
                                      : FileImage(profileImage)
                                          as ImageProvider,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    AppBloc.get(context).pickProfileImage();
                                  },
                                  icon: const CircleAvatar(
                                      radius: 20,
                                      child: Icon(
                                        Icons.camera,
                                        size: 16,
                                      )))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'username must not be empty';
                            }

                            return null;
                          },
                          controller: namecont,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            isDense: false,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                15.0,
                              ),
                            ),
                            label: Text(
                              '${usermodel!.username}',
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'email must not be empty';
                            }

                            return null;
                          },
                          controller: namecont,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            isDense: false,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                15.0,
                              ),
                            ),
                            label: Text(
                              '${usermodel!.email}',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text('Blood Type : A+',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        const SizedBox(
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
                            child: const Text(
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
                ],
              ),
            ),
          );
        });
  }
}
