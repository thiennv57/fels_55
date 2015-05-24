class Admin::WordsController < ApplicationController
  def show
    @word = Word.find params[:id]
    @answer = @word.answers
  end
  
  def new
    @word = Word.new
    @word.answers.build
  end

  def create
    @word = Word.new params_words
    if @word.save
      flash[:success] = t :alert_success
      redirect_to [:admin, @word]
    else
      render "new"
    end
  end

  def edit
    @word = Word.find params[:id]
  end

  def update
    @word = Word.find params[:id]
    if @word.update_attributes params_words
      flash[:success] = t :alert_success
      redirect_to [:admin, @word]
    else
      render "edit"
    end
  end

  def destroy
    @word = Word.find(params[:id]).destroy
    redirect_to request.referrer || root_url
  end

  private
  def params_words
    params.require(:word).permit :keyword, :category_id, 
              answers_attributes: [:id, :meaning, :correct_answer, :_destroy]
  end
end
