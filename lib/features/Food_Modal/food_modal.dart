import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:aqua_trace/features/Food_Modal/bloc/addfood_bloc.dart';
import 'package:aqua_trace/models/addItem.dart';
import 'package:aqua_trace/models/list.dart';
import 'package:aqua_trace/models/servingCategory.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class FoodModal extends StatefulWidget {
  const FoodModal({super.key});

  @override
  State<FoodModal> createState() => _FoodModalState();
}

class _FoodModalState extends State<FoodModal> {
  Category _selectedCategory = Category.grams;
  final _itemController = TextEditingController();
  final _quantityController = TextEditingController();
  final AddfoodBloc addfoodbloc = AddfoodBloc();
  static List<String> _kOptions = [];

  String? userName = '';
    final FirebaseAuth auth = FirebaseAuth.instance;

  void setName() async {
    var user = await auth.currentUser;
    setState(() {
      userName = user!.displayName;
    });
  }

  void getAllFood() async {
    List<String> lists = [];
    final dio = Dio();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    final response = await dio.get('${dotenv.env["URL"]}/getallfood');
    if (response.statusCode == 200) {
      final data = response.data["result"];
      List dataList = data;
      for (int i = 0; i < dataList.length; i++) {
        AllFood list = AllFood.fromMap(dataList[i] as Map<String, dynamic>);
        lists.add(list.fooditems);
      }
      setState(() {
        _kOptions = lists;
      });
    } else {
      setState(() {
        _kOptions = [];
      });
      ;
    }
  }

  @override
  void initState() {
    setName();
    getAllFood();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AddfoodBloc, AddfoodState>(
      bloc: addfoodbloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          default:
            return Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
                child: Column(
                  children: [
                    Autocomplete<String>(
                      fieldViewBuilder: ((context, textEditingController,
                              focusNode, onFieldSubmitted) =>
                          TextFormField(
                            focusNode: focusNode,
                            onEditingComplete: onFieldSubmitted,
                            controller: textEditingController,
                            decoration: const InputDecoration(
                                hintText:
                                    'Enter a FoodItem'), // placeholder text
                          )),
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text == '') {
                          return const Iterable<String>.empty();
                        }
                        return _kOptions.where((String option) {
                          return option
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      onSelected: (String selection) {
                        setState(() {
                          _itemController.text = selection;
                        });
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _quantityController,
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            decoration:
                                const InputDecoration(label: Text('Quantity')),
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
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black),
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
                        // const Spacer(),
                        const SizedBox(width: 60,),
                        ElevatedButton(
                          onPressed: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            print('button clicked');
                            AddFood item = AddFood(
                                itemName: _itemController.text,
                                quantity:
                                    double.parse(_quantityController.text),
                                category: _selectedCategory);
                            final category =
                                item.category.toString().substring(9);
                            final dio = Dio();
                            final response = await dio
                                .post('${dotenv.env["URL"]}/add', data: {
                              "uid": prefs.getString('uid'),
                              "item": item.itemName,
                              "measure": category,
                              "quantity": item.quantity,
                              "name":userName
                            });
                            //  var url = dotenv.env["URL"];
                            //  var client = http.Client();
                            // final headers = {'Content-Type': 'application/json'};
                            // Map<String, dynamic> body = {
                            //   "uid": prefs.getString('uid'),
                            //   "item": item.itemName,
                            //   "measure": category,
                            //   "quantity": item.quantity,
                            //   "name":userName
                            // };
                            // String jsonBody = jsonEncode(body);

                            //   var response = await client.post(Uri.parse('$url/add'),
                            //     headers: headers, body: jsonBody);
                            //   var decodeResponse = jsonDecode(response.body);
                            //   log(decodeResponse.toString());

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
                      ],
                    )
                  ],
                ),
              ),
            );
        }
      },
    );
  }
}
