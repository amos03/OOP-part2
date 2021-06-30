class Book
    @@on_shelf=[]
    @@on_loan=[]

    def initialize (book_author, book_title, book_isbn)
        @author=book_author
        @title=book_title
        @isbn=book_isbn
        @@on_shelf << self
        @due_date=nil      
    end

    attr_accessor :due_date

    
    #Class Methods
    def self.create (book_author, book_title, book_isbn)
        new_book = Book.new(book_author, book_title, book_isbn)
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
        @@on_shelf
    end

    def self.borrowed
        return @@on_loan
    end

#Instance Methods

def borrow
    if lent_out?
        return false
    else 
        @due_date=Book.current_due_date
        @@on_loan << self
        @@on_shelf.delete(self)
        return true
    end
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
puts "-----------------------"
puts "Attempting to borrow Portrait of the Artist"
puts "If borrowing successful, display true:"
p portrait.borrow
puts "Display Portrait of the Artist's due date (2 weeks from today):"
p portrait.due_date
puts "-----------------------"
puts "What books are still available on the shelf now?"
p Book.available
puts "-----------------------"
puts "What books are currently on loan"
p Book.borrowed