# Copilot & AI Agent Instructions for Houston1

## Project Overview
- **Rails app** with modular structure: `app/` (MVC), `lib/` (components), `config/` (settings), `bin/` (custom scripts).
- Uses **Bootstrap** (via gem), **SimpleForm**, **Pagy**, **Devise**, **Pundit**, **FriendlyId**, **MetaTags**, **breadcrumbs_on_rails**, and custom CMS (`houston_cms`).
- Follows Rails conventions, but see below for project-specific patterns and workflows.

## Key Workflows
- **CI/CD:**
  - Run all checks: `bin/ci` (see `config/ci.rb` for steps)
  - Lint: `bin/rubocop`
  - Security: `bin/brakeman`, `bin/bundler-audit`, `bin/importmap audit`
  - Tests: `bin/rails test`, `bin/rails test:system`, `bin/rails db:seed:replant`
- **Sitemap:** Refresh with `rake sitemap:refresh`
- **Bootstrap views:** Use `bootstrap_views_generator` for scaffolded views.
- **Markdown in views:** Use `md()` or `markdown_filter` helpers (see README for usage).
- **Breadcrumbs:** Use `add_breadcrumb` in controllers/views (see README for examples).

## Project-Specific Patterns
- **Custom scripts** in `bin/` (e.g., `bin/ci`, `bin/brakeman`, `bin/bundler-audit`, `bin/importmap`). Always prefer these over direct gem commands.
- **Form components:** Use SimpleForm with custom wrappers (see `config/initializers/simple_form.rb`).
- **Authorization:** Use Pundit policies in `app/policies/`.
- **Pagination:** Use Pagy helpers in controllers/views.
- **CMS integration:** Content managed via `houston_cms` gem.
- **Devise views:** Use `devise-bootstrap-views` for authentication UIs.
- **External dependencies:** See `Gemfile` for gems and their sources (some from GitHub).

## Conventions & Structure
- **Assets:**
  - Styles: `app/assets/stylesheets/` (Sass/SCSS, Bootstrap customizations)
  - JS: `app/javascript/` (controllers, custom logic)
- **Views:**
  - Use GitHub-flavored Markdown for content rendering.
  - Shared partials in `app/views/shared/`.
- **Testing:**
  - System tests in `test/system/`, helpers in `test/helpers/`.
- **Initializers:**
  - Project-specific config in `config/initializers/` (e.g., `meta_tags.rb`, `houston_cms.rb`).
- **Database:**
  - Migrations in `db/migrate/`, schema in `db/schema.rb`.

## Examples
- **Add a breadcrumb in a controller:**
  ```ruby
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Users", :users_path
  ```
- **Render Markdown in a view:**
  ```erb
  <%= md("**Hello** there") %>
  ```
- **Run all CI checks locally:**
  ```bash
  bin/ci
  ```

## References
- See `README.md` for more usage examples and conventions.
- See `.github/workflows/ci.yml` for CI steps and environment.
- See `config/ci.rb` for the canonical CI workflow.

---
**Keep instructions concise and project-specific. Update this file if workflows or conventions change.**
