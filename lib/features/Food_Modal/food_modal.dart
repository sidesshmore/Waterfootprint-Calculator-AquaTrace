import 'package:aqua_trace/models/servingCategory.dart';
import 'package:flutter/material.dart';

class FoodModal extends StatefulWidget {
  const FoodModal({super.key});

  @override
  State<FoodModal> createState() => _FoodModalState();
}

class _FoodModalState extends State<FoodModal> {
  Category _selectedCategory = Category.grams;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(label: Text('Item Name')),
            ),
            const Row(
              children: [
                 Expanded(
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(label: Text('Quantity')),
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
                const SizedBox(width: 10,),
                 Expanded(
                  child: 
                       Container(
                          height: 48,
                          child: DropdownButton(
                            style: const TextStyle(fontSize: 18,color: Colors.black),
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
                  onPressed: () {},
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
}
