  class AppraisalsController < ApplicationController
    unloadable
    before_action :set_appraisal, only: [:show, :edit, :update, :destroy]

    def index
      @appraisals = Appraisal.where(template: false)
    end

    def show
    end

    def new    
      @appraisal = Appraisal.new(template: (params[:template] == 'true' ? true : false))
    end

    def create
      @appraisal = Appraisal.new(appraisal_params)
      @appraisal.template = false

      respond_to do |format|
        if @appraisal.save
          format.html { redirect_to @appraisal, notice: t('appraisal_successfully_created') }
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
      begin
        @appraisal.destroy
        flash[:notice] = t('appraisal_successfully_destroyed')
      rescue ActiveRecord::DeleteRestrictionError => e
        @appraisal.errors.add(:base, e)
        flash[:error] = t('restrict_dependency_on_destroy')
      ensure
        redirect_to appraisals_path
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_appraisal
      @appraisal = Appraisal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appraisal_params
      params[:appraisal].permit(:name, :description, :project_id, :template, :appraisal_template_id, :start_date, :end_date, :appraisal_id, {user_ids: []})
    end

  end
