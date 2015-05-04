class TpaTagsController < ApplicationController
    before_action :set_tpa_tag, only: [:show, :edit, :update, :destroy]

    def index
      # @tpa_tag = Appraisal.where(template: true).order(:name)
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
      params[:tpa_tag].permit(:appraisal_question_option_id, :appraisal_id, :user_id)
    end
end

