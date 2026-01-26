<% module_namespacing do -%>
<%- parent_class = class_path.first == 'admin' ? 'AdminController' : 'ApplicationController' -%>
<%- redirect_url = class_path.first == 'admin' ? "[:admin, @#{singular_table_name}]" : "@#{singular_table_name}" -%>
<%- index_url = class_path.first == 'admin' ? "admin_#{index_helper}_path" : "#{index_helper}_path" -%>
class <%= controller_class_name %> < <%= parent_class %>
  before_action :set_<%= singular_table_name %>, only: %i[ show edit update destroy ]

<% unless options.api? -%>
  # GET /<%= route_url %> or /<%= route_url %>.json
<% end -%>
  def index
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
  end

<% unless options.api? -%>
  # GET /<%= route_url %>/1 or /<%= route_url %>/1.json
<% end -%>
  def show
  end

<% unless options.api? -%>
  # GET /<%= route_url %>/new
<% end -%>
  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
  end

<% unless options.api? -%>
  # GET /<%= route_url %>/1/edit
<% end -%>
  def edit
  end

<% unless options.api? -%>
  # POST /<%= route_url %> or /<%= route_url %>.json
<% end -%>
  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>

    respond_to do |format|
      if @<%= orm_instance.save %>
<% unless options.api? -%>
        format.html { redirect_to <%= redirect_url %>, notice: "<%= human_name %> was successfully created." }
<% end -%>
        format.json { render :show, status: :created, location: <%= redirect_url %> }
      else
<% unless options.api? -%>
        format.html { render :new, status: :unprocessable_entity }
<% end -%>
        format.json { render json: @<%= orm_instance.errors %>, status: :unprocessable_entity }
      end
    end
  end

<% unless options.api? -%>
  # PATCH/PUT /<%= route_url %>/1 or /<%= route_url %>/1.json
<% end -%>
  def update
    respond_to do |format|
      if @<%= orm_instance.update("#{singular_table_name}_params") %>
<% unless options.api? -%>
        format.html { redirect_to <%= redirect_url %>, notice: "<%= human_name %> was successfully updated.", status: :see_other }
<% end -%>
        format.json { render :show, status: :ok, location: <%= redirect_url %> }
      else
<% unless options.api? -%>
        format.html { render :edit, status: :unprocessable_entity }
<% end -%>
        format.json { render json: @<%= orm_instance.errors %>, status: :unprocessable_entity }
      end
    end
  end

<% unless options.api? -%>
  # DELETE /<%= route_url %>/1 or /<%= route_url %>/1.json
<% end -%>
  def destroy
    @<%= orm_instance.destroy %>
    respond_to do |format|
<% unless options.api? -%>
      format.html { redirect_to <%= index_url %>, status: :see_other, notice: "<%= human_name %> was successfully destroyed." }
<% end -%>
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    end

    # Only allow a list of trusted parameters through.
    def <%= "#{singular_table_name}_params" %>
      <%- if attributes_names.empty? -%>
      params.fetch(:<%= singular_table_name %>, {})
      <%- else -%>
      params.require(:<%= singular_table_name %>).permit(<%= permitted_params %>)
      <%- end -%>
    end
end
<% end -%>