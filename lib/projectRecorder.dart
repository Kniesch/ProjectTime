import 'package:flutter/material.dart';
import 'iconTextButton.dart';

import 'singletons/activeProject.dart';

class ProjectRecorder extends StatefulWidget{
  @override
  ProjectRecorderState createState() => ProjectRecorderState();
}

class ProjectRecorderState extends State<ProjectRecorder> {
  
  final _projectNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose () {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _projectNameController.dispose();
    super.dispose();
  }

  void updateActiveProject (String projectName) {
    if (_formKey.currentState.validate()) {
      activeProject.projectName = projectName;
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }
  }

  void stopActiveProject () {
    activeProject.projectName = '';
  }

  Widget build(BuildContext context) {

    Color color;// = Theme.of(context).primaryColor;
    
    return GestureDetector (
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Column(
        verticalDirection: VerticalDirection.up,
        children: <Widget>[
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          autocorrect: false,
                          controller: _projectNameController,
                          decoration: InputDecoration(
                            labelText: 'Project name',
                            helperMaxLines: 1,
                            helperText: ' ',
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(15.0),
                              borderSide: new BorderSide(),
                              gapPadding: 10,
                            )
                          ),
                          keyboardType: TextInputType.phone,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value.isEmpty && activeProject.projectName.isEmpty) {
                              return 'Please enter your project name!';
                            }
                            if (value.toString() == activeProject.projectName) {
                              return 'Project is already started!';
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            updateActiveProject(value);                 
                          },
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: IconTextButton(
                            onPressed: () {
                              updateActiveProject(_projectNameController.text);
                            },
                            color: color,
                            icon: Icons.play_arrow,
                            label: 'START',
                          ),
                        ),
                        Expanded(
                          child: IconTextButton(
                            onPressed: () {
                              stopActiveProject();
                            },
                            color: color,
                            icon: Icons.stop,
                            label: 'STOP',
                          ),
                        ),
                      ],
                    ),
                  )
                ]
              ),
            ),
          ),
          //listSelection,
          //activeProject,
        ],
      )
    );
  }
}