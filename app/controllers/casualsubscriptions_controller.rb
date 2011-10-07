class CasualsubscriptionsController < ApplicationController
  # GET /casualsubscriptions
  # GET /casualsubscriptions.json
  def index
    @casualsubscriptions = Casualsubscription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @casualsubscriptions }
    end
  end

  # GET /casualsubscriptions/1
  # GET /casualsubscriptions/1.json
  def show
    @casualsubscription = Casualsubscription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @casualsubscription }
    end
  end

  # GET /casualsubscriptions/new
  # GET /casualsubscriptions/new.json
  def new
    @casualsubscription = Casualsubscription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @casualsubscription }
    end
  end

  # GET /casualsubscriptions/1/edit
  def edit
    @casualsubscription = Casualsubscription.find(params[:id])
  end

  # POST /casualsubscriptions
  # POST /casualsubscriptions.json
  def create
    @casualsubscription =  Casualsubscription.new(params[:casualsubscription])
    @casualsubscription.status = false
      if @casualsubscription.save
        redirect_to Casualshare.find(@casualsubscription.casualshare_id), notice: 'Casualsubscription was successfully created.' 
      else
        redirect_to Casualshare.find(@casualsubscription.casualshare_id), notice: 'Please try again.' 
      end

  end

  # PUT /casualsubscriptions/1
  # PUT /casualsubscriptions/1.json
  def update
    @casualsubscription = Casualsubscription.find(params[:id])

    respond_to do |format|
      if @casualsubscription.update_attributes(params[:casualsubscription])
        format.html { redirect_to @casualsubscription, notice: 'Casualsubscription was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @casualsubscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /casualsubscriptions/1
  # DELETE /casualsubscriptions/1.json
  def destroy
    @casualsubscription = Casualsubscription.find(params[:id])
    @casualsubscription.destroy

    respond_to do |format|
      format.html { redirect_to casualsubscriptions_url }
      format.json { head :ok }
    end
  end
end
