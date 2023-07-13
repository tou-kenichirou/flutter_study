enum Country {
  argentina(countryCode: 'ar', name: 'Argentina'),
  australia(countryCode: 'au', name: 'Australia'),
  austria(countryCode: 'at', name: 'Austria'),
  belgium(countryCode: 'be', name: 'Belgium'),
  bulgaria(countryCode: 'bg', name: 'Bulgaria'),
  canada(countryCode: 'ca', name: 'Canada'),
  china(countryCode: 'cn', name: 'China'),
  colombia(countryCode: 'co', name: 'Colombia'),
  cuba(countryCode: 'cu', name: 'Cuba'),
  czechRepublic(countryCode: 'cz', name: 'Czech Republic'),
  egypt(countryCode: 'eg', name: 'Egypt'),
  france(countryCode: 'fr', name: 'France'),
  germany(countryCode: 'de', name: 'Germany'),
  greece(countryCode: 'gr', name: 'Greece'),
  hongKong(countryCode: 'hk', name: 'Hong Kong'),
  hungary(countryCode: 'hu', name: 'Hungary'),
  india(countryCode: 'in', name: 'India'),
  indonesia(countryCode: 'id', name: 'Indonesia'),
  ireland(countryCode: 'ie', name: 'Ireland'),
  israel(countryCode: 'il', name: 'Israel'),
  italy(countryCode: 'it', name: 'Italy'),
  japan(countryCode: 'jp', name: 'Japan'),
  latvia(countryCode: 'lv', name: 'Latvia'),
  lithuania(countryCode: 'lt', name: 'Lithuania'),
  malaysia(countryCode: 'my', name: 'Malaysia'),
  mexico(countryCode: 'mx', name: 'Mexico'),
  morocco(countryCode: 'ma', name: 'Morocco'),
  netherlands(countryCode: 'nl', name: 'Netherlands'),
  nigeria(countryCode: 'ng', name: 'Nigeria'),
  norway(countryCode: 'no', name: 'Norway'),
  philippines(countryCode: 'ph', name: 'Philippines'),
  poland(countryCode: 'pl', name: 'Poland'),
  portugal(countryCode: 'pt', name: 'Portugal'),
  romania(countryCode: 'ro', name: 'Romania'),
  russia(countryCode: 'ru', name: 'Russia'),
  saudiArabia(countryCode: 'sa', name: 'Saudi Arabia'),
  serbia(countryCode: 'rs', name: 'Serbia'),
  singapore(countryCode: 'sg', name: 'Singapore'),
  slovakia(countryCode: 'sk', name: 'Slovakia'),
  slovenia(countryCode: 'si', name: 'Slovenia'),
  southAfrica(countryCode: 'za', name: 'South Africa'),
  southKorea(countryCode: 'kr', name: 'South Korea'),
  sweden(countryCode: 'se', name: 'Sweden'),
  switzerland(countryCode: 'ch', name: 'Switzerland'),
  taiwan(countryCode: 'tw', name: 'Taiwan'),
  thailand(countryCode: 'th', name: 'Thailand'),
  turkey(countryCode: 'tr', name: 'Turkey'),
  uae(countryCode: 'ae', name: 'UAE'),
  ukraine(countryCode: 'ua', name: 'Ukraine'),
  unitedKingdom(countryCode: 'gb', name: 'United Kingdom'),
  unitedStates(countryCode: 'us', name: 'United States'),
  venezuela(countryCode: 've', name: 'Venezuela');

  const Country({
    required this.countryCode,
    required this.name,
  });

  final String countryCode;
  final String name;
}