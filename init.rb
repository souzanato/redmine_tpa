require_dependency 'redmine_tpa/hooks'

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
end
