class CasualsharesController < ApplicationController
  # GET /casualshares
  # GET /casualshares.json
  def index
    @casualshares = Casualshare.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @casualshares }
    end
  end

  # GET /casualshares/1
  # GET /casualshares/1.json
  def show
    @casualshare = Casualshare.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @casualshare }
    end
  end

  # GET /casualshares/new
  # GET /casualshares/new.json
  def new
    @casualshare = Casualshare.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @casualshare }
    end
  end

  # GET /casualshares/1/edit
  def edit
    @casualshare = Casualshare.find(params[:id])
  end

  # POST /casualshares
  # POST /casualshares.json
  def create
    @casualshare = Casualshare.new(params[:casualshare])
    @casualshare.user_id = current_user.id
    respond_to do |format|
      if @casualshare.save
        format.html { redirect_to @casualshare, notice: 'Casualshare was successfully created.' }
        format.json { render json: @casualshare, status: :created, location: @casualshare }
      else
        format.html { render action: "new" }
        format.json { render json: @casualshare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /casualshares/1
  # PUT /casualshares/1.json
  def update
    @casualshare = Casualshare.find(params[:id])

    respond_to do |format|
      if @casualshare.update_attributes(params[:casualshare])
        format.html { redirect_to @casualshare, notice: 'Casualshare was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @casualshare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /casualshares/1
  # DELETE /casualshares/1.json
  def destroy
    @casualshare = Casualshare.find(params[:id])
    @casualshare.destroy

    respond_to do |format|
      format.html { redirect_to casualshares_url }
      format.json { head :ok }
    end
  end
end
