class BooksController < ApplicationController

    before_action :find_book, only: [:show, :edit, :update, :delete]

    def index
    end

    def new
        @book = Book.new
    end

    def show
    end

    def create
        @book = Book.new(params_book)

        if @book.save 
            redirect_to books_path, notice: "book created"
        else
            redirect_to new
        end
    end

    def edit 
    end

    def update 
        if @book.update_attributes(params_book)
            redirect_to books_path, notice: "book saved"
        else
            render edit
        end
    end

    def delete
        @book.delete
        redirect_to book_index_path
    end


    private

    def params_book
        params.require(:book).permit(:name,:author)
    end

    def find_book
        @book = Book.find(params[:id])
    end
    
end
