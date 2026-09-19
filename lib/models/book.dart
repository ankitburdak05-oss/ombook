class Book {
  final String id;
  final String title;
  final String author;
  final BookStatus status;
  final int? currentPage;
  final int? totalPages;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final String coverColor;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.status,
    this.currentPage,
    this.totalPages,
    this.startedAt,
    this.completedAt,
    this.coverColor = '#8B4513',
  });

  double get progress {
    if (totalPages == null || totalPages == 0) return 0.0;
    return ((currentPage ?? 0) / totalPages!).clamp(0.0, 1.0);
  }
}

enum BookStatus { reading, completed, lent, wishlist }

class SampleBooks {
  static List<Book> all() => [
    Book(
      id: 'b1',
      title: "The Alchemist's Path",
      author: 'Paulo Coelho',
      status: BookStatus.reading,
      currentPage: 142,
      totalPages: 208,
      startedAt: DateTime.now().subtract(const Duration(days: 12)),
      coverColor: '#6B3410',
    ),
    Book(
      id: 'b2',
      title: 'Dune',
      author: 'Frank Herbert',
      status: BookStatus.completed,
      currentPage: 688,
      totalPages: 688,
      startedAt: DateTime.now().subtract(const Duration(days: 60)),
      completedAt: DateTime.now().subtract(const Duration(days: 5)),
      coverColor: '#2D1810',
    ),
    Book(
      id: 'b3',
      title: 'Stormlight Archive',
      author: 'Brandon Sanderson',
      status: BookStatus.completed,
      currentPage: 1200,
      totalPages: 1200,
      coverColor: '#4A2818',
    ),
    Book(
      id: 'b4',
      title: 'Mindfulness & Focus',
      author: 'Various',
      status: BookStatus.lent,
      coverColor: '#5C3826',
    ),
    Book(
      id: 'b5',
      title: 'Meditations',
      author: 'Marcus Aurelius',
      status: BookStatus.completed,
      coverColor: '#3A2418',
    ),
    Book(
      id: 'b6',
      title: 'The Power of Now',
      author: 'Eckhart Tolle',
      status: BookStatus.reading,
      currentPage: 89,
      totalPages: 236,
      coverColor: '#6B4423',
    ),
    Book(
      id: 'b7',
      title: 'Atomic Habits',
      author: 'James Clear',
      status: BookStatus.completed,
      coverColor: '#8B4513',
    ),
    Book(
      id: 'b8',
      title: 'Deep Work',
      author: 'Cal Newport',
      status: BookStatus.reading,
      currentPage: 156,
      totalPages: 296,
      coverColor: '#2D5A3D',
    ),
    Book(
      id: 'b9',
      title: 'Sapiens',
      author: 'Yuval Noah Harari',
      status: BookStatus.completed,
      coverColor: '#4A0E0E',
    ),
    Book(
      id: 'b10',
      title: 'The Alchemist',
      author: 'Paulo Coelho',
      status: BookStatus.completed,
      coverColor: '#D4A574',
    ),
  ];
}
