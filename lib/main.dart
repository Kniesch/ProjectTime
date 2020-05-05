// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'projectController.dart';

void main() => runApp(ProjectTimeApp());

class ProjectTimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProjectTime',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'Recorder',),
                Tab(text: 'Analyzer',),
              ],
            ),
            title: Text('ProjectTime'),
          ),
          body: TabBarView(
            children: [
              projectRecorder,
              Icon(Icons.directions_transit),
            ]),
        ),
      ),
    );
  }

  final Widget projectRecorder = Column(
    verticalDirection: VerticalDirection.up,
    children: <Widget>[
      ProjectController(),
      listSelection,
    ],
  );

  static Widget listSelection = Expanded(
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('List1'),
        Text('List1'),
      ],
    ),
  );

}