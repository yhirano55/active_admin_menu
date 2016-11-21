# ActiveAdminMenu

Manageable menu with YAML for [Active Admin](https://github.com/activeadmin/activeadmin)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_admin_menu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_admin_menu

## Usage

Install and prepare Rails and ActiveAdmin before install `active_admin_menu` with `bundle`, and run it:

    $ bundle exec rails generate active_admin_menu:install
    create  config/initializers/active_admin_menu.rb
    create  config/active_admin_menu.yml

And edit `config/active_admin_menu.yml`:

```yaml
default: &default
  root:
    - Dashboard
  Admin:
    - AdminUser

development:
  <<: *default

test:
  <<: *default

production:
  <<: *default
```

And edit `config/locales/en.yml`:

```yaml
en:
  active_admin:
    menu:
      admin: Administrator
      dashboard: Admin Dashboard
```

## Configuration

See `config/initializers/active_admin_menu.rb`:

```ruby
ActiveAdminMenu.configure do |config|
  config.source                     = Rails.root.join("config", "active_admin_menu.yml")
  config.namespace                  = Rails.env
  config.uncategorize_key_name      = "root"
  config.i18n_scope_prefix[:parent] = "active_admin.menu"
  config.i18n_scope_prefix[:label]  = "active_admin.menu"
end
```

| attribute | type | content |
|:----------|:-----|:--------|
| source | `/path/to/yaml` or Hash | Source of menu |
| namespace | String | The key of source |
| uncategorize_key_name | String | Uncategorize key name (default: `root`) |
| i18n_scope_prefix[:parent] | String | Looking up i18n scope for parent |
| i18n_scope_prefix[:label] | String | Looking up i18n scope for register_page |

If the resource is not `register_page`, label will translate from `activerecord.models` on locale.

## Tips

### How to sort menu links on top level?

It' impossible to sort by `priority` option. So you need to add numeric prefix on i18n keys.

You need to change like this:

```yaml
en:
  active_admin:
    menu:
      user: "01 User"
      admin: "02 Admin"
      dashboard: "Dashboard"
```

## License

[MIT License](http://opensource.org/licenses/MIT)
