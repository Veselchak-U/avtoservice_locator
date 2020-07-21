import 'package:avtoservicelocator/bloc/common/bloc_provider.dart';
import 'package:avtoservicelocator/bloc/profile_bloc.dart';
import 'package:avtoservicelocator/model/car.dart';
import 'package:avtoservicelocator/model/user.dart';
import 'package:avtoservicelocator/model/extention/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileBloc _bloc;
  User _user;
  Car _carForDelete;
  int _carsItemsCount;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
    _bloc.context = context;
    _user = _bloc.currentUser;
    _carsItemsCount = _user.cars?.length ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      leading: Icon(
        Icons.account_box,
        size: 28,
        color: Colors.white,
      ),
      title: Text('Профиль'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: _onTapExitButton,
        ),
      ],
    );

    var userCard = InkWell(
        onTap: _showEditUserDialog,
        child: Container(
          height: 100,
          child: Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: _bloc.getUserAvatar(),
                    backgroundColor: Colors.white38,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _user.name == null || _user.name.isEmpty
                        ? 'Имя не заполнено'
                        : _user.name,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    _user.phoneNumber,
                    style: TextStyle(fontSize: 16),
                  )
                ],
              )
            ],
          ),
        ));

    var line = Container(
      height: 1,
      color: Colors.black38,
    );

    var eMail = InkWell(
        onTap: _showEditEmailDialog,
        child: Padding(
            padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
            child: ListTile(
              leading: Icon(Icons.alternate_email),
              title: Text(
                _user.eMail ?? 'E-mail не заполнен',
                style: TextStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
            )));

    var country = InkWell(
        onTap: _showEditCountryDialog,
        child: Padding(
            padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
            child: ListTile(
              leading: Icon(Icons.flag),
              title: Text(
                _user.country ?? 'Страна не выбрана',
                style: TextStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
            )));

    var region = InkWell(
        onTap: _showEditRegionDialog,
        child: Padding(
            padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
            child: ListTile(
              leading: Icon(Icons.memory),
              title: Text(
                _user.region ?? 'Регион не выбран',
                style: TextStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
            )));

    var city = InkWell(
        onTap: _showEditCityDialog,
        child: Padding(
            padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
            child: ListTile(
              leading: Icon(Icons.location_city),
              title: Text(
                _user.city ?? 'Город не выбран',
                style: TextStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
            )));

    var cars = InkWell(
        onTap: _showListCarsDialog,
        child: Padding(
            padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
            child: ListTile(
              leading: Icon(Icons.local_taxi),
              title: Text(
                _user.getUserCarsDescription() ?? 'Автомобиль не выбран',
                style: TextStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
            )));

    return Scaffold(
      appBar: appBar,
      body: ListView(
        children: <Widget>[userCard, line, eMail, country, region, city, cars],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        currentIndex: _bloc.bottomNavigationBarIndex,
        onTap: (int index) => _bloc.onTapBottomNavigationBar(index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        selectedIconTheme: IconThemeData(size: 28),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            title: Text('Заявки'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Поиск СТО'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text('Профиль'),
          ),
        ],
      );

  void _onTapExitButton() {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Выйти из текущего профиля?'),
//          content: Text('dialogBody'),
          actions: <Widget>[
            FlatButton(
              child: Text('НЕТ'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
            FlatButton(
              child: Text('ДА'),
              onPressed: () {
                _bloc.logoutUser();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditEmailDialog() {
    final TextEditingController _emailFieldController = TextEditingController();
    _emailFieldController.text = _user.eMail ?? '';

    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('E-mail'),
          content: TextFormField(
            controller: _emailFieldController,
            autofocus: true,
            enableInteractiveSelection: false,
            decoration: InputDecoration(
              hintText: 'user@mail.ru',
            ),
            autovalidate: true,
            validator: (String value) {
              return _bloc.isValidEmail(email: value)
                  ? null
                  : 'Неверный формат e-mail';
            },
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('ОК'),
              onPressed: () {
                var text = _emailFieldController.text.toString();
                if (_bloc.isValidEmail(email: text)) {
                  setState(() {
                    _user.eMail = text == '' ? null : text;
                  });
                  _bloc.saveProfile();
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditCountryDialog() {
    String oldResult = _user.country;
    String result = _user.country;

    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Страна'),
          content: DropdownButtonFormField<String>(
            hint: Text('Выберите страну'),
            value: result,
            elevation: 4,
            items: _bloc.listCountries
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(child: Text(value), value: value);
            }).toList(),
            onChanged: (String value) {
              result = value;
            },
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('ОК'),
              onPressed: () {
                if (result != oldResult) {
                  setState(() {
                    _user.country = result == '' ? null : result;
                    _user.region = null;
                    _user.city = null;
                  });
                  _bloc.saveProfile();
                  _bloc.updateAddressReferenceList();
                }
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditRegionDialog() {
    String oldResult = _user.region;
    String result = _user.region;

    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Регион'),
          content: DropdownButtonFormField<String>(
            hint: Text('Выберите регион'),
            value: result,
            elevation: 4,
            items: _bloc.listRegions == null
                ? null
                : _bloc.listRegions
                    .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        child: Text(value), value: value);
                  }).toList(),
            onChanged: (String value) {
              result = value;
            },
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('ОК'),
              onPressed: () {
                if (result != oldResult) {
                  setState(() {
                    _user.region = result == '' ? null : result;
                    _user.city = null;
                  });
                  _bloc.saveProfile();
                  _bloc.updateAddressReferenceList();
                }
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditCityDialog() {
    String oldResult = _user.city;
    String result = _user.city;

    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Город'),
          content: DropdownButtonFormField<String>(
            hint: Text('Выберите город'),
            value: result,
            elevation: 4,
            items: _bloc.mapCities == null
                ? null
                : _bloc.mapCities.keys
                    .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        child: Text(value), value: value);
                  }).toList(),
            onChanged: (String value) {
              result = value;
            },
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('ОК'),
              onPressed: () {
                if (result != oldResult) {
                  setState(() {
                    _user.city = result == '' ? null : result;
                    _user.location =
                        result == '' ? null : _bloc.mapCities[result];
                  });
                  _bloc.saveProfile();
                }
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }

  void _showListCarsDialog() {
    showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setDialogState) {
            var allCarsCount = _user.cars?.length ?? 0;
            return AlertDialog(
              title: Text(
                  'Автомобили${allCarsCount == 0 ? '' : ' ($allCarsCount)'}'),
              content: Container(
                  height: _carsItemsCount < 5 ? 75.00 * _carsItemsCount : 300,
                  width: 400,
                  child: Scrollbar(
                    child: ListView(
                      children:
                          _convertCarsToListItems(stateSetter: setDialogState),
                    ),
                  )),
              actions: <Widget>[
                FlatButton(
                  child: Text('ДОБАВИТЬ АВТО'),
                  onPressed: () {
                    _showAddOrEditCarsDialog(stateSetter: setDialogState);
                  },
                ),
                FlatButton(
                  child: Text('ОК'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
        });
  }

  List<Widget> _convertCarsToListItems({StateSetter stateSetter}) {
    List<Widget> result = [];
    if (_user.cars == null || _user.cars.isEmpty) {
      result.add(Text('Нет автомобилей'));
    } else {
      _user.cars.forEach((element) {
        result.add(InkWell(
          onTap: () {
            print('onTap:InkWell');
          },
          highlightColor: Colors.blue[100],
          splashColor: Colors.blue[200],
          child: ListTile(
            onTap: () {
              _showAddOrEditCarsDialog(stateSetter: stateSetter, car: element);
            },
            title: Text(element.getCarDescription()),
            subtitle: Text('Пробег: ${element.odometer} км'),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                size: 20,
              ),
              onPressed: () {
                _carForDelete = element;
                _showDeleteCarDialog(stateSetter: stateSetter);
              },
            ),
          ),
        ));
      });
    }
    return result;
  }

  void _showDeleteCarDialog({StateSetter stateSetter}) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Удалить авто?'),
          content: Text(_carForDelete.getCarDescription()),
          actions: <Widget>[
            FlatButton(
              child: Text('УДАЛИТЬ'),
              onPressed: () {
                _bloc.deleteCar(car: _carForDelete);
                // update dialog window
                stateSetter(() {
                  _carsItemsCount = _user.cars?.length ?? 1;
                });
                // update profile screen
                super.setState(() {});
                Navigator.of(dialogContext).pop();
              },
            ),
            FlatButton(
              child: Text('ОТМЕНА'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showAddOrEditCarsDialog({StateSetter stateSetter, Car car}) {
    String mark;
    String model;
    DateTime releaseDate;
    String vinCode;
    String stateNumber;
    int odometer;

    var releaseDateController = TextEditingController();
//    var vinCodeController = TextEditingController();
//    var stateNumberController = TextEditingController();
//    var odometerController = TextEditingController();

    var isEditMode = car != null;
    if (isEditMode) {
      mark = car.mark;
      model = car.model;
      releaseDate = car.releaseDate;
      vinCode = car.vinCode;
      stateNumber = car.stateNumber;
      odometer = car.odometer;
      _bloc.updateCarReferenceList(carMark: mark);
      releaseDateController.text = releaseDate.toStringForHuman();
    }

    final formKey = GlobalKey<FormState>();
    final releaseDateFocusNode = FocusNode();
    final vinCodeFocusNode = FocusNode();
    final stateNumberFocusNode = FocusNode();
    final odometerFocusNode = FocusNode();
    final addButtonFocusNode = FocusNode();
    final saveButtonFocusNode = FocusNode();

    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setDialogState) {
          return AlertDialog(
            title: isEditMode ? Text('Изменить авто:') : Text('Добавить авто:'),
            content: Container(
              height: 350,
//              width: 400,
              child: Form(
                key: formKey,
                autovalidate: true,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      DropdownButtonFormField<String>(
                        hint: Text('*Марка'),
                        value: mark,
                        elevation: 4,
                        isExpanded: true,
                        items: _bloc.listCarMarks
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              child: Text(value), value: value);
                        }).toList(),
                        onChanged: (String value) {
                          mark = value;
                          setDialogState(() {
                            model = null;
                          });
                          _bloc.updateCarReferenceList(carMark: value);
//                          FocusScope.of(context).requestFocus(modelFocusNode);
                        },
                        validator: (String value) {
                          if (mark == null) {
                            return 'Укажите марку авто';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      DropdownButtonFormField<String>(
                        hint: Text('*Модель'),
                        value: model,
                        elevation: 4,
                        isExpanded: true,
                        items: _bloc.listCarModels
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              child: Text(value), value: value);
                        }).toList(),
                        onChanged: (String value) {
                          model = value;
                          FocusScope.of(context)
                              .requestFocus(releaseDateFocusNode);
                        },
                        validator: (String value) {
                          if (model == null) {
                            return 'Укажите модель авто';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: '*Дата выпуска'),
                        readOnly: true,
                        controller: releaseDateController,
                        focusNode: releaseDateFocusNode,
                        onTap: () async {
                          var datePicker =
                              await DatePicker.showSimpleDatePicker(context,
                                  titleText: 'Укажите дату выпуска',
                                  confirmText: 'ОК',
                                  cancelText: 'Отмена',
                                  initialDate: releaseDate ?? DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime.now(),
                                  dateFormat: 'dd-MMMM-yyyy',
                                  locale: DateTimePickerLocale.ru,
                                  looping: true);
                          releaseDate = datePicker;
                          if (releaseDate != null) {
                            releaseDateController.text =
                                releaseDate.toStringForHuman();
                            FocusScope.of(context)
                                .requestFocus(odometerFocusNode);
                          }
                        },
                        validator: (String value) {
                          if (releaseDate == null) {
                            return 'Укажите дату выпуска';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: '*Пробег, км'),
                        initialValue: odometer?.toString(),
                        focusNode: odometerFocusNode,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(7)
                        ],
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (String value) {
                          FocusScope.of(context)
                              .requestFocus(stateNumberFocusNode);
                        },
                        validator: (String value) {
                          if (value.isNotEmpty && int.parse(value) > 0) {
                            odometer = int.parse(value);
                            return null;
                          } else {
                            return 'Укажите пробег';
                          }
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Гос. номер'),
                        initialValue: stateNumber,
                        focusNode: stateNumberFocusNode,
                        inputFormatters: [
                          WhitelistingTextInputFormatter(RegExp(r'\w+'))
                        ],
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (String value) {
                          FocusScope.of(context).requestFocus(vinCodeFocusNode);
                        },
                        validator: (String value) {
                          stateNumber = value;
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'VIN'),
                        initialValue: vinCode,
                        focusNode: vinCodeFocusNode,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (String value) {
                          if (isEditMode)
                            FocusScope.of(context)
                                .requestFocus(saveButtonFocusNode);
                          else
                            FocusScope.of(context)
                                .requestFocus(addButtonFocusNode);
                        },
                        validator: (String value) {
                          vinCode = value;
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              if (isEditMode)
                FlatButton(
                  child: Text('СОХРАНИТЬ'),
                  focusNode: saveButtonFocusNode,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      car.mark = mark;
                      car.model = model;
                      car.releaseDate = releaseDate;
                      car.vinCode = vinCode;
                      car.stateNumber = stateNumber;
                      car.odometer = odometer;
                      _bloc.saveProfile();
                      _bloc.listCarModels = [];
                      // update dialog window
                      stateSetter(() {
                        _carsItemsCount = _user.cars?.length ?? 1;
                      });
                      // update profile screen
                      super.setState(() {});
                      Navigator.of(dialogContext).pop();
                    }
                  },
                )
              else
                FlatButton(
                  child: Text('ДОБАВИТЬ'),
                  focusNode: addButtonFocusNode,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      _bloc.addCar(
                          mark: mark,
                          model: model,
                          releaseDate: releaseDate,
                          vinCode: vinCode,
                          stateNumber: stateNumber,
                          odometer: odometer);
                      _bloc.listCarModels = [];
                      // update dialog window
                      stateSetter(() {
                        _carsItemsCount = _user.cars?.length ?? 1;
                      });
                      // update profile screen
                      super.setState(() {});
                      Navigator.of(dialogContext).pop();
                    }
                  },
                ),
              FlatButton(
                child: Text('ОТМЕНА'),
                onPressed: () {
                  _bloc.listCarModels = [];
                  Navigator.of(dialogContext).pop();
                },
              ),
            ],
          );
        });
      },
    );
  }

  void _showEditUserDialog() async {
    final formKey = GlobalKey<FormState>();
//    final nameFocusNode = FocusNode();
    final phoneFocusNode = FocusNode();
    final okButtonFocusNode = FocusNode();

    var result = await showDialog<String>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setDialogState) {
            return AlertDialog(
              title: Text('Пользователь:'),
              content:
                  /*Container(
                  height: 300,
                  width: 400,
                  child:*/
                  Form(
                      key: formKey,
                      autovalidate: true,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 75,
                                  backgroundImage: _bloc.getUserAvatar(),
                                  backgroundColor: Colors.white38,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.add_a_photo,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      _bloc.getNewUserAvatar().then((result) {
                                        if (result) {
                                          setDialogState(() {});
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Имя'),
                              initialValue: _user.name,
//                              focusNode: nameFocusNode,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (String value) {
                                FocusScope.of(context)
                                    .requestFocus(phoneFocusNode);
                              },
                              validator: (String value) {
                                _user.name = value;
                                return null;
                              },
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: '*Телефон'),
                              initialValue: _user.phoneNumber.substring(2),
                              focusNode: phoneFocusNode,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10)
                              ],
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (String value) {
                                FocusScope.of(context)
                                    .requestFocus(okButtonFocusNode);
                              },
                              validator: (String value) {
                                // patching bag of LengthLimitingTextInputFormatter(10)
                                if (value.length > 10) {
                                  value = value.substring(0, 10);
                                }
                                if (value.isNotEmpty && value.length == 10) {
                                  _user.phoneNumber = '+7$value';
                                  return null;
                                } else {
                                  return 'Введите 10 цифр';
                                }
                              },
                            ),
                          ],
                        ),
                      )),
              actions: <Widget>[
                FlatButton(
                  child: Text('ОК'),
                  focusNode: okButtonFocusNode,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      _bloc.saveProfile();
                      // update profile screen
                      super.setState(() {});
                      Navigator.of(context).pop('OK');
                    }
                  },
                ),
              ],
            );
          });
        });

    if (result != null && result == 'OK') {
      print('Выход по OK');
    } else {
      print('Выход по другому');
      _bloc.rollbackUserProfileChanges();
    }
  }
}
