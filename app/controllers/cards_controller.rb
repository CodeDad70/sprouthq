class CardsController < ApplicationController

	def index
  	if params[:child_id]
      @cards = Child.find(params[:child_id]).cards
    else
      @cards = Card.all
    end
  end
 
  def show
    @child = Child.find_by(id:params[:child_id])
    @card = @child.cards.find_by(id: params[:id])
    
  end

  def new 
  	@child= Child.find_by(id: params[:child_id])
    @new_card = @child.cards.new
  end


	def create
		@child= Child.find_by(id: params[:child_id])  	
		@child.cards.build(card_params)
    if @child.valid?  
		  @child.save
    else 
      render :new  
    end
	end

  def edit
    @child = Child.find_by(id:params[:child_id])
    @card = @child.cards.find_by(id: params[:id])
  end

  def destroy
    @child = Child.find_by(id:params[:child_id])
    @card = @child.cards.find_by(id: params[:id])
    @card.destroy
    redirect_to children_path 
  end


	private


	def card_params
    params.require(:card).permit(:age, :height, :weight, :advil_dosage, :tylenol_dosage, :flu_shot, :child_id)
  end
	

end
