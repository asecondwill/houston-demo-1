class Admin::BoatsController < AdminController
  before_action :set_boat, only: %i[ show edit update destroy ]

  def index
    @boats = Boat.all
  end

  def show
  end

  def new
    @boat = Boat.new
  end

  def edit
  end

  def create
    @boat = Boat.new(boat_params)

    respond_to do |format|
      if @boat.save
        format.html { redirect_to [:admin, @boat], notice: "Boat was successfully created." }
        format.json { render :show, status: :created, location: [:admin, @boat] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @boat.update(boat_params)
        format.html { redirect_to [:admin, @boat], notice: "Boat was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: [:admin, @boat] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @boat.destroy!
    respond_to do |format|
      format.html { redirect_to admin_boats_path, status: :see_other, notice: "Boat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:name, :description)
  end
end