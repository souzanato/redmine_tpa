# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :appraisals do
	resources :users do
		resources :tpa_tags
	end	
end
resources :appraisals_templates

get 'tpa' => 'redmine_tpa#index'
get 'appraisal_appraisees' => 'appraisal_appraisees#index'
get 'appraisal_appraisers' => 'appraisal_appraisers#index'