class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :setup_data
    
    def index
        render json: @data
    end
    
    #Show a single book
    def show
        book_info ={}
        for book in @data
            if book[:id] == params[:id]
                book_info = book
            end
        end
        render json: book_info
    end
    
    #Create a new book
    def create
        new_id = (@data.length   + 1).to_s
        new_title = params[:title]
        new_author = params[:author]
        
        new_book = {id: new_id, title: new_title, author: new_author}
        @data.push(new_book)
        render json: @data
    end
    
    #Update a book
    def update
        edited_book = {}
        for book in @data
        
            if book[:id] = params[:id]
                 edited_book=book
            end
        end
        
        edited_book["title"] = params[:title]
        edited_book["author"] = params[:author]
        render json: edited_book

    end
    
    #Remove a book
    def destroy
        deleted_book = {}
        for book in @data
        
            if book[:id] = params[:id]
                 deleted_book=book
            end
        end
        @data.delete(deleted_book)
        render json: @data
       
    end
    
    private
    def setup_data
        @data = [
            { id: "1", title: "Harry Potter", author: "J.K Rowling" },
            { id: "2", title: "Name of the wind", author: "Patrick Rothfuss" }
        ]
    end
end