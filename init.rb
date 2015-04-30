Redmine::Plugin.register :redmine_tpa do
  name 'redmine tpa plugin'
  author 'Renato de Souza'
  description 'A Redmine plugin for Performance Appraisals Support'
  version '0.0.1'
  url 'https://github.com/hylozero/redmine_tpa'
  author_url 'https://github.com/hylozero'
  
  requires_redmine :version_or_higher => '3.0.1'

  # Menu
  menu :top_menu, 
  	:tpa, 
  	{ :controller => 'redmine_tpa', :action => 'index'}, 
  	:caption => :redmine_tpa

  # Permissions
  # project_module :redmine_tpa do
  #   permission :read_appraisals, {:appraisals => [:index, :show]}
  #   permission :update_appraisals, {:appraisals => [:edit, :update]}
  #   permission :destroy_appraisals, {:appraisals => :destroy}
  #   permission :create_appraisals, {:appraisals => [:new, :create]}
  # end
end
