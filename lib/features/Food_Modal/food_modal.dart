import 'package:flutter/material.dart';

class FoodModal extends StatefulWidget {
  const FoodModal({super.key});

  @override
  State<FoodModal> createState() => _FoodModalState();
}

class _FoodModalState extends State<FoodModal> {

  final unit=['QTY','Grams'];

   String _selectedUnit='QTY';

@override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
        child: Column(
          children: [
            const TextField(
              decoration:  InputDecoration(label: Text('Item Name')),
            ),
            const Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration:  InputDecoration(
                      label: Text('Quantity')
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 38,
            ),
            Row(
              children: [
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
    );  }
}