class RegularsharesController < ApplicationController

  def index
    @regularshares = Regularshare.all
  end


  def show
    @regularshare = Regularshare.find(params[:id])
    @regularsubscription = current_user.regularsubscriptions.build(params[:regularsubscription])
    @regularsubscriptions = Regularsubscription.where("regularshare_id=?", params[:id]).order('created_at DESC')

    @regularcomment = current_user.regularcomments.build(params[:regularcomment])
    @regularcomments = Regularcomment.where("regularshare_id=?", params[:id]).order('created_at DESC')
    #@regularcomments = @regularcomments1.paginate(:page => params[:page])

  end


  def new
    @regularshare = Regularshare.new
  end


  def edit
    @regularshare = Regularshare.find(params[:id])
  end


  def create
    @regularshare = Regularshare.new(params[:regularshare])
    @regularshare.user_id = current_user.id
    respond_to do |format|
      if @regularshare.save
        format.html { redirect_to @regularshare, notice: 'Regularshare was successfully created.' }
        format.json { render json: @regularshare, status: :created, location: @regularshare }
      else
        format.html { render action: "new" }
        format.json { render json: @regularshare.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @regularshare = Regularshare.find(params[:id])

    respond_to do |format|
      if @regularshare.update_attributes(params[:regularshare])
        format.html { redirect_to @regularshare, notice: 'Regularshare was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @regularshare.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @regularshare = Regularshare.find(params[:id])
    @regularshare.destroy

    respond_to do |format|
      format.html { redirect_to regularshares_url }
      format.json { head :ok }
    end
  end
end
