class EditablesController < ApplicationController
  before_filter :require_admin
  # GET /editables
  # GET /editables.json
  def index
    @editables = Editable.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @editables }
    end
  end

  # GET /editables/1
  # GET /editables/1.json
  def show
    @editable = Editable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @editable }
    end
  end

  # GET /editables/new
  # GET /editables/new.json
  def new
    @editable = Editable.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @editable }
    end
  end

  # GET /editables/1/edit
  def edit
    @editable = Editable.find(params[:id])
  end

  # POST /editables
  # POST /editables.json
  def create
    @editable = Editable.new(params[:editable])

    respond_to do |format|
      if @editable.save
        format.html { redirect_to @editable, notice: 'Editable was successfully created.' }
        format.json { render json: @editable, status: :created, location: @editable }
      else
        format.html { render action: "new" }
        format.json { render json: @editable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /editables/1
  # PUT /editables/1.json
  def update
    @editable = Editable.find(params[:id])

    respond_to do |format|
      if @editable.update_attributes(params[:editable])
        format.html { redirect_to @editable, notice: 'Editable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @editable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editables/1
  # DELETE /editables/1.json
  def destroy
    @editable = Editable.find(params[:id])
    @editable.destroy

    respond_to do |format|
      format.html { redirect_to editables_url }
      format.json { head :no_content }
    end
  end
end
