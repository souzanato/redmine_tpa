# Redmine TPA 

Redmine TPA (Tags for Performance Appraisal) is a redmine plugin that helps Performance Appraisals. It makes possible to link issues to pre-established criteria or organizational objectives.

Redmine TPA (Tags for Performance Appraisal) é um plugin redmine que auxilia avaliações de desempenho. Ele torna possível a ligação de tarefas à critérios ou objetivos organizacionais pré-estabelecidos.

For more information please visit http://hylozero.github.io/redmine_tpa

## How to install 

### Requirements

* Tested in Redmine 3.0.1

### Step-by-step

* Copy or clone the plugin on Redmine plugin folder with the name redmine_tpa:
    
	`cd /{redmineInstalationDir}/vendor/plugins`

	`git clone https://github.com/hylozero/redmine_tpa.git redmine_tpa`
    
* Run:

	`cd /{redmineInstalationDir}`

	`bundle install`

	`rake db:migrate_plugins NAME=redmine_tpa`
	
* Restart your redmine application.

* Good to go.

## Contributions

If you want to contribute, please:

* Fork the project.
* Make your translation, feature addition or bug fix.
* Send me a pull request on Github.

## License
 
Redmine TPA Plugin is open source and released under the terms of the [GNU General Public License - GPL - v3](https://github.com/hylozero/redmine_tpa/blob/master/license.txt).
Check [GNU GPL v3 quick guide](http://www.gnu.org/licenses/quick-guide-gplv3.html) for more information.

## Credits
* [redmine](http://www.redmine.org)
* [paper_trail](https://github.com/airblade/paper_trail)
* [active_link_to](https://github.com/comfy/active_link_to)
* [will_paginate](https://github.com/mislav/will_paginate)
* [select2](https://github.com/select2/select2)
* [twitter bootstrap](http://getbootstrap.com)
* [Ryan Bates nested forms](http://railscasts.com/episodes/196-nested-model-form-revised)
