// fileprivate aynı dosyadan erişim sağlanabilen farklı dosyadan erişim sağlanamayan private public gibi bir ön ek
//associated type, generic isimlendirmeden bizi kurtarır.
//IteratorProtocol
//mutating structta fonksiyona erişimi sağlar, classta yok
// Defer bloğu en son işler

//Class init metodu ister, swift istemez.

struct Book {
    let author: String
    let title: String
}

struct Shelf {
    var books: [Book]
}

struct ShelfIterator: IteratorProtocol {
    private var books: [Book]
    init(books: [Book]) {
        self.books = books
    }
    mutating func next() -> Book? {
        // TODO: Return next underlying Book element.
        defer {
            if !books.isEmpty {
                books.removeFirst()
            }
        }
        return books.first
    }
    
    mutating func zipzipzip()-> Book? {
        return books.last
    }
}
extension Shelf: Sequence {
    func makeIterator() -> ShelfIterator {
        return ShelfIterator(books: books)
    }
}

let book1 = Book(author: "A. Brontë",
                 title: "The Tenant of Wildfell Hall")
let book2 = Book(author: "Ch. Brontë",
                 title: "Jane Eyre")
let book3 = Book(author: "E. Brontë",
                 title: "Wuthering Heights")
let shelf = Shelf(books: [book1, book2, book3])
var shelfIterator = shelf.makeIterator()
shelfIterator.next()
shelfIterator.zipzipzip()
