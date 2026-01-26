class Admin::BoatsController < AdminController
  before_action :set_boat, only: %i[ show edit update destroy ]

  # GET /admin/boats or /admin/boats.json
  def index
    @boats = Boat.all
  end

  # GET /admin/boats/1 or /admin/boats/1.json
  def show
  end

  # GET /admin/boats/new
  def new
    @boat = Boat.new
  end

  # GET /admin/boats/1/edit
  def edit
  end

  # POST /admin/boats or /admin/boats.json
  def create
    @boat = Boat.new(boat_params)

    respond_to do |format|
      if @boat.save
        format.html { redirect_to [ :admin, @boat ], notice: "Boat was successfully created." }
        format.json { render :show, status: :created, location: @boat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/boats/1 or /admin/boats/1.json
  def update
    respond_to do |format|
      if @boat.update(boat_params)
        format.html { redirect_to [ :admin, @boat ], notice: "Boat was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @boat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/boats/1 or /admin/boats/1.json
  def destroy
    @boat.destroy!

    respond_to do |format|
      format.html { redirect_to admin_boats_path, notice: "Boat was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boat
      @boat = Boat.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def boat_params
      params.expect(boat: [ :name, :description, :length ])
    end
end
