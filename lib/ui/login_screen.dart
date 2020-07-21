import 'package:avtoservicelocator/bloc/common/bloc_provider.dart';
import 'package:avtoservicelocator/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _bloc;
  bool _isLoginButtonDisabled;
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
    _bloc.context = context;
    _isLoginButtonDisabled = true;
    _phoneNumberController.addListener(_onChangePhoneNumberField);
//    _phoneNumberController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
              colors: [Colors.redAccent, Colors.yellowAccent],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: SizedBox.shrink(),
                ),
                Flexible(
                  flex: 6,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Номер телефона',
                      hintText: 'Номер телефона',
                      prefixIcon: Icon(Icons.phone_android),
                      prefixText: '+7 ',
                    ),
                    controller: _phoneNumberController,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10)
                    ],
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: _submitCredential,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox.shrink(),
                ),
              ],
            ),
            SizedBox(height: 24.0),
            OutlineButton(
              borderSide: _isLoginButtonDisabled
                  ? BorderSide(color: Colors.black, width: 2.0)
                  : BorderSide(color: Colors.blue, width: 2.0),
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
              onPressed: _isLoginButtonDisabled ? null : _submitCredential,
              child: Text('Вход',
                  style: TextStyle(
                      color:
                          _isLoginButtonDisabled ? Colors.black54 : Colors.blue,
                      fontSize: 16.0,
                      fontWeight: _isLoginButtonDisabled
                          ? FontWeight.normal
                          : FontWeight.bold)),
            )
          ],
        )
      ],
    ));
  }

  void _submitCredential() {
    var phoneNumber = _phoneNumberController.text.toString();
    if (phoneNumber.length == 10) {
      _bloc.loginUser(phoneNumber: '+7$phoneNumber');
    }
  }

  void _onChangePhoneNumberField() {
    setState(() {
      if (_phoneNumberController.text.length == 10) {
        _isLoginButtonDisabled = false;
      } else {
        _isLoginButtonDisabled = true;
      }
    });
  }
}
