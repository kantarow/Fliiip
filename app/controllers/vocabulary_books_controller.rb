class VocabularyBooksController < ApplicationController
  def new
  end

  def create
    book = current_user.vocabulary_books.create
    params[:card_ids].each do |id|
      book.book_card_relationships.create(vocabulary_card_id: id)
    end
  end

  def edit
  end

  def show
  end

  def index
  end

  def destroy
  end

  private
    
    def book_params
    end
end
