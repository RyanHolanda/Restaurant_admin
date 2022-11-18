import 'dart:convert';
import 'dart:io';

import 'package:admin_panel/bloc/app_bloc.dart';
import 'package:admin_panel/models/upload_image_model.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class EditItemScreen extends StatefulWidget {
  const EditItemScreen({
    required this.paused,
    required this.id,
    required this.price,
    required this.name,
    required this.image,
    required this.description,
    Key? key,
  }) : super(key: key);
  final bool paused;
  final String id;
  final String name;
  final String image;
  final String price;
  final String description;

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  final TextEditingController? priceController = TextEditingController();

  final TextEditingController? descriptionController = TextEditingController();

  final TextEditingController? nameController = TextEditingController();
  bool uploadingImage = false;
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
    return BlocProvider(
      create: (context) => AppBloc(),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: Platform.isMacOS ||
                            Platform.isWindows ||
                            Platform.isLinux
                        ? const EdgeInsets.only(
                            top: 50, bottom: 20, left: 50, right: 50)
                        : const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: uploadingImage
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : Image.network(
                                      imgbbResponse?.data.displayUrl ??
                                          widget.image,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Padding(
                              padding: Platform.isMacOS ||
                                      Platform.isWindows ||
                                      Platform.isLinux
                                  ? const EdgeInsets.all(25)
                                  : const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Platform.isMacOS ||
                                          Platform.isWindows ||
                                          Platform.isLinux
                                      ? const Icon(
                                          BoxIcons.bx_menu_alt_left,
                                          color: Colors.white,
                                          size: 28,
                                        )
                                      : IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back_ios_new,
                                            color: Colors.white,
                                          )),
                                  Platform.isMacOS ||
                                          Platform.isWindows ||
                                          Platform.isLinux
                                      ? const SizedBox(
                                          width: 20,
                                        )
                                      : const SizedBox.shrink(),
                                  Text(
                                    'Editar Item:',
                                    style: GoogleFonts.inriaSans(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 2.3,
                                  right: 20),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton.icon(
                                    onPressed: () async {
                                      FilePickerResult? result;
                                      result =
                                          await FilePicker.platform.pickFiles();
                                      setState(() {
                                        theImage =
                                            File(result!.files.first.path!);
                                      });

                                      uploadImageFile(theImage!);
                                    },
                                    icon: const Icon(Icons.add),
                                    label: const Text('Alterar imagem')),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: widget.name,
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                            hintText: widget.description,
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: priceController,
                          inputFormatters: [
                            TextInputFormatter.withFunction(
                          (oldValue, newValue) => newValue.copyWith(
                            text: newValue.text.replaceAll('.', ','),
                          ),
                        ),
                          ],
                          decoration: InputDecoration(
                            hintText: widget.price,
                             prefixText: '',
                            
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                          ),
                        ),
                        Platform.isMacOS || Platform.isWindows || Platform.isLinux ? const SizedBox(
                          height: 20,
                        ) : SizedBox(height: 40,),
                        Platform.isMacOS || Platform.isWindows || Platform.isLinux ? const SizedBox(
                          height: 50,
                        ) : const SizedBox.shrink(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Platform.isMacOS ||
                                    Platform.isWindows ||
                                    Platform.isLinux
                                ? Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    width: 250,
                                    height: 50,
                                    child: MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancelar'),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            Platform.isMacOS ||
                                    Platform.isWindows ||
                                    Platform.isLinux
                                ? const SizedBox(
                                    width: 50,
                                  )
                                : const SizedBox.shrink(),
                            uploadingImage
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
                                        context.read<AppBloc>().add(
                                            AppEventEditItem(
                                                paused: widget.paused,
                                                id: widget.id,
                                                image: imgbbResponse
                                                        ?.data.displayUrl ??
                                                    widget.image,
                                                description:
                                                    descriptionController
                                                                ?.text ==
                                                            ''
                                                        ? widget.description
                                                        : descriptionController
                                                            ?.text,
                                                name: nameController?.text == ''
                                                    ? widget.name
                                                    : nameController?.text,
                                                price: priceController?.text ==
                                                        ''
                                                    ? widget.price
                                                    : priceController?.text));
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Atualizar',
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
              ),
            ),
          );
        },
      ),
    );
  }
}
