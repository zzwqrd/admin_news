import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:admin_pnal/Helper/Btns.dart';
import 'package:admin_pnal/Helper/Color.dart';
import 'package:admin_pnal/Helper/app_theme.dart';
import 'package:admin_pnal/Helper/fluttertoast.dart';
import 'package:admin_pnal/Helper/text_form.dart';
import 'package:admin_pnal/Helper/visitor.dart';
import 'package:admin_pnal/screens/app_screen/view.dart';
import 'package:admin_pnal/screens/news/bloc/bloc.dart';
import 'package:admin_pnal/screens/news/bloc/events.dart';
import 'package:admin_pnal/screens/news/bloc/states.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiwi/kiwi.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:easy_localization/easy_localization.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  ShowNewsBloc bloc = KiwiContainer().resolve<ShowNewsBloc>();
  DeleteNewsBloc blocDelete = KiwiContainer().resolve<DeleteNewsBloc>();
  AddNewsBloc blocAdd = KiwiContainer().resolve<AddNewsBloc>();

  @override
  void initState() {
    bloc.add(ShowNewsEventStart());

    // blocDelete.add(DeleteStateStart());
    super.initState();
  }

  // FilePickerResult? filesPicker;
  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Title'),
                  content: Form(
                    key: blocAdd.formKey,
                    child: Column(
                      children: [
                        // IconButton(
                        //   onPressed: () {
                        //     setState(() {
                        //       takeImage(ImageSource.gallery);
                        //       blocAdd.imageController = imageFile!.path;
                        //       print(imageFile!.path);
                        //     });
                        //   },
                        //   icon: Icon(Icons.abc),
                        // ),
                        // CircleAvatar(
                        //   radius: 80.0,
                        //   backgroundImage: FileImage(File(imageFile!.path)),
                        // ),
                        txtField(
                          controller: blocAdd.titleController,
                          context: context,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "title";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (o) {},
                          hintText: 'title',
                          prefix: 'assets/icons/prefix-Phone.png',
                          enabled: true,
                          obscureText: false,
                          textInputType: TextInputType.emailAddress,
                        ),
                        txtField(
                          controller: blocAdd.descriptionController,
                          context: context,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "description";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (o) {},
                          hintText: 'description',
                          prefix: 'assets/icons/prefix-Phone.png',
                          enabled: true,
                          obscureText: false,
                          textInputType: TextInputType.emailAddress,
                        ),

                        BlocConsumer(
                          bloc: blocAdd,
                          listener: (context, state) {
                            if (state is AddStateSuccess) {
                              showMassege(
                                text: state.model.message,
                                state: ToastStates.SUCCESS,
                              );
                            } else if (state is AddStateFailed) {
                              showMassege(
                                text: state.msg,
                                state: ToastStates.SUCCESS,
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is AddStateStart) {
                              return CircularProgressIndicator();
                            } else {
                              return btn(
                                context: context,
                                txt: "add",
                                onTap: () {
                                  if (!blocAdd.formKey.currentState!.validate()) {
                                    return;
                                  } else {
                                    blocAdd.formKey.currentState!.save();
                                    blocAdd.add(
                                      AddNewsEventStart(
                                        description: blocAdd.descriptionController.text,
                                        // image: blocAdd.imageController,
                                        title: blocAdd.titleController.text,
                                      ),
                                    );
                                  }
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            child: Container(
              height: 35,
              width: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                "add",
                style: TextStyle(fontSize: 11, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                  width: 0.5,
                  color: Colors.white,
                )),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text("title"),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text("dascription"),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text("image"),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text("mor"),
                  ),
                ),
              ],
            ),
          ),
          BlocConsumer(
            bloc: bloc,
            listener: (context, state) {
              if (state is DeleteItemState) {
                bloc.add(ShowNewsEventStart());
              }
            },
            builder: (context, state) {
              if (state is ShowNewsStateStart) {
                return CircularProgressIndicator();
              } else if (state is ShowNewsStateSuccess) {
                return state.data! == null && state.data! == []
                    ? Center(child: Text(context.locale.languageCode == "ar" ? "لا توجد منتجات" : "There are no products"))
                    : ListView.builder(
                        shrinkWrap: true,
                        // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        itemCount: state.data!.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.white,
                                )),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text(state.data![index].title),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text("dascription iihg kjshefjk "),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Image(
                                      image: NetworkImage(state.data![index].image),
                                      height: 100.0,
                                      width: 100.0,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 35,
                                            width: 45,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: const Text(
                                              "show",
                                              style: TextStyle(fontSize: 11, color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        delete(state.data![index].id),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 35,
                                            width: 45,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.amber,
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: const Text(
                                              "update",
                                              style: TextStyle(fontSize: 11, color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      );
              } else if (state is ShowNewsStateFailed) {
                return Center(
                  child: Text(state.msg!),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget delete(int id) {
    return BlocConsumer(
      bloc: blocDelete,
      listener: (context, state) {
        if (state is DeleteStateSuccess) {
          showMassege(
            text: context.locale.languageCode == "ar" ? "تم الحذف بنجاح" : "Deleted successfully",
            state: ToastStates.SUCCESS,
          );
          bloc.add(ShowNewsEventStart());
          // blocDelete.add(DeleteNewsEventStart(url: "new/delete/$id"));
        } else if (state is DeleteStateFailed) {
          showMassege(
            text: state.msg,
            state: ToastStates.SUCCESS,
          );
        }
      },
      builder: (context, state) {
        if (state is DeleteStateStart && state.id == id) {
          return const CircularProgressIndicator();
        } else {
          return InkWell(
            onTap: () {
              setState(() {
                visitorDialog(
                  context: context,
                  dialogType: DialogType.INFO,
                  text: context.locale.languageCode == "ar" ? "حذف" : "Delete",
                  btnOkText: context.locale.languageCode == "ar" ? "موافق" : "ok",
                  btnCancelText: context.locale.languageCode == "ar" ? "الغاء" : "cancel",
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {
                    blocDelete.add(
                      DeleteNewsEventStart(url: "new/delete/$id", id: id),
                    );
                  },
                );
              });
            },
            child: Container(
              height: 35,
              width: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                "delete",
                style: TextStyle(fontSize: 11, color: Colors.white),
              ),
            ),
          );
        }
      },
    );
  }

  PickedFile? imageFile;

  final ImagePicker picker = ImagePicker();

  void takeImage(ImageSource source) async {
    final pickerdFile = await picker.getImage(source: source);
    setState(() {
      imageFile = pickerdFile;
    });
  }
}
