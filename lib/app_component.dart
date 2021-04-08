import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_tour_of_heroes/src/hero.dart';
import 'src/hero_component.dart';
import 'src/hero_service.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [formDirectives, coreDirectives, HeroComponent],
  providers: [ClassProvider(HeroService)],
)
class AppComponent implements OnInit {
  final title = 'Tour of Heroes';
  List<Hero> heroes;
  Hero selected;
  void onSelect(Hero hero) => selected = hero;

  final HeroService _heroService;
  AppComponent(this._heroService);

  @override
  void ngOnInit() => _getHeroes();

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }
}
