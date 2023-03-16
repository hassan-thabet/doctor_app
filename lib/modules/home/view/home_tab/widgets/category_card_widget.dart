import 'package:doctor_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.local_hospital_outlined,
                color: appMainColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              ' Category ',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
