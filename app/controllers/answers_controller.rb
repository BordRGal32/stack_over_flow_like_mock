class AnswersController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @answer = Answer.new
  end

  def create
    @post = Post.find(params[:post_id])
    @answer = Answer.new(answer_params)

    if @answer.save
      @answer.update(:user_id => current_user.id)
      @post.answers << @answer
      @answer.update(:best_answer => false)
      flash[:notice] = "Answer Added"
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to :back }
        format.js { render 'new' }
      end
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])

    if @answer.update(answer_params)
      flash[:notice] = "Answer Updated"
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def vote
    target_answer = Answer.find(params[:id])
    Answer.remove_best_answer
    target_answer.mark_best_answer
    redirect_to root_path

  end
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to user_path(current_user)
  end

  def answer_params
    params.require(:answer).permit(:answer)
  end
end
