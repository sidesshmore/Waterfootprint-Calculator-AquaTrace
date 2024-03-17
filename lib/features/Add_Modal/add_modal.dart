import 'package:aqua_trace/features/Activity_Modal/ui/activity_modal.dart';
import 'package:aqua_trace/features/Food_Modal/food_modal.dart';
import 'package:aqua_trace/features/Try_With_AI/trywithai.dart';
import 'package:flutter/material.dart';

class AddModal extends StatefulWidget {
  const AddModal({super.key});

  @override
  State<AddModal> createState() => _AddModalState();
}

class _AddModalState extends State<AddModal> with SingleTickerProviderStateMixin {
 late TabController _tabController;
 @override
  void initState() {
    _tabController =  TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: MediaQuery.of(context).size.height*0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            TabBar(
              automaticIndicatorColorAdjustment: true,
              unselectedLabelColor: Colors.black,
              labelColor: Colors.blue,
              tabs: const[
                Tab(
                  text: 'Food Item',
                ),
                Tab(
                  text: 'Activity',
                ),
                Tab(
                  icon: Icon(Icons.camera_alt),
                )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.blue,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FoodModal(),
                  ActivityModal(),
                  TryWithAI()
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      
    );
  }

}
