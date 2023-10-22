import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apuzhan_reg/bloc/repos_bloc.dart';
import 'package:flutter_apuzhan_reg/bloc/repos_event.dart';
import 'package:flutter_apuzhan_reg/bloc/repos_state.dart';
import 'package:flutter_apuzhan_reg/generated/locale_keys.g.dart';
import 'package:flutter_apuzhan_reg/personalpage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  String? fullName, phoneNumber, email, about, password;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<ReposBloc>().add(SubmitEvent(
          UserInfo(fullName!, phoneNumber!, email!, about!, password!)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReposBloc, ReposState>(
      listener: (context, state) {
        if (state is SuccessState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserInfoPage(userInfo: state.userInfo),
            ),
          );
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Вы зарегистрировались')));
        } else if (state is ErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Ошибка при регистрации')));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('Регистрация')),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: LocaleKeys.name.tr(),
                    icon: Icon(Icons.person),
                  ),
                  onSaved: (value) => fullName = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Поле обязательно' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: LocaleKeys.phone.tr(),
                    icon: Icon(Icons.phone),
                  ),
                  onSaved: (value) => phoneNumber = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Поле обязательно' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: LocaleKeys.email.tr(), icon: Icon(Icons.mail)),
                  onSaved: (value) => email = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Поле обязательно' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: LocaleKeys.life.tr(), icon: Icon(Icons.book)),
                  onSaved: (value) => about = value,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: LocaleKeys.password.tr(),
                      icon: Icon(Icons.lock)),
                  obscureText: true,
                  onSaved: (value) => password = value,
                  controller: _passwordController,
                  validator: (value) =>
                      value!.isEmpty ? 'Поле обязательно' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: LocaleKeys.secondpass.tr(),
                      icon: Icon(Icons.lock)),
                  obscureText: true,
                  validator: (value) => value != _passwordController.text
                      ? 'Пароли не совпадают'
                      : null,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text(LocaleKeys.add.tr()),
                  onPressed: _submitForm,
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(Locale('kk'));
                  },
                  child: const Text('Казахский'),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(Locale('en'));
                  },
                  child: const Text('English'),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(Locale('ru'));
                  },
                  child: const Text('Русский'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
