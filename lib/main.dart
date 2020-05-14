// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:projecttime/views/projectRecorder.dart';
import 'package:projecttime/views/taskList.dart';

void main() => runApp(ProjectTimeApp());

class ProjectTimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ProjectTime',
        theme: ThemeData(
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          indicatorColor: Colors.grey[200],
        ),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Recorder',),
                  Tab(text: 'List',),
                ],
              ),
              title: Text('ProjectTime'),
            ),
            body: TabBarView(
              children: [
                ProjectRecorder(),
                TaskList(),
              ]),
          ),
        ),
    );
  }
}