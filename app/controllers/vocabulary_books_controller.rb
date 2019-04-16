class VocabularyBooksController < ApplicationController
  helper_method :find_book
  before_action :set_commit_message, only: [:new, :create, :edit, :update]
  def new
    @book = VocabularyBook.new
    @card = VocabularyCard.new
  end

  def create
    card_ids = params[:card_ids].to_a
    if params[:commit] == @book_commit_message
      @book = current_user.vocabulary_books.new(name: params[:name])
      if @book.save
        card_ids.each do |id|
          @book.book_card_relationships.create(vocabulary_card_id: id)
        end
        redirect_to @book
      else
        @card = VocabularyCard.new
        render 'new'
      end
    elsif params[:commit] == @card_commit_message
      @card = (card = current_user.vocabulary_cards.create(card_params)).invalid? ? card : VocabularyCard.new
      @book = VocabularyBook.new
      @name = params[:name]
      @checked_card_ids = (card_ids || []) << (card.id)
      render 'new'
    end
  end

  def edit
    @book = find_book
    @card = VocabularyCard.new
    @name = find_book.name
    @checked_card_ids = find_book.vocabulary_cards.map(&:id)
  end

  def update
    card_ids = params[:card_ids].map(&:to_i)
    if params[:commit] == @book_commit_message
      @book = find_book
      @book.name = params[:name]
      if @book.save
        unchecked_ids = @book.vocabulary_cards.map(&:id) - card_ids
        new_checked_ids = card_ids - @book.vocabulary_cards.map(&:id)
        p unchecked_ids
        p new_checked_ids
        unchecked_ids.each do |id|
          @book.book_card_relationships.find_by(vocabulary_card_id: id)&.delete
        end

        new_checked_ids.each do |id|
          @book.book_card_relationships.create(vocabulary_card_id: id)
        end
        redirect_to @book
      else
        @card = VocabularyCard.new
        render 'edit'
      end
    elsif params[:commit] == @card_commit_message
      @card = (card = current_user.vocabulary_cards.create(card_params)).invalid? ? card : VocabularyCard.new
      @book = find_book
      @name = params[:name]
      @checked_card_ids = (card_ids || []) << (card.id)
      render 'edit'
    end
  end

  def show
  end

  def index
  end

  def destroy
    find_book.delete
    redirect_to vocabulary_books_path
  end

  private

  def card_params
    params.require(:vocabulary_card).permit(:name, :ja, :en)
  end

  def find_book
    return @book if defined? @book
    @book = VocabularyBook.find_by_id(params[:id])
  end

  def set_commit_message
    @book_commit_message = "Save book"
    @card_commit_message = "Save card"
  end
end
