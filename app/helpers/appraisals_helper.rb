module AppraisalsHelper
	def define_tpa_title
		params[:templates].present? ? t('tag_for_pa_appraisals_templates') : t('tag_for_pa_appraisals')
	end
end

