class News {
  String imageUrl;
  String title;
  String categories;
  int year;
  String language;
  int length; //! Not needed
  String description;
  List<String> screenshots;

  News(
      {this.imageUrl,
      this.categories,
      this.description,
      this.language,
      this.length,
      this.screenshots,
      this.title,
      this.year});
}

final List<News> news = [
  News(
    imageUrl: 'assets/images/did_you_know.jpg',
    title: "Did you know?",
    categories: 'Society,Culture',
    language: 'English',
    year: 2020,
    length: 129,
    description:
        'Our friendly neighborhood Super Hero decides to join his best friends Ned, MJ, and the rest of the gang on a European vacation. However, Peter\'s plan to leave super heroics behind for a few weeks are quickly scrapped when he begrudgingly agrees to help Nick Fury uncover the mystery of several elemental creature attacks, creating havoc across the continent.',
    screenshots: [
      'assets/images/did_you_know.jpg',
      'assets/images/did_you_know.jpg'
    ],
  ),
  News(
    imageUrl: 'assets/images/who_is_on_korean_money.jpg',
    title: "Who is on Korean money?",
    categories: 'Society,Culture,Economics',
    language: 'English',
    year: 2019,
    length: 129,
    description: 'One question we often get is “Who is on Korean money?”.' +
        '\nIt’s a good question, since we carry around these colorful bills with us and see those friendly faces all the time. But who are they, and why are they significant in Korea? After all, if they’re on the Korean Won bills, they must be important!' +
        '\nWe’ll fill you in on everything you need to know about the friendly faces on money in South Korea.',
    screenshots: [
      'assets/images/who_is_on_korean_money.jpg',
      'assets/images/who_is_on_korean_money.jpg',
      'assets/images/who_is_on_korean_money.jpg',
    ],
  ),
  News(
    imageUrl: 'assets/images/korean_food.jpg',
    title: "More About Korean Food",
    categories: 'Culture',
    language: 'English',
    year: 2018,
    length: 129,
    description:
        'A typical Korean meal consists of a bowl of rice, a bowl of soup or stew, and some side dishes as accompaniments. But within that basic structure, there is a deliciously wide variation of dishes for every season and palate.' +
            '\nKoreans use a huge range of vegetables from wild greens to the leaves of flowers, everything from the sea including seaweed and jellyfish, and all types of meat and poultry in diverse preparations. Koreans may have hundreds of ways to pickle vegetables and wild greens for long storage, but they also prize raw fish and raw meat dishes.' +
            '\nThese are some of the classic plates you will find in Korean kitchens all over the world. Some represent humble fare and others will be seen most often at family gatherings and events, but all are beloved by Koreans everywhere.',
    screenshots: [
      'assets/images/korean_food.jpg',
      'assets/images/korean_food.jpg',
      'assets/images/korean_food.jpg',
    ],
  )
];

final List<String> labels = ['Politics', 'Economy', 'Culture', 'Society'];

final List<String> myList = [
  'assets/images/myList1.jpg',
  'assets/images/myList2.png',
  'assets/images/myList3.png',
  'assets/images/myList4.jpg'
];

final List<String> hangeul = [
  'assets/images/b.jpg',
  'assets/images/giyeok.jpg',
  'assets/images/tt.jpg'
];
