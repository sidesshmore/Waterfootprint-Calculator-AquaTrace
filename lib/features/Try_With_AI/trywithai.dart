import 'dart:developer';
import 'dart:io';

import 'package:aqua_trace/models/addItem.dart';
import 'package:aqua_trace/models/servingCategory.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tensorflow_lite_flutter/tensorflow_lite_flutter.dart';

class TryWithAI extends StatefulWidget {
  const TryWithAI({super.key});

  @override
  State<TryWithAI> createState() => _TryWithAIState();
}

class _TryWithAIState extends State<TryWithAI> {
  late File _image;
  List? _output;
  final ImagePicker imagepicker = ImagePicker();
  String select = '';
  Category _selectedCategory = Category.grams;
  final _itemController = TextEditingController();
  final _quantityController = TextEditingController();

  String? userName = '';
    final FirebaseAuth auth = FirebaseAuth.instance;

  void setName() async {
    var user = await auth.currentUser;
    setState(() {
      userName = user!.displayName;
    });
  }

  @override
  void initState() {
    setName();
    loadmodel();
    super.initState();
  }

  detectimage(File image) async {
    print(image);
    var prediction = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 18,
      threshold: 0.6,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    if (prediction!.isEmpty) {
      setState(() {
        _output = null;
      });
      return null;
    }
    setState(() { 
      _output = prediction;
      select=(_output![0]['label']).toString().substring(2).trim();
      print(_output![0].toString());
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
        model: 'assets/model.tflite', labels: 'assets/labels.txt');
  }

  @override
  void dispose() {
    super.dispose();
  }

  pickimage_camera() async {
    XFile? image = await imagepicker.pickImage(source: ImageSource.camera);
    print(image!.path);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detectimage(_image);
  }

  pickimage_gallery() async {
    XFile? image = await imagepicker.pickImage(source: ImageSource.gallery);
    print(image!.path);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detectimage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 50,
                  width: 160,
                  child: ElevatedButton(
                      child: Text('Capture', style: TextStyle(fontSize: 18)),
                      onPressed: () {
                        pickimage_camera();
                        print((_output![0]['label']).toString().substring(2));
                          
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 50,
                  width: 160,
                  child: ElevatedButton(
                      child: Text('Gallery', style: TextStyle(fontSize: 18)),
                      onPressed: () {
                        pickimage_gallery();
                         setState(() {
                          if(_output!=null){
                            select=(_output![0]['label']).toString().substring(2);
                          }
                        });
                      }),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              children: [
                Text('FoodItem:${select}',style: TextStyle(fontSize: 19),),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _quantityController,
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: const InputDecoration(label: Text('Quantity')),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 38,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 48,
                    width:50,

                    child: DropdownButton(
                        style:
                            const TextStyle(fontSize: 17, color: Colors.black),
                        value: _selectedCategory,
                        items: Category.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category.name.toUpperCase(),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory = value;
                          });
                        }),
                  ),
                ),
                const SizedBox(width: 60,),const SizedBox(
                  width: 6,
                ),
                
                ElevatedButton(
                  onPressed: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    print('button clicked');
                    AddFood item = AddFood(
                        itemName: '',
                        quantity: double.parse(_quantityController.text),
                        category: _selectedCategory);
                    final category = item.category.toString().substring(9);
                    final dio = Dio();
                    final response = await dio.post(
                        '${dotenv.env["URL"]}/add',
                        data: {
                          "uid": prefs.getString('uid'),
                          "item": select,
                          "measure": category,
                          "quantity": item.quantity,
                          "name":userName
                        });
                        log({
                          "uid": prefs.getString('uid'),
                          "item": select,
                          "measure": category,
                          "quantity": item.quantity,
                          "name":userName
                        }.toString());

                    if (response.statusCode == 200) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'aqua_trace', (route) => false);
                    }
                  },
                  child: const Text('Save'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                //     ElevatedButton(
                //       onPressed: () {
                //         pickimage_camera();
                //         setState(() {
                //           if(_output!=null){
                //             select=(_output![0]['label']).toString().substring(2);
                //           }
                //         });
                //       },
                //       child: const Text('Capture'),
                //     ),
                //     const SizedBox(
                //       width: 12,
                //     ),
                //     ElevatedButton(
                //       onPressed: () {
                //         pickimage_gallery();
                //         setState(() {
                //           if(_output!=null){
                //             _itemController.text=(_output![0]['label']).toString().substring(2);
                //           }
                //         });
                //       },
                //       child: const Text('Gallery'),
                //     ),
                //   ],
                // ),
                // const SizedBox(
                //   height: 55,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       width: 120,
                //       // padding: const EdgeInsets.all(20.0),
                //       child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //             textStyle: TextStyle(fontSize: 18)),
                //         onPressed: () async {
                //           final SharedPreferences prefs =
                //               await SharedPreferences.getInstance();
                //           print('button clicked');
                //           AddFood item = AddFood(
                //               itemName: _itemController.text,
                //               quantity:
                //                   double.parse(_quantityController.text),
                //               category: _selectedCategory);
                //           final category =
                //               item.category.toString().substring(9);
                //           final dio = Dio();
                //           final response = await dio.post(
                //               'https://long-pink-swallow-belt.cyclic.app/add',
                //               data: {
                //                 "uid": prefs.getString('uid'),
                //                 "item": item.itemName,
                //                 "measure": category,
                //                 "quantity": item.quantity
                //               });

                //           if (response.statusCode == 200) {
                //             Navigator.pushNamedAndRemoveUntil(
                //                 context, 'aqua_trace', (route) => false);
                //           }
                //         },
                //         child: const Text('Save'),
                //       ),
                //     ),
                //     Container(
                //       width: 120,
                //       child: TextButton(
                //         style: TextButton.styleFrom(
                //             textStyle: TextStyle(fontSize: 18)),
                //         onPressed: () {
                //           Navigator.pop(context);
                //         },
                //         child: const Text('Cancel'),
                //       ),
                //     ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
