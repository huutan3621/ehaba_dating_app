class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Nick Fury',
  imageUrl: '',
  isOnline: true,
);

// USERS
final User hoangDung = User(
  id: 1,
  name: 'Hoàng Dũng',
  imageUrl: 'assets/images/avata.png',
  isOnline: true,
);
final User andrewGarfield = User(
  id: 2,
  name: 'Andrew Garfield',
  imageUrl: 'assets/iconLogo.png',
  isOnline: true,
);
final User chrisEvans = User(
  id: 3,
  name: 'Chris Evans',
  imageUrl: 'assets/images/avata.png',
  isOnline: false,
);
final User manNguyen = User(
  id: 4,
  name: 'Mẫn Nguyễn',
  imageUrl: 'assets/images/avata.png',
  isOnline: false,
);
final User quanAP = User(
  id: 5,
  name: 'Quân AP',
  imageUrl: 'assets/images/avata.png',
  isOnline: true,
);
