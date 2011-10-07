class CasualsharesController < ApplicationController
  # GET /casualshares
  # GET /casualshares.json
  def index
    @casualshares = Casualshare.all
  end


  def show
    @casualshare = Casualshare.find(params[:id])

    @casualsubscription = current_user.casualsubscriptions.build(params[:casualsubscription])
    @casualsubscriptions = Casualsubscription.where("casualshare_id=?", params[:id]).order('created_at DESC')

    @casualcomment = current_user.casualcomments.build(params[:casualcomment])
    @casualcomments = Casualcomment.where("casualshare_id=?", params[:id]).order('created_at DESC')

  end

  def new
    @casualshare = Casualshare.new
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
