import 'package:flutter/material.dart';

class ActivityModal extends StatefulWidget {
  const ActivityModal({super.key});

  @override
  State<ActivityModal> createState() => _ActivityModalState();
}

class _ActivityModalState extends State<ActivityModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
        child: Column(
          children: [
            const TextField(
              decoration:  InputDecoration(label: Text('Activity Name')),
            ),
            const Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration:  InputDecoration(
                      label: Text('Time'),
                      suffixText: 'mins',
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
    );
  }
  }
