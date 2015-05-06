class TpaTagsController < ApplicationController
    before_action :set_tpa_tag, only: [:show, :edit, :update, :destroy]

    def index
      @appraisal = Appraisal.find(params[:appraisal_id])
      @user = User.find(params[:user_id])

      render_403 :message => t('notice_not_authorized') unless (User.current.id == params[:user_id].to_i or @appraisal.appraisers.include?(User.current))
    end

    def show
    end

    def new    
    end

    def create
	    @tpa_tag = TpaTag.new(tpa_tag_params)

      respond_to do |format|
        if @tpa_tag.save
          format.js
        else
          format.js
        end
      end

    end

    def edit
    end

    def update
    	asfsdf
    end

    def destroy
      begin
        @tpa_tag.destroy
      rescue ActiveRecord::DeleteRestrictionError => e
        @tpa_tag.errors.add(:base, e)
        flash[:error] = t('restrict_dependency_on_destroy')
      ensure
        respond_to do |format|
          format.js
        end
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_tpa_tag
      @tpa_tag = TpaTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tpa_tag_params
      params[:tpa_tag].permit(:appraisal_question_option_id, :appraisal_id, :user_id, :issue_id)
    end
end

