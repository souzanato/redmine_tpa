# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :appraisals
resources :appraisals_templates

get 'tpa' => 'tpa#index'
get 'appraisal_appraisees' => 'appraisal_appraisees#index'