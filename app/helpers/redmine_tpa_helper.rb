module RedmineTpaHelper
	def title_for_tpa
		return t('appraisals') if appraisals_path?
		return t('new_appraisal') if new_appraisal_path?
	end

	def appraisals_path?
		path = Rails.application.routes.recognize_path(request.original_url)
		path[:controller] == 'appraisals' and path[:action] == 'index'
	end

	def new_appraisal_path?
		path = Rails.application.routes.recognize_path(request.original_url)
		path[:controller] == 'appraisals' and path[:action] == 'new'
	end
end