import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final List<Map<String, String>> profiles = [
    {
      'name': 'Dinda Aulya Sakina',
      'position': 'Manager',
      'image': 'assets/img/person1.png'
    },
    {
      'name': 'Favian Pradipa',
      'position': 'Programmer',
      'image': 'assets/img/person2.png'
    },
    {
      'name': 'Serli Anggraeni Rahman',
      'position': 'Designer',
      'image': 'assets/img/person3.png'
    },
    {
      'name': 'Yuri Alfa Izzati',
      'position': 'Marketing',
      'image': 'assets/img/person4.png'
    },
    {
      'name': 'Agung Mukti Wibowo',
      'position': 'HRD',
      'image': 'assets/img/person5.png'
    },
    {
      'name': 'Faiz Nurahman Rizal',
      'position': 'Customer Service',
      'image': 'assets/img/person6.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Tim'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: profiles.map((profile) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(2, 4),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      profile['image']!,
                      width: 200,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    profile['name']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    profile['position']!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
      backgroundColor: Colors.purple.shade50,
    );
  }
}
