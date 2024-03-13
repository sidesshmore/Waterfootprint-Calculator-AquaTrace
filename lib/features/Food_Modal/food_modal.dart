import 'dart:developer';

import 'package:aqua_trace/features/Food_Modal/bloc/addfood_bloc.dart';
import 'package:aqua_trace/models/addItem.dart';
import 'package:aqua_trace/models/servingCategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodModal extends StatefulWidget {
  const FoodModal({super.key});

  @override
  State<FoodModal> createState() => _FoodModalState();
}

class _FoodModalState extends State<FoodModal> {
  Category _selectedCategory = Category.grams;
  final _itemController = TextEditingController();
  final _quantityController = TextEditingController();
  final AddfoodBloc addfoodbloc=AddfoodBloc(); 

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddfoodBloc, AddfoodState>(
      bloc:addfoodbloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        
        switch(state.runtimeType){
            default:
              return Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
            child: Column(
              children: [
                TextField(
                  controller: _itemController,
                  decoration: const InputDecoration(label: Text('Item Name')),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _quantityController,
                        keyboardType: const TextInputType.numberWithOptions(),
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
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        print('button clicked');
                        AddFood item=AddFood(itemName: _itemController.text, quantity: double.parse(_quantityController.text), category: _selectedCategory);
                        addfoodbloc.add(AddFoodItemButtonClicked(item: item));
                        Navigator.pop(context);

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
