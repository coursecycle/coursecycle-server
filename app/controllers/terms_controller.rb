class TermsController < ApplicationController
  before_action :set_term, only: [:show, :update, :destroy]

  # GET /terms
  def index
    @terms = Term.all

    render json: @terms
  end

  # GET /terms/1
  def show
    render json: @term
  end

  # POST /terms
  # def create
  #   @term = Term.new(term_params)
  #
  #   if @term.save
  #     render json: @term, status: :created, location: @term
  #   else
  #     render json: @term.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /terms/1
  # def update
  #   if @term.update(term_params)
  #     render json: @term
  #   else
  #     render json: @term.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /terms/1
  # def destroy
  #   @term.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_term
      @term = Term.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def term_params
      params.require(:term).permit(:title)
    end
end
