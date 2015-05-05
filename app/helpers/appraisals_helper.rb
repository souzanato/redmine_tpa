module AppraisalsHelper
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

  	def display_errors(object, attribute)
  		unless object.errors.messages[attribute].blank?
  			 object.errors.messages[attribute].join(', ')
  		end
  	end

	def appraisee_hash(appraisees)
		appraisees.map {|a| "{id: #{a.id}, appraisee_info: \"#{a.login} - #{a.name}\"}"}.join(',')
	end

	def appraiser_hash(appraisers)
		appraisers.map {|a| "{id: #{a.id}, appraiser_info: \"#{a.login} - #{a.name}\"}"}.join(',')
	end

	def appraisees_with_tags(appraisal)
		html = "<div class='apraisee-with-tags' style='margin-top: 10px;'>"
		shielded_appraisees = Array.new
		appraisal.appraisees.each do |a|
			shielded_appraisees << TpaTag.where(user_id: a.id, appraisal_id: appraisal.id).map{|tt| tt.appraisee}.uniq.each do |a|
				html += <<-HTML
					<i class='fa fa-exclamation-triangle'></i> #{t('already_started_to_tagging', appraisee_name: "#{a.firstname} #{a.lastname}")} <br/>
				HTML
			end
		end		
		html += '</div>'
		html.html_safe
	end

end
