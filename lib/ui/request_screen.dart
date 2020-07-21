import 'package:avtoservicelocator/bloc/common/bloc_provider.dart';
import 'package:avtoservicelocator/bloc/request_bloc.dart';
import 'package:avtoservicelocator/model/car.dart';
import 'package:avtoservicelocator/model/request_item.dart';
import 'package:avtoservicelocator/ui/request_screen_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:avtoservicelocator/model/extention/datetime_extension.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';

class RequestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  RequestBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
    _bloc.context = context;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.receipt,
            size: 28,
            color: Colors.white,
          ),
          title: Text('Заявки'),
          actions: <Widget>[
            PopupMenuButton<SelectedFilterMenu>(
              icon: Icon(Icons.sort),
              onSelected: (SelectedFilterMenu result) {
                _bloc.onSelectedFilterMenu(result);
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<SelectedFilterMenu>>[
                  PopupMenuItem<SelectedFilterMenu>(
                    value: SelectedFilterMenu.ACTIVE,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text('Активные')),
                        if (_bloc.selectedFilterMenu ==
                            SelectedFilterMenu.ACTIVE)
                          Icon(
                            Icons.done,
                            color: Colors.black54,
                          )
                        else
                          SizedBox.shrink(),
                      ],
                    ),
                  ),
                  PopupMenuItem<SelectedFilterMenu>(
                    value: SelectedFilterMenu.ALL,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text('Все заявки')),
                        if (_bloc.selectedFilterMenu == SelectedFilterMenu.ALL)
                          Icon(
                            Icons.done,
                            color: Colors.black54,
                          )
                        else
                          SizedBox.shrink(),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
        body: StreamBuilder(
          stream: _bloc.outRequestItems,
          builder: (BuildContext context,
              AsyncSnapshot<List<RequestItem>> snapshot) {
            if (snapshot.data == null || snapshot.data.isEmpty) {
              return Center(
                  child: Text(
                'Заявок нет',
                style: TextStyle(fontSize: 20, color: Colors.black38),
              ));
            } else {
              return ListView.separated(
                  padding: EdgeInsets.all(0),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) =>
                      RequestScreenItem(snapshot.data[index], _bloc),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                        thickness: 5,
                        color: Colors.black12,
                      ));
            }
          },
        ),
        bottomNavigationBar: _bottomNavigationBar(),
        floatingActionButton: FloatingActionButton(
            onPressed: _bloc.isPossibleAddRequest()
                ? _showAddRequestDialog
                : _showErrorDialog,
            child: Icon(
              Icons.add,
              size: 30,
            )),
      );

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

  void _showErrorDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Сообщение:'),
          content: Text('Сначала добавьте автомобиль в профиле пользователя.'),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showAddRequestDialog() async {
    Car car;
    String description;
    DateTime dateRepair;
    bool signYourParts = false;
    bool signNeedEvacuation = false;

    final formKey = GlobalKey<FormState>();
    final descriptionFocusNode = FocusNode();
    final dateRepairFocusNode = FocusNode();
    final okButtonFocusNode = FocusNode();
    final dateRepairController = TextEditingController();

    var result = await showDialog<String>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setDialogState) {
            return AlertDialog(
              title: Text('Заявка на ремонт:'),
              content: Container(
                width: 400,
                child: Form(
                    key: formKey,
                    autovalidate: true,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          DropdownButtonFormField<Car>(
                            hint: Text('*Автомобиль'),
                            elevation: 4,
                            isExpanded: true,
                            items: _bloc.currentUser.cars
                                .map<DropdownMenuItem<Car>>((Car value) {
                              return DropdownMenuItem<Car>(
                                  child: Text(value.getCarDescription()),
                                  value: value);
                            }).toList(),
                            onChanged: (Car value) {
                              car = value;
                            },
                            validator: (Car value) {
                              if (value == null) {
                                return 'Выберите авто';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: '*Описание заявки'),
                            minLines: 3,
                            maxLines: 5,
                            focusNode: descriptionFocusNode,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (String value) {
                              FocusScope.of(context)
                                  .requestFocus(dateRepairFocusNode);
                            },
                            validator: (String value) {
                              if (value == null || value.isEmpty) {
                                return 'Введите описание ремонта';
                              }
                              description = value;
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Желаемая дата ремонта'),
                            readOnly: true,
                            controller: dateRepairController,
                            focusNode: dateRepairFocusNode,
                            onTap: () async {
                              var datePicker =
                                  await DatePicker.showSimpleDatePicker(context,
                                      titleText: 'Укажите дату выпуска',
                                      confirmText: 'ОК',
                                      cancelText: 'Отмена',
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.now()
                                          .add(Duration(days: 30)),
                                      dateFormat: 'dd-MMMM-yyyy',
                                      locale: DateTimePickerLocale.ru,
                                      looping: true);
                              dateRepair = datePicker;
                              if (dateRepair != null) {
                                dateRepairController.text =
                                    dateRepair.toStringForHuman();
                                FocusScope.of(context)
                                    .requestFocus(okButtonFocusNode);
                              }
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 24, 0, 8),
                            child: Row(
                              children: <Widget>[
                                Expanded(child: Text('Свои запчасти')),
                                Switch(
                                  value: signYourParts,
                                  onChanged: (bool value) {
                                    setDialogState(() {
                                      signYourParts = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                            child: Row(
                              children: <Widget>[
                                Expanded(child: Text('Требуется эвакуатор')),
                                Switch(
                                  value: signNeedEvacuation,
                                  onChanged: (bool value) {
                                    setDialogState(() {
                                      signNeedEvacuation = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('СОЗДАТЬ'),
                  focusNode: okButtonFocusNode,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      _bloc.addRequest(
                          car: car,
                          description: description,
                          dateRepair: dateRepair,
                          signYourParts: signYourParts,
                          signNeedEvacuation: signNeedEvacuation);
                      // update profile screen
//                      super.setState(() {});
                      Navigator.of(context).pop('OK');
                    }
                  },
                ),
                FlatButton(
                  child: Text('ОТМЕНА'),
                  focusNode: okButtonFocusNode,
                  onPressed: () {
                    Navigator.of(context).pop();
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
//      _bloc.rollbackUserProfileChanges();
    }
  }
}
