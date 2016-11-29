run "rm Gemfile"

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

# == Generate model
generate :model, "Person name:string age:integer"
generate :model, "Friend name:string age:integer"
generate :model, "Post title:string content:text"
generate :model, "Book title:string content:text"

# == Prepare ActiveAdmin
generate :'active_admin:install --skip-users'
generate :'active_admin:resource Person'
generate :'active_admin:resource Friend'
generate :'active_admin:resource Post'
generate :'active_admin:resource Book'

# == Prepare ActiveAdminMenu
generate :'active_admin_menu:install'

inject_into_file(
  "config/active_admin_menu.yml",
  "    - Person\n",
  after: "Dashboard\n"
)

inject_into_file(
  "config/active_admin_menu.yml",
  "    - Post\n",
  after: "AdminUser\n"
)

inject_into_file(
  "config/active_admin_menu.yml",
  "  Content:\n    - Book\n",
  after: "Post\n"
)

run "rm -r spec"

route "root :to => 'admin/dashboard#index'"

rake "db:migrate"
