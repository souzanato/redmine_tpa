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
  	:caption => :redmine_tpa, if: Proc.new {
      User.current.logged?
    }

  # # Permissions
  # project_module :redmine_tpa do
  #   # Appraisals
  #   permission :read_appraisals, {:appraisals => [:index, :show], :redmine_tpa => [:index]}
  #   permission :update_appraisals, {:appraisals => [:edit, :update]}
  #   permission :destroy_appraisals, {:appraisals => :destroy}
  #   permission :create_appraisals, {:appraisals => [:new, :create]}

  #   # Appraisal Template
  #   permission :read_appraisal_templates, {:appraisal_templates => [:index, :show], :redmine_tpa => [:index]}
  #   permission :update_appraisal_templates, {:appraisal_templates => [:edit, :update]}
  #   permission :destroy_appraisal_templates, {:appraisal_templates => :destroy}
  #   permission :create_appraisal_templates, {:appraisal_templates => [:new, :create]}
  # end
end
