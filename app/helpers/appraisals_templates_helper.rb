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

	def link_to_add_fields(name, f, association)
	    new_object = f.object.send(association).klass.new
	    id = new_object.object_id
	    fields = f.fields_for(association, new_object, child_index: id) do |builder|
	      render(association.to_s.singularize + "_fields", f: builder)
	    end
	    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  	end

  	def display_errors(object, attribute)
  		unless object.errors.messages[attribute].blank?
  			 object.errors.messages[attribute].join(', ')
  		end
  	end

  	def any_restrict_dependecy?(model_object) 
      dependecie_models = Array.new
      model_object.class.reflect_on_all_associations(:has_many).each do |hm| 
         if model_object.method(hm.name.to_sym).call.any? and hm.options[:dependent] == :restrict_with_exception
           model_object.method(hm.name.to_sym).call.each do |d|
             dependecie_models << "".concat(d.class.to_s.constantize.model_name.human.pluralize) unless dependecie_models.include?(" ".concat(d.class.to_s.constantize.model_name.human.pluralize))          
           end
           return dependecie_models
         end
      end     
      false
    end   
end