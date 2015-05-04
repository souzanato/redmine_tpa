module TpaTagsHelper
	def get_tag_color(user, question_option)
		if TpaTag.where(user_id: user.id, question_option_id: question_option.id, appraisal_id: appraisal.id).any?
			"color: '#337ab7';"
		else
			"color: '#ccc';"
		end
	end
end