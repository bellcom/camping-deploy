api = 2
core = 7.x

;includes[custom] = valhalla.custom.make

; Valhalla Modules
projects[valhalla][type] = "module"
projects[valhalla][download][type] = "git"
;projects[valhalla][download][tag] = ""
projects[valhalla][download][branch] = "master"
projects[valhalla][download][url] = "git://github.com/bellcom/valhalla.git"

; Valhalla Themes
projects[valhallatheme][type] = "theme"
projects[valhallatheme][download][type] = "git"
projects[valhallatheme][download][branch] = "master"
projects[valhallatheme][download][tag] = ""
projects[valhallatheme][download][url] = "git://github.com/bellcom/valhalla-theme.git"

; Adaptive Theme
projects[adaptivetheme][type] = "theme"
projects[adaptivetheme][version] = "1.2"

; Valhalla Translation
libraries[translation][download][type] = "file"
libraries[translation][download][url] = "da.po"
libraries[translation][directory_name] = "translations"
libraries[translation][destination] = ""

; Libraries

libraries[ckeditor][download][type]= "get"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%204.1.2/ckeditor_4.1.2_standard.zip"
libraries[ckeditor][directory_name] = "ckeditor"
libraries[ckeditor][destination] = "modules/contrib/ckeditor"

; Contrib modules

projects[ckeditor][subdir] = "contrib"
projects[ckeditor][version] = "1.13"

projects[features][subdir] = "contrib"
projects[features][version] = "2.0"

projects[features_extra][subdir] = "contrib"
projects[features_extra][version] = "1.0-alpha1"

projects[field_collection][subdir] = "contrib"
projects[field_collection][version] = "1.0-beta5"

projects[strongarm][subdir] = "contrib"
projects[strongarm][version] = "2.0"

projects[views][subdir] = "contrib"
projects[views][version] = "3.5"

projects[panels][subdir] = "contrib"
projects[panels][version] = "3.0-alpha3"

projects[media][subdir] = "contrib"
projects[media][version] = "2.0-unstable7"

projects[entity][subdir] = "contrib"
projects[entity][version] = "1.2"

projects[entityreference][subdir] = "contrib"
projects[entityreference][version] = "1.0"

projects[entityreference_prepopulate][subdir] = "contrib"
projects[entityreference_prepopulate][version] = "1.3"

projects[entity_uuid][subdir] = "contrib"
projects[entity_uuid][version] = "1.x-dev"

projects[ckeditor][subdir] = "contrib"
projects[ckeditor][version] = "1.13"

projects[ctools][subdir] = "contrib"
projects[ctools][version] = "1.2"
projects[ctools][patch][] = "patches/ctools-fix-warning-message-1739718-32.patch"

projects[date][subdir] = "contrib"
projects[date][version] = "2.6"

projects[references][subdir] = "contrib"
projects[references][version] = "2.0"

projects[context][subdir] = "contrib"
projects[context][version] = "3.0-beta4"

projects[admin][subdir] = "contrib"
projects[admin][version] = "2.0-beta3"

projects[field_group][subdir] = "contrib"
projects[field_group][version] = "1.1"

projects[libraries][subdir] = "contrib"
projects[libraries][version] = "2.0"

projects[rules][subdir] = "contrib"
projects[rules][version] = "2.3"

projects[front][subdir] = "contrib"
projects[front][version] = "2.4"

projects[addressfield][subdir] = "contrib"
projects[addressfield][version] = "1.0-beta4"

projects[message][subdir] = "contrib"
projects[message][version] = "1.8"

projects[message_notify][subdir] = "contrib"
projects[message_notify][version] = "2.5"

projects[locationmap][subdir] = "contrib"
projects[locationmap][version] = "2.2"

projects[og][subdir] = "contrib"
projects[og][version] = "2.2"

projects[email][subdir] = "contrib"
projects[email][version] = "1.2"

projects[media][subdir] = "contrib"
projects[media][version] = "1.3"

projects[uuid][subdir] = "contrib"
projects[uuid][version] = "1.0-alpha4"

projects[uuid_features][subdir] = "contrib"
projects[uuid_features][version] = "1.0-alpha3"

projects[role_delegation][subdir] = "contrib"
projects[role_delegation][version] = "1.1"

projects[node_export][subdir] = "contrib"
projects[node_export][version] = "3.x-dev"

projects[migrate][subdir] = "contrib"
projects[migrate][version] = "2.5"

projects[backup_migrate][subdir] = "contrib"
projects[backup_migrate][version] = "2.2"

projects[diff][subdir] = "contrib"
projects[diff][version] = "2.0"

projects[imce][subdir] = "contrib"
projects[imce][version] = "1.4"

projects[wysiwyg][subdir] = "contrib"
projects[wysiwyg][version] = "2.2"

projects[i18n][subdir] = "contrib"
projects[i18n][version] = "1.8"

projects[token][subdir] = "contrib"
projects[token][version] = "1.4"

projects[l10n_update][subdir] = "contrib"
projects[l10n_update][version] = "1.0-beta3"

; for sending HTML mails, mmh 23/10-2013
projects[mimemail][subdir] = "contrib"
projects[mimemail][version] = "1.0-beta1"
projects[mailsystem][subdir] = "contrib"
projects[mailsystem][version] = "2.34"

; allow some sites to use their own smtp server, mmh 31/10-2013
projects[smtp][subdir] = "contrib"
projects[smtp][version] = "1.0"


; These modules aren't enabled after installing using the install profile. Do we really need them? Disabled 18/10 2013, mmh
;projects[views_bulk_operations][subdir] = "contrib"
;projects[views_bulk_operations][version] = "3.0-rc1"
;
;projects[tcontact][subdir] = "contrib"
;projects[tcontact][version] = "1.x-dev"
;
;projects[varnish][subdir] = "contrib"
;projects[varnish][version] = "1.0-beta1"
;
;projects[expire][subdir] = "contrib"
;projects[expire][version] = "1.0-alpha3"
;
;projects[gmap][subdir] = "contrib"
;projects[gmap][version] = "2.6"
;
;projects[domain][subdir] = "contrib"
;projects[domain][version] = "2.13"
;
;projects[ds][subdir] = "contrib"
;projects[ds][version] = "1.5"
;
;projects[commerce][subdir] = "contrib"
;projects[commerce][version] = "1.0-beta3"

