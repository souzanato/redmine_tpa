Redmine::Plugin.register :tag_for_pa do
  name 'tag-for-pa plugin'
  author 'Renato de Souza'
  description 'A Redmine plugin for Performance Appraisals Support'
  version '0.0.1'
  url 'https://github.com/hylozero/tag-for-pa'
  author_url 'https://github.com/hylozero'
  
  requires_redmine :version_or_higher => '3.0.1'

  # Menu
  menu :top_menu, 
  	:tpa, 
  	{ :controller => 'tpa', :action => 'index'}, 
  	:caption => :tag_for_pa

  # Permissions
  # project_module :tag_for_pa do
  #   permission :read_appraisals, {:appraisals => [:index, :show]}
  #   permission :update_appraisals, {:appraisals => [:edit, :update]}
  #   permission :destroy_appraisals, {:appraisals => :destroy}
  #   permission :create_appraisals, {:appraisals => [:new, :create]}
  # end
end
