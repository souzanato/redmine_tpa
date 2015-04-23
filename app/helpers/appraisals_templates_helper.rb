module AppraisalsTemplatesHelper
	def title_for_tpa
		return t('appraisals_templates') if appraisals_templates_path?
		return t('new_appraisal_template') if new_appraisal_templates_path?
	end

	def appraisals_templates_path?
		path = Rails.application.routes.recognize_path(request.original_url)
		path[:controller] == 'appraisals_templates' and path[:action] == 'index'
	end

	def new_appraisal_templates_path?
		path = Rails.application.routes.recognize_path(request.original_url)
		path[:controller] == 'appraisals_templates' and path[:action] == 'new'
	end
end