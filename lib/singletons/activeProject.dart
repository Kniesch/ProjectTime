class ActiveProject {
  static final ActiveProject _activeProject = new ActiveProject._internal();

  String projectName;

  factory ActiveProject() {
    return _activeProject;
  }

  ActiveProject._internal();
}

final activeProject = ActiveProject();