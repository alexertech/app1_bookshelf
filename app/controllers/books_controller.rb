class BooksController < ApplicationController

    def index
    end

    def new
        @book = Book.new
    end

    def save
        @book = Book.new(book_params)

        if @book.save 
            redirect_to books_path, notice: "book saved"
        else
            redirect_to new
        end
    end

    def delete
        @book = find_book

        @book.delete

        redirect_to books_path
    end

    private

    def book_params
        params.require(:book).permit(:name,:author)
    end

    def find_book
        @book = Book.find(params[:id])
    end
    
end
