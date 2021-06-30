class Book
    @@on_shelf=[]
    @@on_loan=[]
    

    def initialize (book_author, book_title, book_isbn)
        @due_date=nil
        @title=book_title
        @author=book_author
        @isbn=book_isbn
    end

    attr_accessor :due_date

    def borrow
    end

    def return_to_library
    end

    def lent_out?
    end

    def self.create (book_author, book_title, book_isbn)
        new_book = Book.new(book_author, book_title, book_isbn)
        @@on_shelf << new_book
        return new_book
    end

    def self.current_due_date
    end

    def self.overdue_books
    end

    def self.browse
    end

    def self.available
    end

    def self.borrowed
    end

end
