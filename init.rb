Redmine::Plugin.register :tag_for_pa do
  name 'tag-for-pa plugin'
  author 'Renato de Souza'
  description 'A Redmine plugin for Performance Appraisals Support'
  version '0.0.1'
  url 'https://github.com/hylozero/tag-for-pa'
  author_url 'https://github.com/hylozero'
  menu :application_menu, 
  	:appraisals, 
  	{ :controller => 'appraisals', :action => 'index' }, 
  	:caption => :tag_for_pa_title
  permission :read_appraisals, :appraisals => [:index, :show]
  permission :update_appraisals, :appraisals => [:edit, :update]
  permission :destroy_appraisals, :appraisals => :destroy
  permission :create_appraisals, :appraisals => [:new, :create]
end
