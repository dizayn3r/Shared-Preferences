import 'package:shared_preferences_demo/models.dart';
import 'package:shared_preferences_demo/preferences_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _preferencesService = PreferencesService();

  final _usernameController = TextEditingController();
  var _selectedGender = Gender.FEMALE;
  var _selectedLanguages = Set<ProgrammingLanguage>();
  var _isEmployed = false;

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() async {
    final settings = await _preferencesService.getSettings();
    setState(() {
      _usernameController.text = settings.username;
      _selectedGender = settings.gender;
      _selectedLanguages = settings.programmingLanguages;
      _isEmployed = settings.isEmployed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('User Data'),
            bottom: TabBar(
              tabs: [
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: const Text('Submit Data'),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: const Text('Retrieve Data'),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              submit,
              retrieve,
            ],
          ),
        ),
      ),
    );
  }

  Widget get submit => ListView(
    children: [
      ListTile(
        title: TextField(
          controller: _usernameController,
          decoration: const InputDecoration(labelText: 'Username'),
        ),
      ),
      RadioListTile(
          title: const Text('Female'),
          value: Gender.FEMALE,
          groupValue: _selectedGender,
          onChanged: (newValue) =>
              setState(() => _selectedGender = newValue!)),
      RadioListTile(
          title: const Text('Male'),
          value: Gender.MALE,
          groupValue: _selectedGender,
          onChanged: (newValue) =>
              setState(() => _selectedGender = newValue!)),
      RadioListTile(
          title: const Text('Other'),
          value: Gender.OTHER,
          groupValue: _selectedGender,
          onChanged: (newValue) =>
              setState(() => _selectedGender = newValue!)),
      CheckboxListTile(
          title: const Text('Dart'),
          value: _selectedLanguages.contains(ProgrammingLanguage.DART),
          onChanged: (_) {
            setState(() {
              _selectedLanguages.contains(ProgrammingLanguage.DART)
                  ? _selectedLanguages.remove(ProgrammingLanguage.DART)
                  : _selectedLanguages.add(ProgrammingLanguage.DART);
            });
          }),
      CheckboxListTile(
          title: const Text('JavaScript'),
          value: _selectedLanguages
              .contains(ProgrammingLanguage.JAVASCRIPT),
          onChanged: (_) {
            setState(() {
              _selectedLanguages
                  .contains(ProgrammingLanguage.JAVASCRIPT)
                  ? _selectedLanguages
                  .remove(ProgrammingLanguage.JAVASCRIPT)
                  : _selectedLanguages
                  .add(ProgrammingLanguage.JAVASCRIPT);
            });
          }),
      CheckboxListTile(
          title: const Text('Kotlin'),
          value:
          _selectedLanguages.contains(ProgrammingLanguage.KOTLIN),
          onChanged: (_) {
            setState(() {
              _selectedLanguages.contains(ProgrammingLanguage.KOTLIN)
                  ? _selectedLanguages
                  .remove(ProgrammingLanguage.KOTLIN)
                  : _selectedLanguages.add(ProgrammingLanguage.KOTLIN);
            });
          }),
      CheckboxListTile(
          title: const Text('Swift'),
          value: _selectedLanguages.contains(ProgrammingLanguage.SWIFT),
          onChanged: (_) {
            setState(() {
              _selectedLanguages.contains(ProgrammingLanguage.SWIFT)
                  ? _selectedLanguages.remove(ProgrammingLanguage.SWIFT)
                  : _selectedLanguages.add(ProgrammingLanguage.SWIFT);
            });
          }),
      SwitchListTile(
          title: const Text('Is Employed'),
          value: _isEmployed,
          onChanged: (newValue) =>
              setState(() => _isEmployed = newValue)),
      TextButton(
          onPressed: _saveSettings, child: const Text('Save Settings'),)
    ],
  );

  Widget get retrieve => ListView(
    children: [
      ListTile(
        title: TextField(
          controller: _usernameController,
          decoration: const InputDecoration(labelText: 'Username'),
        ),
      ),
      RadioListTile(
          title: const Text('Female'),
          value: Gender.FEMALE,
          groupValue: _selectedGender,
          onChanged: (newValue) =>
              setState(() => _selectedGender = newValue!)),
      RadioListTile(
          title: const Text('Male'),
          value: Gender.MALE,
          groupValue: _selectedGender,
          onChanged: (newValue) =>
              setState(() => _selectedGender = newValue!)),
      RadioListTile(
          title: const Text('Other'),
          value: Gender.OTHER,
          groupValue: _selectedGender,
          onChanged: (newValue) =>
              setState(() => _selectedGender = newValue!)),
      CheckboxListTile(
          title: const Text('Dart'),
          value: _selectedLanguages.contains(ProgrammingLanguage.DART),
          onChanged: (_) {
            setState(() {
              _selectedLanguages.contains(ProgrammingLanguage.DART)
                  ? _selectedLanguages.remove(ProgrammingLanguage.DART)
                  : _selectedLanguages.add(ProgrammingLanguage.DART);
            });
          }),
      CheckboxListTile(
          title: const Text('JavaScript'),
          value: _selectedLanguages
              .contains(ProgrammingLanguage.JAVASCRIPT),
          onChanged: (_) {
            setState(() {
              _selectedLanguages
                  .contains(ProgrammingLanguage.JAVASCRIPT)
                  ? _selectedLanguages
                  .remove(ProgrammingLanguage.JAVASCRIPT)
                  : _selectedLanguages
                  .add(ProgrammingLanguage.JAVASCRIPT);
            });
          }),
      CheckboxListTile(
          title: const Text('Kotlin'),
          value:
          _selectedLanguages.contains(ProgrammingLanguage.KOTLIN),
          onChanged: (_) {
            setState(() {
              _selectedLanguages.contains(ProgrammingLanguage.KOTLIN)
                  ? _selectedLanguages
                  .remove(ProgrammingLanguage.KOTLIN)
                  : _selectedLanguages.add(ProgrammingLanguage.KOTLIN);
            });
          }),
      CheckboxListTile(
          title: const Text('Swift'),
          value: _selectedLanguages.contains(ProgrammingLanguage.SWIFT),
          onChanged: (_) {
            setState(() {
              _selectedLanguages.contains(ProgrammingLanguage.SWIFT)
                  ? _selectedLanguages.remove(ProgrammingLanguage.SWIFT)
                  : _selectedLanguages.add(ProgrammingLanguage.SWIFT);
            });
          }),
      SwitchListTile(
          title: const Text('Is Employed'),
          value: _isEmployed,
          onChanged: (newValue) =>
              setState(() => _isEmployed = newValue)),
      TextButton(
          onPressed: _saveSettings, child: const Text('Save Settings'))

    ],
  );

  void _saveSettings() {
    final newSettings = Settings(
        username: _usernameController.text,
        gender: _selectedGender,
        programmingLanguages: _selectedLanguages,
        isEmployed: _isEmployed);

    print(newSettings);
    _preferencesService.saveSettings(newSettings);
  }
}

/// This allows a value of type T or T? to be treated as a value of type T?.
///
/// We use this so that APIs that have become non-nullable can still be used
/// with `!` and `?` on the stable branch.
// TODO(ianh): Remove this once we roll stable in late 2021.
T? _ambiguate<T>(T? value) => value;
