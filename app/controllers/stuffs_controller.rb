class StuffsController < ApplicationController
  before_action :set_stuff, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :new]
  #before_action :require_user, except: [:index, :search]  //without devise gem
  #before_action :require_same_user, only: [:edit, :update, :destroy] //without devise gem

  # GET /stuffs
  # GET /stuffs.json
  def index
    @stuffs = Stuff.all.order("created_at DESC").paginate(page: params[:page], per_page: 14)
    
    @stuffs = @stuffs.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 14) if params[:search].present?
    @stuffs = @stuffs.searchLoc(params[:location]).order("created_at DESC").paginate(page: params[:page], per_page: 14) if params[:location].present?
    @stuffs = @stuffs.found(params[:value1]).order("created_at DESC").paginate(page: params[:page], per_page: 14) if params[:value1].present?
    @stuffs = @stuffs.lost(params[:value2]).order("created_at DESC").paginate(page: params[:page], per_page: 14) if params[:value2].present?
    @stuffs = @stuffs.cat(params[:category_id]).order("created_at DESC").paginate(page: params[:page], per_page: 14) if params[:category_id].present?
    @stuffs = @stuffs.between(params[:start_date], params[:end_date]).order("created_at DESC").paginate(page: params[:page], per_page: 14) if params[:start_date].present? and params[:end_date].present?

    flash[:alert] = "No result found" if @stuffs.nil? || @stuffs.blank?
  end 

  # GET /stuffs/1
  # GET /stuffs/1.json
  def show
  end 

  def lost_stuff
    @stuffs = Stuff.lost_stuf
  end

  def found_stuff
    @stuffs = Stuff.found_stuf
  end

  # GET /stuffs/new
  def new
    @stuff = Stuff.new
  end

  # GET /stuffs/1/edit
  def edit
  end

  # POST /stuffs
  # POST /stuffs.json
  def create
    @stuff = Stuff.new(stuff_params)
    @stuff.user = current_user
    respond_to do |format|
      if @stuff.save
        format.html { redirect_to @stuff, notice: 'Stuff was successfully created.' }
        format.json { render :show, status: :created, location: @stuff }
      else
        format.html { render :new }
        format.json { render json: @stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stuffs/1
  # PATCH/PUT /stuffs/1.json
  def update
    respond_to do |format|
      if @stuff.update(stuff_params)
        format.html { redirect_to @stuff, notice: 'Stuff was successfully updated.' }
        format.json { render :show, status: :ok, location: @stuff }
      else
        format.html { render :edit }
        format.json { render json: @stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stuffs/1
  # DELETE /stuffs/1.json
  def destroy
    @stuff.destroy
    respond_to do |format|
      format.html { redirect_to stuffs_url, notice: 'Stuff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stuff
      @stuff = Stuff.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stuff_params
      params.require(:stuff).permit(:title, :description, :found_date, :category_ids, :image, :find, :lost, :address, :latitude, :longitude)
    end

    #def require_same_user
    #  if current_user != @stuff.user && !current_user.admin?
    #    flash[:alert] = "You can only delete or edit your own stuff"
    #    redirect_to @stuff
    #  end
    #end
end
