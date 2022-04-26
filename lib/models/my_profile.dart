import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:projectscoid/models/my_profile_base.dart';
import 'package:projectscoid/core/components/utility/tool/expand_space_bar.dart';
import 'dart:async';
import 'meta.dart';
import 'photo.dart';
import 'button.dart';
import 'dart:io';
import 'package:photo_view/photo_view.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:projectscoid/views/components/uploadprovider.dart';
import 'package:path/path.dart' as p;
import 'package:image/image.dart' as img;
import 'package:projectscoid/views/route.dart' as rt;
import 'package:projectscoid/app/projectscoid.dart';
import 'package:projectscoid/models/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
part 'my_profile.g.dart';
/** AUTOGENERATE OFF **/

class EditProfileMyProfileModel extends EditProfileMyProfileBase {
  Map<String, dynamic> json;
  EditProfileMyProfileModel(Map<String, dynamic> this.json) : super(json);

  @override
  Widget editCountry(State state) {
    return (ModelLocalWidget(
      value: model!.model!.country_id,
      caption: 'Country',
      hint: 'pilih Model',
      required: false,
      idenum: model!.model!.country_list,
      nameenum: model!.model!.country_list_str,
      idLocalType: 0,
      getValue: (Local? val) {
        state.setState(() {
          model!.model!.country_id = val!.id;
          val!.listId.isEmpty
              ? model!.model!.provinsi_id = 0
              : model!.model!.provinsi_id = val!.listId[1];
          model!.model!.provinsi_list.clear();
          model!.model!.provinsi_list.addAll(val!.listId);
          model!.model!.provinsi_list_str.clear();
          model!.model!.provinsi_list_str.addAll(val!.listStr);

          val!.listId1.isEmpty
              ? model!.model!.kabupaten_id = 0
              : model!.model!.kabupaten_id = val!.listId1[1];
          model!.model!.kabupaten_list.clear();
          model!.model!.kabupaten_list.addAll(val!.listId1);
          model!.model!.kabupaten_list_str.clear();
          model!.model!.kabupaten_list_str.addAll(val!.listStr1);

          val!.listId2.isEmpty
              ? model!.model!.kecamatan_id = 0
              : model!.model!.kecamatan_id = val!.listId2[1] ?? 0;
          model!.model!.kecamatan_list.clear();
          model!.model!.kecamatan_list.addAll(val!.listId2);
          model!.model!.kecamatan_list_str.clear();
          model!.model!.kecamatan_list_str.addAll(val!.listStr2);

          model!.model!.kelurahan_id = 0;
          model!.model!.kelurahan_list.clear();
          model!.model!.kelurahan_list.addAll(val!.listId3);
          model!.model!.kelurahan_list_str.clear();
          model!.model!.kelurahan_list_str.addAll(val!.listStr3);
        });
      },
    ));
  }

  @override
  Widget editProvinsi(State state) {
    return (ModelLocalWidget(
      value: model!.model!.provinsi_id,
      caption: 'Provinsi',
      hint: 'pilih Model',
      required: false,
      idenum: model!.model!.provinsi_list,
      nameenum: model!.model!.provinsi_list_str,
      idLocalType: 1,
      getValue: (Local? val) {
        state.setState(() {
          model!.model!.provinsi_id = val!.id;

          model!.model!.kabupaten_id = val!.listId[1];
          model!.model!.kabupaten_list.clear();
          model!.model!.kabupaten_list.addAll(val!.listId);
          model!.model!.kabupaten_list_str.clear();
          model!.model!.kabupaten_list_str.addAll(val!.listStr);

          model!.model!.kecamatan_id = val!.listId1[1];
          model!.model!.kecamatan_list.clear();
          model!.model!.kecamatan_list.addAll(val!.listId1);
          model!.model!.kecamatan_list_str.clear();
          model!.model!.kecamatan_list_str.addAll(val!.listStr1);

          model!.model!.kelurahan_id = 0;
          model!.model!.kelurahan_list.clear();
          model!.model!.kelurahan_list.addAll(val!.listId2);
          model!.model!.kelurahan_list_str.clear();
          model!.model!.kelurahan_list_str.addAll(val!.listStr2);
        });
      },
    ));
  }

  @override
  Widget editKabupaten(State state) {
    return (ModelLocalWidget(
      value: model!.model!.kabupaten_id,
      caption: 'Kabupaten',
      hint: 'pilih Model',
      required: false,
      idenum: model!.model!.kabupaten_list,
      nameenum: model!.model!.kabupaten_list_str,
      idLocalType: 2,
      getValue: (Local? val) {
        state.setState(() {
          model!.model!.kabupaten_id = val!.id;

          model!.model!.kecamatan_id = val!.listId[1];
          model!.model!.kecamatan_list.clear();
          model!.model!.kecamatan_list.addAll(val!.listId);
          model!.model!.kecamatan_list_str.clear();
          model!.model!.kecamatan_list_str.addAll(val!.listStr);

          model!.model!.kelurahan_id = 0;
          model!.model!.kelurahan_list.clear();
          model!.model!.kelurahan_list.addAll(val!.listId1);
          model!.model!.kelurahan_list_str.clear();
          model!.model!.kelurahan_list_str.addAll(val!.listStr1);
        });
      },
    ));
  }

  @override
  Widget editKecamatan(State state) {
    return (ModelLocalWidget(
      value: model!.model!.kecamatan_id,
      caption: 'Kecamatan',
      hint: 'pilih Model',
      required: false,
      idenum: model!.model!.kecamatan_list,
      nameenum: model!.model!.kecamatan_list_str,
      idLocalType: 3,
      getValue: (Local? val) {
        state.setState(() {
          model!.model!.kecamatan_id = val!.id;
          model!.model!.kelurahan_id = 0;
          model!.model!.kelurahan_list.clear();
          model!.model!.kelurahan_list.addAll(val!.listId);
          model!.model!.kelurahan_list_str.clear();
          model!.model!.kelurahan_list_str.addAll(val!.listStr);
        });
      },
    ));
  }

  @override
  Widget editKelurahan(State state) {
    return (ModelLocalWidget(
      value: model!.model!.kelurahan_id,
      caption: 'Kelurahan',
      hint: 'pilih Model',
      required: false,
      idenum: model!.model!.kelurahan_list,
      nameenum: model!.model!.kelurahan_list_str,
      idLocalType: 4,
      getValue: (Local? val) {
        state.setState(() {
          model!.model!.kelurahan_id = val!.id;
        });
      },
    ));
  }
}

class ChangePasswordMyProfileModel extends ChangePasswordMyProfileBase {
  Map<String, dynamic> json;
  ChangePasswordMyProfileModel(Map<String, dynamic> this.json) : super(json);
  @override
  Widget injectAction(
      BuildContext context,
      bool? visible,
      var formKey,
      ScrollController controller,
      MyProfileController my_profile,
      var postChangeEmailResult,
      State state,
      String? sendPath,
      String? id,
      String? title,
      bool? isLoading) {
    bool darkMode = false;
    final themeManager = Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark
        ? darkMode = true
        : darkMode = false;
    model!.model!.password_confirmation = confirmPassword;
    return (SingleChildScrollView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        reverse: false,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CategoryWidget(
              isDark: darkMode,
              title: 'Change Password',
              subtitle: 'Mengganti nomer password anda.',
              children: <Widget>[
                ItemListString(
                  // icon: Icons.arrow_forward_ios,
                  isDark: darkMode,
                  tooltip: 'Name',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditDisplayName(model: model!.model!.user_name)),
                    );
                  },
                  lines: <String>[
                    'User Name',
                    '${model!.model!.user_name}',
                  ],
                ),
                PasswordWidgetEx(
                    value: model!.model!.old_password,
                    value1: confirmOldPassword,
                    caption: 'Old Password',
                    hint: '',
                    required: true,
                    getValue: (String? val) {
                      state.setState(() {
                        model!.model!.old_password = val!;
                      });
                    },
                    getValue1: (String? val) {
                      state.setState(() {
                        model!.model!.old_password_confirmation = val!;
                        //confirmOldPassword = val!;
                      });
                    }),
                PasswordWidgetEx1(
                    value: model!.model!.password,
                    value1: confirmPassword,
                    caption: 'New Password',
                    hint: '',
                    required: true,
                    getValue: (String? val) {
                      state.setState(() {
                        model!.model!.password = val!;
                      });
                    },
                    getValue1: (String? val) {
                      state.setState(() {
                        // model!.model!.password_confirmation = val!;
                        confirmPassword = val!;
                      });
                    }),
                RButtonActionMyProfileWidget(
                    model!.buttons[0],
                    context,
                    formKey,
                    controller,
                    my_profile,
                    postChangeEmailResult,
                    state,
                    sendPath,
                    id,
                    title)
              ]),
        ])));
  }
}

class ChangeEmailMyProfileModel extends ChangeEmailMyProfileBase {
  String? verData = '';
  Map<String, dynamic> json;
  ChangeEmailMyProfileModel(Map<String, dynamic> this.json) : super(json);

  @override
  Widget injectAction(
      BuildContext context,
      bool? visible,
      var formKey,
      ScrollController controller,
      MyProfileController my_profile,
      var postChangeEmailResult,
      State state,
      String? sendPath,
      String? id,
      String? title,
      bool? isLoading) {
    bool darkMode = false;
    final themeManager = Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark
        ? darkMode = true
        : darkMode = false;

    return (SingleChildScrollView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        reverse: false,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CategoryWidget(
              isDark: darkMode,
              title: 'Change email',
              subtitle: 'Mengganti email anda.',
              children: <Widget>[
                ItemListString(
                  // icon: Icons.arrow_forward_ios,
                  isDark: darkMode,
                  tooltip: 'Name',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditDisplayName(model: model!.model!.user_name)),
                    );
                  },
                  lines: <String>[
                    'User Name',
                    '${model!.model!.user_name}',
                  ],
                ),
                EmailWidget(
                  value: model!.model!.new_email,
                  caption: 'New Email',
                  hint: 'Isi dengan Email Anda',
                  required: true,
                  getValue: (String? val) {
                    state.setState(() {
                      model!.model!.new_email = val!;
                    });
                  },
                ),
                SecureWidget(
                  value: model!.model!.secure_code,
                  caption: 'SecureCode',
                  hint: 'Isi dengan secure code Anda',
                  required: true,
                  isEmail: true,
                  verified: verData,
                  getValue: (String? val) {
                    state.setState(() {
                      model!.model!.secure_code = val!;
                    });
                  },
                  getVerified: (String? val) {
                    state.setState(() {
                      verData = val!;
                    });
                  },
                ),
                RButtonActionMyProfileWidget(
                    model!.buttons[0],
                    context,
                    formKey,
                    controller,
                    my_profile,
                    postChangeEmailResult,
                    state,
                    sendPath,
                    id,
                    title)
              ]),
        ])));
  }

  Widget editSecureCode(State state) {
    return (SecureWidget(
      value: model!.model!.secure_code,
      caption: 'SecureCode',
      hint: 'Isi dengan secure code Anda',
      required: true,
      isEmail: false,
      verified: verData,
      getValue: (String? val) {
        state.setState(() {
          model!.model!.new_email = val!;
        });
      },
      getVerified: (String? val) {
        state.setState(() {
          verData = val!;
        });
      },
    ));
  }
}

/*
 SecureWidget(
            value: test,
            caption: 'SecureCode',
            hint: '',
            verified: verData,
            isEmail: true,
            required: true,
            getValue:(String?val) {
              setState(() {
                test = val!;
              });
            },
            getVerified:(String?val) {
              setState(() {
                verData = val!;
              });
            },
          ),
 */

class ChangeHandphoneMyProfileModel extends ChangeHandphoneMyProfileBase {
  String? verData = '';
  Map<String, dynamic> json;
  ChangeHandphoneMyProfileModel(Map<String, dynamic> this.json) : super(json);
  @override
  Widget injectAction(
      BuildContext context,
      bool? visible,
      var formKey,
      ScrollController controller,
      MyProfileController my_profile,
      var postChangeHandphoneResult,
      State state,
      String? sendPath,
      String? id,
      String? title,
      bool? isLoading) {
    bool darkMode = false;
    final themeManager = Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark
        ? darkMode = true
        : darkMode = false;

    return (SingleChildScrollView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        reverse: false,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CategoryWidget(
              isDark: darkMode,
              title: 'Change Handphone',
              subtitle: 'Mengganti nomer telpon anda.',
              children: <Widget>[
                ItemListString(
                  // icon: Icons.arrow_forward_ios,
                  isDark: darkMode,
                  tooltip: 'Name',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditDisplayName(model: model!.model!.user_name)),
                    );
                  },
                  lines: <String>[
                    'User Name',
                    '${model!.model!.user_name}',
                  ],
                ),
                HandphoneWidget(
                  value: model!.model!.handphone,
                  caption: 'Handphone',
                  hint: 'Isi dengan Handphone Anda',
                  required: true,
                  getValue: (String? val) {
                    state.setState(() {
                      model!.model!.handphone = val!;
                    });
                  },
                ),
                SecureWidget(
                  value: model!.model!.secure_code,
                  caption: 'SecureCode',
                  hint: 'Isi dengan secure code Anda',
                  required: true,
                  isEmail: false,
                  verified: verData,
                  getValue: (String? val) {
                    state.setState(() {
                      model!.model!.secure_code = val!;
                    });
                  },
                  getVerified: (String? val) {
                    state.setState(() {
                      verData = val!;
                    });
                  },
                ),
                RButtonActionMyProfileWidget(
                    model!.buttons[0],
                    context,
                    formKey,
                    controller,
                    my_profile,
                    postChangeHandphoneResult,
                    state,
                    sendPath,
                    id,
                    title)
              ]),
        ])));
  }

  @override
  Widget editSecureCode(State state) {
    return (SecureWidget(
      value: model!.model!.secure_code,
      caption: 'SecureCode',
      hint: 'Isi dengan secure code Anda',
      required: true,
      isEmail: true,
      verified: verData,
      getValue: (String? val) {
        state.setState(() {
          model!.model!.handphone = val!;
        });
      },
      getVerified: (String? val) {
        state.setState(() {
          verData = val!;
        });
      },
    ));
  }
}

class MyProfileModel extends MyProfileBase {
  Map<String, dynamic> json;
  MyProfileModel(Map<String, dynamic> this.json) : super(json);
}

class _ContactCategory extends StatelessWidget {
  const _ContactCategory({Key? key, this.title, this.subtitle, this.children})
      : super(key: key);

  final String? title;
  final String? subtitle;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: themeData.dividerColor))),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.headline5!,
        child: SafeArea(
          top: false,
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  //width: 72.0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title!,
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle == ''
                            ? Container(
                                height: 0.0,
                                width: 0.0,
                              )
                            : Text(subtitle!, style: TextStyle(fontSize: 14)),
                      ])),
              Column(children: children!),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  _ContactItem({Key? key, this.icon, this.lines, this.tooltip, this.onPressed})
      : assert(lines!.length! > 1),
        super(key: key);

  final IconData? icon;
  final List<String?>? lines;
  final String? tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return MergeSemantics(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(lines!.first!,
                        style: TextStyle(
                            fontSize: 12,
                            color: CurrentTheme.DisableTextColor)),
                    Padding(
                      padding: EdgeInsets.only(top: 6.0),
                      child: Text(lines!.last!),
                    )
                  ],
                ),
              ),
              icon != null
                  ? SizedBox(
                      width: 35.0,
                      child: IconButton(
                        icon: Icon(icon),
                        color: Colors.black26,
                        onPressed: onPressed,
                      ),
                    )
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    )
            ],
          ),
          Divider(color: Colors.black)
        ]),
      ),
    );
  }
}

class _SkillItem extends StatelessWidget {
  const _SkillItem(
      {Key? key,
      this.icon,
      this.lines,
      this.tooltip,
      this.onPressed,
      this.wgt,
      this.isDark})
      : super(key: key);

  final IconData? icon;
  final String? lines;
  final String? tooltip;
  final VoidCallback? onPressed;
  final Widget? wgt;
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return MergeSemantics(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(lines!,
                        style: TextStyle(
                            fontSize: 12,
                            color: CurrentTheme.DisableTextColor)),
                    wgt!,
                  ],
                ),
              ),
              icon != null
                  ? SizedBox(
                      width: 35.0,
                      child: IconButton(
                        icon: Icon(icon),
                        color: isDark! ? Colors.white : Colors.black26,
                        onPressed: onPressed,
                      ),
                    )
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    ),
            ],
          ),
          //  Divider(
          //      color: Colors.black
          //  )
        ]),
      ),
    );
  }
}

class UserDetail extends StatelessWidget {
  const UserDetail(
      {Key? key, this.icon, this.lines, this.tooltip, this.onPressed})
      : super(key: key);

  final IconData? icon;
  final String? lines;
  final String? tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    TextStyle readTextStyle = TextStyle(
      color: Colors.blue,
      fontSize: 18.0,
    );

    final ThemeData themeData = Theme.of(context);
    return MergeSemantics(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Divider(color: Colors.black),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: InkWell(
                      onTap: onPressed,
                      child: Text(
                        lines!,
                        textAlign: TextAlign.start,
                        style: readTextStyle,
                      ),
                    ))
                  ])
            ]),
      ),
    );
  }
}

class _ContactPhoto extends StatelessWidget {
  const _ContactPhoto(
      {Key? key,
      this.icon,
      this.lines,
      this.tooltip,
      this.photo,
      this.onPressed,
      this.isDark})
      : super(key: key);

  final IconData? icon;
  final List<String?>? lines;
  final String? tooltip;
  final String? photo;
  final VoidCallback? onPressed;
  final bool? isDark;

  Widget _buildBottomNavigationBar() {
    return Container(
      color: Colors.black54,
      height: 30.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            iconSize: 17.0,
            padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.camera_alt,

              // size: 80.0,
              color: Colors.white,
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context, String? photo) {
    return Center(
        child: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
                width: 5.0,
              ),
              borderRadius: BorderRadius.circular(80),
            ),
            child: InkWell(
                onTap: onPressed,
                // return BidItemInfo(info : this.info);

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Stack(children: <Widget>[
                    Image.network(
                      photo!,
                      fit: BoxFit.contain,
                      height: 70.0,
                      width: 70.0,
                    ),
                    Positioned.fill(
                      top: 47,
                      left: 0.0,
                      right: 0.0,
                      child: _buildBottomNavigationBar(),
                    )
                  ]),
                ))));
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return MergeSemantics(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(lines!.first!,
                        style: TextStyle(
                            fontSize: 12,
                            color: CurrentTheme.DisableTextColor)),
                    Padding(
                      padding: EdgeInsets.only(top: 6.0),
                      child: Text(lines!.last!,
                          style: TextStyle(
                              fontSize: 14,
                              color: isDark! ? Colors.white : Colors.black)),
                    )
                  ],
                ),
              ),
              icon != null
                  ? _buildProfileImage(context, this.photo)
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    ),
              /*
                    SizedBox(
                      width: 35.0,
                      child: IconButton(
                        icon: Icon(icon),
                        color: Colors.black26,
                        onPressed: onPressed,
                      ),
                    ),

                     */
            ],
          ),
          Divider(color: Colors.black)
        ]),
      ),
    );
  }
}

@JsonSerializable()
class ViewModelMyProfileRev {
  int? age;
  int? cnt;
  int? page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  String? user_name;
  String? email;
  String? password;
  String? photo_url;
  Photo? photo;
  String? display_name;
  DateTime? birth_date;
  int? jenis_kelamin_id;
  String? jenis_kelamin_str;
  List<int?>? jenis_kelamin_list;
  List<String?>? jenis_kelamin_list_str;
  String? address;
  int? country_id;
  String? country_str;
  String? country_url;
  List<int?>? country_list;
  List<String?>? country_list_str;
  int? provinsi_id;
  String? provinsi_str;
  String? provinsi_url;
  List<int?>? provinsi_list;
  List<String?>? provinsi_list_str;
  int? kabupaten_id;
  String? kabupaten_str;
  String? kabupaten_url;
  List<int?>? kabupaten_list;
  List<String?>? kabupaten_list_str;
  int? kecamatan_id;
  String? kecamatan_str;
  String? kecamatan_url;
  List<int?>? kecamatan_list;
  List<String?>? kecamatan_list_str;
  int? kelurahan_id;
  String? kelurahan_str;
  String? kelurahan_url;
  List<int?>? kelurahan_list;
  List<String?>? kelurahan_list_str;
  String? post_code;
  String? handphone;
  String? self_introduction;
  String? website;
  int? language_id;
  String? language_str;
  String? language_url;
  List<int?>? language_list;
  List<String?>? language_list_str;
  bool? notify_projects;
  List<int?>? skills_id;
  List<String?>? skills_str;
  List<String?>? skills_url;
  String? user_id;

  ViewModelMyProfileRev(
    this.id,
    this.user_name,
    this.email,
    this.password,
    this.photo,
    this.photo_url,
    this.display_name,
    this.birth_date,
    this.jenis_kelamin_id,
    this.jenis_kelamin_str,
    this.jenis_kelamin_list,
    this.jenis_kelamin_list_str,
    this.address,
    this.country_id,
    this.country_str,
    this.country_url,
    this.country_list,
    this.country_list_str,
    this.provinsi_id,
    this.provinsi_str,
    this.provinsi_url,
    this.provinsi_list,
    this.provinsi_list_str,
    this.kabupaten_id,
    this.kabupaten_str,
    this.kabupaten_url,
    this.kabupaten_list,
    this.kabupaten_list_str,
    this.kecamatan_id,
    this.kecamatan_str,
    this.kecamatan_url,
    this.kecamatan_list,
    this.kecamatan_list_str,
    this.kelurahan_id,
    this.kelurahan_str,
    this.kelurahan_url,
    this.kelurahan_list,
    this.kelurahan_list_str,
    this.post_code,
    this.handphone,
    this.self_introduction,
    this.website,
    this.language_id,
    this.language_str,
    this.language_url,
    this.language_list,
    this.language_list_str,
    this.notify_projects,
    this.skills_id,
    this.skills_str,
    this.skills_url,
    this.user_id,
  );

  factory ViewModelMyProfileRev.fromJson(Map<String, dynamic> json) =>
      _$ViewModelMyProfileRevFromJson(json);
}
/*
ViewModelMyProfileRev _$ViewModelMyProfileRevFromJson(Map<String, dynamic> json) {
  return ViewModelMyProfileRev(
      json['id'] as String,
      json['user_name'] as String,
      json['email'] as String,
      json['password'] as String,
      json['photo'] == null
          ? null
          : Photo.fromJson(json['photo'] as Map<String, dynamic>),
      json['photo_url'] as String,
      json['display_name'] as String,
      json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      json['jenis_kelamin_id'] as int,
      json['jenis_kelamin_str'] as String,
      (json['jenis_kelamin_list'] as List)?.map((e) => e as int)?.toList(),
      (json['jenis_kelamin_list_str'] as List)
          ?.map((e) => e as String)
          ?.toList(),
      json['address'] as String,
      json['country_id'] as int,
      json['country_str'] as String,
      json['country_url'] as String,
      (json['country_list'] as List)?.map((e) => e as int)?.toList(),
      (json['country_list_str'] as List)?.map((e) => e as String)?.toList(),
      json['provinsi_id'] as int,
      json['provinsi_str'] as String,
      json['provinsi_url'] as String,
      (json['provinsi_list'] as List)?.map((e) => e as int)?.toList(),
      (json['provinsi_list_str'] as List)?.map((e) => e as String)?.toList(),
      json['kabupaten_id'] as int,
      json['kabupaten_str'] as String,
      json['kabupaten_url'] as String,
      (json['kabupaten_list'] as List)?.map((e) => e as int)?.toList(),
      (json['kabupaten_list_str'] as List)?.map((e) => e as String)?.toList(),
      json['kecamatan_id'] as int,
      json['kecamatan_str'] as String,
      json['kecamatan_url'] as String,
      (json['kecamatan_list'] as List)?.map((e) => e as int)?.toList(),
      (json['kecamatan_list_str'] as List)?.map((e) => e as String)?.toList(),
      json['kelurahan_id'] as int,
      json['kelurahan_str'] as String,
      json['kelurahan_url'] as String,
      (json['kelurahan_list'] as List)?.map((e) => e as int)?.toList(),
      (json['kelurahan_list_str'] as List)?.map((e) => e as String)?.toList(),
      json['post_code'] as String,
      json['handphone'] as String,
      json['self_introduction'] as String,
      json['website'] as String,
      json['language_id'] as int,
      json['language_str'] as String,
      json['language_url'] as String,
      (json['language_list'] as List)?.map((e) => e as int)?.toList(),
      (json['language_list_str'] as List)?.map((e) => e as String)?.toList(),
      json['notify_projects'] as bool,
      (json['skills_id'] as List)?.map((e) => e as int)?.toList(),
      (json['skills_str'] as List)?.map((e) => e as String)?.toList(),
      (json['skills_url'] as List)?.map((e) => e as String)?.toList(),
      (json['user_id'] as String))
    ..age = json['age'] as int
    ..cnt = json['cnt'] as int
    ..page = json['page'] as int
    ..ttl = json['ttl'] as String
    ..pht = json['pht'] as String
    ..sbttl = json['sbttl'] as String;
}

 */

@JsonSerializable()
class MyProfileViewSuperBaseRev {
  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelMyProfileRev? model;
  MyProfileViewSuperBaseRev(
    this.id,
    this.buttons,
    this.meta,
    this.model,
  );

  factory MyProfileViewSuperBaseRev.fromJson(Map<String, dynamic> json) =>
      _$MyProfileViewSuperBaseRevFromJson(json);
}
/*

MyProfileViewSuperBaseRev _$MyProfileViewSuperBaseRevFromJson(
    Map<String, dynamic> json) {
  return MyProfileViewSuperBaseRev(
      json['id'] as String,
      (json['buttons'] as List)
          ?.map((e) =>
      e == null ? null : Button.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['model'] == null
          ? null
          : ViewModelMyProfileRev.fromJson(json['model'] as Map<String, dynamic>));
}

 */

class MyProfileViewModel extends MyProfileViewBase {
  // static const String? _BASE_URL1= 'https://upload.projects.co.id';
//  String? _UPLOAD_URL1 = '';
  bool progresscircular = false;
  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  bool isLoading = true;
  String? link = '';
  Photo? foto;
  DIOProvider? provider;
  Map<String, dynamic> json;
  final double _appBarHeight = 280.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
  // MyProfileViewModel(Map<String, dynamic> this.json):super(json);
  MyProfileViewModel(Map<String, dynamic> this.json) : super(json) {
    model = MyProfileViewSuperBaseRev.fromJson(this.json);
  }

  @override
  Widget body(BuildContext context, ScrollController controller, bool? account,
      GlobalKey<ScaffoldState> ss, State state) {
    var dateformat = DateFormat('dd/MM/yyyy');
    bool darkMode = false;
    final themeManager = Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark
        ? darkMode = true
        : darkMode = false;
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return (DefaultTabController(
        length: 5,
        child: NestedScrollView(
          controller: controller,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Text(
                  'Profile',
                  style: TextStyle(color: CurrentTheme.DisableTextColor),
                ),

                centerTitle: true,
                elevation: 4.0,
                backgroundColor:
                    darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                expandedHeight: _appBarHeight,
                forceElevated: true,
                excludeHeaderSemantics: true,
                // pinned: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: CurrentTheme.DisableTextColor,
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Projectscoid(id: model!.model!.user_id)),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
                pinned: _appBarBehavior == AppBarBehavior.pinned,
                floating: _appBarBehavior == AppBarBehavior.floating ||
                    _appBarBehavior == AppBarBehavior.snapping,
                snap: _appBarBehavior == AppBarBehavior.snapping,
                actions: <Widget>[
                  account!
                      ? Container(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: InkWell(
                                  onTap: () {
                                    _createProfilePhoto(
                                        context, model!.model!.user_id);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      model!.model!.photo_url,
                                      fit: BoxFit.cover,
                                      height: 34,
                                      width: 32,
                                    ),
                                  ))))
                      : Container(
                          width: 0.0,
                          height: 0.0,
                          color: Colors.white,
                        )
                ],
                flexibleSpace: account!
                    ? null
                    : ExpandSpaceBar(
                        title: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        rt.PublicBrowseUsersView(
                                            id: model!.model!.user_id!,
                                            title: '123',
                                            cb: null)),
                              );
                            },
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(model!.model!.display_name,
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: darkMode
                                              ? CurrentTheme.BackgroundColor
                                              : Colors.black87)),
                                  Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        model!.model!.email,
                                        style: TextStyle(
                                            fontSize: 11.0,
                                            color: darkMode
                                                ? CurrentTheme.BackgroundColor
                                                : Colors.black87),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: Icon(Icons.keyboard_arrow_down,
                                              size: 13.0,
                                              color: darkMode
                                                  ? CurrentTheme.BackgroundColor
                                                  : Colors.black87))
                                    ],
                                  ))
                                ])),
                        titlePadding: EdgeInsets.only(bottom: 65),
                        collapseMode: CollapseBarMode.parallax,
                        centerTitle: true,
                        background: Column(
                          // fit: StackFit.passthrough,
                          children: <Widget>[
                            Center(
                              heightFactor: 2.4,
                              child: ShowAvatar(
                                  avatar: this.model!.model!.photo_url),
                              /*
                              Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.white,
                                      width: 1.0,),
                                    borderRadius: BorderRadius.circular(80),
                                  ),

                                  child: InkWell(
                                    onTap: () {_createProfilePhoto(context, model!.model!.user_id);},

                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                        model!.model!.photo_url,
                                        fit: BoxFit.cover,
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                  )

                              )
                              */
                            ),

                            // This gradient ensures that the toolbar icons are distinct
                            // against the background image.
                            const DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.0, -1.0),
                                  end: Alignment(0.0, -0.4),
                                  colors: <Color>[
                                    Color(0x60000000),
                                    Color(0x00000000)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                bottom: const TabBar(
                  labelColor: CurrentTheme.PrimaryDarkColor,
                  unselectedLabelColor: CurrentTheme.DisableTextColor,
                  indicatorColor: CurrentTheme.PrimaryDarkColor,
                  indicatorWeight: 3.0,
                  isScrollable: true,
                  indicatorPadding:
                      EdgeInsets.symmetric(vertical: 0.1, horizontal: 0.1),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      text: "Personal Info",
                    ),
                    Tab(text: "Portofolio"),
                    Tab(text: "Phone"),
                    Tab(text: "Email"),
                    Tab(text: "Password"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Container(
                color: darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                child: SingleChildScrollView(
                  // controller: controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  reverse: false,
                  child: Column(children: <Widget>[
                    Card(
                      elevation: 1.0,
                      color: darkMode
                          ? Colors.black87
                          : CurrentTheme.BackgroundColor,
                      margin: EdgeInsets.all(10.0),
                      child: CategoryWidget(
                        title: 'Profile',
                        isDark: darkMode,
                        subtitle:
                            'Sebagian informasi dalam profile ini dapat diketahui oleh user lain pengguna Projects.co.id.',
                        children: <Widget>[
                          _ContactPhoto(
                            icon: Icons.arrow_forward_ios,
                            isDark: darkMode,
                            tooltip: 'Send message',
                            photo: model!.model!.photo_url,
                            onPressed: () async {
                              _createProfilePhoto(
                                  context, model!.model!.user_id);

                              // CameraExampleHome();
                            },
                            lines: const <String>[
                              'PHOTO',
                              'Photo membantu personalisasi akun Anda ',
                            ],
                          ),
                          ItemListString(
                            // icon: Icons.arrow_forward_ios,
                            isDark: darkMode,
                            tooltip: 'Name',
                            /*
                                    onPressed: () {

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => EditDisplayName(model : model!.model )),
                                      );
                                    },

                                     */
                            lines: <String>[
                              'NAME',
                              '${model!.model!.display_name}',
                            ],
                          ),
                          ItemListString(
                            //icon: Icons.arrow_forward_ios,
                            isDark: darkMode,
                            tooltip: 'Send message',
                            onPressed: () {
                              //  ss.currentState.showSnackBar(const SnackBar(
                              //   content: Text('Imagine if you will, a messaging application.'),
                              // ));
                            },
                            lines: <String>[
                              'USERNAME',
                              '${model!.model!.user_name}',
                            ],
                          ),
                          ItemListString(
                            // icon: Icons.arrow_forward_ios,
                            isDark: darkMode,
                            tooltip: 'Send message',
                            /*
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => EditBirthday(model : model!.model )),
                                      );
                                      //EditBirthday
                                    },

                                     */
                            lines: model!.model!.birth_date == null
                                ? <String>[
                                    'BIRTHDAY',
                                    '',
                                  ]
                                : <String>[
                                    'BIRTHDAY',
                                    '${dateformat.format(model!.model!.birth_date)}',
                                  ],
                          ),
                          ItemListString(
                            // icon: Icons.arrow_forward_ios,
                            isDark: darkMode,
                            tooltip: 'Send message',
                            /*
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => EditSex(model : model!.model )),
                                      );
                                    },

                                     */
                            lines: <String>[
                              'JENIS KELAMIN',
                              '${model!.model!.jenis_kelamin_str}',
                            ],
                          ),
                          ItemListString(
                            // icon: Icons.arrow_forward_ios,
                            isDark: darkMode,
                            tooltip: 'Send message',
                            /*
                                    onPressed: () {
                                      ss.currentState.showSnackBar(const SnackBar(
                                        content: Text('Imagine if you will, a messaging application.'),
                                      ));
                                    },

                                     */
                            lines: <String>[
                              'PASSWORD',
                              '************',
                            ],
                          ),
                          ItemListString(
                            // icon: Icons.arrow_forward_ios,
                            isDark: darkMode,
                            tooltip: 'Send message',
                            /*
                                    onPressed: () {
                                      //ss.currentState.showSnackBar(const SnackBar(
                                      //  content: Text('Imagine if you will, a messaging application.'),
                                      //));
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => EditWebsite(model : model!.model )),
                                      );
                                    },

                                     */
                            lines: <String>[
                              'WEBSITE',
                              '${model!.model!.website == null ? '' : model!.model!.website}',
                            ],
                          ),
                          _SkillItem(
                            // icon: Icons.arrow_forward_ios,
                            isDark: darkMode,
                            tooltip: 'Send message',
                            /*
                                    onPressed: ()async {
                                      // ss.currentState.showSnackBar(const SnackBar(
                                      //  content: Text('Imagine if you will, a messaging application.'),
                                      // ));
                                      MyProfileController my_profile;
                                      String? sendPath = Env.value!.baseUrl! + '/user/my_profile/edit_profile/' + model!.model!.user_id!+'/';
                                      List<int?>? idskills = [];
                                      List<String?>? nameskills = [];
                                      my_profile = MyProfileController(
                                          AppProvider.getApplication(context),
                                          sendPath,
                                          AppAction.post,
                                          model!.model!.user_id!,
                                          '',
                                          null,
                                          false);
                                      final mdl = await my_profile.editEditProfileMyProfile();
                                      idskills.addAll(mdl.model!.model!.skills_list);
                                      nameskills.addAll(mdl.model!.model!.skills_list_str);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => EditSkills(model : model!.model, listskillsid: idskills ,listskillsstr: nameskills )),
                                      );
                                      //  List<int?>? skills_list;
                                      // List<String?>? skills_list_str;
                                    },

                                     */
                            lines: 'SKILLS',

                            wgt: model!.model!.skills_url != null
                                ? ChannelRouteTagsWidget(
                                    value: model!.model!.skills_id,
                                    caption: '',
                                    hint: ' ',
                                    required: false,
                                    idroutetags: model!.model!.skills_id,
                                    nameroutetags: model!.model!.skills_str,
                                    urlroutetags: model!.model!.skills_url,
                                    getValue: (String? val) {
                                      Navigator.pushReplacementNamed(
                                          context, "/projectscoid");
                                      AppProvider.getRouter(context)!
                                          .navigateTo(
                                              context, urlToRoute(val!));
                                    },
                                  )
                                : ChannelNonURLRouteWidget(
                                    value: model!.model!.skills_id,
                                    caption: '',
                                    hint: ' ',
                                    required: false,
                                    idroutetags: model!.model!.skills_id,
                                    nameroutetags: model!.model!.skills_str,
                                  ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      elevation: 1.0,
                      color: darkMode
                          ? Colors.black87
                          : CurrentTheme.BackgroundColor,
                      margin: EdgeInsets.all(10.0),
                      child: CategoryWidget(
                        title: 'Contact info',
                        isDark: darkMode,
                        subtitle: '',
                        children: <Widget>[
                          ItemListString(
                            isDark: darkMode,
                            // icon: Icons.arrow_forward_ios,
                            tooltip: 'Send message',
                            onPressed: () {
                              // ss.currentState.showSnackBar(const SnackBar(
                              //    content: Text('A messaging app appears.'),
                              // ));
                            },
                            lines: <String>[
                              'EMAIL',
                              '${model!.model!.email}',
                            ],
                          ),
                          ItemListString(
                            isDark: darkMode,
                            // icon: Icons.arrow_forward_ios,
                            tooltip: 'Send message',
                            onPressed: () {
                              // ss.currentState.showSnackBar(const SnackBar(
                              //   content: Text('Imagine if you will, a messaging application.'),
                              //  ));
                            },
                            lines: <String>[
                              'PHONE',
                              '${model!.model!.handphone}',
                            ],
                          ),
                          ItemListString(
                            isDark: darkMode,
                            // icon: Icons.arrow_forward_ios,
                            tooltip: 'Send message',
                            /*
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => EditAddress(model : model!.model )),
                                      );
                                    },

                                    */
                            lines: <String>[
                              'ADDRESS',
                              '${model!.model!.address}',
                            ],
                          ),
                          ItemListString(
                            isDark: darkMode,
                            // icon: Icons.arrow_forward_ios,
                            tooltip: 'Send message',
                            /*
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => EditCountry(model : model!.model )),
                                      );
                                    },

                                     */
                            lines: <String>[
                              'NEGARA',
                              '${model!.model!.country_str}',
                            ],
                          ),
                          ItemListString(
                            isDark: darkMode,
                            // icon: Icons.arrow_forward_ios,
                            tooltip: 'Send message',
                            /*
                                    onPressed: ()async {

                                      SubModelController provinsi;
                                      List<int?>? idprovinsi = [];
                                      List<String?>? nameprovinsi = [];
                                      String? sendPath = Env.value!.baseUrl! + '/user/my_profile/json?model=country_id&id='+  model!.model!.country_id.toString() ;
                                      provinsi = SubModelController(
                                          AppProvider.getApplication(context),
                                          sendPath,
                                          null);
                                      if(model!.model!.country_id == 104){
                                        var prov = await provinsi.getData();
                                        int  count = 0;
                                        for(var item in prov['rows']){
                                          idprovinsi.add(int.parse(prov['rows'][count]['id']));
                                          count ++;
                                        }
                                        int?  count1 = 0;
                                        for(var item in prov['rows']){
                                          nameprovinsi.add(prov['rows'][count1]['name'] as String);
                                          count1 ++;
                                        }
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => EditProvinsi(model : model!.model, provinsilistid: idprovinsi, provinsilistname: nameprovinsi,)),
                                        );

                                        // print('provinsi = ${prov['rows'][0]['id'] as int}');
                                      }


                                    },

                                     */
                            lines: <String>[
                              'PROVINSI',
                              '${model!.model!.provinsi_str}',
                            ],
                          ),
                          ItemListString(
                            isDark: darkMode,
                            // icon: Icons.arrow_forward_ios,
                            tooltip: 'Send message',
                            /*
                                    onPressed: () async{
                                      SubModelController kabupaten;
                                      List<int?>? idkabupaten = [];
                                      List<String?>? namekabupaten = [];
                                      String? sendPath = Env.value!.baseUrl! + '/user/my_profile/json?model=provinsi_id&id='+  model!.model!.provinsi_id.toString() ;
                                      kabupaten = SubModelController(
                                          AppProvider.getApplication(context),
                                          sendPath,
                                          null);
                                      if(model!.model!.provinsi_id != 0){
                                        var prov = await kabupaten.getData();
                                        int  count = 0;
                                        for(var item in prov['rows']){
                                          idkabupaten.add(int.parse(prov['rows'][count]['id']));
                                          count ++;
                                        }
                                        int?  count1 = 0;
                                        for(var item in prov['rows']){
                                          namekabupaten.add(prov['rows'][count1]['name'] as String);
                                          count1 ++;
                                        }
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => EditKabupaten(model : model!.model, kabupatenlistid: idkabupaten, kabupatenlistname: namekabupaten,)),
                                        );

                                        // print('provinsi = ${prov['rows'][0]['id'] as int}');
                                      }
                                    },

                                    */
                            lines: <String>[
                              'KABUPATEN',
                              '${model!.model!.kabupaten_str}',
                            ],
                          ),
                          ItemListString(
                            isDark: darkMode,
                            // icon: Icons.arrow_forward_ios,
                            tooltip: 'Send message',
                            /*
                                    onPressed: ()async {
                                      SubModelController kecamatan;
                                      List<int?>? idkecamatan = [];
                                      List<String?>? namekecamatan = [];
                                      String? sendPath = Env.value!.baseUrl! + '/user/my_profile/json?model=kabupaten_id&id='+  model!.model!.kabupaten_id.toString() ;
                                      kecamatan = SubModelController(
                                          AppProvider.getApplication(context),
                                          sendPath,
                                          null);
                                      if(model!.model!.kabupaten_id != 0){
                                        var prov = await kecamatan.getData();
                                        int  count = 0;
                                        for(var item in prov['rows']){
                                          idkecamatan.add(int.parse(prov['rows'][count]['id']));
                                          count ++;
                                        }
                                        int?  count1 = 0;
                                        for(var item in prov['rows']){
                                          namekecamatan.add(prov['rows'][count1]['name'] as String);
                                          count1 ++;
                                        }
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => EditKecamatan(model : model!.model, kecamatanlistid: idkecamatan, kecamatanlistname: namekecamatan,)),
                                        );

                                        // print('provinsi = ${prov['rows'][0]['id'] as int}');
                                      }
                                    },

                                     */
                            lines: <String>[
                              'KECAMATAN',
                              '${model!.model!.kecamatan_str}',
                            ],
                          ),
                          ItemListString(
                            isDark: darkMode,
                            //icon: Icons.arrow_forward_ios,
                            tooltip: 'Send message',
                            /*
                                    onPressed: () async{
                                      SubModelController kelurahan;
                                      List<int?>? idkelurahan = [];
                                      List<String?>? namekelurahan = [];
                                      String? sendPath = Env.value!.baseUrl! + '/user/my_profile/json?model=kecamatan_id&id='+  model!.model!.kecamatan_id.toString() ;
                                      kelurahan = SubModelController(
                                          AppProvider.getApplication(context),
                                          sendPath,
                                          null);
                                      if(model!.model!.kecamatan_id != 0){
                                        var prov = await kelurahan.getData();
                                        int  count = 0;
                                        for(var item in prov['rows']){
                                          idkelurahan.add(int.parse(prov['rows'][count]['id']));
                                          count ++;
                                        }
                                        int?  count1 = 0;
                                        for(var item in prov['rows']){
                                          namekelurahan.add(prov['rows'][count1]['name'] as String);
                                          count1 ++;
                                        }
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => EditKelurahan(model : model!.model, kelurahanlistid: idkelurahan, kelurahanlistname: namekelurahan,)),
                                        );

                                        // print('provinsi = ${prov['rows'][0]['id'] as int}');
                                      }
                                    },

                                     */
                            lines: <String>[
                              'KELURAHAN',
                              '${model!.model!.kelurahan_str}',
                            ],
                          ),
                          _SkillItem(
                            // icon: Icons.arrow_forward_ios,
                            isDark: darkMode,
                            tooltip: 'Send message',
                            /*
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => EditPostcode(model : model!.model )),
                                      );
                                    },

                                    */
                            lines: 'POST CODE',

                            wgt: Text(
                                model!.model!.post_code == 'null'
                                    ? ''
                                    : model!.model!.post_code,
                                style: TextStyle(
                                    color: darkMode
                                        ? Colors.white
                                        : Colors.black)),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 1.0,
                      margin: EdgeInsets.all(10.0),
                      color: darkMode
                          ? Colors.black87
                          : CurrentTheme.BackgroundColor,
                      child: CategoryWidget(
                        title: 'Self Introduction',
                        isDark: darkMode,
                        subtitle: '',
                        children: <Widget>[
                          _SkillItem(
                            // icon: Icons.arrow_forward_ios,
                            isDark: darkMode,
                            tooltip: 'Send message',
                            /*
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => EditIntro(model : model!.model )),
                                      );
                                    },

                                     */
                            lines: 'INTRODUCTION',

                            wgt: Html(
                                data: model!.model!.self_introduction
                                    .replaceAll('<div>', '')
                                    .replaceAll('<\/div>', '')
                                    .replaceAll('<br>', '​<br>')
                                    .replaceAll('<p>', '')
                                    .replaceAll('<\/p>', '​<br>'),
                                style: {
                                  "html": Style(
                                      color: darkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: FontSize.medium,
                                      fontWeight: FontWeight.w800),
                                }

                                // textStyle: TextStyle(color: darkMode? Colors.white: Colors.black)),
                                ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      elevation: 1.0,
                      margin: EdgeInsets.all(10.0),
                      color: darkMode
                          ? Colors.black87
                          : CurrentTheme.BackgroundColor,
                      child: CategoryWidget(
                        title: 'Detail user profile',
                        isDark: darkMode,
                        subtitle: '',
                        children: <Widget>[
                          _SkillItem(
                            icon: Icons.arrow_forward_ios,
                            isDark: darkMode,
                            tooltip: 'Send message',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditNotifyProjects(
                                        model: model!.model)),
                              );
                            },
                            lines: 'NOTIFY PROJECTS',
                            wgt: HtmlWidget(
                                model!.model!.notify_projects ? 'YES' : 'NO',
                                textStyle: TextStyle(
                                    color: darkMode
                                        ? Colors.white
                                        : Colors.black)),
                          ),
                          UserDetail(
                              icon: Icons.arrow_forward_ios,
                              tooltip: 'Send message',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          rt.PublicBrowseUsersView(
                                              id: model!.model!.user_id!,
                                              title: '123',
                                              cb: null)),
                                );
                                /*
                                        AppProvider.getRouter(context)!.navigateTo(
                                            context,
                                            urlToRoute(model!.buttons[0].url));

                                         */
                              },
                              lines: 'Go to about me'),
                          ButtonBar(
                              alignment: MainAxisAlignment.center,
                              buttonMinWidth: 0.9 * width,
                              children: <Widget>[
                                ElevatedButton(
                                    child: Text('Edit Profile'),
                                    style: ButtonStyle(
                                      textStyle:
                                          MaterialStateProperty.all<TextStyle>(
                                              TextStyle(color: Colors.white)),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.green),
                                    ),
                                    //backgroundColor : Color(0xFF037f51),),

                                    onPressed: () {
                                      if (account!) {
                                        AppProvider.getRouter(context)!.navigateTo(
                                            context,
                                            //https://projects.co.id/user/my_profile/edit_profile/801711/ruri-viani-pratiwi-ruri2008
                                            '/user/my_profile/edit_profile/${this.model!.model!.user_id}/${this.model!.model!.user_name}');
                                        // '/public/browse_services/service_comments_new_reply/' + this.model!.model!.service_id +'/' + this.model!.meta.title.replaceAll('/', ''));
                                      } else {
                                        AppProvider.getRouter(context)!
                                            .navigateTo(context, '/login/1');
                                      }
                                    })
                              ]),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              Portofolio(id: model!.model!.user_id!, title: ''),
              rt.ChangeHandphoneMyProfile(
                  id: model!.model!.user_id!, title: ''),
              rt.ChangeEmailMyProfile(id: model!.model!.user_id!, title: ''),
              rt.ChangePasswordMyProfile(id: model!.model!.user_id!, title: ''),
            ],
          ),
        )));
  }

  Widget detailProfile(BuildContext context) {
    TextStyle readTextStyle = TextStyle(
      color: Colors.blue,
      fontSize: 18.0,
    );
    return MergeSemantics(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  AppProvider.getRouter(context)!
                      .navigateTo(context, urlToRoute(model!.buttons[0].url));
                },
                child: Text(
                  'Go to About me',
                  textAlign: TextAlign.start,
                  style: readTextStyle,
                ),
              )
            ]),
      ),
    );
  }

  Future<void> _createProfilePhoto(BuildContext context, String? id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Photo profile'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Photo Anda akan terlihat oleh semua pengguna aplikasi Projects.co.id'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Buat Photo Profile'),
              onPressed: () async {
                Navigator.of(context).pop();
                await choosePhoto(context, id);
              },
            ),
          ],
        );
      },
    );
  }

  choosePhoto(BuildContext context, String? id) async {
    String? filepath;
    Photo foto1;
    MyProfileController my_profile;
    String? sendPath = Env.value!.baseUrl! +
        '/user/my_profile/edit_profile/' +
        model!.model!.user_id! +
        '/';
    await showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Buat profile photo'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () async {
                // Navigator.of(context).pop();
                try {
                  WidgetsFlutterBinding.ensureInitialized();
                  cameras = await availableCameras();
                } on CameraException catch (e) {
                  logError(e.code, e.description);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AccountCamera(id: id, model: model!.model)),
                );
              },
              child: const Text('Ambil gambar'),
            ),
            SimpleDialogOption(
              onPressed: () async {
                //  Navigator.of(context).pop();
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();

                if (result != null) {
                  // File file = File(result.files.single.path);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProfilePhoto(
                            model: model!.model,
                            filePath: result.files.single.path)),
                  );
                }
                /*
                filepath = await FilePicker.getFilePath(type: FileType.any);
                if (filepath != null){
                  // print('filepath ==${filepath}');

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePhoto(model : model!.model, filePath: filepath)),
                  );
                }

                 */
              },
              child: const Text('Pilih gambar'),
            ),
          ],
        );
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
///////////////////////////
//dialog

//////////////////////////
//CAMERA

/// Returns a suitable camera icon for [direction].
IconData getCameraLensIcon(CameraLensDirection direction) {
  switch (direction) {
    case CameraLensDirection.back:
      return Icons.camera_rear;
    case CameraLensDirection.front:
      return Icons.camera_front;
    case CameraLensDirection.external:
      return Icons.camera;
  }
  throw ArgumentError('Unknown lens direction');
}

void logError(String code, String? message) =>
    print('Error: $code\nError Message: $message');

List<CameraDescription> cameras = [];

class AccountCamera extends StatefulWidget {
  final String? id;
  final ViewModelMyProfileRev? model;
  AccountCamera({Key? key, this.id, this.model}) : super(key: key);
  @override
  _AccountCameraState createState() {
    return _AccountCameraState();
  }
}

class _AccountCameraState extends State<AccountCamera>
    with WidgetsBindingObserver, RestorationMixin {
  CameraController? controller;
  MyProfileController? my_profile;
  String? imagePath;
  // var model;
  var isLoading = true;

  final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'AccountCamera';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }

  @override
  void initState() {
    super.initState();
    _initCamera();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  Future<void> _initCamera() async {
    //  cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.low);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.
    if (controller == null || !controller!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (controller != null) {
        onNewCameraSelected(controller!.description);
      }
    }
  }

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (controller != null) {
      if (!controller!.value.isInitialized) {
        return Container();
      }
    } else {
      return const Center(
        child: SizedBox(
          width: 32,
          height: 32,
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (!controller!.value.isInitialized) {
      return Container();
    }

    //fetchData(my_profile);
    return Scaffold(
      // key: _scaffoldKey,
      extendBody: true,
      body: Stack(
        children: <Widget>[
          _cameraPreviewWidget(size),
          Align(
            alignment: Alignment(0.9, -0.9),
            child: IconButton(
              iconSize: 40.0,
              color: Colors.white,
              icon: Icon(
                Icons.camera,
                color: Colors.white,
              ),
              onPressed: () {
                _onCameraSwitch();
              },
            ),
          ),
          Positioned.fill(
            top: size.height - 100,
            left: 0.0,
            right: 0.0,
            child: _buildBottomNavigationBar(context),
          )
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 100.0,
      width: double.infinity,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              IconButton(
                iconSize: 80.0,
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.circle,

                  // size: 80.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  onTakePictureButtonPressed(context);
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  'Tap untuk mengambil gambar',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> _onCameraSwitch() async {
    final CameraDescription cameraDescription =
        (controller!.description == cameras[0]) ? cameras[1] : cameras[0];
    if (controller != null) {
      await controller!.dispose();
    }

    controller = CameraController(
      cameraDescription,
      ResolutionPreset.low,
    );

    // If the controller is updated then update the UI.
    controller!.addListener(() {
      if (mounted) setState(() {});
      if (controller!.value.hasError) {
        showInSnackBar('Camera error ${controller!.value.errorDescription}');
      }
    });

    try {
      await controller!.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  Future<FileSystemEntity?> getLastImage() async {
    final Directory? extDir = await getApplicationDocumentsDirectory();
    final String? dirPath = '${extDir!.path}/media';
    final myDir = Directory(dirPath!);
    List<FileSystemEntity> _images;
    _images = myDir.listSync(recursive: true, followLinks: false);
    _images.sort((a, b) {
      return b.path.compareTo(a.path);
    });
    // var lastFile = _images[0];
    /* var extension = path.extension(lastFile.path);
    if (extension == '.jpeg') {
      return lastFile;
    } else {
      String? thumb = await Thumbnails.getThumbnail(
          videoFile: lastFile.path, imageType: ThumbFormat.PNG, quality: 30);
      return File(thumb);
    }
    */
  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget(Size size) {
    final _size = size;
    return ClipRect(
      child: Container(
        child: Transform.scale(
          scale: controller!.value.aspectRatio / _size.aspectRatio,
          child: Center(
            child: AspectRatio(
              aspectRatio: controller!.value.aspectRatio,
              child: CameraPreview(controller!),
            ),
          ),
        ),
      ),
    );
  }

  /// Toggle recording audio

  /// Display the thumbnail of the captured image or video.
  Widget _thumbnailWidget() {
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            imagePath == null
                ? Container()
                : SizedBox(
                    child: Image.file(File(imagePath!)),
                    width: 64.0,
                    height: 64.0,
                  ),
          ],
        ),
      ),
    );
  }

  /// Display the control bar with buttons to take pictures and record videos.
  /* Widget _captureControlRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.camera_alt),
          color: Colors.blue,
          onPressed: controller != null &&
              controller!.value.isInitialized &&
              !controller!.value.isRecordingVideo
              ? onTakePictureButtonPressed
              : null,
        ),


      ],
    );
  } */

  /// Display a row of toggle to select the camera (or a message if no camera is available).
  Widget _cameraTogglesRowWidget() {
    final List<Widget> toggles = <Widget>[];

    if (cameras.isEmpty) {
      return const Text('No camera found');
    } else {
      for (CameraDescription cameraDescription in cameras) {
        toggles.add(
          SizedBox(
            width: 90.0,
            child: RadioListTile<CameraDescription>(
              title: Icon(getCameraLensIcon(cameraDescription.lensDirection)),
              groupValue: controller?.description,
              value: cameraDescription,
              onChanged: controller! != null ? null : onNewCameraSelected,
            ),
          ),
        );
      }
    }

    return Row(children: toggles);
  }

  String? timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    //_scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void onNewCameraSelected(CameraDescription? cameraDescription) async {
    if (controller != null) {
      await controller!.dispose();
    }
    controller = CameraController(
      cameraDescription!,
      ResolutionPreset.low,
    );

    // If the controller is updated then update the UI.
    controller!.addListener(() {
      if (mounted) setState(() {});
      if (controller!.value.hasError) {
        showInSnackBar('Camera error ${controller!.value.errorDescription}');
      }
    });

    try {
      await controller!.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void onTakePictureButtonPressed(BuildContext context) {
    takePicture().then((String? filePath) {
      if (mounted) {
        setState(() {
          imagePath = filePath;
        });
        if (filePath != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    EditProfilePhoto(model: widget.model!, filePath: filePath)),
          );
        }
        //showInSnackBar('Picture saved to $filePath');
      }
    });
  }

  Future<String?> takePicture() async {
    if (!controller!.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }
    final Directory? extDir = await getExternalStorageDirectory();
    final String? dirPath = '${extDir!.path}/Pictures/my_profile';
    await Directory(dirPath!).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (controller!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await controller!.takePicture();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
    return filePath;
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
}

class EditProfilePhoto extends StatefulWidget {
  final ViewModelMyProfileRev? model;
  final String? filePath;

  DIOProvider? provider;
  EditProfilePhoto({Key? key, this.model, this.filePath}) : super(key: key);

  @override
  EditProfilePhotoState createState() {
    return EditProfilePhotoState();
  }
}

class EditProfilePhotoState extends State<EditProfilePhoto>
    with RestorationMixin {
  MyProfileController? my_profile;

  bool progresscircular = false;
  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  String? errormessage = 'Upload your Image.';

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'EditProfilePhoto';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // key: _scaffoldKey,
      extendBody: true,
      body: Stack(
        children: <Widget>[
          _profilePreview(size, widget.filePath, context),
          Align(
            alignment: Alignment(-0.9, -0.9),
            child: IconButton(
              iconSize: 40.0,
              color: Colors.white,
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          progresscircular
              ? Center(
                  child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ))
              : Container(
                  width: 0.0,
                  height: 0.0,
                ),
          Positioned.fill(
            top: size.height - 100,
            left: 0.0,
            right: 0.0,
            child: _buildBottomNavigationBar(
                context, widget.model!, widget.filePath),
          )
        ],
      ),
    );
  }

  Widget _profilePreview(Size size, String? image, BuildContext context) {
    final _size = size;
    // print('image == $image');

    return PhotoView(
      imageProvider: FileImage(
        File(image!),
      ),
      // Contained = the smallest possible size to fit one dimension of the screen
      minScale: PhotoViewComputedScale.contained * 1.3,
      // minScale: PhotoViewComputedScale.covered  ,
      // Covered = the smallest possible size to fit the whole screen
      maxScale: PhotoViewComputedScale.covered * 2.7,
      enableRotation: true,
      // Set the background color to the "classic white"
      backgroundDecoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
      ),
      loadingBuilder: (context, event) => Center(
        child: Container(
          width: 20.0,
          height: 20.0,
          child: CircularProgressIndicator(
            value: event == null
                ? 0
                : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
          ),
        ),
      ),
    );
  }

  String? timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  Future<File> fixExifRotation(String imagePath) async {
    final originalFile = File(imagePath);
    List<int> imageBytes = await originalFile.readAsBytes();

    final originalImage = img.decodeImage(imageBytes);
    img.Image originalImg;
    originalImg = img.copyResize(originalImage!, height: 320, width: 320);
    // Here you can select whether you'd like to save it as png
    // or jpg with some compression
    // I choose jpg with 100% quality
    final fixedFile =
        await originalFile.writeAsBytes(img.encodeJpg(originalImg));

    return fixedFile;
  }

  Widget _buildBottomNavigationBar(
      BuildContext context, ViewModelMyProfileRev model, String? ft) {
    MyProfileController my_profile;
    String? sendPath = Env.value!.baseUrl! +
        '/user/my_profile/edit_profile/' +
        widget.model!.user_id! +
        '/';
    // var formData ;
    var postMyProfileResult;
    Photo foto1;
    Photo foto2;
    return Container(
      color: Colors.green,
      height: 100.0,
      width: double.infinity,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text('Ubah photo profile dengan photo ini',
                style: TextStyle(color: Colors.white)),
          ),
          IconButton(
            iconSize: 50.0,
            padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.send,

              // size: 80.0,
              color: Colors.white,
            ),
            onPressed: () async {
              setState(() {
                progresscircular = true;
              });
              final Directory? extDir = await getExternalStorageDirectory();
              final String? dirPath = '${extDir!.path}/Pictures/my_profile';
              await Directory(dirPath!).create(recursive: true);
              final String? filePath = '$dirPath/${timestamp()}.jpg';
              await File(ft!).copy(filePath!);
              await fixExifRotation(filePath!);

              widget.model!.photo = await _uploadImage(filePath!);

              // print('name===${foto1.file}');
              var formData = await convertFormDataEdit(
                  'usr' + widget.model!.user_id!, widget.model!);
              my_profile = MyProfileController(
                  AppProvider.getApplication(context),
                  sendPath,
                  AppAction.post,
                  widget.model!.user_id!,
                  'quot-onmouseoverquotalert1quotgt-ahmadriki',
                  formData!,
                  false);

              final future = my_profile.postMyProfile();
              future.then((value) {
                // setState(() {
                postMyProfileResult = value;
                //  Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(builder: (context) => UserMyProfileView()),
                //       (Route<dynamic> route) => false,
                // );
                //AppProvider.getRouter(context)!.pop(context);
                // });
                //  print('postMyProfileResult === $postMyProfileResult');
                // _showToast(context, '$postMyProfileResult');
              }).catchError((Error) {
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(builder: (context) => UserMyProfileView()),
                //       (Route<dynamic> route) => false,
                //  );
                //AppProvider.getRouter(context)!.pop(context);
                // setState(() {
                //   progresscircular = false;
                // });
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => rt.UserMyProfileView()),
                  (Route<dynamic> route) => false,
                );
                /* if(isPhoto){
                  AppProvider.getRouter(context)!.pop(context);
                  AppProvider.getRouter(context)!.pop(context);
                  AppProvider.getRouter(context)!.pop(context);
                }else{
                  AppProvider.getRouter(context)!.pop(context);
                  AppProvider.getRouter(context)!.pop(context);
                    Navigator.pushAndRemoveUntil(
                     context,
                     MaterialPageRoute(builder: (context) => UserMyProfileView()),
                         (Route<dynamic> route) => false,
                   );
                } */

                //
              });
            },
          ),
        ],
      ),
    );
  }

  void _showToast(BuildContext context, String? info) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(info!),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void onProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
      setState(() {});
    } else {
      setState(() {});
    }
  }

  Future<DIOProvider> _init() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    final DIOProvider provider = await DIOProvider(appDocDir.path);
    return provider;
  }

  Future<Photo> _uploadImage(String filepath) async {
    String? filename;
    Photo dioResultImage;
    widget.provider = await _init();
    filename = p.basename(filepath);
    dioResultImage = await loadImageFile(filename, filepath, onProgress);
    //_UPLOAD_URL1 = '/upload/temp/';
    //link = _BASE_URL1+ _UPLOAD_URL1   +  dioResultImage.temp;
    print('upload ==== ${dioResultImage.toJson()}');
    if (dioResultImage != null) {
      dioResultImage.file = dioResultImage.temp;
      dioResultImage.temp = dioResultImage.temp;
      dioResultImage.name = dioResultImage.name;
      //  uploadimage(dioResultImage);
    } else {
      dioResultImage.file = '';
    }

    //setState(() {
    // progresscircular = false;
    //});

    return dioResultImage;
  }

  Future<Photo> loadImageFile(
      String filename, String? filepath, ProgressCallback onProgress) async {
    FormData formdata = FormData.fromMap({
      "Filename": "filename",
      "Filedata": await MultipartFile.fromFile(filepath!, filename: filename),
    });
    Photo res;
    // String? res ;
    res = await widget.provider!
        .uploadImage2(formdata, onProgress)
        .then((response) {
      return response;
    });
    return res;
  }

  // void uploadimage (Photo value){
  //   widget.getValue(value);
  // }

//"user[address]": "${widget.model!.address }"
}

/////////////////////////
Map<String, dynamic> convertFormDataEdit(
    String id, ViewModelMyProfileRev model) {
  String? image = '';

  if (model!.photo != null) {
    if (model!.photo!.temp != null) {
      image =
          '{"status":"1","name":"${model!.photo!.name}","temp":"${model!.photo!.temp}"}';
    }
  }

  print('image ==$image');
  print('display name === ${model!.display_name}');
  print("user[_trigger_]save_profile");
  print("user[photo]$image");
  //print(  "user[photo_lastval]": '{"name":"${model!.model!.photo!.name}","dir":"${model!.model!.photo!.dir}","file":"${model!.model!.photo!.file}","thumb":"${model!.model!.photo!.thumb}"}');
  print("user[display_name]${model!.display_name}");
  print(
      "user[birth_date]${model!.birth_date == null ? '' : DateFormat('dd/MM/yyyy').format(model!.birth_date!)}");
  print("user[jenis_kelamin_id]${model!.jenis_kelamin_id}");
  print("user[address]${model!.address}");
  print("user[country_id]${model!.country_id}");
  print("user[provinsi_id]${model!.provinsi_id}");
  print("user[kabupaten_id]${model!.kabupaten_id}");
  print("user[kecamatan_id]${model!.kecamatan_id}");
  print("user[kelurahan_id]${model!.kelurahan_id}");
  print("user[post_code]${model!.post_code}");
  print("user[self_introduction]${model!.self_introduction}");
  print("file");
  print("user[website]${model!.website == null ? '' : model!.website}");
  print("user[language_id]${model!.language_id}");
  print("user[notify_projects]${model!.notify_projects! ? 1 : 0}");
  var formData = {
    "user[_trigger_]": "save_profile",
    "user[photo]": '$image',
    "user[photo_lastval]":
        '{"name":"${model!.photo!.name}","dir":"${model!.photo!.dir}","file":"${model!.photo!.file}","thumb":"${model!.photo!.thumb}"}',
    "user[display_name]": "${model!.display_name}",
    "user[birth_date]":
        "${model!.birth_date == null ? '' : DateFormat('dd/MM/yyyy').format(model!.birth_date!)}",
    "user[jenis_kelamin_id]": "${model!.jenis_kelamin_id}",
    "user[address]": "${model!.address}",
    "user[country_id]": "${model!.country_id}",
    "user[provinsi_id]": "${model!.provinsi_id}",
    "user[kabupaten_id]": "${model!.kabupaten_id}",
    "user[kecamatan_id]": "${model!.kecamatan_id}",
    "user[kelurahan_id]": "${model!.kelurahan_id}",
    "user[post_code]": "${model!.post_code}",
    "user[self_introduction]": "${model!.self_introduction}",
    "file": '',
    "user[website]": "${model!.website == null ? '' : model!.website}",
    "user[language_id]": "${model!.language_id}",
    "user[notify_projects]": '${model!.notify_projects! ? 1 : 0}',
  };

  int count = 0;
  for (var tag in model!.skills_id!) {
    formData.addAll({"user[skills][selection][$count]": "$tag"});
    count++;
  }

  return (formData);
}
///////////////////////////////////////////////////
//Portofolio

class Portofolio extends StatefulWidget {
  final String? id;
  final String? title;
  static const String? PATH = '/user/my_profile/portofolio/:id/:title';
  Portofolio({Key? key, this.id, this.title}) : super(key: key);
  @override
  PortofolioState createState() => PortofolioState();
}

class PortofolioState extends State<Portofolio> with RestorationMixin {
  String? title = 'Portofolio';
  bool _dialVisible = true;
  bool search = true;
  String? getPath = Env.value!.baseUrl! + '/user/my_profile/portofolio/';
  final scrollController = ScrollController();
  MyProfileController? portofolio;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String? searchText = '';
  bool account = true;
  AccountController? accountController;

  PortofolioState() {
    scrollController.addListener(_onScroll);
  }

  final RestorableDouble cs = RestorableDouble(0);

  @override
  String? get restorationId => 'Portofolio';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'Portofolio');
  }

  @override
  Widget build(BuildContext context) {
    getPath = Env.value!.baseUrl! +
        '/user/my_profile/portofolio/' +
        widget.id! +
        '/' +
        widget.title! +
        '?page=%d';
    if (widget.id!.contains('filter') || widget.id!.contains('search')) {
      search = true;
    }
    if (widget.id!.contains('filter')) {
      var ids = widget.id!;
      int? ind = ids.indexOf('&');
      ids = ids.substring(ind, ids.length);
      getPath = Env.value!.baseUrl! +
          '/user/my_profile/portofolio/' +
          widget.id! +
          '/' +
          widget.title! +
          '?page=%d' +
          ids;
    }
    if (widget.id!.contains('search')) {
      var ids = widget.id!;
      ids = ids.replaceAll('%28', '(');
      ids = ids.replaceAll('%29', ')');
      getPath = Env.value!.baseUrl! +
          '/user/my_profile/portofolio/' +
          widget.id! +
          '/' +
          widget.title! +
          '?page=%d&' +
          ids;
    }

    portofolio = MyProfileController(AppProvider.getApplication(context),
        getPath, AppAction.listing, '', '', '', search);
    portofolio!.listMyProfilePortofolio();
    portofolio!.listingPortofolio!.add(PortofolioMyProfileList());
    accountController =
        AccountController(AppProvider.getApplication(context), AppAction.view);
    List listAccount = [];
    final future = accountController!.getAccount();
    future.then((val) {
      listAccount.addAll(val);
      if (listAccount.length == 0) {
        setState(() {
          account = false;
        });
      }
    });
    return Scaffold(body: buildListingBar());
  }

  void _onChanged(String value) {
    setState(() {
      searchText = value;
    });
  }

  Widget buildSearchBar(String tiltle) {
    return Container(
        // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0),
        //alignment: Alignment.topCenter,
        height: 40.0,
        child: TextField(
          controller: searchBoxController,
          style: TextStyle(fontSize: 14.0, height: 0.2, color: Colors.black),
          onChanged: (String? value) {
            _onChanged(value!);
          },
          decoration: InputDecoration(
            fillColor: CurrentTheme.BackgroundColor,
            filled: true,

            //hasFloatingPlaceholder: false,
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                searchBoxController.clear();
                setState(() {
                  searchText = '';
                  selected = false;
                });
              },
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                gapPadding: 20.0),
          ),
        ));
  }

  // @override
  Widget buildListingBar() {
    return BlocBuilder<PortofolioMyProfileListing, PortofolioMyProfileState>(
      bloc: portofolio!.listingPortofolio,
      builder: (BuildContext context, state) {
        final mediaQueryData = MediaQuery.of(context);
        if (state is PortofolioMyProfileListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ));
        }
        if (state is PortofolioMyProfileListingError) {
          return
              //Center(
              //   child: Text('failed to ' + title!),
              //);
              Scaffold(
            body: Center(
              child: Text('no ' + title!),
            ),
            floatingActionButton: SpeedDial(
                childMargin:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                animatedIcon: AnimatedIcons.menu_close,
                animatedIconTheme: IconThemeData(size: 22.0),
                // this is ignored if animatedIcon is non null
                // child: Icon(Icons.add),
                visible: true,
                // If true user is forced to close dial manually
                // by tapping main button and overlay is not rendered.
                closeManually: false,
                curve: Curves.bounceIn,
                overlayColor: Colors.black,
                overlayOpacity: 0.5,
                onOpen: () => print('OPENING DIAL'),
                onClose: () => print('DIAL CLOSED'),
                tooltip: 'Speed Dial',
                heroTag: 'speed-dial-hero-tag',
                backgroundColor: CurrentTheme.MainAccentColor,
                foregroundColor: Colors.white,
                elevation: 8.0,
                shape: CircleBorder(),
                children: <SpeedDialChild>[
                  SpeedDialChild(
                    child: Icon(Icons.save),
                    backgroundColor: Colors.green,
                    label: 'Add',
                    labelStyle: TextStyle(fontSize: 18.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                rt.MyProfilePortofolioAddPortofolio(
                                    id: '',
                                    title: '',
                                    url: urlToRoute(
                                        '/user/my_profile/portofolio_add_portofolio/' +
                                            widget.id! +
                                            '/zzz'))),
                      ).then((value) {
                        setState(() {});
                      });
                      //AppProvider.getRouter(context)!.navigateTo(context, urlToRoute('/user/my_profile/portofolio_add_portofolio/'+widget.id! + '/zzz'));
                    },
                  )
                ]),
          );
        }
        if (state is PortofolioMyProfileListingLoaded) {
          if (state.portofolio!.items.items.isEmpty) {
            if (state.portofolio!.tools.buttons.length == 0) {
              return Scaffold(
                body: Center(
                  child: Text('no ' + title!),
                ),
              );
            } else {
              return Scaffold(
                body: Center(
                  child: Text('no ' + title!),
                ),
                floatingActionButton: SpeedDial(
                    childMargin: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 20),
                    animatedIcon: AnimatedIcons.menu_close,
                    animatedIconTheme: IconThemeData(size: 22.0),
                    // this is ignored if animatedIcon is non null
                    // child: Icon(Icons.add),
                    visible: true,
                    // If true user is forced to close dial manually
                    // by tapping main button and overlay is not rendered.
                    closeManually: false,
                    curve: Curves.bounceIn,
                    overlayColor: Colors.black,
                    overlayOpacity: 0.5,
                    onOpen: () => print('OPENING DIAL'),
                    onClose: () => print('DIAL CLOSED'),
                    tooltip: 'Speed Dial',
                    heroTag: 'speed-dial-hero-tag',
                    backgroundColor: CurrentTheme.MainAccentColor,
                    foregroundColor: Colors.white,
                    elevation: 8.0,
                    shape: CircleBorder(),
                    children: <SpeedDialChild>[
                      SpeedDialChild(
                        child: Icon(Icons.save),
                        backgroundColor: Colors.green,
                        label: 'Add',
                        labelStyle: TextStyle(fontSize: 18.0),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    rt.MyProfilePortofolioAddPortofolio(
                                        id: '',
                                        title: '',
                                        url: urlToRoute(
                                            '/user/my_profile/portofolio_add_portofolio/' +
                                                widget.id! +
                                                '/zzz'))),
                          ).then((value) {
                            setState(() {});
                          });
                          //AppProvider.getRouter(context)!.navigateTo(context, urlToRoute('/user/my_profile/portofolio_add_portofolio/'+widget.id! + '/zzz'));
                        },
                      )
                    ]),
              );
            }
          }
          if (state.portofolio!.tools.buttons.length == 0) {
            return Scaffold(
                body: RefreshIndicator(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: state.hasReachedMax!
                    ? state.portofolio!.items.items.length
                    : state.portofolio!.items.items.length + 1,
                controller: scrollController,
                physics: AlwaysScrollableScrollPhysics(),
                // padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 2.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  //mainAxisSpacing: 10,
                  //crossAxisSpacing: 10,
                  //childAspectRatio: 0.9,
                  childAspectRatio: mediaQueryData.size.width /
                      (mediaQueryData.size.height / 1.9),
                ),
                itemBuilder: (context, index) {
                  return index >= state.portofolio!.items.items.length
                      ? UserPortofolioMyProfileBottomLoader()
                      : state.portofolio!.viewItem2(
                          state.portofolio!.items.items[index],
                          searchText!,
                          account,
                          widget.id!,
                          this);
                },
              ),
              onRefresh: _onRefresh,
            )
                /*
                  RefreshIndicator(
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int?  index) {

                        return index >= state.portofolio!.items.items.length
                            ?  UserPortofolioMyProfileBottomLoader()
                            : state.portofolio!.viewItem (state.portofolio!.items.items[index] , searchText , account, widget.id!);
                      },
                      itemCount: state.hasReachedMax!
                          ? state.portofolio!.items.items.length
                          : state.portofolio!.items.items.length + 1,
                      controller: scrollController,
                    ),
                    onRefresh: _onRefresh,
                  )

                       */
                );
          }
          return Scaffold(
            body: RefreshIndicator(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: state.hasReachedMax!
                    ? state.portofolio!.items.items.length
                    : state.portofolio!.items.items.length + 1,
                controller: scrollController,
                physics: AlwaysScrollableScrollPhysics(),
                // padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 2.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  //mainAxisSpacing: 10,
                  //crossAxisSpacing: 10,
                  //childAspectRatio: 0.9,
                  childAspectRatio: mediaQueryData.size.width /
                      (mediaQueryData.size.height / 1.9),
                ),
                itemBuilder: (context, index) {
                  return index >= state.portofolio!.items.items.length
                      ? UserPortofolioMyProfileBottomLoader()
                      : state.portofolio!.viewItem2(
                          state.portofolio!.items.items[index],
                          searchText!,
                          account,
                          widget.id!,
                          this);
                },
              ),
              onRefresh: _onRefresh,
            ),
            floatingActionButton: SpeedDial(
                childMargin:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                animatedIcon: AnimatedIcons.menu_close,
                animatedIconTheme: IconThemeData(size: 22.0),
                // this is ignored if animatedIcon is non null
                // child: Icon(Icons.add),
                visible: true,
                // If true user is forced to close dial manually
                // by tapping main button and overlay is not rendered.
                closeManually: false,
                curve: Curves.bounceIn,
                overlayColor: Colors.black,
                overlayOpacity: 0.5,
                onOpen: () => print('OPENING DIAL'),
                onClose: () => print('DIAL CLOSED'),
                tooltip: 'Speed Dial',
                heroTag: 'speed-dial-hero-tag',
                backgroundColor: CurrentTheme.MainAccentColor,
                foregroundColor: Colors.white,
                elevation: 8.0,
                shape: CircleBorder(),
                children: <SpeedDialChild>[
                  SpeedDialChild(
                    child: Icon(Icons.save),
                    backgroundColor: Colors.green,
                    label: 'Add',
                    labelStyle: TextStyle(fontSize: 18.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                rt.MyProfilePortofolioAddPortofolio(
                                    id: '',
                                    title: '',
                                    url: urlToRoute(
                                        '/user/my_profile/portofolio_add_portofolio/' +
                                            widget.id! +
                                            '/zzz'))),
                      ).then((value) {
                        setState(() {});
                      });
                      //AppProvider.getRouter(context)!.navigateTo(context, urlToRoute('/user/my_profile/portofolio_add_portofolio/'+widget.id! + '/zzz'));
                    },
                  )
                ]),
          );
        }

        return Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ));
      },
    );
  }

  @override
  void dispose() {
    portofolio!.listingPortofolio!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = Completer<Null>();
    portofolio!.listingPortofolio!.add(PortofolioMyProfileListingRefresh());

    Timer timer = Timer(Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    cs.value = currentScroll;
    if (maxScroll - currentScroll <= scrollThreshold) {
      portofolio!.listingPortofolio!.add(PortofolioMyProfileList());
    }
  }
}

class UserPortofolioMyProfileBottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}

/////////////////////////

// EDIT DISPLAYNAME

class EditDisplayName extends StatefulWidget {
  ViewModelMyProfileRev? model;
  bool progresscircular = false;
  EditDisplayName({Key? key, this.model}) : super(key: key);

  @override
  EditDisplayNameState createState() {
    return EditDisplayNameState();
  }
}

class EditDisplayNameState extends State<EditDisplayName> {
  MyProfileController? my_profile;

  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  String? errormessage = 'Upload your Image.';

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // key: _scaffoldKey,
        extendBody: true,
        body: Form(
          key: formKey,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 100),
                child: DisplayNameWidget(
                  value: widget.model!.display_name,
                  caption: 'Display Name',
                  hint: 'Isi dengan Display Name Anda',
                  required: true,
                  getValue: (String? val) {
                    print('value===$val');
                    setState(() {
                      widget.model!.display_name = val!;
                    });
                  },
                ),
              ),
              Align(
                alignment: Alignment(-0.9, -0.9),
                child: IconButton(
                  iconSize: 40.0,
                  color: Colors.white,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              widget.progresscircular
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ))
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    ),
              Positioned.fill(
                top: size.height - 180,
                left: 0.0,
                right: 0.0,
                child: editNavigationBar(context, widget.model!,
                    'Ubah display name Anda', this, formKey),
              )
            ],
          ),
        ));
  }
}
////////////////////////

// EDIT BIRTHDAY

class EditBirthday extends StatefulWidget {
  ViewModelMyProfileRev? model;
  bool progresscircular = false;
  EditBirthday({Key? key, this.model}) : super(key: key);

  @override
  EditBirthdayState createState() {
    return EditBirthdayState();
  }
}

class EditBirthdayState extends State<EditBirthday> {
  MyProfileController? my_profile;

  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  String? errormessage = 'Upload your Image.';

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // key: _scaffoldKey,
        extendBody: true,
        body: Form(
          key: formKey,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 100),
                child: DateWidget(
                  value: widget.model!.birth_date,
                  caption: 'Tanggal lahir',
                  hint: 'isi dengan tanggal lahir diatas.',
                  required: true,
                  getValue: (DateTime val) {
                    setState(() {
                      widget.model!.birth_date = val!;
                    });
                  },
                ),
              ),
              Align(
                alignment: Alignment(-0.9, -0.9),
                child: IconButton(
                  iconSize: 40.0,
                  color: Colors.white,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              widget.progresscircular
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ))
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    ),
              Positioned.fill(
                top: size.height - 180,
                left: 0.0,
                right: 0.0,
                child: editNavigationBar(context, widget.model!,
                    'Ubah Tanggal lahir Anda', this, formKey),
              )
            ],
          ),
        ));
  }
}

////////////////////////

// EDIT KELAMIN

class EditSex extends StatefulWidget {
  ViewModelMyProfileRev? model;
  bool progresscircular = false;
  EditSex({Key? key, this.model}) : super(key: key);

  @override
  EditSexState createState() {
    return EditSexState();
  }
}

class EditSexState extends State<EditSex> {
  MyProfileController? my_profile;

  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  String? errormessage = 'Upload your Image.';

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // key: _scaffoldKey,
        extendBody: true,
        body: Form(
          key: formKey,
          child: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 100),
                  child: EnumWidget(
                    value: widget.model!.jenis_kelamin_id,
                    caption: 'Jenis Kelamin',
                    hint: 'pilih Jenis Kelamin',
                    required: true,
                    idenum: [1, 2],
                    nameenum: ['Pria', 'Wanita'],
                    getValue: (int? val) {
                      ;
                      setState(() {
                        widget.model!.jenis_kelamin_id = val!;
                      });
                    },
                  )),
              Align(
                alignment: Alignment(-0.9, -0.9),
                child: IconButton(
                  iconSize: 40.0,
                  color: Colors.white,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              widget.progresscircular
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ))
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    ),
              Positioned.fill(
                top: size.height - 180,
                left: 0.0,
                right: 0.0,
                child: editNavigationBar(context, widget.model!,
                    'Jenis Kelamin Anda', this, formKey),
              )
            ],
          ),
        ));
  }
}

////////////////////////

// EDIT WEBSITE

class EditWebsite extends StatefulWidget {
  ViewModelMyProfileRev? model;
  bool progresscircular = false;
  EditWebsite({Key? key, this.model}) : super(key: key);

  @override
  EditWebsiteState createState() {
    return EditWebsiteState();
  }
}

class EditWebsiteState extends State<EditWebsite> {
  MyProfileController? my_profile;

  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  String? errormessage = 'Upload your Image.';

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // key: _scaffoldKey,
        extendBody: true,
        body: Form(
          key: formKey,
          child: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 100),
                  child: WebsiteWidget(
                    value: widget.model!.website,
                    caption: 'Website',
                    hint: 'Isi dengan Website Anda',
                    required: true,
                    getValue: (String? val) {
                      setState(() {
                        widget.model!.website = val!;
                      });
                    },
                  )),
              Align(
                alignment: Alignment(-0.9, -0.9),
                child: IconButton(
                  iconSize: 40.0,
                  color: Colors.white,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              widget.progresscircular
                  ? const Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ))
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    ),
              Positioned.fill(
                top: size.height - 180,
                left: 0.0,
                right: 0.0,
                child: editNavigationBar(
                    context, widget.model!, 'Ubah website Anda', this, formKey),
              )
            ],
          ),
        ));
  }
}

////////////////////////

// EDIT SKILLS

class EditSkills extends StatefulWidget {
  ViewModelMyProfileRev? model;
  bool progresscircular = false;
  List<int?>? listskillsid;
  List<String?>? listskillsstr;
  EditSkills({Key? key, this.model, this.listskillsid, this.listskillsstr})
      : super(key: key);

  @override
  EditSkillsState createState() {
    return EditSkillsState();
  }
}

class EditSkillsState extends State<EditSkills> {
  MyProfileController? my_profile;

  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  String? errormessage = 'Upload your Image.';

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // key: _scaffoldKey,
        extendBody: true,
        body: Form(
          key: formKey,
          child: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 100),
                  child: InlineTagsWidget(
                    value: widget.model!.skills_id,
                    caption: 'Inline Tags',
                    hint: ' ',
                    required: true,
                    idtags: widget.listskillsid,
                    nametags: widget.listskillsstr,
                    getValue: (List<int?>? val) {
                      setState(() {
                        widget.model!.skills_id!.addAll(val!);
                      });
                    },
                    removeValue: (int? val) {
                      setState(() {
                        widget.model!.skills_id!.remove(val!);
                      });
                    },
                  )),
              Align(
                alignment: Alignment(-0.9, -0.9),
                child: IconButton(
                  iconSize: 40.0,
                  color: Colors.white,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              widget.progresscircular
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ))
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    ),
              Positioned.fill(
                top: size.height - 180,
                left: 0.0,
                right: 0.0,
                child: editNavigationBar(
                    context, widget.model!, 'Ubah Skills Anda', this, formKey),
              )
            ],
          ),
        ));
  }
}

////////////////////////

// EDIT COUNTRY

class EditCountry extends StatefulWidget {
  ViewModelMyProfileRev? model;
  bool progresscircular = false;
  EditCountry({Key? key, this.model}) : super(key: key);

  @override
  EditCountryState createState() {
    return EditCountryState();
  }
}

class EditCountryState extends State<EditCountry> {
  MyProfileController? my_profile;

  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  String? errormessage = 'Upload your Image.';

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // key: _scaffoldKey,
        extendBody: true,
        body: Form(
          key: formKey,
          child: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 100),
                  child: EnumWidget(
                    value: widget.model!.country_id,
                    caption: 'Negara',
                    hint: 'pilih Negara',
                    required: true,
                    idenum: Countrylistid,
                    nameenum: Countrylist,
                    getValue: (int? val) {
                      ;
                      setState(() {
                        widget.model!.country_id = val!;
                      });
                    },
                  )),
              Align(
                alignment: Alignment(-0.9, -0.9),
                child: IconButton(
                  iconSize: 40.0,
                  color: Colors.white,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              widget.progresscircular
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ))
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    ),
              Positioned.fill(
                top: size.height - 180,
                left: 0.0,
                right: 0.0,
                child: editNavigationBar(
                    context, widget.model!, 'Pilih negara Anda', this, formKey),
              )
            ],
          ),
        ));
  }
}

////////////////////////

// EDIT PROVINSI

class EditProvinsi extends StatefulWidget {
  ViewModelMyProfileRev? model;
  bool progresscircular = false;
  List<int?>? provinsilistid;
  List<String?>? provinsilistname;
  EditProvinsi(
      {Key? key, this.model, this.provinsilistid, this.provinsilistname})
      : super(key: key);

  @override
  EditProvinsiState createState() {
    return EditProvinsiState();
  }
}

class EditProvinsiState extends State<EditProvinsi> {
  MyProfileController? my_profile;

  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  String? errormessage = 'Upload your Image.';

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // key: _scaffoldKey,
        extendBody: true,
        body: Form(
          key: formKey,
          child: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 100),
                  child: EnumWidget(
                    value: widget.provinsilistid!.length <=
                            widget.model!.provinsi_id!
                        ? 0
                        : widget.model!.provinsi_id,
                    caption: 'Provinsi',
                    hint: 'pilih Provinsi',
                    required: true,
                    idenum: widget.provinsilistid,
                    nameenum: widget.provinsilistname,
                    getValue: (int? val) {
                      ;
                      setState(() {
                        widget.model!.provinsi_id = val!;
                      });
                    },
                  )),
              Align(
                alignment: Alignment(-0.9, -0.9),
                child: IconButton(
                  iconSize: 40.0,
                  color: Colors.white,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              widget.progresscircular
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ))
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    ),
              Positioned.fill(
                top: size.height - 180,
                left: 0.0,
                right: 0.0,
                child: editNavigationBar(context, widget.model!,
                    'Pilih Provinsi Anda', this, formKey),
              )
            ],
          ),
        ));
  }
}

////////////////////////

// EDIT KABUPATEN

class EditKabupaten extends StatefulWidget {
  ViewModelMyProfileRev? model;
  bool progresscircular = false;
  List<int?>? kabupatenlistid;
  List<String?>? kabupatenlistname;
  EditKabupaten(
      {Key? key, this.model, this.kabupatenlistid, this.kabupatenlistname})
      : super(key: key);

  @override
  EditKabupatenState createState() {
    return EditKabupatenState(this.model);
  }
}

class EditKabupatenState extends State<EditKabupaten> {
  MyProfileController? my_profile;
  ViewModelMyProfileRev? model;
  EditKabupatenState(model) {
    firstid = model!.kabupaten_id;
  }

  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  String? errormessage = 'Upload your Image.';
  int? firstid;

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // key: _scaffoldKey,
        extendBody: true,
        body: Form(
          key: formKey,
          child: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 100),
                  child: EnumWidget(
                    value: widget.model!.kabupaten_id,
                    caption: 'Kabupaten',
                    hint: 'pilih Kabupaten',
                    required: true,
                    idenum: widget.kabupatenlistid,
                    nameenum: widget.kabupatenlistname,
                    getValue: (int? val) {
                      setState(() {
                        widget.model!.kabupaten_id = val!;
                      });
                    },
                  )),
              Align(
                alignment: Alignment(-0.9, -0.9),
                child: IconButton(
                  iconSize: 40.0,
                  color: Colors.white,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.model!.kabupaten_id = firstid;
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
              widget.progresscircular
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ))
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    ),
              Positioned.fill(
                top: size.height - 180,
                left: 0.0,
                right: 0.0,
                child: editNavigationBar(context, widget.model!,
                    'Pilih Kabupaten Anda', this, formKey),
              )
            ],
          ),
        ));
  }
}

////////////////////////

// EDIT KECAMATAN

class EditKecamatan extends StatefulWidget {
  ViewModelMyProfileRev? model;
  bool progresscircular = false;
  List<int?>? kecamatanlistid;
  List<String?>? kecamatanlistname;
  EditKecamatan(
      {Key? key, this.model, this.kecamatanlistid, this.kecamatanlistname})
      : super(key: key);

  @override
  EditKecamatanState createState() {
    return EditKecamatanState();
  }
}

class EditKecamatanState extends State<EditKecamatan> {
  MyProfileController? my_profile;

  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  String? errormessage = 'Upload your Image.';

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // key: _scaffoldKey,
        extendBody: true,
        body: Form(
          key: formKey,
          child: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 100),
                  child: EnumWidget(
                    value: widget.kecamatanlistid!.length <=
                            widget.model!.kecamatan_id!
                        ? 0
                        : widget.model!.kecamatan_id,
                    caption: 'Kecamatan',
                    hint: 'pilih Kecamatan',
                    required: true,
                    idenum: widget.kecamatanlistid,
                    nameenum: widget.kecamatanlistname,
                    getValue: (int? val) {
                      ;
                      setState(() {
                        widget.model!.kecamatan_id = val!;
                      });
                    },
                  )),
              Align(
                alignment: Alignment(-0.9, -0.9),
                child: IconButton(
                  iconSize: 40.0,
                  color: Colors.white,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              widget.progresscircular
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ))
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    ),
              Positioned.fill(
                top: size.height - 180,
                left: 0.0,
                right: 0.0,
                child: editNavigationBar(context, widget.model!,
                    'Pilih Kecamatan Anda', this, formKey),
              )
            ],
          ),
        ));
  }
}

////////////////////////

// EDIT KELURAHAN

class EditKelurahan extends StatefulWidget {
  ViewModelMyProfileRev? model;
  bool progresscircular = false;
  List<int?>? kelurahanlistid;
  List<String?>? kelurahanlistname;
  EditKelurahan(
      {Key? key, this.model, this.kelurahanlistid, this.kelurahanlistname})
      : super(key: key);

  @override
  EditKelurahanState createState() {
    return EditKelurahanState();
  }
}

class EditKelurahanState extends State<EditKelurahan> {
  MyProfileController? my_profile;

  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  String? errormessage = 'Upload your Image.';

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // key: _scaffoldKey,
        extendBody: true,
        body: Form(
          key: formKey,
          child: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 100),
                  child: EnumWidget(
                    value: widget.kelurahanlistid!.length <=
                            widget.model!.kelurahan_id!
                        ? 0
                        : widget.model!.kelurahan_id,
                    caption: 'Kelurahan',
                    hint: 'pilih Kelurahan',
                    required: true,
                    idenum: widget.kelurahanlistid,
                    nameenum: widget.kelurahanlistname,
                    getValue: (int? val) {
                      ;
                      setState(() {
                        widget.model!.kelurahan_id = val!;
                      });
                    },
                  )),
              Align(
                alignment: Alignment(-0.9, -0.9),
                child: IconButton(
                  iconSize: 40.0,
                  color: Colors.white,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              widget.progresscircular
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ))
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    ),
              Positioned.fill(
                top: size.height - 180,
                left: 0.0,
                right: 0.0,
                child: editNavigationBar(context, widget.model!,
                    'Pilih Kelurahan Anda', this, formKey),
              )
            ],
          ),
        ));
  }
}

////////////////////////

// EDIT ADDRESS

class EditAddress extends StatefulWidget {
  ViewModelMyProfileRev? model;
  bool progresscircular = false;
  EditAddress({Key? key, this.model}) : super(key: key);

  @override
  EditAddressState createState() {
    return EditAddressState();
  }
}

class EditAddressState extends State<EditAddress> {
  MyProfileController? my_profile;

  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  String? errormessage = 'Upload your Image.';

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // key: _scaffoldKey,
        extendBody: true,
        body: Form(
          key: formKey,
          child: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 100),
                  child: AddressWidget(
                    value: widget.model!.address,
                    caption: 'Address',
                    hint: 'Isi dengan Address Anda',
                    required: true,
                    getValue: (String? val) {
                      setState(() {
                        widget.model!.address = val!;
                      });
                    },
                  )),
              Align(
                alignment: Alignment(-0.9, -0.9),
                child: IconButton(
                  iconSize: 40.0,
                  color: Colors.white,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              widget.progresscircular
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ))
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    ),
              Positioned.fill(
                top: size.height - 180,
                left: 0.0,
                right: 0.0,
                child: editNavigationBar(
                    context, widget.model!, 'Ubah address Anda', this, formKey),
              )
            ],
          ),
        ));
  }
}

////////////////////////

// EDIT POSTCODE

class EditPostcode extends StatefulWidget {
  ViewModelMyProfileRev? model;
  bool progresscircular = false;
  EditPostcode({Key? key, this.model}) : super(key: key);

  @override
  EditPostcodeState createState() {
    return EditPostcodeState();
  }
}

class EditPostcodeState extends State<EditPostcode> {
  MyProfileController? my_profile;

  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  String? errormessage = 'Upload your Image.';

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // key: _scaffoldKey,
        extendBody: true,
        body: Form(
          key: formKey,
          child: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 100),
                  child: DisplayNameWidget(
                    value: widget.model!.post_code,
                    caption: 'Postcode',
                    hint: 'Isi dengan Postcode Anda',
                    required: true,
                    getValue: (String? val) {
                      setState(() {
                        widget.model!.post_code = val!;
                      });
                    },
                  )),
              Align(
                alignment: Alignment(-0.9, -0.9),
                child: IconButton(
                  iconSize: 40.0,
                  color: Colors.white,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              widget.progresscircular
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ))
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    ),
              Positioned.fill(
                top: size.height - 180,
                left: 0.0,
                right: 0.0,
                child: editNavigationBar(context, widget.model!,
                    'Ubah postcode Anda', this, formKey),
              )
            ],
          ),
        ));
  }
}

////////////////////////

// EDIT INTRO

class EditIntro extends StatefulWidget {
  ViewModelMyProfileRev? model;
  bool progresscircular = false;
  EditIntro({Key? key, this.model}) : super(key: key);

  @override
  EditIntroState createState() {
    return EditIntroState();
  }
}

class EditIntroState extends State<EditIntro> {
  MyProfileController? my_profile;

  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  String? errormessage = 'Upload your Image.';

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // key: _scaffoldKey,
        extendBody: true,
        body: Form(
          key: formKey,
          child: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 100),
                  child: ArticleWidget(
                    value: widget.model!.self_introduction,
                    caption: 'Intro',
                    hint: 'Isi dengan Intro Anda',
                    required: true,
                    getValue: (String? val) {
                      setState(() {
                        widget.model!.self_introduction = val!;
                      });
                    },
                  )),
              Align(
                alignment: Alignment(-0.9, -0.9),
                child:

                    /*
                GFButtonBar(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,

                children: <Widget>[
                  this.model!.model!.finish_date == null ? Container(width: 0.0, height: 0.0,) : GFButton(
                    onPressed: () {
                      AppProvider.getRouter(context)!.navigateTo(
                          context,
                          urlToRoute(this.model!.model!.accepted_worker_url ));
                    },
                    text: 'Cancel',
                  ),
                  GFButton(
                    onPressed: () {
                      AppProvider.getRouter(context)!.navigateTo(
                          context,
                          urlToRoute(this.model!.model!.owner_url  ));
                    },
                    text: 'Done',
                  ),
                ],
              ),
                    */
                    IconButton(
                  iconSize: 40.0,
                  color: Colors.white,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              widget.progresscircular
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ))
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    ),
              Positioned.fill(
                top: size.height - 180,
                left: 0.0,
                right: 0.0,
                child: editNavigationBar(context, widget.model!,
                    'Ubah pengenalan diri Anda', this, formKey),
              )
            ],
          ),
        ));
  }
}

////////////////////////

// EDIT NOTIFY PROJECTS

class EditNotifyProjects extends StatefulWidget {
  ViewModelMyProfileRev? model;
  bool progresscircular = false;
  EditNotifyProjects({Key? key, this.model}) : super(key: key);

  @override
  EditNotifyProjectsState createState() {
    return EditNotifyProjectsState();
  }
}

class EditNotifyProjectsState extends State<EditNotifyProjects> {
  MyProfileController? my_profile;

  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  String? errormessage = 'Upload your Image.';

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // key: _scaffoldKey,
        extendBody: true,
        body: Form(
          key: formKey,
          child: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 100),
                  child: BooleanWidget(
                    value: widget.model!.notify_projects,
                    caption: 'NotifyProjects',
                    hint: 'Isi dengan NotifyProjects Anda',
                    required: true,
                    getValue: (bool val) {
                      setState(() {
                        widget.model!.notify_projects = val!;
                      });
                    },
                  )),
              Align(
                alignment: Alignment(-0.9, -0.9),
                child: IconButton(
                  iconSize: 40.0,
                  color: Colors.white,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              widget.progresscircular
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ))
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    ),
              Positioned.fill(
                top: size.height - 180,
                left: 0.0,
                right: 0.0,
                child: editNavigationBar(context, widget.model!,
                    'Ubah pemberitahuan projetcs Anda', this, formKey),
              )
            ],
          ),
        ));
  }
}

/////////////////////////
Widget editNavigationBar(BuildContext context, ViewModelMyProfileRev model,
    String? ft, State st, var formKey) {
  MyProfileController my_profile;
  String? sendPath = Env.value!.baseUrl! +
      '/user/my_profile/edit_profile/' +
      model!.user_id! +
      '/';
  // var formData ;
  var postMyProfileResult;
  Photo foto1;
  Photo foto2;
  return Container(
    color: Colors.transparent,
    height: 300.0,
    width: double.infinity,
    child: Column(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(ft!),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0, top: 30.0),
              child: GFButtonBar(
                alignment: WrapAlignment.end,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: <Widget>[
                  GFButton(
                    color: CurrentTheme.SecondaryColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Cancel',
                  ),
                  GFButton(
                    color: CurrentTheme.SecondaryColor,
                    onPressed: () async {
                      //st.setState(() {

                      //});

                      if (formKey.currentState.validate()) {
                        // print('name===${foto1.file}');
                        var formData = await convertFormDataEdit(
                            'usr' + model!.user_id!, model);
                        my_profile = MyProfileController(
                            AppProvider.getApplication(context),
                            sendPath,
                            AppAction.post,
                            model!.user_id!,
                            '',
                            formData,
                            false);

                        final future = my_profile.postMyProfile();
                        future.then((value) {
                          // setState(() {
                          postMyProfileResult = value;
                          //  Navigator.pushAndRemoveUntil(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => UserMyProfileView()),
                          //       (Route<dynamic> route) => false,
                          // );
                          //AppProvider.getRouter(context)!.pop(context);
                          // });
                          //  print('postMyProfileResult === $postMyProfileResult');
                          // _showToast(context, '$postMyProfileResult');
                        }).catchError((Error) {
                          // Navigator.pushAndRemoveUntil(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => UserMyProfileView()),
                          //       (Route<dynamic> route) => false,
                          //  );
                          //AppProvider.getRouter(context)!.pop(context);
                          // setState(() {
                          //   progresscircular = false;
                          // });
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => rt.UserMyProfileView()),
                            (Route<dynamic> route) => false,
                          );
                          /* if(isPhoto){
                  AppProvider.getRouter(context)!.pop(context);
                  AppProvider.getRouter(context)!.pop(context);
                  AppProvider.getRouter(context)!.pop(context);
                }else{
                  AppProvider.getRouter(context)!.pop(context);
                  AppProvider.getRouter(context)!.pop(context);
                    Navigator.pushAndRemoveUntil(
                     context,
                     MaterialPageRoute(builder: (context) => UserMyProfileView()),
                         (Route<dynamic> route) => false,
                   );
                } */

                          //
                        });
                      }
                    },
                    text: 'Done',
                  ),
                ],
              ),
            ),
          ],
        ),

        /*

        IconButton(
          iconSize: 60.0 ,
          padding: EdgeInsets.all(0),
          icon: Icon(Icons.send,

            // size: 80.0,
            color:Colors.black54,
          ),
          onPressed: ()async{
            //st.setState(() {

            //});

            if (formKey.currentState.validate()) {
            // print('name===${foto1.file}');
            var formData = await convertFormDataEdit( 'usr' + model!.user_id!, model);
            my_profile = MyProfileController(
                AppProvider.getApplication(context),
                sendPath,
                AppAction.post,
                model!.user_id!,
                '',
                formData,
                false);

            final future = my_profile.postMyProfile();
            future.then((value) {
              // setState(() {
              postMyProfileResult = value;
              //  Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(builder: (context) => UserMyProfileView()),
              //       (Route<dynamic> route) => false,
              // );
              //AppProvider.getRouter(context)!.pop(context);
              // });
              //  print('postMyProfileResult === $postMyProfileResult');
              // _showToast(context, '$postMyProfileResult');
            }).catchError((Error) {
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(builder: (context) => UserMyProfileView()),
              //       (Route<dynamic> route) => false,
              //  );
              //AppProvider.getRouter(context)!.pop(context);
              // setState(() {
              //   progresscircular = false;
              // });
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => UserMyProfileView()),
                    (Route<dynamic> route) => false,
              );
              /* if(isPhoto){
                  AppProvider.getRouter(context)!.pop(context);
                  AppProvider.getRouter(context)!.pop(context);
                  AppProvider.getRouter(context)!.pop(context);
                }else{
                  AppProvider.getRouter(context)!.pop(context);
                  AppProvider.getRouter(context)!.pop(context);
                    Navigator.pushAndRemoveUntil(
                     context,
                     MaterialPageRoute(builder: (context) => UserMyProfileView()),
                         (Route<dynamic> route) => false,
                   );
                } */


              //
            });
            }
          },
        ),

         */
      ],
    ),
  );
}
/////////////////////////

class MyProfileListingModel extends MyProfileListingBase {
  Map<String, dynamic> json;
  MyProfileListingModel(Map<String, dynamic> this.json) : super(json);
}

//class ItemMyProfile extends class ItemMyProfileBase{
//
//}

////////////////////////////
List<String?>? Countrylist = [
  "Afghanistan",
  "�land Islands",
  "Albania",
  "Algeria",
  "American Samoa",
  "Andorra",
  "Angola",
  "Anguilla",
  "Antarctica",
  "Antigua and Barbuda",
  "Argentina",
  "Armenia",
  "Aruba",
  "Australia",
  "Austria",
  "Azerbaijan",
  "Bahamas",
  "Bahrain",
  "Bangladesh",
  "Barbados",
  "Belarus",
  "Belgium",
  "Belize",
  "Benin",
  "Bermuda",
  "Bhutan",
  "Bolivia, Plurinational State of",
  "Bonaire, Sint?  Eustatius and Saba",
  "Bosnia and Herzegovina",
  "Botswana",
  "Bouvet Island",
  "Brazil",
  "British Indian Ocean Territory",
  "Brunei Darussalam",
  "Bulgaria",
  "Burkina Faso",
  "Burundi",
  "Cambodia",
  "Cameroon",
  "Canada",
  "Cape Verde",
  "Cayman Islands",
  "Central African Republic",
  "Chad",
  "Chile",
  "China",
  "Christmas Island",
  "Cocos (Keeling) Islands",
  "Colombia",
  "Comoros",
  "Congo",
  "Congo, the Democratic Republic of the",
  "Cook Islands",
  "Costa Rica",
  "C�te d'Ivoire",
  "Croatia",
  "Cuba",
  "Cura�ao",
  "Cyprus",
  "Czech Republic",
  "Denmark",
  "Djibouti",
  "Dominica",
  "Dominican Republic",
  "Ecuador",
  "Egypt",
  "El Salvador",
  "Equatorial Guinea",
  "Eritrea",
  "Estonia",
  "Ethiopia",
  "Falkland Islands (Malvinas)",
  "Faroe Islands",
  "Fiji",
  "Finland",
  "France",
  "French Guiana",
  "French Polynesia",
  "French Southern Territories",
  "Gabon",
  "Gambia",
  "Georgia",
  "Germany",
  "Ghana",
  "Gibraltar",
  "Greece",
  "Greenland",
  "Grenada",
  "Guadeloupe",
  "Guam",
  "Guatemala",
  "Guernsey",
  "Guinea",
  "Guinea-Bissau",
  "Guyana",
  "Haiti",
  "Heard Island and McDonald Islands",
  "Holy See (Vatican City State)",
  "Honduras",
  "Hong Kong",
  "Hungary",
  "Iceland",
  "India",
  "Indonesia",
  "Iran, Islamic Republic of",
  "Iraq",
  "Ireland",
  "Isle of Man",
  "Israel",
  "Italy",
  "Jamaica",
  "Japan",
  "Jersey",
  "Jordan",
  "Kazakhstan",
  "Kenya",
  "Kiribati",
  "Korea, Democratic People's Republic of",
  "Korea, Republic of",
  "Kuwait",
  "Kyrgyzstan",
  "Lao People's Democratic Republic",
  "Latvia",
  "Lebanon",
  "Lesotho",
  "Liberia",
  "Libyan Arab Jamahiriya",
  "Liechtenstein",
  "Lithuania",
  "Luxembourg",
  "Macao",
  "Macedonia, the former Yugoslav Republic of",
  "Madagascar",
  "Malawi",
  "Malaysia",
  "Maldives",
  "Mali",
  "Malta",
  "Marshall Islands",
  "Martinique",
  "Mauritania",
  "Mauritius",
  "Mayotte",
  "Mexico",
  "Micronesia, Federated States of",
  "Moldova, Republic of",
  "Monaco",
  "Mongolia",
  "Montenegro",
  "Montserrat",
  "Morocco",
  "Mozambique",
  "Myanmar",
  "Namibia",
  "Nauru",
  "Nepal",
  "Netherlands",
  "New Caledonia",
  "New Zealand",
  "Nicaragua",
  "Niger",
  "Nigeria",
  "Niue",
  "Norfolk Island",
  "Northern Mariana Islands",
  "Norway",
  "Oman",
  "Pakistan",
  "Palau",
  "Palestinian Territory, Occupied",
  "Panama",
  "Papua New Guinea",
  "Paraguay",
  "Peru",
  "Philippines",
  "Pitcairn",
  "Poland",
  "Portugal",
  "Puerto Rico",
  "Qatar",
  "R�union",
  "Romania",
  "Russian Federation",
  "Rwanda",
  "Saint?  Barth�lemy",
  "Saint?  Helena, Ascension and Tristan da Cunha",
  "Saint?  Kitts and Nevis",
  "Saint?  Lucia",
  "Saint?  Martin (French part)",
  "Saint?  Pierre and Miquelon",
  "Saint?  Vincent and the Grenadines",
  "Samoa",
  "San Marino",
  "Sao Tome and Principe",
  "Saudi Arabia",
  "Senegal",
  "Serbia",
  "Seychelles",
  "Sierra Leone",
  "Singapore",
  "Sint?  Maarten (Dutch part)",
  "Slovakia",
  "Slovenia",
  "Solomon Islands",
  "Somalia",
  "South Africa",
  "South Georgia and the South Sandwich Islands",
  "South Sudan",
  "Spain",
  "Sri Lanka",
  "Sudan",
  "Suriname",
  "Svalbard and Jan Mayen",
  "Swaziland",
  "Sweden",
  "Switzerland",
  "Syrian Arab Republic",
  "Taiwan, Province of China",
  "Tajikistan",
  "Tanzania, United Republic of",
  "Thailand",
  "Timor-Leste",
  "Togo",
  "Tokelau",
  "Tonga",
  "Trinidad and Tobago",
  "Tunisia",
  "Turkey",
  "Turkmenistan",
  "Turks and Caicos Islands",
  "Tuvalu",
  "Uganda",
  "Ukraine",
  "United Arab Emirates",
  "United Kingdom",
  "United States",
  "United States Minor Outlying Islands",
  "Uruguay",
  "Uzbekistan",
  "Vanuatu",
  "Venezuela, Bolivarian Republic of",
  "Viet Nam",
  "Virgin Islands, British",
  "Virgin Islands, U.S.",
  "Wallis and Futuna",
  "Western Sahara",
  "Yemen",
  "Zambia",
  "Zimbabwe"
];
List<int> Countrylistid = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29,
  30,
  31,
  32,
  33,
  34,
  35,
  36,
  37,
  38,
  39,
  40,
  41,
  42,
  43,
  44,
  45,
  46,
  47,
  48,
  49,
  50,
  51,
  52,
  53,
  54,
  55,
  56,
  57,
  58,
  59,
  60,
  61,
  62,
  63,
  64,
  65,
  66,
  67,
  68,
  69,
  70,
  71,
  72,
  73,
  74,
  75,
  76,
  77,
  78,
  79,
  80,
  81,
  82,
  83,
  84,
  85,
  86,
  87,
  88,
  89,
  90,
  91,
  92,
  93,
  94,
  95,
  96,
  97,
  98,
  99,
  100,
  101,
  102,
  103,
  104,
  105,
  106,
  107,
  108,
  109,
  110,
  111,
  112,
  113,
  114,
  115,
  116,
  117,
  118,
  119,
  120,
  121,
  122,
  123,
  124,
  125,
  126,
  127,
  128,
  129,
  130,
  131,
  132,
  133,
  134,
  135,
  136,
  137,
  138,
  139,
  140,
  141,
  142,
  143,
  144,
  145,
  146,
  147,
  148,
  149,
  150,
  151,
  152,
  153,
  154,
  155,
  156,
  157,
  158,
  159,
  160,
  161,
  162,
  163,
  164,
  165,
  166,
  167,
  168,
  169,
  170,
  171,
  172,
  173,
  174,
  175,
  176,
  177,
  178,
  179,
  180,
  181,
  182,
  183,
  184,
  185,
  186,
  187,
  188,
  189,
  190,
  191,
  192,
  193,
  194,
  195,
  196,
  197,
  198,
  199,
  200,
  201,
  202,
  203,
  204,
  205,
  206,
  207,
  208,
  209,
  210,
  211,
  212,
  213,
  214,
  215,
  216,
  217,
  218,
  219,
  220,
  221,
  222,
  223,
  224,
  225,
  226,
  227,
  228,
  229,
  230,
  231,
  232,
  233,
  234,
  235,
  236,
  237,
  238,
  239,
  240,
  241,
  242,
  243,
  244,
  245,
  246,
  247,
  248,
  249
];
