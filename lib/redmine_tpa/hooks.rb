module RedmineTpa
	class Hooks < Redmine::Hook::ViewListener
	    render_on :view_issues_show_description_bottom, :partial => "hooks/redmine_tpa/view_issues_form_details_bottom"
	end
end