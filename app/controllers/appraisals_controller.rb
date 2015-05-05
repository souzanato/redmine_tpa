  class AppraisalsController < ApplicationController
    unloadable
    before_action :set_appraisal, only: [:show, :edit, :update, :destroy, :authorize_appraisal, :authorize_manage]
    before_action :authorize_manage, only: [:edit, :update, :destroy]
    before_action :authorize_appraisal, only: [:show]


    def index
      @appraisals = Appraisal
        .joins(:appraisees, :appraisers)
        .where("template is false and (appraisal_appraisees.user_id in (?) or appraisal_appraisers.id in (?))",
          User.current.id, User.current.id)
    end

    def show
      if params[:questions_and_options]
        render partial: 'questions_and_options'      
      end
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
      respond_to do |format|
        if @appraisal.update(appraisal_params)
          format.html { redirect_to appraisal_path(@appraisal), notice: t('appraisal_successfully_updated') }
          format.json { render :show, status: :ok, location: @appraisal }
        else
          format.html { render :edit }
          format.json { render json: @appraisal.errors, status: :unprocessable_entity }
        end
      end
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
    def authorize_appraisal
      render_403 :message => t('notice_not_authorized') unless @appraisal.appraisees.include?(User.current) or @appraisal.appraisers.include?(User.current)
    end

    def authorize_manage
      render_403 :message => t('notice_not_authorized') unless @appraisal.appraisers.include?(User.current)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_appraisal
      @appraisal = Appraisal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appraisal_params
      params[:appraisal].permit(:name, :description, :project_id, :template, :appraisal_template_id, :start_date, :end_date, :appraisal_id, {appraiser_ids: []}, {appraisee_ids: []})
    end

  end
