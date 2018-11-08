import 'package:angular/angular.dart';
import 'package:angular_components/theme/dark_theme.dart';
import 'package:hangman/src/hangman/hangman_component.dart';

import 'src/todo_list/todo_list_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    TodoListComponent,
    HangmanComponent,
    DarkThemeDirective
  ],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
