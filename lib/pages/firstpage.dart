import 'package:flutter/material.dart';
import 'package:lab_bmi/pages/secondpage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController nameInputType = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    heightController.text = '';
    weightController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      appBar: AppBar(
        title: const Text("BMI"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text('ชื่อ'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: nameInputType,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรุณากรอกชื่อ',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('ส่วนสูง (Height)'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรุณากรอกส่วนสูง (เซนติเมตร)',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('น้ำหนัก (Weight)'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรุณากรอกน้ำหนัก (กิโลกรัม)',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  double weight = double.tryParse(weightController.text) ?? 0;
                  double heightInCm =
                      double.tryParse(heightController.text) ?? 0;
                  double bmi;

                  if (heightInCm > 0 && weight > 0) {
                    double heightInMeters =
                        heightInCm / 100; // แปลงความสูงเป็นเมตร
                    bmi = weight / (heightInMeters * heightInMeters);
                    // คุณสามารถใช้ bmi ที่ได้รับในการคำนวณต่อไปได้ตามต้องการ

                    // Navigate to the BMIResultPage and pass the BMI value
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(
                          bmiValue: bmi,
                          nameInputType: nameInputType.text,
                        ),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content: const Text('กรุณาป้อนเลข'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('คำนวณ BMI'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
