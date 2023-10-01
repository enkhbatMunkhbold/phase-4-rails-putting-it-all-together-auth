class RecipesController < ApplicationController
  # skip_before_action :authorize, only: :create

  def index
    render json: Recipe.all
  end

  def create
    recipe = Recipe.create(recipe_params)
    # if recipe.valid?
      @current_user.recipes << recipe
      render json: @current_user, status: :created
    # else
    #   render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    # end
  end

  private

  def recipe_params
    params.permit(:title, :instructions, :minutes_to_complete, :user_id)
  end
end
