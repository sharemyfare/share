class RegularcommentsController < ApplicationController
  # GET /regularcomments
  # GET /regularcomments.json
  def index
    @regularcomments = Regularcomment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @regularcomments }
    end
  end

  # GET /regularcomments/1
  # GET /regularcomments/1.json
  def show
    @regularcomment = Regularcomment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @regularcomment }
    end
  end

  # GET /regularcomments/new
  # GET /regularcomments/new.json
  def new
    @regularcomment = Regularcomment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @regularcomment }
    end
  end

  # GET /regularcomments/1/edit
  def edit
    @regularcomment = Regularcomment.find(params[:id])
  end

  # POST /regularcomments
  # POST /regularcomments.json
  def create
    @regularcomment = Regularcomment.new(params[:regularcomment])

      if @regularcomment.save
	redirect_to Regularshare.find(@regularcomment.regularshare_id), notice: 'Regularcomment was successfully created.' 
      else
        redirect_to Regularshare.find(@regularcomment.regularshare_id), notice: 'Please try again.' 
      end

  end

  # PUT /regularcomments/1
  # PUT /regularcomments/1.json
  def update
    @regularcomment = Regularcomment.find(params[:id])

    respond_to do |format|
      if @regularcomment.update_attributes(params[:regularcomment])
        format.html { redirect_to @regularcomment, notice: 'Regularcomment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @regularcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regularcomments/1
  # DELETE /regularcomments/1.json
  def destroy
    @regularcomment = Regularcomment.find(params[:id])
    @regularshare = @regularcomment.regularshare
    
    @regularcomment.destroy
    redirect_to @regularshare, notice: 'Regularcomment was successfully delteed.'  

  end
end
