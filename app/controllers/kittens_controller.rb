# app/controllers/kittens_controller.rb
class KittensController < ApplicationController
    def index
      @kittens = Kitten.all

      respond_to do |format|
        format.html # Render the index.html.erb template by default for HTML requests
  
        format.json do
          # Render the @kittens array as JSON for JSON requests
          render json: @kittens
        end
      end
    end
  
    def show
      @kitten = Kitten.find(params[:id])
    end
  
    def new
      @kitten = Kitten.new
    end
  
    def create
      @kitten = Kitten.new(kitten_params)
  
      if @kitten.save
        redirect_to kitten_path(@kitten), notice: 'Kitten was successfully created.'
      else
        flash.now[:alert] = 'Oh no! There were errors in the form. Please check the errors below.'
        render :new
      end
    end
  
    def edit
      @kitten = Kitten.find(params[:id])
    end
  
    def update
      @kitten = Kitten.find(params[:id])
  
      if @kitten.update(kitten_params)
        redirect_to kitten_path(@kitten), notice: 'Kitten was successfully updated.'
      else
        flash.now[:alert] = 'Oops! There were errors in the form. Please check the errors below.'
        render :edit
      end
    end

    def destroy
      @kitten = Kitten.find(params[:id])
      @kitten.destroy
      redirect_to kittens_path, notice: 'Kitten was successfully deleted.'
    end
  
    private
  
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
  end
  