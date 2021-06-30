class Book
    @@on_shelf=[]
    @@on_loan=[]
    

    def initialize (book_author, book_title, book_isbn)
        @author=book_author
        @title=book_title
        @isbn=book_isbn
        @due_date=nil      
    end

    attr_accessor :due_date

    def borrow
    end

    def return_to_library
    end

    def lent_out?
        if @@on_loan.include?(Book)
            return true
        else
            return false
        end
    end

    def self.create (book_author, book_title, book_isbn)
        new_book = Book.new(book_author, book_title, book_isbn)
        @@on_shelf << new_book
        return new_book
    end

    def self.current_due_date
        #due date will be 2 weeks from now
        return Time.now + (14*24*60*60)
    end

    def self.overdue_books
    end

    def self.browse
        return @@on_shelf.sample
    end

    def self.available
        return @@on_shelf
    end

    def self.borrowed
        return @@on_loan
    end

end

#Creating new Book instances
p portrait = Book.create("James Joyce", "Portrait of the Artist as a Young Man", "0142437344")
p karamazov = Book.create("Fyodor Dostoyevsky", "The Brothers Karamazov", "0141915684")
p war_and_peace = Book.create("Leo Tolstoy", "War and Peace", "0375760644")

#instance method for determining if lent out
p karamazov.lent_out?

#Calling class methods
puts "-----------------------"
puts "Available books:"
p Book.available
puts "-----------------------"
puts "Random book from the shelf:"
p Book.browse
puts "-----------------------"
puts "Has Portrait of the Artist been checked out?"
p portrait.lent_out?