import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_11/therments_list/therment_list.dart';

class ThemernetTab extends StatelessWidget {
  const ThemernetTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 18),
          itemCount: thermentslist.length,
              itemBuilder: (context, index) =>  Row(
                children: [
                CircleAvatar(
                  radius: 10,
                  child: Image.asset(thermentslistimage[index],) ,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(thermentslist[index]),
                const SizedBox(width: 30,)
              ],
              ),
            ),
      ),
      
    );
  }
}