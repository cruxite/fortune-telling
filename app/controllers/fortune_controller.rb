class FortuneController < ApplicationController

  def index
    @fortunes = Fortune.all
  end

  def create
    # creates a new fortune
    @fortune = Fortune.new()
    @fortune.text = "You will " << verb.sample  << noun.sample

    # render errors on fortune creation. no idea why this would ever fail but yeah
    respond_to do |format|
      if @fortune.save
        format.html { redirect_to @fortunet, notice: 'Fortune was successfully created! HOI YAH' }
        format.json { render :show, status: :created, location: @fortune }
      else
        format.html { render :new }
        format.json { render json: @fortune.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fortune.destroy

    respond_to do |format|
      if @fortune.destroy
        format.html { redirect_to @fortunet, notice: 'Fortune was successfully obliterated.' }
        format.json { head :no_content }
      end
    end
  end

  private

    def verb
      ['be visited by ', 'be pushed towards ', 'be eaten by ', 'be seen by ', 'be granted ', 'be coorced by ', ' invest in ']
    end

    def noun
      [' your grandmother ', ' a snake ', ' your therapist ', ' an audience ', ' a window ', ' an opportunity ', ' bitcoin ']
    end

    def adv
      [' greatly ', ' purple ', ' tumescent ']
    end
  
end
