class ActiveProject {
  //static final ActiveProject _activeProject = new ActiveProject._internal();

  int _id;
  String _projectName = '';
  DateTime _startTime;
  DateTime _stopTime;
  Duration _time;

  int get id => _id;
  String get projectName => _projectName;
  DateTime get startTime => _startTime;
  DateTime get stopTime => _stopTime;
  Duration get time => _time;

  set projectName(String newName) {
    if (newName.length <= 255) {
      this._projectName = newName;
    }
  }
  set startTime(DateTime newStart) {
    this._startTime = newStart;
  }
  set stopTime(DateTime newStop) {
    this._stopTime = newStop;
  }
  set time(Duration newTime) {
    this._time = newTime;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['ID'] = _id;
    }
    if (_projectName != null) {
      map['TASKNAME'] = _projectName;
    }
    else {
      map['TASKNAME'] = '';
    }
    if (_startTime != null) {
      map['STARTTIME'] = _startTime.toIso8601String();
    }
    else {
      map['STARTTIME'] = '';
    }
    if (_stopTime != null) {
      map['STOPTIME'] = _stopTime.toIso8601String();
    }
    else {
      map['STOPTIME'] = '';
    }
    if (_time != null) {
      map['TIMEDIF'] = _time.toString();
    }
    else {
      map['TIMEDIF'] = '';
    }
    return map;   
  }

  ActiveProject.fromMapObject(Map<String, dynamic> map) {
    this._id = map['ID'];
    this._projectName = map['TASKNAME'];
    String start = map['STARTTIME'];
    if (start != '') {
      this._startTime = DateTime.parse(start);
    }
    String stop = map['STOPTIME'];
    if (stop != '') {
      this._stopTime = DateTime.parse(stop);
    }
    if (this._startTime != null && this._stopTime != null) {
      this._time = this._startTime.difference(this._stopTime);
    }
  }

  ActiveProject({id, name, start, stop, time}) {
    
  }
}

//final activeProject = ActiveProject();