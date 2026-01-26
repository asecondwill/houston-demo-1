# Admin Scaffold Generator

Rails automatically uses admin-specific templates when generating admin controllers.

## Usage

```bash
# Creates admin controller with admin-specific templates:
bin/rails generate scaffold_controller admin/boat name:string description:text --model-name="Boat"

# Creates frontend controller with frontend templates:
bin/rails generate scaffold_controller boat name:string description:text
```

## What Happens Automatically

### Controller
- Admin controllers inherit from `AdminController` (from HoustonCMS gem)
- Frontend controllers inherit from `ApplicationController`
- All redirects use proper routing (`[:admin, @resource]` vs `@resource`)

### Forms
- Admin forms use `simple_form_for([:admin, @resource])`
- Frontend forms use `simple_form_for(@resource)`
- Cancel/Show links use proper paths

## Files that handle this

- **[lib/templates/rails/scaffold_controller/controller.rb](lib/templates/rails/scaffold_controller/controller.rb)** - Detects admin namespace and uses AdminController
- **[lib/templates/erb/scaffold/admin/_form.html.erb](lib/templates/erb/scaffold/admin/_form.html.erb)** - Admin-specific form template  
- **[lib/templates/erb/scaffold/_form.html.erb](lib/templates/erb/scaffold/_form.html.erb)** - Frontend form template

Rails automatically picks the right templates based on namespace - no configuration needed!