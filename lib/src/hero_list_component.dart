import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_tour_of_heroes/src/hero.dart';
import 'package:angular_tour_of_heroes/src/route_paths.dart';
import 'hero_service.dart';

@Component(
  selector: 'my-heroes',
  styleUrls: ['hero_list_component.css'],
  templateUrl: 'hero_list_component.html',
  directives: [
    formDirectives,
    coreDirectives,
  ],
  providers: [ClassProvider(HeroService)],
  pipes: [commonPipes],
)
class HeroListComponent implements OnInit {
  final title = 'Tour of Heroes';
  final HeroService _heroService;
  final Router _router;
  List<Hero> heroes;
  Hero selected;

  HeroListComponent(this._heroService, this._router);

  void onSelect(Hero hero) => selected = hero;

  @override
  void ngOnInit() => _getHeroes();

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }

  String _heroUrl(int id) =>
      RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_heroUrl(selected.id));
}
