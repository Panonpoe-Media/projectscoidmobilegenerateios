// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:projectscoid/i18n/projectscoid_messages_all.dart';

// Information about how this file relates to i18n/stock_messages_all.dart and how the i18n files
// were generated can be found in i18n/regenerate.md.

class ProjectscoidStrings {
  ProjectscoidStrings(Locale locale) : _localeName = locale.toString();

  final String _localeName;

  static Future<ProjectscoidStrings> load(Locale locale) {
    return initializeMessages(locale.toString())
        .then<ProjectscoidStrings>((Object _) {
      return ProjectscoidStrings(locale);
    });
  }

  static ProjectscoidStrings? of(BuildContext context) {
    return Localizations.of<ProjectscoidStrings>(context, ProjectscoidStrings);
  }

  String browserprojectstitle() {
    return Intl.message(
      'Browser Projects',
      name: 'browserprojectstitle',
      desc: 'Title for the Browser Projects',
      locale: _localeName,
    );
  }

  String browseruserstitle() => Intl.message(
    'Browser Users',
    name: 'browseruserstitle',
    desc: 'Title for the Browser Users',
    locale: _localeName,
  );

  String browserservicestitle() => Intl.message(
    'Browser Services',
    name: 'browserservicestitle',
    desc: 'Title for the Browser Services',
    locale: _localeName,
  );
}

class ProjectscoidLocalizationsDelegate extends LocalizationsDelegate<ProjectscoidStrings> {
  @override
  Future<ProjectscoidStrings> load(Locale locale) => ProjectscoidStrings.load(locale);

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'id' || locale.languageCode == 'en';

  @override
  bool shouldReload(ProjectscoidLocalizationsDelegate old) => false;
}
