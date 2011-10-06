class RegularsubscriptionsController < ApplicationController
  # GET /regularsubscriptions
  # GET /regularsubscriptions.json
  def index
    @regularsubscriptions = Regularsubscription.all

  end


  def show
    @regularsubscription = Regularsubscription.find(params[:id])

  end


  def new
    @regularsubscription = Regularsubscription.new
  end


  def edit
    @regularsubscription = Regularsubscription.find(params[:id])
  end

  def create
    @regularsubscription = Regularsubscription.new(params[:regularsubscription])

      if @regularsubscription.save
        redirect_to Regularshare.find(@regularsubscription.regularshare_id), notice: 'Regularsubscription was successfully created.' 
      else
        redirect_to Regularshare.find(@regularsubscription.regularshare_id), notice: 'Please try again.' 
      end

  end

  # PUT /regularsubscriptions/1
  # PUT /regularsubscriptions/1.json
  def update
    @regularsubscription = Regularsubscription.find(params[:id])

    respond_to do |format|
      if @regularsubscription.update_attributes(params[:regularsubscription])
        format.html { redirect_to @regularsubscription, notice: 'Regularsubscription was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @regularsubscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regularsubscriptions/1
  # DELETE /regularsubscriptions/1.json
  def destroy
    @regularsubscription = Regularsubscription.find(params[:id])
    @regularsubscription.destroy

    respond_to do |format|
      format.html { redirect_to regularsubscriptions_url }
      format.json { head :ok }
    end
  end
end
