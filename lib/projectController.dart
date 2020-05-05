import 'package:flutter/material.dart';
import 'iconTextButton.dart';


class ProjectController extends StatefulWidget{
  @override
  ProjectControllerState createState() => ProjectControllerState();
}

class ProjectControllerState extends State<ProjectController> {
  final _formKey = GlobalKey<FormState>();
  final _projectNameController = TextEditingController();
  var _activeProject = '-';

  @override
  void dispose () {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _projectNameController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: _projectNameController,
                    autofocus: true,
                    decoration: const InputDecoration(
                      labelText: 'Project name',
                      hintText: 'Enter project name',
                      helperMaxLines: 1,
                      helperText: ' '
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your project name!';
                      }
                      if (value.toString() == _activeProject) {
                        return 'Project is already started!';
                      }
                      return null;
                    },
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Active project:',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      _activeProject,
                      maxLines: 1,
                      style: TextStyle(fontSize: 20),
                      ),
                  ],
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
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            _activeProject = _projectNameController.text;
                            _projectNameController.text = '';
                          });
                        }
                      },
                      color: color,
                      icon: Icons.play_arrow,
                      label: 'START',
                    ),
                  ),
                  Expanded(
                    child: IconTextButton(
                      onPressed: () {
                        setState(() {
                          _activeProject = '-';
                        });
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
    );
  }
}