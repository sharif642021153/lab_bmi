import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final double bmiValue;
  final String nameInputType;

  const SecondPage(
      {super.key, required this.bmiValue, required this.nameInputType});

  @override
  Widget build(BuildContext context) {
    String result;
    Color resultColor;

    if (bmiValue < 18.5) {
      result = 'น้ำหนักน้อยกว่ามาตรฐาน';
      resultColor = Colors.blue; // หรือสีอื่นๆ ตามที่คุณต้องการ
    } else if (bmiValue >= 18.5 && bmiValue <= 22.9) {
      result = 'น้ำหนักปกติ';
      resultColor = Colors.green; // หรือสีอื่นๆ ตามที่คุณต้องการ
    } else if (bmiValue >= 23 && bmiValue <= 24.9) {
      result = 'น้ำหนักเกินมาตรฐาน (อันตราย)';
      resultColor = Colors.orange; // หรือสีอื่นๆ ตามที่คุณต้องการ
    } else if (bmiValue >= 25 && bmiValue <= 29.9) {
      result = 'โรคอ้วน';
      resultColor = Colors.red; // หรือสีอื่นๆ ตามที่คุณต้องการ
    } else {
      result = 'โรคอ้วนขั้นสูง (อันตรายมาก)';
      resultColor = Colors.purple; // หรือสีอื่นๆ ตามที่คุณต้องการ
    }

// แล้วคุณสามารถใช้ resultColor ในการตั้งค่าสีของข้อความที่แสดงบนหน้าจอได้

    return Scaffold(
      appBar: AppBar(
        title: const Text("ผลการคำนวณ BMI"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Text(
                ' ${nameInputType}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'ค่า BMI ของคุณคือ: ${bmiValue.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Text(
                result,
                style: TextStyle(
                  color: resultColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 85),
            Image.network(
              "http://www.sadathai.org/wp-content/uploads/2022/08/271370-750x350.jpg",
            ),
          ],
        ),
      ),
    );
  }
}
