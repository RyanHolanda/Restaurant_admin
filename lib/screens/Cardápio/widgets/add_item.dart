import 'dart:convert';
import 'dart:io';

import 'package:admin_panel/bloc/app_bloc.dart';
import 'package:admin_panel/models/upload_image_model.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final TextEditingController addItemNameController = TextEditingController();

  final TextEditingController addItemDescriptionController =
      TextEditingController();

  final TextEditingController addItemPriceController = TextEditingController();

  bool uploadingImage = false;
  String txt = 'Adicionar imagem';
  File? theImage;

  ImgbbResponseModel? imgbbResponse;
  void uploadImageFile(File image) async {
    setState(() {
      uploadingImage = true;
    });
    const imgBBkey = 'b239db71c7c38f9b28ba8d4b6a9f62f5';
    Dio dio = Dio();
    try {
      List<int> bytes = await image.readAsBytes();
      final base64image = base64Encode(bytes);

      FormData formData =
          FormData.fromMap({"key": imgBBkey, "image": base64image});

      Response response = await dio.post(
        "https://api.imgbb.com/1/upload",
        data: formData,
      );
      if (response.statusCode != 400) {
        imgbbResponse = ImgbbResponseModel.fromJson(response.data);
        setState(() {
          uploadingImage = false;
        });
      }
    } catch (e) {
      throw Exception('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Center(
          child: SizedBox(
            height: 600,
            width: 700,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 50, bottom: 20, left: 50, right: 50),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        BoxIcons.bx_menu_alt_left,
                        color: Colors.black,
                        size: 28,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Adicionar Item ao cardápio',
                        style: GoogleFonts.inriaSans(fontSize: 28),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: addItemNameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        label: Text('Nome')),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: addItemDescriptionController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        label: Text('Descrição')),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: addItemPriceController,
                    decoration: const InputDecoration(
                        prefixText: r'R$',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        label: Text('Preço (Digite somente números)')),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                          onPressed: () async {
                            FilePickerResult? result;
                            result = await FilePicker.platform.pickFiles();
                            setState(() {
                              theImage = File(result!.files.first.path!);
                              txt = (result.files.first.name);
                            });
                            uploadImageFile(theImage!);
                          },
                          icon: const Icon(Icons.add),
                          label: Text(txt))),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(15)),
                        width: 250,
                        height: 50,
                        child: MaterialButton(
                          onPressed: () {
                            context
                                .read<AppBloc>()
                                .add(AppEventGoToCardapioScreen());
                          },
                          child: const Text('Cancelar'),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      state.isLoading || uploadingImage
                          ? const CircularProgressIndicator()
                          : Container(
                              width: 250,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.black,
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  context.read<AppBloc>().add(AppEventAddItems(
                                      paused: false,
                                      image: imgbbResponse?.data.displayUrl,
                                      name: addItemNameController.text,
                                      price: addItemPriceController.text,
                                      description:
                                          addItemDescriptionController.text));
                                },
                                child: const Text(
                                  'Adicionar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

const imageString = 'https://imgur.com/4NH3806.png';
