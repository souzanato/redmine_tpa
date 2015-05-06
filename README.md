# Redmine TPA 

Redmine TPA (Tag for Performance Appraisal) is a redmine plugin that helps appraisers and appraisees in Performance Appraisals. The plugin makes possible to create tags that link issues to pre-established criteria or organizational objectives.

## How to install 

### Requirements

* Tested in `Redmine 3.0.1`;

### Step-by-step

* Copy or clone the plugin on Redmine plugin folder with the name `redmine_tpa`
    
	cd /{redmineInstalationDir}/vendor/plugins
	git clone https://github.com/hylozero/redmine_tpa.git redmine_tpa
    
* Run 
	cd /{redmineInstalationDir}
	bundle install
	rake db:migrate_plugins NAME=redmine_tpa
	
* Restart your redmine application.

* Good to go.

## Contributions

If you want to contribute, please:

* Fork the project.
* Make your translation, feature addition or bug fix.
* Send me a pull request on Github.

## License
 
Redmine Tag for PA Plugin is open source and released under the terms of the {GNU General Public License - GPL - v3}[https://github.com/hylozero/redmine_tpa/blob/master/license.txt].
Check {GNU GPL v3 quick guide}[http://www.gnu.org/licenses/quick-guide-gplv3.html] for more information.

## Credits
* paper_trail[https://github.com/airblade/paper_trail]
* active_link_to[https://github.com/comfy/active_link_to]
* will_paginate[https://github.com/mislav/will_paginate]
* select2[https://github.com/select2/select2]
* twitter bootstrap[http://getbootstrap.com]
* Nice Andrew France Workaround [https://rails.lighthouseapp.com/projects/8994/tickets/2160-nested_attributes-validates_uniqueness_of-fails#ticket-2160-11]
* Ryan Bates nested forms [http://railscasts.com/episodes/196-nested-model-form-revised]