import 'package:aqua_trace/models/addItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/activity_bloc.dart';

class ActivityModal extends StatefulWidget {
  const ActivityModal({super.key});

  @override
  State<ActivityModal> createState() => _ActivityModalState();
}

class _ActivityModalState extends State<ActivityModal> {
  final ActivityBloc activitybloc=ActivityBloc();
  final _activityitemController=TextEditingController();
  final _timeController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActivityBloc, ActivityState>(
      bloc: activitybloc,
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
                  controller: _activityitemController,
                  decoration: const InputDecoration(label: Text('Activity Name')),
                ),
                 Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _timeController,
                        keyboardType: const TextInputType.numberWithOptions(),
                        decoration: const InputDecoration(
                          label: Text('Time'),
                          suffixText: 'mins',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
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
                      onPressed: () {
                        final AddActivity item=AddActivity(activityName: _activityitemController.text, time: double.parse(_timeController.text));
                        activitybloc.add(AddActivityItemButtonClicked(item: item));
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
