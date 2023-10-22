import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  final UserInfo userInfo;

  UserInfoPage({required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Информация о пользователе'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoCard('ФИО', userInfo.fullName),
            SizedBox(height: 20),
            _infoCard('Номер телефона', userInfo.phoneNumber),
            SizedBox(height: 20),
            _infoCard('Email', userInfo.email),
            SizedBox(height: 20),
            _infoCard('Рассказ о себе', userInfo.about),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String title, String value) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }
}

class UserInfo {
  final String fullName;
  final String phoneNumber;
  final String email;
  final String about;
  final String password;

  UserInfo(
      this.fullName, this.phoneNumber, this.email, this.about, this.password);
}
