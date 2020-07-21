import 'dart:math';

import 'package:avtoservicelocator/model/address.dart';
import 'package:avtoservicelocator/model/autoservice.dart';
import 'package:avtoservicelocator/model/car.dart';
import 'package:avtoservicelocator/model/proposal.dart';
import 'package:avtoservicelocator/model/request.dart';
import 'package:avtoservicelocator/model/user_feedback.dart';

class DummyDataGenerator {
  static final List<Car> _cars = [
    Car(
        mark: 'Hyundai',
        model: 'Accent',
        releaseDate: DateTime.parse('2007-05-15 13:27:00'),
        vinCode: 'VINCODE',
        stateNumber: 'A123AA',
        odometer: 127000),
    Car(
        mark: 'Nissan',
        model: '350Z',
        releaseDate: DateTime.parse('2005-06-16 13:27:00'),
        vinCode: 'JN1VINCODE',
        stateNumber: 'C061CC',
        odometer: 130000)
  ];

  static final List<String> _photoUrls = [
    'https://avatars.mds.yandex.net/get-pdb/2797058/4a7a0a61-cafa-4a15-9aa9-3a1f22163bd4/s1200?webp=false',
    'https://avatars.mds.yandex.net/get-altay/1868686/2a0000016b2b835ea5a06a4c7fe9d143dcb1/XXL',
    'https://46biz.ru/uploads/archive/2020/1h94j7j4illn2_1pxtrod.jpeg',
    'https://a.d-cd.net/ea82408s-960.jpg',
    'https://avtogarant52.ru/images/foto/contacts/8.jpg',
    'https://avatars.mds.yandex.net/get-altay/214458/2a0000016264862562cf11d9f61bfda937f6/XXL',
    'https://avatars.mds.yandex.net/get-altay/176734/2a00000164ff5f82a90529c4c26ed456ab59/XXL',
    'https://p0.zoon.ru/f/0/5943832d3731335fc714bcbc_5def52f554e84.jpg',
    'https://img1.okidoker.com/c/1/3/7/37036/8764099/19096048_2.jpg'
  ];

  static final List<UserFeedback> _feedbacks = [
    UserFeedback(
        date: DateTime.now(),
        userName: 'Владимир',
        text: 'Понравилась квалификация специалистов.',
        rating: 10),
    UserFeedback(
        date: DateTime.now(),
        userName: 'Михаил',
        text: 'Справились быстро и качественно',
        rating: 9.5),
    UserFeedback(
        date: DateTime.now(),
        userName: 'Геннадий',
        text: 'Быстро, качественно',
        rating: 9.9),
    UserFeedback(
        date: DateTime.now(),
        userName: 'Александр',
        text: 'Все хорошо!',
        rating: 10),
    UserFeedback(
        date: DateTime.now(),
        userName: 'Николай',
        text: 'Произвели диагностику на достойном уровне',
        rating: 9.7),
    UserFeedback(
        date: DateTime.now(),
        userName: 'Сергей',
        text: 'Все устроило. Хорошо сделали, быстро!',
        rating: 10)
  ];

  static final List<AutoService> _autoServices = _generateAutoServices();

  static List<AutoService> getAutoServices() {
    return _autoServices;
  }

  static List<Request> generateRequests() {
    var listRequest = <Request>[];

//    listRequest.add(Request(
//        date: DateTime.now(),
//        number: 123001,
//        status: RequestStatus.ACTIVE,
//        car: _cars[0],
//        description: 'Замена масла',
//        dateRepair: DateTime.now(),
//        signYourParts: Random().nextBool(),
//        signNeedEvacuation: Random().nextBool(),
////        List<String> photos;
//        proposals: [
//          Proposal(autoService: _autoServices[0], price: 600),
//          Proposal(autoService: _autoServices[1], price: 900),
//          Proposal(autoService: _autoServices[2], price: 700)
//        ]));
//    listRequest.add(Request(
//        date: DateTime.now(),
//        number: 123002,
//        status: RequestStatus.CANCEL,
//        car: _cars[0],
//        description: 'Ремонт автосигнализации',
//        dateRepair: DateTime.now(),
//        signYourParts: Random().nextBool(),
//        signNeedEvacuation: Random().nextBool()
////        List<String> photos;
////        List<Proposal> proposals;
//        ));
//    listRequest.add(Request(
//        date: DateTime.now(),
//        number: 123003,
//        status: RequestStatus.DONE,
//        car: _cars[0],
//        description: 'Замена фильтров: масла, воздушный, салонный.',
//        dateRepair: DateTime.now(),
//        signYourParts: Random().nextBool(),
//        signNeedEvacuation: Random().nextBool()
////        List<String> photos;
////        List<Proposal> proposals;
//        ));
//    listRequest.add(Request(
//        date: DateTime.now(),
//        number: 123004,
//        status: RequestStatus.ACTIVE,
//        car: _cars[1],
//        description: 'Замена масла',
//        dateRepair: DateTime.now(),
//        signYourParts: Random().nextBool(),
//        signNeedEvacuation: Random().nextBool(),
////        List<String> photos;
//        proposals: [
//          Proposal(autoService: _autoServices[2], price: 1000),
//          Proposal(autoService: _autoServices[1], price: 1100),
//          Proposal(autoService: _autoServices[0], price: 1500)
//        ]));
//    listRequest.add(Request(
//        date: DateTime.now(),
//        number: 123005,
//        status: RequestStatus.CANCEL,
//        car: _cars[1],
//        description: 'Ремонт автосигнализации',
//        dateRepair: DateTime.now(),
//        signYourParts: Random().nextBool(),
//        signNeedEvacuation: Random().nextBool()
////        List<String> photos;
////        List<Proposal> proposals;
//        ));
//    listRequest.add(Request(
//        date: DateTime.now(),
//        number: 123006,
//        status: RequestStatus.DONE,
//        car: _cars[1],
//        description: 'Замена фильтров: масла, воздушный, салонный.',
//        dateRepair: DateTime.now(),
//        signYourParts: Random().nextBool(),
//        signNeedEvacuation: Random().nextBool()
////        List<String> photos;
////        List<Proposal> proposals;
//        ));

    return listRequest;
  }

  static List<AutoService> _generateAutoServices() {
//    _photoUrls.shuffle();
    _feedbacks.shuffle();

    List<AutoService> autoServices = [
      AutoService(
          name: 'Щукин Авто',
          address: 'Поляковское ш., 49-3, Таганрог',
          location: '47.203856, 38.854382',
          description:
              'Мы производим обслуживание физических и юридических лиц (заключаем договоры, принимаем участие в открытых торгах на электронных площадках). Оплата услуг может быть произведена за наличный, безналичный расчёт.',
          photos: [
            _photoUrls[0],
            _photoUrls[1],
            _photoUrls[2],
          ],
          userRating: 9.8,
          stars: 3,
          feedbacks: _generateListFeedbacks()),
      AutoService(
          name: 'AvtoCool',
          address: 'П.Тольятти, 2А, Таганрог',
          location: '47.249299, 38.916446',
          description:
              'Ремонт ходовой части, тормозной системы, рулевого управления, двигателя, трансмиссии. Диагностика узлов и агрегатов. Сход-развал. Шиномонтаж и балансировка колёс',
          photos: [
            _photoUrls[3],
            _photoUrls[4],
            _photoUrls[5],
          ],
          userRating: 9.9,
          stars: 4,
          feedbacks: _generateListFeedbacks()),
      AutoService(
          name: 'АССА Авто',
          address: 'Химическая, 117-8, Таганрог',
          location: '47.247733, 38.874962',
          description:
              'Сертифицированный сервисный центр. Техническое обслуживание и ремонт автомобиля. Запасные части, шины, диски. Отдел приёмки автомобилей в сервис расположен в автосалоне.',
          photos: [
            _photoUrls[6],
            _photoUrls[7],
            _photoUrls[8],
          ],
          userRating: 9.5,
          stars: 2,
          feedbacks: _generateListFeedbacks())
    ];

    autoServices.shuffle();
    return autoServices;
  }

  static List<UserFeedback> _generateListFeedbacks() {
    var listLength = Random().nextInt(_feedbacks.length);
    return List.generate(listLength, (int i) {
      i++;
      var n = Random().nextInt(_feedbacks.length);
      return _feedbacks[n];
    }).toSet().toList();
  }

  static Map<String, List<String>> getCarReferenceList() => <String, List<String>> {
    'Audi': ['A1','A2','A3','A4','A4 Allroad Quattro','A5','A6','A7','A8','Allroad','E-Tron','Q2','Q3','Q5','Q7','Q8','R8','RS Q3','RS3','RS4','RS5','RS6','RS7','S3','S4','S5','S6','S7','S8','SQ2','SQ5','SQ7','SQ8','TT','TT RS','TTS'],
    'BMW': ['1 series','2 series','3 series','4 series','5 series','6 series','7 series','8 series','i3','i8','M2','M3','M4','M5','M6','X1','X2','X3','X3 M','X4','X4 M','X5','X5 M','X6','X6 M','X7','Z3','Z4','Z8'],
    'Chevrolet': ['Astro','Avalanche','Aveo','Blazer','Camaro','Captiva','Cavalier','Cobalt','Colorado','Corvette','Cruze','Epica','Equinox','Express','HHR','Impala','Lacetti','Lanos','Malibu','Monte Carlo','Niva','Orlando','Rezzo','Silverado','Silverado 2500 HD','Spark','SSR','Suburban','Tahoe','TrailBlazer','Traverse','Trax','Uplander','Venture'],
    'Daihatsu': ['Applause','Cast','Copen','Cuore','Gran Move','Luxio','Materia','Mebius','Move','Rocky','Sirion','Terios','Trevis','YRV'],
    'Ford': ['B-Max','C-Max','Cougar','Crown Victoria','EcoSport','Edge','Escape','Excursion','Expedition','Explorer','Explorer Sport Trac','F-150','F-250','F-350','Falcon','Fiesta','Five Hundred','Flex','Focus','Focus Active','Freestar','Freestyle','Fusion','Galaxy','Ka','Kuga','Maverick','Mondeo','Mustang','Mustang Shelby GT350','Mustang Shelby GT500','Puma','Ranger','S-Max','Taurus','Taurus X','Thunderbird','Tourneo Connect','Transit','Transit Connect'],
    'GAZ': ['3102','31105','Siber','Sobol'],
    'Honda': ['Accord','Amaze','City','Civic','CR-V','CR-Z','Crosstour','Element','Fit','FR-V','HR-V','HR-V II (GJ)','Insight','Jade','Jazz','Legend','Odyssey','Pilot','Prelude','Ridgeline','S2000','Shuttle','Stream','Vezel'],
    'Hyundai': ['Accent','Atos Prime','Azera','Centennial','Creta','Elantra','Entourage','Eon','Equus','Galloper','Genesis','Genesis Coupe','Getz','Grandeur','H-1','i10','i20','i30','i30 N','i40','Ioniq','ix20','ix35','Kona','Matrix','Palisade','Porter','Santa Fe','Solaris','Sonata','Terracan','Trajet','Tucson','Veloster','Veracruz','Verna','Xcent','XG'],
    'Kia': ['Carens','Carnival','Ceed','Cerato','Clarus','Forte','K900','Magentis','Mohave','Niro','Opirus','Optima','Picanto','ProCeed','Quoris','Ray','Rio','Rio X-Line','Seltos','Shuma','Sorento','Sorento Prime','Soul','Spectra','Sportage','Stinger','Stonic','Telluride','Venga'],
    'Lexus': ['CT','ES','GS','GX','HS','IS','LC','LFA','LS','LX','NX','RC','RX','SC','UX'],
    'Mazda': ['2','3','323','5','6','626','B-Series','BT-50','CX-3','CX-5','CX-7','CX-9','MPV','MX-5','Premacy','RX-7','RX-8','Tribute'],
    'Mercedes': ['A-class','AMG GT','AMG GT 4-Door','B-class','C-class','C-class Sport Coupe','CL-class','CLA-class','CLC-class','CLK-class','CLS-class','E-class','E-class Coupe','EQC','G-class','GL-class','GLA-class','GLB-class','GLC-class','GLC-class Coupe','GLE-class','GLE-class Coupe','GLK-class','GLS-class','M-class','R-class','S-class','S-class Cabrio','S-class Coupe','SL-class','SLK-class','SLR-class','SLS AMG','Sprinter','Vaneo','Viano','Vito','X-class'],
    'Mitsubishi': ['3000 GT','ASX','Carisma','Colt','Dignity','Eclipse','Eclipse Cross','Endeavor','Galant','Grandis','i-MiEV','L200','Lancer','Lancer Evo','Mirage','Outlander','Outlander XL','Pajero','Pajero Pinin','Pajero Sport','Raider','Space Gear','Space Runner','Space Star'],
    'Nissan': ['350Z','370Z','Almera','Almera Classic','Almera Tino','Altima','Armada','Bluebird Sylphy','GT-R','Juke','Leaf','Maxima','Micra','Murano','Navara','Note','NP300','Pathfinder','Patrol','Primera','Qashqai','Qashqai+2','Quest','Rogue','Sentra','Skyline','Sylphy','Teana','Terrano','Tiida','Titan','Titan XD','X-Trail','XTerra','Z'],
    'Opel': ['Adam','Agila','Antara','Astra','Astra GTS','Cascada','Combo','Corsa','Corsa OPC','Crossland X','Frontera','Grandland X','Insignia','Insignia OPC','Karl','Meriva','Mokka','Omega','Signum','Speedster','Tigra','Vectra','Vivaro','Zafira','Zafira Tourer'],
    'Peugeot': ['1007','107','108','2008','206','207','208','3008','301','307','308','4007','4008','406','407','408','5008','508','607','807','Boxer','Partner','RCZ Sport'],
    'Renault': ['Arkana','Avantime','Captur','Clio','Duster','Duster Oroch','Espace','Fluence','Grand Scenic','Kadjar','Kangoo','Kaptur','Koleos','Laguna','Latitude','Logan','Master','Megane','Modus','Sandero','Sandero Stepway','Scenic','Symbol','Talisman','Trafic','Twingo','Twizy','Vel Satis','Wind','Zoe'],
    'Skoda': ['Citigo','Fabia','Felicia','Kamiq','Karoq','Kodiaq','Octavia','Octavia Scout','Octavia Tour','Praktik','Rapid','Rapid Spaceback (NH1)','Roomster','Superb','Yeti'],
    'Subaru': ['Ascent','Baja','Crosstrack','Exiga','Forester','Impreza','Justy','Legacy','Levorg','Outback','Traviq','Tribeca','WRX','XV'],
    'Suzuki': ['Alto','Baleno','Celerio','Ciaz','Grand Vitara','Grand Vitara XL7','Ignis','Jimny','Kizashi','Liana','Splash','Swift','SX4','Vitara','Wagon R','Wagon R+'],
    'Toyota': ['4Runner','Alphard','Auris','Avalon','Avensis','Avensis Verso','Aygo','C-HR','Caldina','Camry','Celica','Corolla','Corolla Verso','FJ Cruiser','Fortuner','GT 86','Hiace','Highlander','Hilux','iQ','ist','Land Cruiser','Land Cruiser Prado','Mark II','Mirai','MR2','Picnic','Previa','Prius','RAV4','Sequoia','Sienna','Supra','Tacoma','Tundra','Venza','Verso','Vitz','Yaris','Yaris Verso'],
    'UAZ': ['Patriot', 'Pickup'],
    'VAZ': ['2101-2107','2108, 2109, 21099','2110, 2111, 2112','2113, 2114, 2115','4x4 Urban','Granta','Largus','Largus Cross','Vesta Cross','Vesta Sport','Vesta SW','XRay','XRay Cross'],
    'Volkswagen': ['Amarok','Arteon','Beetle','Bora','Caddy','CC','Crafter','CrossGolf','CrossPolo','CrossTouran','Eos','Fox','Golf','Jetta','Lupo','Multivan','New Beetle','Passat','Passat CC','Phaeton','Pointer','Polo','Routan','Scirocco','Sharan','T-Roc','Teramont','Tiguan','Touareg','Touran','Transporter','Up'],
    'Volvo': ['C30','C70','C70 Convertible','C70 Coupe','S40','S60','S70','S80','S90','V40','V50','V60','V70','V90','XC40','XC60','XC70','XC90']
  };

  static List<Address> getAddresses() {
    var result = <Address>[];
    result.add(Address(country: 'Россия', region: 'Адыгея', city: 'Адыгейск', lat: '44.884856', lng: '39.190567'));
    result.add(Address(country: 'Россия', region: 'Адыгея', city: 'Майкоп', lat: '44.608865', lng: '40.098548'));
    result.add(Address(country: 'Россия', region: 'Алтай', city: 'Горно-Алтайск', lat: '51.958182', lng: '85.960373'));
    result.add(Address(country: 'Россия', region: 'Алтайский край', city: 'Алейск', lat: '52.492167', lng: '82.779448'));
    result.add(Address(country: 'Россия', region: 'Алтайский край', city: 'Барнаул', lat: '53.346785', lng: '83.776856'));
    result.add(Address(country: 'Россия', region: 'Алтайский край', city: 'Белокуриха', lat: '51.99606', lng: '84.984004'));
    result.add(Address(country: 'Россия', region: 'Алтайский край', city: 'Бийск', lat: '52.539297', lng: '85.21382'));
    result.add(Address(country: 'Россия', region: 'Алтайский край', city: 'Горняк', lat: '50.997775', lng: '81.464198'));
    result.add(Address(country: 'Россия', region: 'Алтайский край', city: 'Заринск', lat: '53.706332', lng: '84.931488'));
    result.add(Address(country: 'Россия', region: 'Алтайский край', city: 'Змеиногорск', lat: '51.158015', lng: '82.18727'));
    result.add(Address(country: 'Россия', region: 'Алтайский край', city: 'Камень-на-Оби', lat: '53.791486', lng: '81.354558'));
    result.add(Address(country: 'Россия', region: 'Алтайский край', city: 'Новоалтайск', lat: '53.412021', lng: '83.93107'));
    result.add(Address(country: 'Россия', region: 'Алтайский край', city: 'Рубцовск', lat: '51.501207', lng: '81.2078'));
    result.add(Address(country: 'Россия', region: 'Алтайский край', city: 'Славгород', lat: '52.999375', lng: '78.64594'));
    result.add(Address(country: 'Россия', region: 'Алтайский край', city: 'Яровое', lat: '52.923446', lng: '78.569601'));
    result.add(Address(country: 'Россия', region: 'Амурская область', city: 'Белогорск', lat: '50.921287', lng: '128.473917'));
    result.add(Address(country: 'Россия', region: 'Амурская область', city: 'Благовещенск', lat: '50.28702', lng: '127.541025'));
    result.add(Address(country: 'Россия', region: 'Амурская область', city: 'Завитинск', lat: '50.106518', lng: '129.439309'));
    result.add(Address(country: 'Россия', region: 'Амурская область', city: 'Зея', lat: '53.734033', lng: '127.265889'));
    result.add(Address(country: 'Россия', region: 'Амурская область', city: 'Райчихинск', lat: '49.794114', lng: '129.411255'));
    result.add(Address(country: 'Россия', region: 'Амурская область', city: 'Свободный', lat: '51.375889', lng: '128.134147'));
    result.add(Address(country: 'Россия', region: 'Амурская область', city: 'Сковородино', lat: '53.987177', lng: '123.943632'));
    result.add(Address(country: 'Россия', region: 'Амурская область', city: 'Тында', lat: '55.154656', lng: '124.729236'));
    result.add(Address(country: 'Россия', region: 'Амурская область', city: 'Шимановск', lat: '51.85262', lng: '116.032735'));
    result.add(Address(country: 'Россия', region: 'Архангельская область', city: 'Архангельск', lat: '64.539393', lng: '40.516939'));
    result.add(Address(country: 'Россия', region: 'Архангельская область', city: 'Вельск', lat: '61.065915', lng: '42.10331'));
    result.add(Address(country: 'Россия', region: 'Архангельская область', city: 'Каргополь', lat: '61.505339', lng: '38.948166'));
    result.add(Address(country: 'Россия', region: 'Архангельская область', city: 'Коряжма', lat: '61.315335', lng: '47.159855'));
    result.add(Address(country: 'Россия', region: 'Архангельская область', city: 'Котлас', lat: '61.25297', lng: '46.633217'));
    result.add(Address(country: 'Россия', region: 'Архангельская область', city: 'Мезень', lat: '65.839904', lng: '44.25314'));
    result.add(Address(country: 'Россия', region: 'Архангельская область', city: 'Мирный', lat: '62.541028', lng: '113.978692'));
    result.add(Address(country: 'Россия', region: 'Архангельская область', city: 'Новодвинск', lat: '64.413683', lng: '40.820821'));
    result.add(Address(country: 'Россия', region: 'Архангельская область', city: 'Няндома', lat: '61.669822', lng: '40.204388'));
    result.add(Address(country: 'Россия', region: 'Архангельская область', city: 'Онега', lat: '63.914485', lng: '38.086646'));
    result.add(Address(country: 'Россия', region: 'Архангельская область', city: 'Северодвинск', lat: '64.562501', lng: '39.818175'));
    result.add(Address(country: 'Россия', region: 'Архангельская область', city: 'Сольвычегодск', lat: '61.330589', lng: '46.928089'));
    result.add(Address(country: 'Россия', region: 'Архангельская область', city: 'Шенкурск', lat: '62.10565', lng: '42.899612'));
    result.add(Address(country: 'Россия', region: 'Астраханская область', city: 'Астрахань', lat: '46.347869', lng: '48.033574'));
    result.add(Address(country: 'Россия', region: 'Астраханская область', city: 'Ахтубинск', lat: '48.284884', lng: '46.164413'));
    result.add(Address(country: 'Россия', region: 'Астраханская область', city: 'Знаменск', lat: '48.586634', lng: '45.736744'));
    result.add(Address(country: 'Россия', region: 'Астраханская область', city: 'Камызяк', lat: '46.110571', lng: '48.073235'));
    result.add(Address(country: 'Россия', region: 'Астраханская область', city: 'Нариманов', lat: '46.690301', lng: '47.853623'));
    result.add(Address(country: 'Россия', region: 'Астраханская область', city: 'Харабали', lat: '47.409315', lng: '47.252058'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Агидель', lat: '55.899835', lng: '53.92204'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Баймак', lat: '52.591257', lng: '58.311199'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Белебей', lat: '54.103441', lng: '54.111279'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Белорецк', lat: '53.967621', lng: '58.410023'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Бирск', lat: '55.417531', lng: '55.530707'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Благовещенск', lat: '50.28702', lng: '127.541025'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Давлеканово', lat: '54.222727', lng: '55.03127'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Дюртюли', lat: '55.48529', lng: '54.873463'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Ишимбай', lat: '53.454621', lng: '56.04395'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Кумертау', lat: '52.756523', lng: '55.796976'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Межгорье', lat: '54.239989', lng: '57.961225'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Мелеуз', lat: '52.958964', lng: '55.92831'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Нефтекамск', lat: '56.088408', lng: '54.248236'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Октябрьский', lat: '54.481448', lng: '53.46557'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Салават', lat: '53.361651', lng: '55.924672'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Сибай', lat: '52.72051', lng: '58.666429'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Стерлитамак', lat: '53.630403', lng: '55.930825'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Туймазы', lat: '54.599988', lng: '53.695008'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Уфа', lat: '54.735147', lng: '55.958727'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Учалы', lat: '54.319176', lng: '59.378631'));
    result.add(Address(country: 'Россия', region: 'Башкортостан', city: 'Янаул', lat: '56.264957', lng: '54.929824'));
    result.add(Address(country: 'Россия', region: 'Белгородская область', city: 'Алексеевка', lat: '50.629961', lng: '38.688095'));
    result.add(Address(country: 'Россия', region: 'Белгородская область', city: 'Белгород', lat: '50.59566', lng: '36.587223'));
    result.add(Address(country: 'Россия', region: 'Белгородская область', city: 'Бирюч', lat: '50.648389', lng: '38.400553'));
    result.add(Address(country: 'Россия', region: 'Белгородская область', city: 'Валуйки', lat: '50.211194', lng: '38.099914'));
    result.add(Address(country: 'Россия', region: 'Белгородская область', city: 'Грайворон', lat: '50.486223', lng: '35.666351'));
    result.add(Address(country: 'Россия', region: 'Белгородская область', city: 'Губкин', lat: '51.283644', lng: '37.534748'));
    result.add(Address(country: 'Россия', region: 'Белгородская область', city: 'Короча', lat: '50.811036', lng: '37.194942'));
    result.add(Address(country: 'Россия', region: 'Белгородская область', city: 'Новый Оскол', lat: '47.757738', lng: '39.93643'));
    result.add(Address(country: 'Россия', region: 'Белгородская область', city: 'Старый Оскол', lat: '52.585277', lng: '32.760346'));
    result.add(Address(country: 'Россия', region: 'Белгородская область', city: 'Шебекино', lat: '50.400498', lng: '36.887916'));
    result.add(Address(country: 'Россия', region: 'Брянская область', city: 'Брянск', lat: '53.243562', lng: '34.363443'));
    result.add(Address(country: 'Россия', region: 'Брянская область', city: 'Жуковка', lat: '53.533062', lng: '33.732547'));
    result.add(Address(country: 'Россия', region: 'Брянская область', city: 'Злынка', lat: '52.427384', lng: '31.737075'));
    result.add(Address(country: 'Россия', region: 'Брянская область', city: 'Карачев', lat: '53.121594', lng: '34.982796'));
    result.add(Address(country: 'Россия', region: 'Брянская область', city: 'Клинцы', lat: '52.753143', lng: '32.233852'));
    result.add(Address(country: 'Россия', region: 'Брянская область', city: 'Мглин', lat: '53.061069', lng: '32.847806'));
    result.add(Address(country: 'Россия', region: 'Брянская область', city: 'Новозыбков', lat: '52.536717', lng: '31.933222'));
    result.add(Address(country: 'Россия', region: 'Брянская область', city: 'Почеп', lat: '52.92913', lng: '33.454267'));
    result.add(Address(country: 'Россия', region: 'Брянская область', city: 'Севск', lat: '52.156089', lng: '34.495091'));
    result.add(Address(country: 'Россия', region: 'Брянская область', city: 'Сельцо', lat: '53.373933', lng: '34.105932'));
    result.add(Address(country: 'Россия', region: 'Брянская область', city: 'Стародуб', lat: '52.585277', lng: '32.760346'));
    result.add(Address(country: 'Россия', region: 'Брянская область', city: 'Сураж', lat: '53.013891', lng: '32.393043'));
    result.add(Address(country: 'Россия', region: 'Брянская область', city: 'Трубчевск', lat: '52.579077', lng: '33.766073'));
    result.add(Address(country: 'Россия', region: 'Брянская область', city: 'Унеча', lat: '52.845115', lng: '32.670676'));
    result.add(Address(country: 'Россия', region: 'Брянская область', city: 'Фокино', lat: '53.455436', lng: '34.415923'));
    result.add(Address(country: 'Россия', region: 'Бурятия', city: 'Бабушкин', lat: '51.715833', lng: '105.864363'));
    result.add(Address(country: 'Россия', region: 'Бурятия', city: 'Гусиноозёрск', lat: '51.285526', lng: '106.529323'));
    result.add(Address(country: 'Россия', region: 'Бурятия', city: 'Закаменск', lat: '50.372602', lng: '103.286764'));
    result.add(Address(country: 'Россия', region: 'Бурятия', city: 'Кяхта', lat: '50.355214', lng: '106.449903'));
    result.add(Address(country: 'Россия', region: 'Бурятия', city: 'Северобайкальск', lat: '55.635996', lng: '109.335597'));
    result.add(Address(country: 'Россия', region: 'Бурятия', city: 'Улан-Удэ', lat: '51.834464', lng: '107.584574'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Александров', lat: '56.397774', lng: '38.727621'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Владимир', lat: '56.129057', lng: '40.406635'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Вязники', lat: '56.247021', lng: '42.158862'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Гороховец', lat: '56.201695', lng: '42.691194'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Гусь-Хрустальный', lat: '55.619818', lng: '40.657902'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Камешково', lat: '56.348916', lng: '40.995588'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Карабаново', lat: '56.313269', lng: '38.703438'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Киржач', lat: '56.161709', lng: '38.872052'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Кольчугино', lat: '56.293901', lng: '39.376042'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Костерёво', lat: '55.933701', lng: '39.624732'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Курлово', lat: '55.454968', lng: '40.611208'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Лакинск', lat: '56.018001', lng: '39.956525'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Меленки', lat: '55.338715', lng: '41.63403'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Муром', lat: '55.579169', lng: '42.052411'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Петушки', lat: '55.930967', lng: '39.4599'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Покров', lat: '55.916633', lng: '39.173374'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Радужный', lat: '62.134265', lng: '77.458439'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Собинка', lat: '55.993837', lng: '40.017943'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Струнино', lat: '56.37493', lng: '38.584079'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Судогда', lat: '55.949879', lng: '40.856295'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Суздаль', lat: '56.419836', lng: '40.449457'));
    result.add(Address(country: 'Россия', region: 'Владимирская область', city: 'Юрьев-Польский', lat: '56.49925', lng: '39.680814'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Волгоград', lat: '48.707073', lng: '44.51693'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Волжский', lat: '56.053804', lng: '48.555271'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Дубовка', lat: '49.055369', lng: '44.826957'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Жирновск', lat: '50.978713', lng: '44.778834'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Калач-на-Дону', lat: '48.681995', lng: '43.538234'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Камышин', lat: '50.083698', lng: '45.407367'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Котельниково', lat: '47.631528', lng: '43.142625'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Котово', lat: '50.322058', lng: '44.801319'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Краснослободск', lat: '54.424901', lng: '43.784435'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Ленинск', lat: '48.693682', lng: '45.199228'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Михайловка', lat: '50.070847', lng: '43.239723'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Николаевск', lat: '50.025878', lng: '45.45911'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Новоаннинский', lat: '50.529658', lng: '42.66667'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Палласовка', lat: '50.050167', lng: '46.880398'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Петров Вал', lat: '58.599071', lng: '35.798098'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Серафимович', lat: '49.584135', lng: '42.734008'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Суровикино', lat: '48.605493', lng: '42.844195'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Урюпинск', lat: '50.794522', lng: '41.995844'));
    result.add(Address(country: 'Россия', region: 'Волгоградская область', city: 'Фролово', lat: '49.765861', lng: '43.649292'));
    result.add(Address(country: 'Россия', region: 'Вологодская область', city: 'Бабаево', lat: '59.389227', lng: '35.937759'));
    result.add(Address(country: 'Россия', region: 'Вологодская область', city: 'Белозерск', lat: '60.030843', lng: '37.789016'));
    result.add(Address(country: 'Россия', region: 'Вологодская область', city: 'Великий Устюг', lat: '55.603969', lng: '31.197214'));
    result.add(Address(country: 'Россия', region: 'Вологодская область', city: 'Вологда', lat: '59.220496', lng: '39.891523'));
    result.add(Address(country: 'Россия', region: 'Вологодская область', city: 'Вытегра', lat: '61.006355', lng: '36.449511'));
    result.add(Address(country: 'Россия', region: 'Вологодская область', city: 'Грязовец', lat: '58.875793', lng: '40.248423'));
    result.add(Address(country: 'Россия', region: 'Вологодская область', city: 'Кадников', lat: '59.503767', lng: '40.34404'));
    result.add(Address(country: 'Россия', region: 'Вологодская область', city: 'Кириллов', lat: '59.859059', lng: '38.374933'));
    result.add(Address(country: 'Россия', region: 'Вологодская область', city: 'Красавино', lat: '60.961377', lng: '46.481474'));
    result.add(Address(country: 'Россия', region: 'Вологодская область', city: 'Никольск', lat: '53.71447', lng: '46.084356'));
    result.add(Address(country: 'Россия', region: 'Вологодская область', city: 'Сокол', lat: '59.460968', lng: '40.099977'));
    result.add(Address(country: 'Россия', region: 'Вологодская область', city: 'Тотьма', lat: '59.973487', lng: '42.758873'));
    result.add(Address(country: 'Россия', region: 'Вологодская область', city: 'Устюжна', lat: '58.838391', lng: '36.442414'));
    result.add(Address(country: 'Россия', region: 'Вологодская область', city: 'Харовск', lat: '59.95074', lng: '40.20631'));
    result.add(Address(country: 'Россия', region: 'Вологодская область', city: 'Череповец', lat: '59.122612', lng: '37.903461'));
    result.add(Address(country: 'Россия', region: 'Воронежская область', city: 'Бобров', lat: '51.097718', lng: '40.035604'));
    result.add(Address(country: 'Россия', region: 'Воронежская область', city: 'Богучар', lat: '49.935512', lng: '40.559079'));
    result.add(Address(country: 'Россия', region: 'Воронежская область', city: 'Борисоглебск', lat: '51.367725', lng: '42.074977'));
    result.add(Address(country: 'Россия', region: 'Воронежская область', city: 'Бутурлиновка', lat: '50.835367', lng: '40.584825'));
    result.add(Address(country: 'Россия', region: 'Воронежская область', city: 'Воронеж', lat: '51.660781', lng: '39.200269'));
    result.add(Address(country: 'Россия', region: 'Воронежская область', city: 'Калач', lat: '50.424119', lng: '41.01624'));
    result.add(Address(country: 'Россия', region: 'Воронежская область', city: 'Лиски', lat: '50.987298', lng: '39.497099'));
    result.add(Address(country: 'Россия', region: 'Воронежская область', city: 'Нововоронеж', lat: '51.309213', lng: '39.216277'));
    result.add(Address(country: 'Россия', region: 'Воронежская область', city: 'Новохопёрск', lat: '51.100286', lng: '41.631452'));
    result.add(Address(country: 'Россия', region: 'Воронежская область', city: 'Острогожск', lat: '50.860139', lng: '39.082365'));
    result.add(Address(country: 'Россия', region: 'Воронежская область', city: 'Павловск', lat: '59.686411', lng: '30.431598'));
    result.add(Address(country: 'Россия', region: 'Воронежская область', city: 'Поворино', lat: '51.190773', lng: '42.245576'));
    result.add(Address(country: 'Россия', region: 'Воронежская область', city: 'Россошь', lat: '50.192899', lng: '39.57652'));
    result.add(Address(country: 'Россия', region: 'Воронежская область', city: 'Семилуки', lat: '51.695255', lng: '39.018953'));
    result.add(Address(country: 'Россия', region: 'Воронежская область', city: 'Эртиль', lat: '51.835727', lng: '40.799243'));
    result.add(Address(country: 'Россия', region: 'Дагестан', city: 'Буйнакск', lat: '42.821749', lng: '47.115927'));
    result.add(Address(country: 'Россия', region: 'Дагестан', city: 'Дагестанские Огни', lat: '54.222727', lng: '55.03127'));
    result.add(Address(country: 'Россия', region: 'Дагестан', city: 'Дербент', lat: '42.057669', lng: '48.288776'));
    result.add(Address(country: 'Россия', region: 'Дагестан', city: 'Избербаш', lat: '42.565141', lng: '47.871078'));
    result.add(Address(country: 'Россия', region: 'Дагестан', city: 'Каспийск', lat: '42.890833', lng: '47.635674'));
    result.add(Address(country: 'Россия', region: 'Дагестан', city: 'Кизилюрт', lat: '43.204637', lng: '46.866878'));
    result.add(Address(country: 'Россия', region: 'Дагестан', city: 'Кизляр', lat: '43.84738', lng: '46.711685'));
    result.add(Address(country: 'Россия', region: 'Дагестан', city: 'Махачкала', lat: '42.98306', lng: '47.504682'));
    result.add(Address(country: 'Россия', region: 'Дагестан', city: 'Хасавюрт', lat: '43.246265', lng: '46.590044'));
    result.add(Address(country: 'Россия', region: 'Дагестан', city: 'Южно-Сухокумск', lat: '44.660166', lng: '45.649966'));
    result.add(Address(country: 'Россия', region: 'Еврейская АО', city: 'Биробиджан', lat: '48.794668', lng: '132.921754'));
    result.add(Address(country: 'Россия', region: 'Еврейская АО', city: 'Облучье', lat: '49.018898', lng: '131.053914'));
    result.add(Address(country: 'Россия', region: 'Забайкальский край', city: 'Балей', lat: '51.582284', lng: '116.637948'));
    result.add(Address(country: 'Россия', region: 'Забайкальский край', city: 'Борзя', lat: '50.387629', lng: '116.523485'));
    result.add(Address(country: 'Россия', region: 'Забайкальский край', city: 'Краснокаменск', lat: '50.09372', lng: '118.033256'));
    result.add(Address(country: 'Россия', region: 'Забайкальский край', city: 'Могоча', lat: '53.736206', lng: '119.76608'));
    result.add(Address(country: 'Россия', region: 'Забайкальский край', city: 'Нерчинск', lat: '51.95948', lng: '116.585415'));
    result.add(Address(country: 'Россия', region: 'Забайкальский край', city: 'Петровск-Забайкальский', lat: '51.274889', lng: '108.846689'));
    result.add(Address(country: 'Россия', region: 'Забайкальский край', city: 'Сретенск', lat: '52.246252', lng: '117.71192'));
    result.add(Address(country: 'Россия', region: 'Забайкальский край', city: 'Хилок', lat: '51.363401', lng: '110.459012'));
    result.add(Address(country: 'Россия', region: 'Забайкальский край', city: 'Чита', lat: '52.033973', lng: '113.499432'));
    result.add(Address(country: 'Россия', region: 'Ивановская область', city: 'Вичуга', lat: '57.217138', lng: '41.918149'));
    result.add(Address(country: 'Россия', region: 'Ивановская область', city: 'Гаврилов Посад', lat: '55.205944', lng: '34.298037'));
    result.add(Address(country: 'Россия', region: 'Ивановская область', city: 'Заволжск', lat: '57.491737', lng: '42.137491'));
    result.add(Address(country: 'Россия', region: 'Ивановская область', city: 'Иваново', lat: '57.000348', lng: '40.973921'));
    result.add(Address(country: 'Россия', region: 'Ивановская область', city: 'Кинешма', lat: '57.442544', lng: '42.168923'));
    result.add(Address(country: 'Россия', region: 'Ивановская область', city: 'Комсомольск', lat: '57.027394', lng: '40.37761'));
    result.add(Address(country: 'Россия', region: 'Ивановская область', city: 'Кохма', lat: '56.932531', lng: '41.093208'));
    result.add(Address(country: 'Россия', region: 'Ивановская область', city: 'Наволоки', lat: '57.470588', lng: '41.957765'));
    result.add(Address(country: 'Россия', region: 'Ивановская область', city: 'Плёс', lat: '57.460578', lng: '41.512254'));
    result.add(Address(country: 'Россия', region: 'Ивановская область', city: 'Приволжск', lat: '57.380662', lng: '41.28083'));
    result.add(Address(country: 'Россия', region: 'Ивановская область', city: 'Пучеж', lat: '56.982087', lng: '43.168406'));
    result.add(Address(country: 'Россия', region: 'Ивановская область', city: 'Родники', lat: '57.107152', lng: '41.733366'));
    result.add(Address(country: 'Россия', region: 'Ивановская область', city: 'Тейково', lat: '56.85436', lng: '40.535471'));
    result.add(Address(country: 'Россия', region: 'Ивановская область', city: 'Фурманов', lat: '57.252601', lng: '41.106189'));
    result.add(Address(country: 'Россия', region: 'Ивановская область', city: 'Шуя', lat: '56.852037', lng: '41.385556'));
    result.add(Address(country: 'Россия', region: 'Ивановская область', city: 'Южа', lat: '56.583698', lng: '42.011843'));
    result.add(Address(country: 'Россия', region: 'Ивановская область', city: 'Юрьевец', lat: '57.317815', lng: '43.110995'));
    result.add(Address(country: 'Россия', region: 'Ингушетия', city: 'Карабулак', lat: '43.305594', lng: '44.909404'));
    result.add(Address(country: 'Россия', region: 'Ингушетия', city: 'Магас', lat: '43.171501', lng: '44.81624'));
    result.add(Address(country: 'Россия', region: 'Ингушетия', city: 'Малгобек', lat: '43.509645', lng: '44.590188'));
    result.add(Address(country: 'Россия', region: 'Ингушетия', city: 'Назрань', lat: '43.225727', lng: '44.764641'));
    result.add(Address(country: 'Россия', region: 'Ингушетия', city: 'Сунжа', lat: '43.320353', lng: '45.047682'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Алзамай', lat: '55.555072', lng: '98.664357'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Ангарск', lat: '52.544358', lng: '103.88824'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Байкальск', lat: '51.522821', lng: '104.149928'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Бирюсинск', lat: '55.960876', lng: '97.820453'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Братск', lat: '56.151362', lng: '101.63408'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Вихоревка', lat: '56.120718', lng: '101.170396'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Железногорск-Илимский', lat: '56.584843', lng: '104.114283'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Зима', lat: '53.92072', lng: '102.049065'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Иркутск', lat: '52.287054', lng: '104.281047'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Киренск', lat: '57.775723', lng: '108.110816'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Нижнеудинск', lat: '54.901233', lng: '99.026387'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Саянск', lat: '53.139472', lng: '91.4792'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Свирск', lat: '53.066567', lng: '103.342244'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Слюдянка', lat: '51.656501', lng: '103.718845'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Тайшет', lat: '55.940502', lng: '98.002982'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Усолье-Сибирское', lat: '52.756648', lng: '103.638769'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Усть-Илимск', lat: '54.55712', lng: '100.578038'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Усть-Кут', lat: '56.792838', lng: '105.775699'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Черемхово', lat: '53.136911', lng: '103.090096'));
    result.add(Address(country: 'Россия', region: 'Иркутская область', city: 'Шелехов', lat: '52.210209', lng: '104.097395'));
    result.add(Address(country: 'Россия', region: 'Кабардино-Балкария', city: 'Баксан', lat: '43.681939', lng: '43.534613'));
    result.add(Address(country: 'Россия', region: 'Кабардино-Балкария', city: 'Майский', lat: '44.605753', lng: '40.093069'));
    result.add(Address(country: 'Россия', region: 'Кабардино-Балкария', city: 'Нальчик', lat: '43.485259', lng: '43.607072'));
    result.add(Address(country: 'Россия', region: 'Кабардино-Балкария', city: 'Нарткала', lat: '43.556734', lng: '43.862022'));
    result.add(Address(country: 'Россия', region: 'Кабардино-Балкария', city: 'Прохладный', lat: '43.758962', lng: '44.010083'));
    result.add(Address(country: 'Россия', region: 'Кабардино-Балкария', city: 'Терек', lat: '43.483865', lng: '44.140267'));
    result.add(Address(country: 'Россия', region: 'Кабардино-Балкария', city: 'Тырныауз', lat: '43.398084', lng: '42.921423'));
    result.add(Address(country: 'Россия', region: 'Кабардино-Балкария', city: 'Чегем', lat: '43.567114', lng: '43.586626'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Багратионовск', lat: '54.386509', lng: '20.639638'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Балтийск', lat: '54.644072', lng: '19.892177'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Гвардейск', lat: '54.647708', lng: '21.071341'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Гурьевск', lat: '54.285935', lng: '85.947635'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Гусев', lat: '54.591841', lng: '22.201117'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Зеленоградск', lat: '54.95993', lng: '20.475354'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Калининград', lat: '54.70739', lng: '20.507307'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Краснознаменск', lat: '55.600506', lng: '37.042489'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Ладушкин', lat: '54.569116', lng: '20.172954'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Мамоново', lat: '54.463785', lng: '19.942267'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Неман', lat: '55.038836', lng: '22.028146'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Нестеров', lat: '54.631368', lng: '22.571357'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Озёрск', lat: '55.763184', lng: '60.707599'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Пионерский', lat: '54.949482', lng: '20.224841'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Полесск', lat: '54.862777', lng: '21.109879'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Правдинск', lat: '54.44634', lng: '21.018817'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Приморск', lat: '60.366014', lng: '28.613552'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Светлогорск', lat: '54.944006', lng: '20.151512'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Светлый', lat: '54.67737', lng: '20.135719'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Славск', lat: '55.043819', lng: '21.680067'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Советск', lat: '57.587599', lng: '48.959521'));
    result.add(Address(country: 'Россия', region: 'Калининградская область', city: 'Черняховск', lat: '54.630706', lng: '21.819503'));
    result.add(Address(country: 'Россия', region: 'Калмыкия', city: 'Городовиковск', lat: '46.083105', lng: '41.936052'));
    result.add(Address(country: 'Россия', region: 'Калмыкия', city: 'Лагань', lat: '45.392947', lng: '47.355202'));
    result.add(Address(country: 'Россия', region: 'Калмыкия', city: 'Элиста', lat: '46.307743', lng: '44.269759'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Балабаново', lat: '55.177396', lng: '36.65677'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Белоусово', lat: '55.089516', lng: '36.657812'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Боровск', lat: '55.207634', lng: '36.483584'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Ермолино', lat: '55.197204', lng: '36.5952'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Жиздра', lat: '53.749114', lng: '34.734447'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Жуков', lat: '55.03167', lng: '36.746503'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Калуга', lat: '54.513845', lng: '36.261215'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Киров', lat: '58.603581', lng: '49.667978'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Козельск', lat: '54.034823', lng: '35.78226'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Кондрово', lat: '54.80743', lng: '35.926647'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Кремёнки', lat: '54.887036', lng: '37.116232'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Людиново', lat: '53.864607', lng: '34.447678'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Малоярославец', lat: '55.011897', lng: '36.462555'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Медынь', lat: '54.968784', lng: '35.857701'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Мещовск', lat: '54.321476', lng: '35.278081'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Мосальск', lat: '54.491307', lng: '34.984197'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Обнинск', lat: '55.11201', lng: '36.586531'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Сосенский', lat: '54.059489', lng: '35.966038'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Спас-Деменск', lat: '54.409834', lng: '34.018948'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Сухиничи', lat: '54.101752', lng: '35.339319'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Таруса', lat: '54.729122', lng: '37.17959'));
    result.add(Address(country: 'Россия', region: 'Калужская область', city: 'Юхнов', lat: '54.744201', lng: '35.238878'));
    result.add(Address(country: 'Россия', region: 'Камчатский край', city: 'Вилючинск', lat: '52.906857', lng: '158.418296'));
    result.add(Address(country: 'Россия', region: 'Камчатский край', city: 'Елизово', lat: '53.183053', lng: '158.388355'));
    result.add(Address(country: 'Россия', region: 'Камчатский край', city: 'Петропавловск-Камчатский', lat: '53.024075', lng: '158.643566'));
    result.add(Address(country: 'Россия', region: 'Карачаево-Черкесия', city: 'Карачаевск', lat: '43.773167', lng: '41.914313'));
    result.add(Address(country: 'Россия', region: 'Карачаево-Черкесия', city: 'Теберда', lat: '43.443841', lng: '41.741423'));
    result.add(Address(country: 'Россия', region: 'Карачаево-Черкесия', city: 'Усть-Джегута', lat: '44.083895', lng: '41.971042'));
    result.add(Address(country: 'Россия', region: 'Карачаево-Черкесия', city: 'Черкесск', lat: '44.226863', lng: '42.04677'));
    result.add(Address(country: 'Россия', region: 'Карелия', city: 'Беломорск', lat: '64.53032', lng: '34.763328'));
    result.add(Address(country: 'Россия', region: 'Карелия', city: 'Кемь', lat: '64.955532', lng: '34.598371'));
    result.add(Address(country: 'Россия', region: 'Карелия', city: 'Кондопога', lat: '62.20475', lng: '34.272758'));
    result.add(Address(country: 'Россия', region: 'Карелия', city: 'Костомукша', lat: '64.588014', lng: '30.598361'));
    result.add(Address(country: 'Россия', region: 'Карелия', city: 'Лахденпохья', lat: '61.518857', lng: '30.199491'));
    result.add(Address(country: 'Россия', region: 'Карелия', city: 'Медвежьегорск', lat: '62.914998', lng: '34.473101'));
    result.add(Address(country: 'Россия', region: 'Карелия', city: 'Олонец', lat: '60.979719', lng: '32.972034'));
    result.add(Address(country: 'Россия', region: 'Карелия', city: 'Петрозаводск', lat: '61.785017', lng: '34.346878'));
    result.add(Address(country: 'Россия', region: 'Карелия', city: 'Питкяранта', lat: '61.573083', lng: '31.471254'));
    result.add(Address(country: 'Россия', region: 'Карелия', city: 'Пудож', lat: '61.80589', lng: '36.533'));
    result.add(Address(country: 'Россия', region: 'Карелия', city: 'Сегежа', lat: '63.743701', lng: '34.312617'));
    result.add(Address(country: 'Россия', region: 'Карелия', city: 'Сортавала', lat: '61.703306', lng: '30.691723'));
    result.add(Address(country: 'Россия', region: 'Карелия', city: 'Суоярви', lat: '62.087896', lng: '32.373738'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Анжеро-Судженск', lat: '56.083175', lng: '86.018216'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Белово', lat: '54.422114', lng: '86.303692'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Берёзовский', lat: '56.910173', lng: '60.798203'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Гурьевск', lat: '54.285935', lng: '85.947635'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Калтан', lat: '53.521083', lng: '87.27716'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Кемерово', lat: '55.354727', lng: '86.088374'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Киселёвск', lat: '54.006025', lng: '86.636679'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Ленинск-Кузнецкий', lat: '54.663609', lng: '86.162243'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Мариинск', lat: '56.206952', lng: '87.742263'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Междуреченск', lat: '53.686596', lng: '88.070372'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Мыски', lat: '53.712509', lng: '87.805747'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Новокузнецк', lat: '53.757547', lng: '87.136044'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Осинники', lat: '53.598748', lng: '87.337069'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Полысаево', lat: '54.605443', lng: '86.280901'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Прокопьевск', lat: '53.884487', lng: '86.750055'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Салаир', lat: '54.235127', lng: '85.803007'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Тайга', lat: '56.065138', lng: '85.631024'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Таштагол', lat: '52.763912', lng: '87.848309'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Топки', lat: '55.276508', lng: '85.615223'));
    result.add(Address(country: 'Россия', region: 'Кемеровская область', city: 'Юрга', lat: '55.713557', lng: '84.933869'));
    result.add(Address(country: 'Россия', region: 'Кировская область', city: 'Белая Холуница', lat: '57.78567', lng: '36.693871'));
    result.add(Address(country: 'Россия', region: 'Кировская область', city: 'Вятские Поляны', lat: '55.205944', lng: '34.298037'));
    result.add(Address(country: 'Россия', region: 'Кировская область', city: 'Зуевка', lat: '58.403217', lng: '51.133426'));
    result.add(Address(country: 'Россия', region: 'Кировская область', city: 'Киров', lat: '58.603581', lng: '49.667978'));
    result.add(Address(country: 'Россия', region: 'Кировская область', city: 'Кирово-Чепецк', lat: '58.556581', lng: '50.043932'));
    result.add(Address(country: 'Россия', region: 'Кировская область', city: 'Кирс', lat: '59.339987', lng: '52.241516'));
    result.add(Address(country: 'Россия', region: 'Кировская область', city: 'Котельнич', lat: '58.303426', lng: '48.347508'));
    result.add(Address(country: 'Россия', region: 'Кировская область', city: 'Луза', lat: '60.629099', lng: '47.261229'));
    result.add(Address(country: 'Россия', region: 'Кировская область', city: 'Малмыж', lat: '56.524461', lng: '50.678232'));
    result.add(Address(country: 'Россия', region: 'Кировская область', city: 'Мураши', lat: '59.3956', lng: '48.963851'));
    result.add(Address(country: 'Россия', region: 'Кировская область', city: 'Нолинск', lat: '57.559708', lng: '49.935712'));
    result.add(Address(country: 'Россия', region: 'Кировская область', city: 'Омутнинск', lat: '58.66406', lng: '52.177152'));
    result.add(Address(country: 'Россия', region: 'Кировская область', city: 'Слободской', lat: '58.731886', lng: '50.183674'));
    result.add(Address(country: 'Россия', region: 'Кировская область', city: 'Советск', lat: '57.587599', lng: '48.959521'));
    result.add(Address(country: 'Россия', region: 'Кировская область', city: 'Сосновка', lat: '56.253352', lng: '51.283364'));
    result.add(Address(country: 'Россия', region: 'Кировская область', city: 'Уржум', lat: '57.109738', lng: '50.005717'));
    result.add(Address(country: 'Россия', region: 'Кировская область', city: 'Яранск', lat: '57.304228', lng: '47.885855'));
    result.add(Address(country: 'Россия', region: 'Коми', city: 'Воркута', lat: '67.49741', lng: '64.061091'));
    result.add(Address(country: 'Россия', region: 'Коми', city: 'Вуктыл', lat: '63.844407', lng: '57.29984'));
    result.add(Address(country: 'Россия', region: 'Коми', city: 'Емва', lat: '62.598375', lng: '50.886569'));
    result.add(Address(country: 'Россия', region: 'Коми', city: 'Инта', lat: '66.03682', lng: '60.115367'));
    result.add(Address(country: 'Россия', region: 'Коми', city: 'Микунь', lat: '62.358008', lng: '50.071986'));
    result.add(Address(country: 'Россия', region: 'Коми', city: 'Печора', lat: '65.148602', lng: '57.223977'));
    result.add(Address(country: 'Россия', region: 'Коми', city: 'Сосногорск', lat: '63.59911', lng: '53.876441'));
    result.add(Address(country: 'Россия', region: 'Коми', city: 'Сыктывкар', lat: '61.668793', lng: '50.836399'));
    result.add(Address(country: 'Россия', region: 'Коми', city: 'Усинск', lat: '65.994144', lng: '57.55701'));
    result.add(Address(country: 'Россия', region: 'Коми', city: 'Ухта', lat: '63.562626', lng: '53.684022'));
    result.add(Address(country: 'Россия', region: 'Костромская область', city: 'Буй', lat: '58.481719', lng: '41.533113'));
    result.add(Address(country: 'Россия', region: 'Костромская область', city: 'Волгореченск', lat: '57.439464', lng: '41.157456'));
    result.add(Address(country: 'Россия', region: 'Костромская область', city: 'Галич', lat: '58.381199', lng: '42.34749'));
    result.add(Address(country: 'Россия', region: 'Костромская область', city: 'Кологрив', lat: '58.826929', lng: '44.318762'));
    result.add(Address(country: 'Россия', region: 'Костромская область', city: 'Кострома', lat: '57.767961', lng: '40.926858'));
    result.add(Address(country: 'Россия', region: 'Костромская область', city: 'Макарьев', lat: '57.880009', lng: '43.807836'));
    result.add(Address(country: 'Россия', region: 'Костромская область', city: 'Мантурово', lat: '58.328617', lng: '44.757292'));
    result.add(Address(country: 'Россия', region: 'Костромская область', city: 'Нерехта', lat: '57.454414', lng: '40.572446'));
    result.add(Address(country: 'Россия', region: 'Костромская область', city: 'Нея', lat: '58.294389', lng: '43.878192'));
    result.add(Address(country: 'Россия', region: 'Костромская область', city: 'Солигалич', lat: '59.07858', lng: '42.287815'));
    result.add(Address(country: 'Россия', region: 'Костромская область', city: 'Чухлома', lat: '58.753399', lng: '42.688526'));
    result.add(Address(country: 'Россия', region: 'Костромская область', city: 'Шарья', lat: '58.369849', lng: '45.518264'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Абинск', lat: '44.866256', lng: '38.151163'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Анапа', lat: '44.894965', lng: '37.31617'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Апшеронск', lat: '44.468327', lng: '39.736707'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Армавир', lat: '44.997655', lng: '41.129644'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Белореченск', lat: '44.761141', lng: '39.87114'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Геленджик', lat: '44.561141', lng: '38.076809'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Горячий Ключ', lat: '56.201695', lng: '42.691194'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Гулькевичи', lat: '45.360342', lng: '40.695227'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Ейск', lat: '46.711524', lng: '38.276451'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Кореновск', lat: '45.462742', lng: '39.448033'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Краснодар', lat: '45.03547', lng: '38.975313'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Кропоткин', lat: '45.434686', lng: '40.575994'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Крымск', lat: '44.934986', lng: '37.986196'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Курганинск', lat: '44.887641', lng: '40.591364'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Лабинск', lat: '44.635387', lng: '40.724459'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Новокубанск', lat: '45.103812', lng: '41.047493'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Новороссийск', lat: '44.723912', lng: '37.768974'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Приморско-Ахтарск', lat: '46.043502', lng: '38.177645'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Славянск-на-Кубани', lat: '45.260439', lng: '38.126001'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Сочи', lat: '43.585525', lng: '39.723062'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Темрюк', lat: '45.27841', lng: '37.370194'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Тимашёвск', lat: '45.61478', lng: '38.934332'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Тихорецк', lat: '45.85468', lng: '40.125929'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Туапсе', lat: '44.09564', lng: '39.073553'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Усть-Лабинск', lat: '45.213625', lng: '39.691234'));
    result.add(Address(country: 'Россия', region: 'Краснодарский край', city: 'Хадыженск', lat: '44.422804', lng: '39.537326'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Артёмовск', lat: '54.347336', lng: '93.435749'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Ачинск', lat: '56.269496', lng: '90.495231'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Боготол', lat: '56.210117', lng: '89.531258'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Бородино', lat: '55.905442', lng: '94.902177'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Дивногорск', lat: '55.957721', lng: '92.380148'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Дудинка', lat: '69.403081', lng: '86.190854'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Енисейск', lat: '58.453069', lng: '92.173769'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Железногорск', lat: '52.337971', lng: '35.351743'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Заозёрный', lat: '55.961818', lng: '94.709228'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Зеленогорск', lat: '56.113246', lng: '94.589006'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Игарка', lat: '67.466954', lng: '86.567715'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Иланский', lat: '56.238552', lng: '96.065297'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Канск', lat: '56.205045', lng: '95.705055'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Кодинск', lat: '58.603398', lng: '99.179748'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Красноярск', lat: '56.010563', lng: '92.852572'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Лесосибирск', lat: '58.221728', lng: '92.503657'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Минусинск', lat: '53.710564', lng: '91.687268'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Назарово', lat: '56.012345', lng: '90.417688'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Норильск', lat: '69.349033', lng: '88.201176'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Сосновоборск', lat: '56.120211', lng: '93.335434'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Ужур', lat: '55.320155', lng: '89.844006'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Уяр', lat: '55.813172', lng: '94.328297'));
    result.add(Address(country: 'Россия', region: 'Красноярский край', city: 'Шарыпово', lat: '55.539064', lng: '89.180151'));
    result.add(Address(country: 'Россия', region: 'Крым', city: 'Бахчисарай', lat: '44.754887', lng: '33.85214'));
    result.add(Address(country: 'Россия', region: 'Крым', city: 'Керчь', lat: '45.356219', lng: '36.467378'));
    result.add(Address(country: 'Россия', region: 'Крым', city: 'Старый Крым', lat: '52.585277', lng: '32.760346'));
    result.add(Address(country: 'Россия', region: 'Крым', city: 'Щёлкино', lat: '45.428886', lng: '35.825065'));
    result.add(Address(country: 'Россия', region: 'Курганская область', city: 'Далматово', lat: '56.258608', lng: '62.939311'));
    result.add(Address(country: 'Россия', region: 'Курганская область', city: 'Катайск', lat: '56.283235', lng: '62.58365'));
    result.add(Address(country: 'Россия', region: 'Курганская область', city: 'Курган', lat: '55.441004', lng: '65.341118'));
    result.add(Address(country: 'Россия', region: 'Курганская область', city: 'Куртамыш', lat: '54.912459', lng: '64.433505'));
    result.add(Address(country: 'Россия', region: 'Курганская область', city: 'Макушино', lat: '55.205024', lng: '67.248601'));
    result.add(Address(country: 'Россия', region: 'Курганская область', city: 'Петухово', lat: '55.065035', lng: '67.887375'));
    result.add(Address(country: 'Россия', region: 'Курганская область', city: 'Шадринск', lat: '56.087042', lng: '63.629747'));
    result.add(Address(country: 'Россия', region: 'Курганская область', city: 'Шумиха', lat: '55.228726', lng: '63.28571'));
    result.add(Address(country: 'Россия', region: 'Курганская область', city: 'Щучье', lat: '55.208831', lng: '62.747853'));
    result.add(Address(country: 'Россия', region: 'Курская область', city: 'Дмитриев', lat: '52.127774', lng: '35.080353'));
    result.add(Address(country: 'Россия', region: 'Курская область', city: 'Железногорск', lat: '52.337971', lng: '35.351743'));
    result.add(Address(country: 'Россия', region: 'Курская область', city: 'Курск', lat: '51.730361', lng: '36.192647'));
    result.add(Address(country: 'Россия', region: 'Курская область', city: 'Курчатов', lat: '51.660496', lng: '35.657143'));
    result.add(Address(country: 'Россия', region: 'Курская область', city: 'Льгов', lat: '51.656942', lng: '35.259432'));
    result.add(Address(country: 'Россия', region: 'Курская область', city: 'Обоянь', lat: '51.20995', lng: '36.26744'));
    result.add(Address(country: 'Россия', region: 'Курская область', city: 'Рыльск', lat: '51.571431', lng: '34.683288'));
    result.add(Address(country: 'Россия', region: 'Курская область', city: 'Суджа', lat: '51.190953', lng: '35.268918'));
    result.add(Address(country: 'Россия', region: 'Курская область', city: 'Фатеж', lat: '52.091789', lng: '35.853892'));
    result.add(Address(country: 'Россия', region: 'Курская область', city: 'Щигры', lat: '51.87619', lng: '36.912'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Бокситогорск', lat: '59.473572', lng: '33.847675'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Волосово', lat: '59.447275', lng: '29.48481'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Волхов', lat: '59.916744', lng: '32.331544'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Всеволожск', lat: '60.021317', lng: '30.654084'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Выборг', lat: '60.710232', lng: '28.749404'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Высоцк', lat: '60.625264', lng: '28.568016'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Гатчина', lat: '59.568456', lng: '30.124473'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Ивангород', lat: '59.376655', lng: '28.223117'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Каменногорск', lat: '60.95081', lng: '29.130882'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Кингисепп', lat: '59.374028', lng: '28.611297'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Кириши', lat: '59.449695', lng: '32.008707'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Кировск', lat: '67.612101', lng: '33.668165'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Коммунар', lat: '59.621609', lng: '30.393483'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Кудрово', lat: '59.908489', lng: '30.513569'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Лодейное Поле', lat: '56.012269', lng: '37.474821'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Луга', lat: '58.735221', lng: '29.847999'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Любань', lat: '52.798914', lng: '27.993481'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Никольское', lat: '59.704642', lng: '30.788966'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Новая Ладога', lat: '59.704642', lng: '30.788966'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Отрадное', lat: '51.666104', lng: '39.33658'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Пикалёво', lat: '59.513113', lng: '34.177303'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Подпорожье', lat: '60.912784', lng: '34.156813'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Приморск', lat: '60.366014', lng: '28.613552'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Приозерск', lat: '61.036554', lng: '30.119838'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Светогорск', lat: '61.111193', lng: '28.87268'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Сертолово', lat: '60.141613', lng: '30.211879'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Сланцы', lat: '59.11779', lng: '28.088136'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Сосновый Бор', lat: '56.120211', lng: '93.335434'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Сясьстрой', lat: '60.141954', lng: '32.556743'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Тихвин', lat: '59.644209', lng: '33.542096'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Тосно', lat: '59.540664', lng: '30.877719'));
    result.add(Address(country: 'Россия', region: 'Ленинградская область', city: 'Шлиссельбург', lat: '59.934943', lng: '31.026597'));
    result.add(Address(country: 'Россия', region: 'Липецкая область', city: 'Грязи', lat: '52.496186', lng: '39.95533'));
    result.add(Address(country: 'Россия', region: 'Липецкая область', city: 'Данков', lat: '53.246197', lng: '39.134414'));
    result.add(Address(country: 'Россия', region: 'Липецкая область', city: 'Елец', lat: '52.62419', lng: '38.503653'));
    result.add(Address(country: 'Россия', region: 'Липецкая область', city: 'Задонск', lat: '52.391972', lng: '38.919456'));
    result.add(Address(country: 'Россия', region: 'Липецкая область', city: 'Лебедянь', lat: '53.020489', lng: '39.13135'));
    result.add(Address(country: 'Россия', region: 'Липецкая область', city: 'Липецк', lat: '52.60882', lng: '39.59922'));
    result.add(Address(country: 'Россия', region: 'Липецкая область', city: 'Усмань', lat: '52.043386', lng: '39.736069'));
    result.add(Address(country: 'Россия', region: 'Липецкая область', city: 'Чаплыгин', lat: '53.240555', lng: '39.96699'));
    result.add(Address(country: 'Россия', region: 'Магаданская область', city: 'Магадан', lat: '59.568164', lng: '150.808541'));
    result.add(Address(country: 'Россия', region: 'Магаданская область', city: 'Сусуман', lat: '62.780464', lng: '148.153687'));
    result.add(Address(country: 'Россия', region: 'Марий Эл', city: 'Волжск', lat: '55.862267', lng: '48.372041'));
    result.add(Address(country: 'Россия', region: 'Марий Эл', city: 'Звенигово', lat: '55.972312', lng: '48.01532'));
    result.add(Address(country: 'Россия', region: 'Марий Эл', city: 'Йошкар-Ола', lat: '56.630842', lng: '47.886089'));
    result.add(Address(country: 'Россия', region: 'Марий Эл', city: 'Козьмодемьянск', lat: '56.344167', lng: '46.568107'));
    result.add(Address(country: 'Россия', region: 'Мордовия', city: 'Ардатов', lat: '54.84656', lng: '46.241183'));
    result.add(Address(country: 'Россия', region: 'Мордовия', city: 'Инсар', lat: '53.866508', lng: '44.372248'));
    result.add(Address(country: 'Россия', region: 'Мордовия', city: 'Ковылкино', lat: '54.039201', lng: '43.919056'));
    result.add(Address(country: 'Россия', region: 'Мордовия', city: 'Краснослободск', lat: '54.424901', lng: '43.784435'));
    result.add(Address(country: 'Россия', region: 'Мордовия', city: 'Рузаевка', lat: '54.058268', lng: '44.94911'));
    result.add(Address(country: 'Россия', region: 'Мордовия', city: 'Саранск', lat: '54.187433', lng: '45.183938'));
    result.add(Address(country: 'Россия', region: 'Мордовия', city: 'Темников', lat: '54.630967', lng: '43.216089'));
    result.add(Address(country: 'Россия', region: 'Москва', city: 'Москва', lat: '55.753215', lng: '37.622504'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Апрелевка', lat: '55.545166', lng: '37.07322'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Балашиха', lat: '55.796339', lng: '37.938199'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Бронницы', lat: '55.425471', lng: '38.264108'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Верея', lat: '55.343369', lng: '36.185694'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Видное', lat: '55.557174', lng: '37.708644'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Волоколамск', lat: '56.035728', lng: '35.958537'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Воскресенск', lat: '55.322978', lng: '38.673353'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Высоковск', lat: '56.320243', lng: '36.551236'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Голицыно', lat: '55.615944', lng: '36.987117'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Дедовск', lat: '55.859984', lng: '37.120669'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Дзержинский', lat: '55.630939', lng: '37.849616'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Дмитров', lat: '56.343942', lng: '37.520348'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Долгопрудный', lat: '55.933564', lng: '37.514104'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Дрезна', lat: '55.741404', lng: '38.842371'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Дубна', lat: '56.744002', lng: '37.173176'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Егорьевск', lat: '55.38305', lng: '39.035833'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Жуковский', lat: '53.498298', lng: '33.774598'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Зарайск', lat: '54.756973', lng: '38.874845'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Звенигород', lat: '55.729686', lng: '36.855325'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Ивантеевка', lat: '55.971718', lng: '37.924338'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Истра', lat: '55.914287', lng: '36.860284'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Кашира', lat: '54.834589', lng: '38.15154'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Клин', lat: '56.331693', lng: '36.728716'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Коломна', lat: '55.103152', lng: '38.752917'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Королёв', lat: '55.922212', lng: '37.854629'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Котельники', lat: '55.65984', lng: '37.863199'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Красноармейск', lat: '56.120959', lng: '38.14094'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Красногорск', lat: '55.831099', lng: '37.330192'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Краснозаводск', lat: '56.439338', lng: '38.245261'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Краснознаменск', lat: '55.600506', lng: '37.042489'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Кубинка', lat: '55.575556', lng: '36.695209'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Куровское', lat: '55.579144', lng: '38.920866'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Ликино-Дулёво', lat: '55.707786', lng: '38.957742'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Лобня', lat: '56.012269', lng: '37.474821'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Лосино-Петровский', lat: '55.87137', lng: '38.200606'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Луховицы', lat: '54.965217', lng: '39.025394'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Лыткарино', lat: '55.579297', lng: '37.908986'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Люберцы', lat: '55.676494', lng: '37.898116'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Можайск', lat: '55.506714', lng: '36.017358'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Мытищи', lat: '55.910483', lng: '37.736402'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Наро-Фоминск', lat: '55.38616', lng: '36.734493'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Ногинск', lat: '55.854522', lng: '38.441831'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Одинцово', lat: '55.678859', lng: '37.263986'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Озёры', lat: '54.854087', lng: '38.559824'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Орехово-Зуево', lat: '55.805837', lng: '38.981592'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Павловский Посад', lat: '59.686411', lng: '30.431598'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Подольск', lat: '55.431177', lng: '37.544737'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Протвино', lat: '54.870621', lng: '37.218316'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Пушкино', lat: '56.010428', lng: '37.847155'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Пущино', lat: '54.832479', lng: '37.620977'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Раменское', lat: '55.567326', lng: '38.22584'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Реутов', lat: '55.760515', lng: '37.855141'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Рошаль', lat: '55.663283', lng: '39.862759'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Руза', lat: '55.701516', lng: '36.195997'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Сергиев Посад', lat: '55.520105', lng: '45.481361'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Серпухов', lat: '54.913536', lng: '37.416763'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Солнечногорск', lat: '56.185102', lng: '36.977631'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Старая Купавна', lat: '45.044521', lng: '41.969083'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Ступино', lat: '54.88688', lng: '38.07839'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Талдом', lat: '56.73084', lng: '37.527633'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Фрязино', lat: '55.957938', lng: '38.052339'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Химки', lat: '55.88874', lng: '37.43039'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Хотьково', lat: '56.252182', lng: '37.978677'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Черноголовка', lat: '56.010005', lng: '38.379245'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Чехов', lat: '55.149851', lng: '37.466997'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Щёлково', lat: '55.920209', lng: '37.991478'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Электрогорск', lat: '55.883161', lng: '38.786209'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Электросталь', lat: '55.784445', lng: '38.444849'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Электроугли', lat: '55.716859', lng: '38.219659'));
    result.add(Address(country: 'Россия', region: 'Московская область', city: 'Яхрома', lat: '56.28989', lng: '37.483858'));
    result.add(Address(country: 'Россия', region: 'Мурманская область', city: 'Апатиты', lat: '67.568041', lng: '33.407115'));
    result.add(Address(country: 'Россия', region: 'Мурманская область', city: 'Гаджиево', lat: '69.249049', lng: '33.315262'));
    result.add(Address(country: 'Россия', region: 'Мурманская область', city: 'Заозёрск', lat: '69.400373', lng: '32.450139'));
    result.add(Address(country: 'Россия', region: 'Мурманская область', city: 'Заполярный', lat: '69.426103', lng: '30.820739'));
    result.add(Address(country: 'Россия', region: 'Мурманская область', city: 'Кандалакша', lat: '67.151252', lng: '32.412823'));
    result.add(Address(country: 'Россия', region: 'Мурманская область', city: 'Кировск', lat: '67.612101', lng: '33.668165'));
    result.add(Address(country: 'Россия', region: 'Мурманская область', city: 'Ковдор', lat: '67.562914', lng: '30.474025'));
    result.add(Address(country: 'Россия', region: 'Мурманская область', city: 'Кола', lat: '68.878636', lng: '33.026247'));
    result.add(Address(country: 'Россия', region: 'Мурманская область', city: 'Мончегорск', lat: '67.938931', lng: '32.937116'));
    result.add(Address(country: 'Россия', region: 'Мурманская область', city: 'Мурманск', lat: '68.970682', lng: '33.074981'));
    result.add(Address(country: 'Россия', region: 'Мурманская область', city: 'Оленегорск', lat: '68.142161', lng: '33.26696'));
    result.add(Address(country: 'Россия', region: 'Мурманская область', city: 'Островной', lat: '68.05439', lng: '39.514105'));
    result.add(Address(country: 'Россия', region: 'Мурманская область', city: 'Полярные Зори', lat: '54.605443', lng: '86.280901'));
    result.add(Address(country: 'Россия', region: 'Мурманская область', city: 'Полярный', lat: '69.198909', lng: '33.451033'));
    result.add(Address(country: 'Россия', region: 'Мурманская область', city: 'Североморск', lat: '69.076153', lng: '33.416215'));
    result.add(Address(country: 'Россия', region: 'Мурманская область', city: 'Снежногорск', lat: '69.192168', lng: '33.238303'));
    result.add(Address(country: 'Россия', region: 'Ненецкий АО', city: 'Нарьян-Мар', lat: '67.63805', lng: '53.006926'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Арзамас', lat: '55.386666', lng: '43.815687'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Балахна', lat: '56.504556', lng: '43.602005'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Богородск', lat: '56.103362', lng: '43.516755'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Бор', lat: '56.356517', lng: '44.064575'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Ветлуга', lat: '57.852885', lng: '45.776099'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Володарск', lat: '56.21695', lng: '43.159729'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Ворсма', lat: '55.98999', lng: '43.271955'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Выкса', lat: '55.320683', lng: '42.167961'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Горбатов', lat: '56.130869', lng: '43.062701'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Городец', lat: '56.644822', lng: '43.472351'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Дзержинск', lat: '56.238377', lng: '43.461625'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Заволжье', lat: '56.640441', lng: '43.387164'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Княгинино', lat: '55.820566', lng: '45.032249'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Кстово', lat: '56.15067', lng: '44.206751'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Кулебаки', lat: '55.429716', lng: '42.512483'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Лукоянов', lat: '55.032697', lng: '44.493349'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Лысково', lat: '56.021357', lng: '45.040962'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Навашино', lat: '55.543888', lng: '42.18874'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Нижний Новгород', lat: '54.901233', lng: '99.026387'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Павлово', lat: '55.964629', lng: '43.06457'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Первомайск', lat: '54.867632', lng: '43.801377'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Перевоз', lat: '55.596849', lng: '44.544931'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Саров', lat: '54.922788', lng: '43.344844'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Семёнов', lat: '56.789012', lng: '44.490331'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Сергач', lat: '55.520105', lng: '45.481361'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Урень', lat: '57.463042', lng: '45.799527'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Чкаловск', lat: '56.766253', lng: '43.251105'));
    result.add(Address(country: 'Россия', region: 'Нижегородская область', city: 'Шахунья', lat: '57.676379', lng: '46.612915'));
    result.add(Address(country: 'Россия', region: 'Новгородская область', city: 'Боровичи', lat: '58.388219', lng: '33.914025'));
    result.add(Address(country: 'Россия', region: 'Новгородская область', city: 'Валдай', lat: '57.980199', lng: '33.246667'));
    result.add(Address(country: 'Россия', region: 'Новгородская область', city: 'Великий Новгород', lat: '55.603969', lng: '31.197214'));
    result.add(Address(country: 'Россия', region: 'Новгородская область', city: 'Малая Вишера', lat: '55.205024', lng: '67.248601'));
    result.add(Address(country: 'Россия', region: 'Новгородская область', city: 'Окуловка', lat: '58.377145', lng: '33.298679'));
    result.add(Address(country: 'Россия', region: 'Новгородская область', city: 'Пестово', lat: '58.599071', lng: '35.798098'));
    result.add(Address(country: 'Россия', region: 'Новгородская область', city: 'Сольцы', lat: '58.120168', lng: '30.309355'));
    result.add(Address(country: 'Россия', region: 'Новгородская область', city: 'Старая Русса', lat: '45.044521', lng: '41.969083'));
    result.add(Address(country: 'Россия', region: 'Новгородская область', city: 'Холм', lat: '57.145202', lng: '31.178781'));
    result.add(Address(country: 'Россия', region: 'Новгородская область', city: 'Чудово', lat: '59.12119', lng: '31.670285'));
    result.add(Address(country: 'Россия', region: 'Новосибирская область', city: 'Барабинск', lat: '55.350412', lng: '78.341923'));
    result.add(Address(country: 'Россия', region: 'Новосибирская область', city: 'Бердск', lat: '54.758288', lng: '83.107135'));
    result.add(Address(country: 'Россия', region: 'Новосибирская область', city: 'Болотное', lat: '55.672001', lng: '84.385447'));
    result.add(Address(country: 'Россия', region: 'Новосибирская область', city: 'Искитим', lat: '54.642582', lng: '83.306382'));
    result.add(Address(country: 'Россия', region: 'Новосибирская область', city: 'Карасук', lat: '53.734294', lng: '78.042389'));
    result.add(Address(country: 'Россия', region: 'Новосибирская область', city: 'Каргат', lat: '55.194476', lng: '80.283039'));
    result.add(Address(country: 'Россия', region: 'Новосибирская область', city: 'Куйбышев', lat: '53.195538', lng: '50.101783'));
    result.add(Address(country: 'Россия', region: 'Новосибирская область', city: 'Купино', lat: '54.366046', lng: '77.297254'));
    result.add(Address(country: 'Россия', region: 'Новосибирская область', city: 'Новосибирск', lat: '55.030199', lng: '82.92043'));
    result.add(Address(country: 'Россия', region: 'Новосибирская область', city: 'Обь', lat: '54.994594', lng: '82.693758'));
    result.add(Address(country: 'Россия', region: 'Новосибирская область', city: 'Татарск', lat: '55.214532', lng: '75.97409'));
    result.add(Address(country: 'Россия', region: 'Новосибирская область', city: 'Тогучин', lat: '55.238013', lng: '84.402865'));
    result.add(Address(country: 'Россия', region: 'Новосибирская область', city: 'Черепаново', lat: '54.228417', lng: '83.372201'));
    result.add(Address(country: 'Россия', region: 'Новосибирская область', city: 'Чулым', lat: '55.091258', lng: '80.963288'));
    result.add(Address(country: 'Россия', region: 'Омская область', city: 'Исилькуль', lat: '54.911844', lng: '71.266945'));
    result.add(Address(country: 'Россия', region: 'Омская область', city: 'Калачинск', lat: '55.052608', lng: '74.581782'));
    result.add(Address(country: 'Россия', region: 'Омская область', city: 'Называевск', lat: '55.567066', lng: '71.348718'));
    result.add(Address(country: 'Россия', region: 'Омская область', city: 'Омск', lat: '54.989342', lng: '73.368212'));
    result.add(Address(country: 'Россия', region: 'Омская область', city: 'Тюкалинск', lat: '55.870506', lng: '72.195506'));
    result.add(Address(country: 'Россия', region: 'Оренбургская область', city: 'Абдулино', lat: '53.677839', lng: '53.647263'));
    result.add(Address(country: 'Россия', region: 'Оренбургская область', city: 'Бугуруслан', lat: '53.6523', lng: '52.432606'));
    result.add(Address(country: 'Россия', region: 'Оренбургская область', city: 'Бузулук', lat: '52.788116', lng: '52.262438'));
    result.add(Address(country: 'Россия', region: 'Оренбургская область', city: 'Кувандык', lat: '51.478483', lng: '57.361168'));
    result.add(Address(country: 'Россия', region: 'Оренбургская область', city: 'Медногорск', lat: '51.403794', lng: '57.58324'));
    result.add(Address(country: 'Россия', region: 'Оренбургская область', city: 'Новотроицк', lat: '51.196417', lng: '58.301767'));
    result.add(Address(country: 'Россия', region: 'Оренбургская область', city: 'Оренбург', lat: '51.768199', lng: '55.096955'));
    result.add(Address(country: 'Россия', region: 'Оренбургская область', city: 'Орск', lat: '51.229362', lng: '58.475196'));
    result.add(Address(country: 'Россия', region: 'Оренбургская область', city: 'Соль-Илецк', lat: '51.16185', lng: '54.980336'));
    result.add(Address(country: 'Россия', region: 'Оренбургская область', city: 'Сорочинск', lat: '52.429092', lng: '53.151016'));
    result.add(Address(country: 'Россия', region: 'Оренбургская область', city: 'Ясный', lat: '51.036877', lng: '59.874349'));
    result.add(Address(country: 'Россия', region: 'Орловская область', city: 'Болхов', lat: '53.443097', lng: '36.005087'));
    result.add(Address(country: 'Россия', region: 'Орловская область', city: 'Дмитровск', lat: '52.505434', lng: '35.14151'));
    result.add(Address(country: 'Россия', region: 'Орловская область', city: 'Ливны', lat: '52.426549', lng: '37.608041'));
    result.add(Address(country: 'Россия', region: 'Орловская область', city: 'Малоархангельск', lat: '52.400974', lng: '36.502107'));
    result.add(Address(country: 'Россия', region: 'Орловская область', city: 'Мценск', lat: '53.278939', lng: '36.575006'));
    result.add(Address(country: 'Россия', region: 'Орловская область', city: 'Новосиль', lat: '52.974633', lng: '37.043756'));
    result.add(Address(country: 'Россия', region: 'Орловская область', city: 'Орёл', lat: '52.970371', lng: '36.063837'));
    result.add(Address(country: 'Россия', region: 'Пензенская область', city: 'Белинский', lat: '52.96562', lng: '43.408679'));
    result.add(Address(country: 'Россия', region: 'Пензенская область', city: 'Городище', lat: '53.272758', lng: '45.70267'));
    result.add(Address(country: 'Россия', region: 'Пензенская область', city: 'Заречный', lat: '53.19611', lng: '45.169071'));
    result.add(Address(country: 'Россия', region: 'Пензенская область', city: 'Каменка', lat: '53.185524', lng: '44.046896'));
    result.add(Address(country: 'Россия', region: 'Пензенская область', city: 'Кузнецк', lat: '53.119335', lng: '46.601165'));
    result.add(Address(country: 'Россия', region: 'Пензенская область', city: 'Нижний Ломов', lat: '54.901233', lng: '99.026387'));
    result.add(Address(country: 'Россия', region: 'Пензенская область', city: 'Никольск', lat: '53.71447', lng: '46.084356'));
    result.add(Address(country: 'Россия', region: 'Пензенская область', city: 'Пенза', lat: '53.195063', lng: '45.018316'));
    result.add(Address(country: 'Россия', region: 'Пензенская область', city: 'Сердобск', lat: '52.455683', lng: '44.202735'));
    result.add(Address(country: 'Россия', region: 'Пензенская область', city: 'Спасск', lat: '53.926494', lng: '43.187729'));
    result.add(Address(country: 'Россия', region: 'Пензенская область', city: 'Сурск', lat: '53.07604', lng: '45.6911'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Александровск', lat: '59.162925', lng: '57.584669'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Березники', lat: '59.407922', lng: '56.804015'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Верещагино', lat: '58.079761', lng: '54.658083'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Горнозаводск', lat: '58.374682', lng: '58.330917'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Гремячинск', lat: '58.562599', lng: '57.852034'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Губаха', lat: '58.837018', lng: '57.554575'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Добрянка', lat: '58.468063', lng: '56.403986'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Кизел', lat: '59.049425', lng: '57.653875'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Красновишерск', lat: '60.412821', lng: '57.083301'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Краснокамск', lat: '58.078357', lng: '55.736376'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Кудымкар', lat: '59.014548', lng: '54.664183'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Кунгур', lat: '57.42881', lng: '56.944206'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Лысьва', lat: '58.100413', lng: '57.811655'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Нытва', lat: '57.939127', lng: '55.328622'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Оса', lat: '57.279672', lng: '55.468723'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Оханск', lat: '57.72193', lng: '55.388656'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Очёр', lat: '57.886894', lng: '54.715602'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Пермь', lat: '58.010374', lng: '56.229398'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Соликамск', lat: '59.648333', lng: '56.771029'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Усолье', lat: '52.756648', lng: '103.638769'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Чайковский', lat: '56.778061', lng: '54.147759'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Чердынь', lat: '60.402836', lng: '56.479543'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Чёрмоз', lat: '58.784335', lng: '56.150796'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Чернушка', lat: '56.51601', lng: '56.076361'));
    result.add(Address(country: 'Россия', region: 'Пермский край', city: 'Чусовой', lat: '58.297548', lng: '57.819318'));
    result.add(Address(country: 'Россия', region: 'Приморский край', city: 'Арсеньев', lat: '44.162084', lng: '133.269726'));
    result.add(Address(country: 'Россия', region: 'Приморский край', city: 'Артём', lat: '43.354804', lng: '132.18563'));
    result.add(Address(country: 'Россия', region: 'Приморский край', city: 'Большой Камень', lat: '53.443097', lng: '36.005087'));
    result.add(Address(country: 'Россия', region: 'Приморский край', city: 'Владивосток', lat: '43.115536', lng: '131.885485'));
    result.add(Address(country: 'Россия', region: 'Приморский край', city: 'Дальнегорск', lat: '44.554018', lng: '135.566179'));
    result.add(Address(country: 'Россия', region: 'Приморский край', city: 'Дальнереченск', lat: '45.93085', lng: '133.731738'));
    result.add(Address(country: 'Россия', region: 'Приморский край', city: 'Лесозаводск', lat: '45.477955', lng: '133.418594'));
    result.add(Address(country: 'Россия', region: 'Приморский край', city: 'Находка', lat: '42.824037', lng: '132.892811'));
    result.add(Address(country: 'Россия', region: 'Приморский край', city: 'Партизанск', lat: '43.119813', lng: '133.123246'));
    result.add(Address(country: 'Россия', region: 'Приморский край', city: 'Спасск-Дальний', lat: '44.597641', lng: '132.817559'));
    result.add(Address(country: 'Россия', region: 'Приморский край', city: 'Уссурийск', lat: '43.797273', lng: '131.95178'));
    result.add(Address(country: 'Россия', region: 'Приморский край', city: 'Фокино', lat: '53.455436', lng: '34.415923'));
    result.add(Address(country: 'Россия', region: 'Псковская область', city: 'Великие Луки', lat: '55.603969', lng: '31.197214'));
    result.add(Address(country: 'Россия', region: 'Псковская область', city: 'Гдов', lat: '58.744393', lng: '27.819585'));
    result.add(Address(country: 'Россия', region: 'Псковская область', city: 'Дно', lat: '57.826914', lng: '29.962992'));
    result.add(Address(country: 'Россия', region: 'Псковская область', city: 'Невель', lat: '56.02022', lng: '29.923969'));
    result.add(Address(country: 'Россия', region: 'Псковская область', city: 'Новоржев', lat: '57.029623', lng: '29.332419'));
    result.add(Address(country: 'Россия', region: 'Псковская область', city: 'Новосокольники', lat: '56.340749', lng: '30.152761'));
    result.add(Address(country: 'Россия', region: 'Псковская область', city: 'Опочка', lat: '56.714151', lng: '28.658881'));
    result.add(Address(country: 'Россия', region: 'Псковская область', city: 'Остров', lat: '57.345188', lng: '28.343806'));
    result.add(Address(country: 'Россия', region: 'Псковская область', city: 'Печоры', lat: '57.813934', lng: '27.609064'));
    result.add(Address(country: 'Россия', region: 'Псковская область', city: 'Порхов', lat: '57.764855', lng: '29.553145'));
    result.add(Address(country: 'Россия', region: 'Псковская область', city: 'Псков', lat: '57.81925', lng: '28.332065'));
    result.add(Address(country: 'Россия', region: 'Псковская область', city: 'Пустошка', lat: '56.337526', lng: '29.36678'));
    result.add(Address(country: 'Россия', region: 'Псковская область', city: 'Пыталово', lat: '57.063925', lng: '27.92396'));
    result.add(Address(country: 'Россия', region: 'Псковская область', city: 'Себеж', lat: '56.277398', lng: '28.484814'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Азов', lat: '47.112442', lng: '39.423581'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Аксай', lat: '47.269804', lng: '39.862615'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Батайск', lat: '47.138333', lng: '39.744469'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Белая Калитва', lat: '57.78567', lng: '36.693871'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Волгодонск', lat: '47.516545', lng: '42.198423'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Гуково', lat: '48.058442', lng: '39.940274'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Донецк', lat: '48.015877', lng: '37.80285'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Зверево', lat: '55.499999', lng: '36.926211'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Зерноград', lat: '46.849564', lng: '40.312815'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Каменск-Шахтинский', lat: '48.320515', lng: '40.268923'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Константиновск', lat: '47.577341', lng: '41.096694'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Красный Сулин', lat: '56.010563', lng: '92.852572'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Миллерово', lat: '48.92173', lng: '40.394849'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Морозовск', lat: '48.351157', lng: '41.830878'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Новочеркасск', lat: '47.422052', lng: '40.093725'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Новошахтинск', lat: '47.757738', lng: '39.93643'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Пролетарск', lat: '46.703849', lng: '41.727544'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Ростов-на-Дону', lat: '47.222078', lng: '39.720349'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Сальск', lat: '46.475177', lng: '41.541135'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Семикаракорск', lat: '47.517792', lng: '40.811505'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Таганрог', lat: '47.220983', lng: '38.9173'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Цимлянск', lat: '47.647714', lng: '42.09306'));
    result.add(Address(country: 'Россия', region: 'Ростовская область', city: 'Шахты', lat: '47.709601', lng: '40.215797'));
    result.add(Address(country: 'Россия', region: 'Рязанская область', city: 'Касимов', lat: '54.937288', lng: '41.391368'));
    result.add(Address(country: 'Россия', region: 'Рязанская область', city: 'Кораблино', lat: '53.926812', lng: '40.034463'));
    result.add(Address(country: 'Россия', region: 'Рязанская область', city: 'Михайлов', lat: '54.232506', lng: '39.023508'));
    result.add(Address(country: 'Россия', region: 'Рязанская область', city: 'Новомичуринск', lat: '54.034574', lng: '39.750865'));
    result.add(Address(country: 'Россия', region: 'Рязанская область', city: 'Рыбное', lat: '54.730806', lng: '39.505463'));
    result.add(Address(country: 'Россия', region: 'Рязанская область', city: 'Ряжск', lat: '53.708949', lng: '40.062894'));
    result.add(Address(country: 'Россия', region: 'Рязанская область', city: 'Рязань', lat: '54.629216', lng: '39.736375'));
    result.add(Address(country: 'Россия', region: 'Рязанская область', city: 'Сасово', lat: '54.349928', lng: '41.924087'));
    result.add(Address(country: 'Россия', region: 'Рязанская область', city: 'Скопин', lat: '53.82359', lng: '39.549328'));
    result.add(Address(country: 'Россия', region: 'Рязанская область', city: 'Спас-Клепики', lat: '55.131038', lng: '40.175786'));
    result.add(Address(country: 'Россия', region: 'Рязанская область', city: 'Спасск-Рязанский', lat: '54.407072', lng: '40.376424'));
    result.add(Address(country: 'Россия', region: 'Рязанская область', city: 'Шацк', lat: '51.496839', lng: '23.930185'));
    result.add(Address(country: 'Россия', region: 'Самарская область', city: 'Жигулёвск', lat: '53.401714', lng: '49.494657'));
    result.add(Address(country: 'Россия', region: 'Самарская область', city: 'Кинель', lat: '53.221004', lng: '50.634394'));
    result.add(Address(country: 'Россия', region: 'Самарская область', city: 'Нефтегорск', lat: '52.797221', lng: '51.163799'));
    result.add(Address(country: 'Россия', region: 'Самарская область', city: 'Новокуйбышевск', lat: '53.099469', lng: '49.947767'));
    result.add(Address(country: 'Россия', region: 'Самарская область', city: 'Октябрьск', lat: '53.164038', lng: '48.670668'));
    result.add(Address(country: 'Россия', region: 'Самарская область', city: 'Отрадный', lat: '51.691727', lng: '39.21793'));
    result.add(Address(country: 'Россия', region: 'Самарская область', city: 'Похвистнево', lat: '53.653282', lng: '52.122346'));
    result.add(Address(country: 'Россия', region: 'Самарская область', city: 'Самара', lat: '53.195538', lng: '50.101783'));
    result.add(Address(country: 'Россия', region: 'Самарская область', city: 'Сызрань', lat: '53.155782', lng: '48.474485'));
    result.add(Address(country: 'Россия', region: 'Самарская область', city: 'Тольятти', lat: '53.508816', lng: '49.419207'));
    result.add(Address(country: 'Россия', region: 'Самарская область', city: 'Чапаевск', lat: '52.981709', lng: '49.710217'));
    result.add(Address(country: 'Россия', region: 'Санкт-Петербург', city: 'Санкт-Петербург', lat: '59.939095', lng: '30.315868'));
    result.add(Address(country: 'Россия', region: 'Саратовская область', city: 'Аркадак', lat: '51.938814', lng: '43.499849'));
    result.add(Address(country: 'Россия', region: 'Саратовская область', city: 'Аткарск', lat: '51.873632', lng: '45.000296'));
    result.add(Address(country: 'Россия', region: 'Саратовская область', city: 'Балаково', lat: '52.018424', lng: '47.819667'));
    result.add(Address(country: 'Россия', region: 'Саратовская область', city: 'Балашов', lat: '51.554601', lng: '43.146469'));
    result.add(Address(country: 'Россия', region: 'Саратовская область', city: 'Вольск', lat: '52.045978', lng: '47.38729'));
    result.add(Address(country: 'Россия', region: 'Саратовская область', city: 'Ершов', lat: '51.352068', lng: '48.283494'));
    result.add(Address(country: 'Россия', region: 'Саратовская область', city: 'Калининск', lat: '51.499671', lng: '44.48548'));
    result.add(Address(country: 'Россия', region: 'Саратовская область', city: 'Красноармейск', lat: '56.120959', lng: '38.14094'));
    result.add(Address(country: 'Россия', region: 'Саратовская область', city: 'Красный Кут', lat: '56.010563', lng: '92.852572'));
    result.add(Address(country: 'Россия', region: 'Саратовская область', city: 'Маркс', lat: '51.713333', lng: '46.740009'));
    result.add(Address(country: 'Россия', region: 'Саратовская область', city: 'Новоузенск', lat: '50.466326', lng: '48.132119'));
    result.add(Address(country: 'Россия', region: 'Саратовская область', city: 'Петровск', lat: '52.314023', lng: '45.389931'));
    result.add(Address(country: 'Россия', region: 'Саратовская область', city: 'Пугачёв', lat: '52.014871', lng: '48.795588'));
    result.add(Address(country: 'Россия', region: 'Саратовская область', city: 'Ртищево', lat: '52.257455', lng: '43.785657'));
    result.add(Address(country: 'Россия', region: 'Саратовская область', city: 'Саратов', lat: '51.533103', lng: '46.034158'));
    result.add(Address(country: 'Россия', region: 'Саратовская область', city: 'Хвалынск', lat: '52.495501', lng: '48.105772'));
    result.add(Address(country: 'Россия', region: 'Саратовская область', city: 'Шиханы', lat: '52.114774', lng: '47.202327'));
    result.add(Address(country: 'Россия', region: 'Саратовская область', city: 'Энгельс', lat: '51.485489', lng: '46.126783'));
    result.add(Address(country: 'Россия', region: 'Сахалинская область', city: 'Александровск-Сахалинский', lat: '50.894564', lng: '142.1594'));
    result.add(Address(country: 'Россия', region: 'Сахалинская область', city: 'Анива', lat: '46.713168', lng: '142.526595'));
    result.add(Address(country: 'Россия', region: 'Сахалинская область', city: 'Долинск', lat: '47.32624', lng: '142.79344'));
    result.add(Address(country: 'Россия', region: 'Сахалинская область', city: 'Корсаков', lat: '46.63498', lng: '142.78257'));
    result.add(Address(country: 'Россия', region: 'Сахалинская область', city: 'Курильск', lat: '45.225174', lng: '147.883761'));
    result.add(Address(country: 'Россия', region: 'Сахалинская область', city: 'Макаров', lat: '48.625101', lng: '142.778851'));
    result.add(Address(country: 'Россия', region: 'Сахалинская область', city: 'Невельск', lat: '46.652828', lng: '141.863126'));
    result.add(Address(country: 'Россия', region: 'Сахалинская область', city: 'Оха', lat: '53.584521', lng: '142.947186'));
    result.add(Address(country: 'Россия', region: 'Сахалинская область', city: 'Поронайск', lat: '49.22038', lng: '143.08956'));
    result.add(Address(country: 'Россия', region: 'Сахалинская область', city: 'Северо-Курильск', lat: '50.676327', lng: '156.124106'));
    result.add(Address(country: 'Россия', region: 'Сахалинская область', city: 'Томари', lat: '47.762214', lng: '142.061627'));
    result.add(Address(country: 'Россия', region: 'Сахалинская область', city: 'Углегорск', lat: '49.081575', lng: '142.069281'));
    result.add(Address(country: 'Россия', region: 'Сахалинская область', city: 'Холмск', lat: '47.040905', lng: '142.041622'));
    result.add(Address(country: 'Россия', region: 'Сахалинская область', city: 'Южно-Сахалинск', lat: '46.959155', lng: '142.738023'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Алапаевск', lat: '57.853038', lng: '61.702672'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Артёмовский', lat: '57.338402', lng: '61.894651'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Асбест', lat: '57.005274', lng: '61.458114'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Берёзовский', lat: '56.910173', lng: '60.798203'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Богданович', lat: '56.776502', lng: '62.046295'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Верхний Тагил', lat: '53.876143', lng: '59.216953'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Верхняя Пышма', lat: '53.876143', lng: '59.216953'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Верхняя Салда', lat: '53.876143', lng: '59.216953'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Верхняя Тура', lat: '53.876143', lng: '59.216953'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Верхотурье', lat: '58.862216', lng: '60.810213'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Волчанск', lat: '59.934934', lng: '60.078796'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Дегтярск', lat: '56.698463', lng: '60.086674'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Екатеринбург', lat: '56.838011', lng: '60.597465'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Заречный', lat: '53.19611', lng: '45.169071'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Ивдель', lat: '60.697349', lng: '60.41729'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Ирбит', lat: '57.683819', lng: '63.057664'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Каменск-Уральский', lat: '56.414927', lng: '61.918708'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Камышлов', lat: '56.846578', lng: '62.712288'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Карпинск', lat: '59.766534', lng: '60.001227'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Качканар', lat: '58.70511', lng: '59.483959'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Кировград', lat: '57.432415', lng: '60.062896'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Краснотурьинск', lat: '59.763761', lng: '60.193493'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Красноуральск', lat: '58.35369', lng: '60.055961'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Красноуфимск', lat: '56.617744', lng: '57.770692'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Кушва', lat: '58.282566', lng: '59.764682'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Михайловск', lat: '45.129667', lng: '42.028803'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Невьянск', lat: '57.491225', lng: '60.218251'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Нижние Серги', lat: '54.901233', lng: '99.026387'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Нижний Тагил', lat: '54.901233', lng: '99.026387'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Нижняя Салда', lat: '54.901233', lng: '99.026387'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'НижняяТура', lat: '54.901233', lng: '99.026387'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Новая Ляля', lat: '59.704642', lng: '30.788966'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Новоуральск', lat: '57.247235', lng: '60.095604'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Первоуральск', lat: '56.905839', lng: '59.943249'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Полевской', lat: '56.446499', lng: '60.177072'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Ревда', lat: '56.800079', lng: '59.908718'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Реж', lat: '57.373772', lng: '61.391639'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Североуральск', lat: '60.153281', lng: '59.952556'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Среднеуральск', lat: '56.991837', lng: '60.477136'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Сухой Лог', lat: '54.101752', lng: '35.339319'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Сысерть', lat: '56.502281', lng: '60.810025'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Тавда', lat: '58.041871', lng: '65.272595'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Талица', lat: '56.595192', lng: '37.661689'));
    result.add(Address(country: 'Россия', region: 'Свердловская область', city: 'Туринск', lat: '58.039442', lng: '63.698144'));
    result.add(Address(country: 'Россия', region: 'Северная Осетия — Алания', city: 'Алагир', lat: '43.041711', lng: '44.219875'));
    result.add(Address(country: 'Россия', region: 'Северная Осетия — Алания', city: 'Ардон', lat: '43.175598', lng: '44.295621'));
    result.add(Address(country: 'Россия', region: 'Северная Осетия — Алания', city: 'Беслан', lat: '43.19376', lng: '44.533792'));
    result.add(Address(country: 'Россия', region: 'Северная Осетия — Алания', city: 'Владикавказ', lat: '43.02115', lng: '44.68196'));
    result.add(Address(country: 'Россия', region: 'Северная Осетия — Алания', city: 'Дигора', lat: '43.156732', lng: '44.155035'));
    result.add(Address(country: 'Россия', region: 'Северная Осетия — Алания', city: 'Моздок', lat: '43.735413', lng: '44.653878'));
    result.add(Address(country: 'Россия', region: 'Смоленская область', city: 'Велиж', lat: '55.603969', lng: '31.197214'));
    result.add(Address(country: 'Россия', region: 'Смоленская область', city: 'Вязьма', lat: '55.205944', lng: '34.298037'));
    result.add(Address(country: 'Россия', region: 'Смоленская область', city: 'Демидов', lat: '55.26444', lng: '31.515011'));
    result.add(Address(country: 'Россия', region: 'Смоленская область', city: 'Десногорск', lat: '54.152366', lng: '33.287872'));
    result.add(Address(country: 'Россия', region: 'Смоленская область', city: 'Дорогобуж', lat: '54.912677', lng: '33.297035'));
    result.add(Address(country: 'Россия', region: 'Смоленская область', city: 'Духовщина', lat: '55.191351', lng: '32.414171'));
    result.add(Address(country: 'Россия', region: 'Смоленская область', city: 'Ельня', lat: '54.575906', lng: '33.182734'));
    result.add(Address(country: 'Россия', region: 'Смоленская область', city: 'Починок', lat: '54.406265', lng: '32.439782'));
    result.add(Address(country: 'Россия', region: 'Смоленская область', city: 'Рославль', lat: '53.947309', lng: '32.85678'));
    result.add(Address(country: 'Россия', region: 'Смоленская область', city: 'Рудня', lat: '54.947031', lng: '31.093576'));
    result.add(Address(country: 'Россия', region: 'Смоленская область', city: 'Сафоново', lat: '55.106304', lng: '33.237917'));
    result.add(Address(country: 'Россия', region: 'Смоленская область', city: 'Смоленск', lat: '54.782635', lng: '32.045251'));
    result.add(Address(country: 'Россия', region: 'Смоленская область', city: 'Сычёвка', lat: '55.83161', lng: '34.277834'));
    result.add(Address(country: 'Россия', region: 'Смоленская область', city: 'Ярцево', lat: '57.535951', lng: '40.006121'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Благодарный', lat: '45.095649', lng: '43.440021'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Будённовск', lat: '44.781528', lng: '44.165024'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Георгиевск', lat: '44.148599', lng: '43.473896'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Ессентуки', lat: '44.044526', lng: '42.85891'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Железноводск', lat: '44.132058', lng: '43.030533'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Зеленокумск', lat: '44.403288', lng: '43.884148'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Изобильный', lat: '45.368536', lng: '41.708644'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Ипатово', lat: '45.717419', lng: '42.911147'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Кисловодск', lat: '43.905225', lng: '42.716796'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Лермонтов', lat: '44.105344', lng: '42.973175'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Минеральные Воды', lat: '48.92173', lng: '40.394849'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Михайловск', lat: '45.129667', lng: '42.028803'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Невинномысск', lat: '44.638287', lng: '41.936061'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Нефтекумск', lat: '44.750586', lng: '44.994088'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Новоалександровск', lat: '45.493304', lng: '41.215388'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Новопавловск', lat: '43.957369', lng: '43.631901'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Пятигорск', lat: '44.03929', lng: '43.07084'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Светлоград', lat: '45.328573', lng: '42.856628'));
    result.add(Address(country: 'Россия', region: 'Ставропольский край', city: 'Ставрополь', lat: '45.044521', lng: '41.969083'));
    result.add(Address(country: 'Россия', region: 'Тамбовская область', city: 'Жердевка', lat: '51.842282', lng: '41.461796'));
    result.add(Address(country: 'Россия', region: 'Тамбовская область', city: 'Кирсанов', lat: '52.650646', lng: '42.728663'));
    result.add(Address(country: 'Россия', region: 'Тамбовская область', city: 'Котовск', lat: '52.59292', lng: '41.50575'));
    result.add(Address(country: 'Россия', region: 'Тамбовская область', city: 'Мичуринск', lat: '52.893913', lng: '40.498011'));
    result.add(Address(country: 'Россия', region: 'Тамбовская область', city: 'Моршанск', lat: '53.443611', lng: '41.811627'));
    result.add(Address(country: 'Россия', region: 'Тамбовская область', city: 'Рассказово', lat: '52.653842', lng: '41.874302'));
    result.add(Address(country: 'Россия', region: 'Тамбовская область', city: 'Тамбов', lat: '52.721219', lng: '41.452274'));
    result.add(Address(country: 'Россия', region: 'Тамбовская область', city: 'Уварово', lat: '51.983099', lng: '42.261'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Агрыз', lat: '56.526318', lng: '52.995266'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Азнакаево', lat: '54.859808', lng: '53.074533'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Альметьевск', lat: '54.901383', lng: '52.297113'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Арск', lat: '56.091311', lng: '49.876989'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Бавлы', lat: '54.406333', lng: '53.245896'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Болгар', lat: '57.852118', lng: '114.198968'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Бугульма', lat: '54.536413', lng: '52.789489'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Буинск', lat: '54.964153', lng: '48.290142'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Елабуга', lat: '55.75667', lng: '52.05446'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Заинск', lat: '55.298984', lng: '52.006391'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Зеленодольск', lat: '55.846906', lng: '48.500617'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Иннополис', lat: '55.75208', lng: '48.744609'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Казань', lat: '55.796289', lng: '49.108795'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Кукмор', lat: '56.186599', lng: '50.893981'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Лаишево', lat: '55.402449', lng: '49.543328'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Лениногорск', lat: '54.599028', lng: '52.442667'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Мамадыш', lat: '55.717771', lng: '51.410224'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Менделеевск', lat: '55.895186', lng: '52.314397'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Мензелинск', lat: '55.719972', lng: '53.101429'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Набережные Челны', lat: '57.787134', lng: '38.455332'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Нижнекамск', lat: '55.63407', lng: '51.809112'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Нурлат', lat: '54.428117', lng: '50.804958'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Тетюши', lat: '54.936931', lng: '48.830074'));
    result.add(Address(country: 'Россия', region: 'Татарстан', city: 'Чистополь', lat: '55.372334', lng: '50.643575'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Андреаполь', lat: '56.65079', lng: '32.262023'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Бежецк', lat: '57.78567', lng: '36.693871'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Белый', lat: '55.83385', lng: '32.938805'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Бологое', lat: '57.885626', lng: '34.053776'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Весьегонск', lat: '58.658355', lng: '37.259019'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Вышний Волочёк', lat: '61.006355', lng: '36.449511'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Западная Двина', lat: '69.400373', lng: '32.450139'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Зубцов', lat: '56.176143', lng: '34.58256'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Калязин', lat: '57.240412', lng: '37.855078'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Кашин', lat: '57.358381', lng: '37.61344'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Кимры', lat: '56.873338', lng: '37.355678'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Конаково', lat: '56.713217', lng: '36.779309'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Красный Холм', lat: '56.010563', lng: '92.852572'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Кувшиново', lat: '57.028957', lng: '34.165877'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Лихославль', lat: '57.122219', lng: '35.466808'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Нелидово', lat: '56.223296', lng: '32.776587'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Осташков', lat: '57.142872', lng: '33.115441'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Ржев', lat: '56.262877', lng: '34.329065'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Старица', lat: '56.514927', lng: '34.933586'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Тверь', lat: '56.859611', lng: '35.911896'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Торжок', lat: '57.041338', lng: '34.96014'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Торопец', lat: '56.501173', lng: '31.635466'));
    result.add(Address(country: 'Россия', region: 'Тверская область', city: 'Удомля', lat: '57.876779', lng: '35.00511'));
    result.add(Address(country: 'Россия', region: 'Томская область', city: 'Асино', lat: '56.997514', lng: '86.153906'));
    result.add(Address(country: 'Россия', region: 'Томская область', city: 'Кедровый', lat: '57.560963', lng: '79.566965'));
    result.add(Address(country: 'Россия', region: 'Томская область', city: 'Колпашево', lat: '58.311384', lng: '82.902679'));
    result.add(Address(country: 'Россия', region: 'Томская область', city: 'Северск', lat: '56.603185', lng: '84.880913'));
    result.add(Address(country: 'Россия', region: 'Томская область', city: 'Стрежевой', lat: '60.732862', lng: '77.604002'));
    result.add(Address(country: 'Россия', region: 'Томская область', city: 'Томск', lat: '56.48464', lng: '84.947649'));
    result.add(Address(country: 'Россия', region: 'Тульская область', city: 'Алексин', lat: '54.502429', lng: '37.066034'));
    result.add(Address(country: 'Россия', region: 'Тульская область', city: 'Белёв', lat: '53.809934', lng: '36.130097'));
    result.add(Address(country: 'Россия', region: 'Тульская область', city: 'Богородицк', lat: '53.770694', lng: '38.131687'));
    result.add(Address(country: 'Россия', region: 'Тульская область', city: 'Болохово', lat: '54.082107', lng: '37.82679'));
    result.add(Address(country: 'Россия', region: 'Тульская область', city: 'Венёв', lat: '54.350369', lng: '38.265527'));
    result.add(Address(country: 'Россия', region: 'Тульская область', city: 'Донской', lat: '47.992758', lng: '37.915058'));
    result.add(Address(country: 'Россия', region: 'Тульская область', city: 'Кимовск', lat: '53.972149', lng: '38.533063'));
    result.add(Address(country: 'Россия', region: 'Тульская область', city: 'Киреевск', lat: '53.934944', lng: '37.928542'));
    result.add(Address(country: 'Россия', region: 'Тульская область', city: 'Липки', lat: '53.94175', lng: '37.701915'));
    result.add(Address(country: 'Россия', region: 'Тульская область', city: 'Новомосковск', lat: '54.010993', lng: '38.290896'));
    result.add(Address(country: 'Россия', region: 'Тульская область', city: 'Плавск', lat: '53.706843', lng: '37.291987'));
    result.add(Address(country: 'Россия', region: 'Тульская область', city: 'Советск', lat: '57.587599', lng: '48.959521'));
    result.add(Address(country: 'Россия', region: 'Тульская область', city: 'Суворов', lat: '54.122083', lng: '36.490339'));
    result.add(Address(country: 'Россия', region: 'Тульская область', city: 'Тула', lat: '54.193122', lng: '37.617348'));
    result.add(Address(country: 'Россия', region: 'Тульская область', city: 'Узловая', lat: '53.97844', lng: '38.160299'));
    result.add(Address(country: 'Россия', region: 'Тульская область', city: 'Чекалин', lat: '54.098505', lng: '36.247372'));
    result.add(Address(country: 'Россия', region: 'Тульская область', city: 'Щёкино', lat: '54.002146', lng: '37.517626'));
    result.add(Address(country: 'Россия', region: 'Тульская область', city: 'Ясногорск', lat: '54.479555', lng: '37.689689'));
    result.add(Address(country: 'Россия', region: 'Тыва', city: 'Ак-Довурак', lat: '51.178493', lng: '90.598474'));
    result.add(Address(country: 'Россия', region: 'Тыва', city: 'Кызыл', lat: '51.719086', lng: '94.437757'));
    result.add(Address(country: 'Россия', region: 'Тыва', city: 'Туран', lat: '52.144916', lng: '93.917309'));
    result.add(Address(country: 'Россия', region: 'Тыва', city: 'Чадан', lat: '51.284472', lng: '91.578913'));
    result.add(Address(country: 'Россия', region: 'Тыва', city: 'Шагонар', lat: '51.534705', lng: '92.919972'));
    result.add(Address(country: 'Россия', region: 'Тюменская область', city: 'Заводоуковск', lat: '56.508808', lng: '66.539174'));
    result.add(Address(country: 'Россия', region: 'Тюменская область', city: 'Ишим', lat: '56.11055', lng: '69.479639'));
    result.add(Address(country: 'Россия', region: 'Тюменская область', city: 'Тобольск', lat: '58.201698', lng: '68.253762'));
    result.add(Address(country: 'Россия', region: 'Тюменская область', city: 'Тюмень', lat: '57.153033', lng: '65.534328'));
    result.add(Address(country: 'Россия', region: 'Тюменская область', city: 'Ялуторовск', lat: '56.654689', lng: '66.312206'));
    result.add(Address(country: 'Россия', region: 'Удмуртия', city: 'Воткинск', lat: '57.051806', lng: '53.987392'));
    result.add(Address(country: 'Россия', region: 'Удмуртия', city: 'Глазов', lat: '58.14081', lng: '52.674235'));
    result.add(Address(country: 'Россия', region: 'Удмуртия', city: 'Ижевск', lat: '56.852593', lng: '53.204843'));
    result.add(Address(country: 'Россия', region: 'Удмуртия', city: 'Камбарка', lat: '56.266057', lng: '54.193358'));
    result.add(Address(country: 'Россия', region: 'Удмуртия', city: 'Можга', lat: '56.442802', lng: '52.213839'));
    result.add(Address(country: 'Россия', region: 'Удмуртия', city: 'Сарапул', lat: '56.461621', lng: '53.803678'));
    result.add(Address(country: 'Россия', region: 'Ульяновская область', city: 'Барыш', lat: '53.653468', lng: '47.118029'));
    result.add(Address(country: 'Россия', region: 'Ульяновская область', city: 'Димитровград', lat: '54.217715', lng: '49.621984'));
    result.add(Address(country: 'Россия', region: 'Ульяновская область', city: 'Инза', lat: '53.857035', lng: '46.351649'));
    result.add(Address(country: 'Россия', region: 'Ульяновская область', city: 'Новоульяновск', lat: '54.151718', lng: '48.384824'));
    result.add(Address(country: 'Россия', region: 'Ульяновская область', city: 'Сенгилей', lat: '53.96207', lng: '48.790584'));
    result.add(Address(country: 'Россия', region: 'Ульяновская область', city: 'Ульяновск', lat: '54.314192', lng: '48.403123'));
    result.add(Address(country: 'Россия', region: 'Хабаровский край', city: 'Амурск', lat: '50.226797', lng: '136.910607'));
    result.add(Address(country: 'Россия', region: 'Хабаровский край', city: 'Бикин', lat: '46.818592', lng: '134.255034'));
    result.add(Address(country: 'Россия', region: 'Хабаровский край', city: 'Вяземский', lat: '47.535352', lng: '134.755297'));
    result.add(Address(country: 'Россия', region: 'Хабаровский край', city: 'Комсомольск-на-Амуре', lat: '50.549923', lng: '137.007948'));
    result.add(Address(country: 'Россия', region: 'Хабаровский край', city: 'Николаевск-на-Амуре', lat: '53.146143', lng: '140.711046'));
    result.add(Address(country: 'Россия', region: 'Хабаровский край', city: 'СоветскаяГавань', lat: '57.587599', lng: '48.959521'));
    result.add(Address(country: 'Россия', region: 'Хабаровский край', city: 'Хабаровск', lat: '48.480223', lng: '135.071917'));
    result.add(Address(country: 'Россия', region: 'Хакасия', city: 'Абаза', lat: '52.651657', lng: '90.088572'));
    result.add(Address(country: 'Россия', region: 'Хакасия', city: 'Абакан', lat: '53.721152', lng: '91.442387'));
    result.add(Address(country: 'Россия', region: 'Хакасия', city: 'Саяногорск', lat: '53.100762', lng: '91.412195'));
    result.add(Address(country: 'Россия', region: 'Хакасия', city: 'Сорск', lat: '54.002606', lng: '90.253323'));
    result.add(Address(country: 'Россия', region: 'Хакасия', city: 'Черногорск', lat: '53.827013', lng: '91.306005'));
    result.add(Address(country: 'Россия', region: 'Ханты-Мансийский АО — Югра', city: 'Белоярский', lat: '63.716043', lng: '66.667588'));
    result.add(Address(country: 'Россия', region: 'Ханты-Мансийский АО — Югра', city: 'Когалым', lat: '62.264069', lng: '74.482761'));
    result.add(Address(country: 'Россия', region: 'Ханты-Мансийский АО — Югра', city: 'Лангепас', lat: '61.253701', lng: '75.180725'));
    result.add(Address(country: 'Россия', region: 'Ханты-Мансийский АО — Югра', city: 'Лянтор', lat: '61.620663', lng: '72.155352'));
    result.add(Address(country: 'Россия', region: 'Ханты-Мансийский АО — Югра', city: 'Мегион', lat: '61.03289', lng: '76.102612'));
    result.add(Address(country: 'Россия', region: 'Ханты-Мансийский АО — Югра', city: 'Нефтеюганск', lat: '61.088212', lng: '72.616331'));
    result.add(Address(country: 'Россия', region: 'Ханты-Мансийский АО — Югра', city: 'Нижневартовск', lat: '60.939716', lng: '76.569628'));
    result.add(Address(country: 'Россия', region: 'Ханты-Мансийский АО — Югра', city: 'Нягань', lat: '62.145759', lng: '65.433654'));
    result.add(Address(country: 'Россия', region: 'Ханты-Мансийский АО — Югра', city: 'Покачи', lat: '61.742253', lng: '75.59412'));
    result.add(Address(country: 'Россия', region: 'Ханты-Мансийский АО — Югра', city: 'Пыть-Ях', lat: '60.758589', lng: '72.836526'));
    result.add(Address(country: 'Россия', region: 'Ханты-Мансийский АО — Югра', city: 'Радужный', lat: '62.134265', lng: '77.458439'));
    result.add(Address(country: 'Россия', region: 'Ханты-Мансийский АО — Югра', city: 'Сургут', lat: '61.254035', lng: '73.396221'));
    result.add(Address(country: 'Россия', region: 'Ханты-Мансийский АО — Югра', city: 'Урай', lat: '60.129632', lng: '64.803944'));
    result.add(Address(country: 'Россия', region: 'Ханты-Мансийский АО — Югра', city: 'Ханты-Мансийск', lat: '61.00318', lng: '69.018902'));
    result.add(Address(country: 'Россия', region: 'Ханты-Мансийский АО — Югра', city: 'Югорск', lat: '61.314917', lng: '63.331964'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Аша', lat: '54.990628', lng: '57.278469'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Бакал', lat: '54.938064', lng: '58.809171'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Верхнеуральск', lat: '53.876143', lng: '59.216953'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Верхний Уфалей', lat: '53.876143', lng: '59.216953'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Еманжелинск', lat: '54.752147', lng: '61.317223'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Златоуст', lat: '55.172871', lng: '59.671841'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Карабаш', lat: '55.490789', lng: '60.203042'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Карталы', lat: '53.053681', lng: '60.647753'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Касли', lat: '55.893652', lng: '60.765918'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Катав-Ивановск', lat: '54.752074', lng: '58.198443'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Копейск', lat: '55.116732', lng: '61.61797'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Коркино', lat: '54.892493', lng: '61.393049'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Куса', lat: '55.338597', lng: '59.438603'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Кыштым', lat: '55.707877', lng: '60.538949'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Магнитогорск', lat: '53.407158', lng: '58.980282'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Миасс', lat: '55.045635', lng: '60.107731'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Миньяр', lat: '55.070912', lng: '57.548458'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Нязепетровск', lat: '56.053673', lng: '59.609678'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Озёрск', lat: '55.763184', lng: '60.707599'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Сатка', lat: '55.040492', lng: '59.028881'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Сим', lat: '54.990716', lng: '57.689969'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Снежинск', lat: '56.085209', lng: '60.732536'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Трёхгорный', lat: '54.817842', lng: '58.446423'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Троицк', lat: '54.083217', lng: '61.559759'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Усть-Катав', lat: '54.930289', lng: '58.1747'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Чебаркуль', lat: '54.977785', lng: '60.37012'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Челябинск', lat: '55.159897', lng: '61.402554'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Южноуральск', lat: '54.442455', lng: '61.268229'));
    result.add(Address(country: 'Россия', region: 'Челябинская область', city: 'Юрюзань', lat: '54.854646', lng: '58.422662'));
    result.add(Address(country: 'Россия', region: 'Чечня', city: 'Аргун', lat: '56.694538', lng: '60.834315'));
    result.add(Address(country: 'Россия', region: 'Чечня', city: 'Грозный', lat: '43.317776', lng: '45.694909'));
    result.add(Address(country: 'Россия', region: 'Чечня', city: 'Гудермес', lat: '43.35188', lng: '46.103535'));
    result.add(Address(country: 'Россия', region: 'Чечня', city: 'Курчалой', lat: '43.20463', lng: '46.088955'));
    result.add(Address(country: 'Россия', region: 'Чечня', city: 'Урус-Мартан', lat: '43.127617', lng: '45.540614'));
    result.add(Address(country: 'Россия', region: 'Чечня', city: 'Шали', lat: '43.1488', lng: '45.900991'));
    result.add(Address(country: 'Россия', region: 'Чувашия', city: 'Алатырь', lat: '54.839816', lng: '46.572195'));
    result.add(Address(country: 'Россия', region: 'Чувашия', city: 'Канаш', lat: '55.506943', lng: '47.491764'));
    result.add(Address(country: 'Россия', region: 'Чувашия', city: 'Козловка', lat: '55.840386', lng: '48.245127'));
    result.add(Address(country: 'Россия', region: 'Чувашия', city: 'МариинскийПосад', lat: '56.206952', lng: '87.742263'));
    result.add(Address(country: 'Россия', region: 'Чувашия', city: 'Новочебоксарск', lat: '56.109551', lng: '47.479125'));
    result.add(Address(country: 'Россия', region: 'Чувашия', city: 'Цивильск', lat: '55.86501', lng: '47.47298'));
    result.add(Address(country: 'Россия', region: 'Чувашия', city: 'Чебоксары', lat: '56.146277', lng: '47.251079'));
    result.add(Address(country: 'Россия', region: 'Чувашия', city: 'Шумерля', lat: '55.497934', lng: '46.417846'));
    result.add(Address(country: 'Россия', region: 'Чувашия', city: 'Ядрин', lat: '55.940689', lng: '46.202107'));
    result.add(Address(country: 'Россия', region: 'Чукотский АО', city: 'Анадырь', lat: '64.733115', lng: '177.508924'));
    result.add(Address(country: 'Россия', region: 'Чукотский АО', city: 'Билибино', lat: '68.057129', lng: '166.451139'));
    result.add(Address(country: 'Россия', region: 'Чукотский АО', city: 'Певек', lat: '69.701761', lng: '170.299935'));
    result.add(Address(country: 'Россия', region: 'Якутия', city: 'Алдан', lat: '58.609451', lng: '125.381673'));
    result.add(Address(country: 'Россия', region: 'Якутия', city: 'Верхоянск', lat: '67.550161', lng: '133.390702'));
    result.add(Address(country: 'Россия', region: 'Якутия', city: 'Вилюйск', lat: '63.751722', lng: '121.627326'));
    result.add(Address(country: 'Россия', region: 'Якутия', city: 'Ленск', lat: '60.713731', lng: '114.911844'));
    result.add(Address(country: 'Россия', region: 'Якутия', city: 'Мирный', lat: '62.541028', lng: '113.978692'));
    result.add(Address(country: 'Россия', region: 'Якутия', city: 'Нерюнгри', lat: '56.659948', lng: '124.720315'));
    result.add(Address(country: 'Россия', region: 'Якутия', city: 'Нюрба', lat: '63.278463', lng: '118.336617'));
    result.add(Address(country: 'Россия', region: 'Якутия', city: 'Олёкминск', lat: '60.375796', lng: '120.406013'));
    result.add(Address(country: 'Россия', region: 'Якутия', city: 'Покровск', lat: '61.48424', lng: '129.148219'));
    result.add(Address(country: 'Россия', region: 'Якутия', city: 'Среднеколымск', lat: '67.458183', lng: '153.707009'));
    result.add(Address(country: 'Россия', region: 'Якутия', city: 'Томмот', lat: '58.958666', lng: '126.287579'));
    result.add(Address(country: 'Россия', region: 'Якутия', city: 'Удачный', lat: '66.406995', lng: '112.306362'));
    result.add(Address(country: 'Россия', region: 'Якутия', city: 'Якутск', lat: '62.028103', lng: '129.732663'));
    result.add(Address(country: 'Россия', region: 'Ямало-Ненецкий АО', city: 'Губкинский', lat: '51.18651', lng: '37.380687'));
    result.add(Address(country: 'Россия', region: 'Ямало-Ненецкий АО', city: 'Лабытнанги', lat: '66.660595', lng: '66.383963'));
    result.add(Address(country: 'Россия', region: 'Ямало-Ненецкий АО', city: 'Муравленко', lat: '63.795285', lng: '74.494448'));
    result.add(Address(country: 'Россия', region: 'Ямало-Ненецкий АО', city: 'Надым', lat: '65.535924', lng: '72.531341'));
    result.add(Address(country: 'Россия', region: 'Ямало-Ненецкий АО', city: 'НовыйУренгой', lat: '47.757738', lng: '39.93643'));
    result.add(Address(country: 'Россия', region: 'Ямало-Ненецкий АО', city: 'Ноябрьск', lat: '63.201801', lng: '75.450938'));
    result.add(Address(country: 'Россия', region: 'Ямало-Ненецкий АО', city: 'Салехард', lat: '66.529844', lng: '66.614399'));
    result.add(Address(country: 'Россия', region: 'Ямало-Ненецкий АО', city: 'Тарко-Сале', lat: '64.911819', lng: '77.761055'));
    result.add(Address(country: 'Россия', region: 'Ярославская область', city: 'Гаврилов-Ям', lat: '57.303309', lng: '39.849086'));
    result.add(Address(country: 'Россия', region: 'Ярославская область', city: 'Данилов', lat: '58.187861', lng: '40.174815'));
    result.add(Address(country: 'Россия', region: 'Ярославская область', city: 'Любим', lat: '58.362004', lng: '40.686873'));
    result.add(Address(country: 'Россия', region: 'Ярославская область', city: 'Мышкин', lat: '57.787134', lng: '38.455332'));
    result.add(Address(country: 'Россия', region: 'Ярославская область', city: 'Переславль-Залесский', lat: '56.736093', lng: '38.85431'));
    result.add(Address(country: 'Россия', region: 'Ярославская область', city: 'Пошехонье', lat: '58.503749', lng: '39.12005'));
    result.add(Address(country: 'Россия', region: 'Ярославская область', city: 'Ростов', lat: '47.222078', lng: '39.720349'));
    result.add(Address(country: 'Россия', region: 'Ярославская область', city: 'Рыбинск', lat: '58.048454', lng: '38.858406'));
    result.add(Address(country: 'Россия', region: 'Ярославская область', city: 'Тутаев', lat: '57.8688', lng: '39.530759'));
    result.add(Address(country: 'Россия', region: 'Ярославская область', city: 'Углич', lat: '57.526592', lng: '38.319372'));
    result.add(Address(country: 'Россия', region: 'Ярославская область', city: 'Ярославль', lat: '57.626569', lng: '39.893787'));
    return result;
  }

}


