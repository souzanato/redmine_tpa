# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :appraisals
resources :appraisals_templates
resources :tpa_tags

get 'tpa' => 'redmine_tpa#index'
get 'appraisal_appraisees' => 'appraisal_appraisees#index'
get 'appraisal_appraisers' => 'appraisal_appraisers#index'