class FortuneController < ApplicationController
  require 'fortune_cookie'

  # hoping the helper is automatically included in this.
  def index
    @fortune = get_random_fortune;
  end

  def create
    # creates a new fortune
    @fortune = Fortune.new()

    # render errors on fortune creation. no idea why this would ever fail but yeah
    respond_to do |format|
      if @fortune.save
        format.html { redirect_to @fortunet, notice: 'Fortune was successfully created' }
        format.json { render :show, status: :created, location: @fortune }
      else
        format.html { render :new }
        format.json { render json: @fortune.errors, status: :unprocessable_entity }
      end
    end
  end

  # defined in helper
  def show
    @fortune = get_random_fortune
  end

  def destroy
    @fortune.destroy
    respond_to do |format|
      if @fortune.destroy
        format.html { redirect_to @fortune, notice: 'Fortune was successfully obliterated.' }
        format.json { head :no_content }
      end
    end
  end

  private

  def get_random_fortune
    offset = rand(Fortune.count)
    # return a random fortune offset off of the first fortune record
    return Fortune.offset(offset).first
  end
end
