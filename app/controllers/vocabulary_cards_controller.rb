class VocabularyCardsController < ApplicationController
  helper_method :find_card
  def new
    @card = VocabularyCard.new
  end

  def create
    @card = current_user.vocabulary_cards.new(card_params)
    if @card.save
      flash[:success] = "Card created"
      redirect_to @card
    else
      render 'new'
    end
  end

  def edit
    @card = find_card
  end

  def update
    @card = find_card
    @card.assign_attributes(card_params)
    if @card.save
      flash[:success] = "Card is saved"
      redirect_to @card
    else
      render 'new'
    end
  end

  def show
  end

  def index
    render 'index', locals: { cards: VocabularyCard.all }
  end

  def destroy
    find_card.delete
    redirect_to vocabulary_cards_path
  end


  private

    def card_params
      params.require(:vocabulary_card).permit(:ja, :en)
    end

    def find_card
      return @card if defined? @card
      @card = VocabularyCard.find_by_id(params[:id])
    end

end
