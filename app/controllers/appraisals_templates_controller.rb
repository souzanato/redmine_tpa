  class AppraisalsTemplatesController < ApplicationController
    unloadable
    before_action :set_appraisal, only: [:show, :edit, :update, :destroy]
    
    def index
      @appraisals = Appraisal.where(template: true)
    end

    def show
    end

    def new    
      @appraisal = Appraisal.new
    end

    def create
      @appraisal = Appraisal.new(appraisal_params)

      respond_to do |format|
        if @appraisal.save
          format.html { redirect_to appraisal_template_url, notice: t('appraisal_successfully_created') }
          format.json { render :show, status: :created, location: @appraisal }
        else
          format.html { render :new }
          format.json { render json: @appraisal.errors, status: :unprocessable_entity }
        end
      end

    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_appraisal
      @appraisal = Appraisal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appraisal_params
      params[:appraisal].permit(:name, :description, :project_id, :template)
    end

  end
