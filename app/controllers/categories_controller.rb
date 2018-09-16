class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @questions = @category.questions.includes(:user, :categories, :replies)
                                    .paginate(page: params[:page], per_page: 20)
                                    .order(id: :desc)
    @categories = Category.all
  end
end
