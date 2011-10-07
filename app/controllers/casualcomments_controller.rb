class CasualcommentsController < ApplicationController
  # GET /casualcomments
  # GET /casualcomments.json
  def index
    @casualcomments = Casualcomment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @casualcomments }
    end
  end

  # GET /casualcomments/1
  # GET /casualcomments/1.json
  def show
    @casualcomment = Casualcomment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @casualcomment }
    end
  end

  # GET /casualcomments/new
  # GET /casualcomments/new.json
  def new
    @casualcomment = Casualcomment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @casualcomment }
    end
  end

  # GET /casualcomments/1/edit
  def edit
    @casualcomment = Casualcomment.find(params[:id])
  end

  # POST /casualcomments
  # POST /casualcomments.json
  def create
    @casualcomment = Casualcomment.new(params[:casualcomment])

      if @casualcomment.save
	redirect_to Casualshare.find(@casualcomment.casualshare_id), notice: 'casualcomment was successfully created.' 
      else
        redirect_to Casualshare.find(@casualcomment.casualshare_id), notice: 'Please try again.' 
      end

  end

  # PUT /casualcomments/1
  # PUT /casualcomments/1.json
  def update
    @casualcomment = Casualcomment.find(params[:id])

    respond_to do |format|
      if @casualcomment.update_attributes(params[:casualcomment])
        format.html { redirect_to @casualcomment, notice: 'Casualcomment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @casualcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /casualcomments/1
  # DELETE /casualcomments/1.json
  def destroy
    @casualcomment = Casualcomment.find(params[:id])
    @casualcomment.destroy

    respond_to do |format|
      format.html { redirect_to casualcomments_url }
      format.json { head :ok }
    end
  end
end
