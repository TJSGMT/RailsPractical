class BooksController < ApplicationController
    def index
      @books= Book.all
    end
  
    def new 
      @book = Book.new
    end
  
    def create
      @book = Book.new(params.require(:book).permit(:name,:price,:author_id))
      if @book.save
        redirect_to books_path
      else
        flash[:notice] = @book.errors.full_messages
        redirect_to new_book_path
      end
    
    end
  
    def show
      @book = Book.find(params[:id])
    end
  
    def edit
      @book = Book.find(params[:id])
    end
  
    def update
      @book = Book.find(params[:id])
      @book.update(params.require(:book).permit(:name,:price))
      redirect_to books_path
    end
  
    def destroy
      @author = Book.find(params[:id].to_i) 
         @book.destroy
      redirect_to books_path
    end
  end
  