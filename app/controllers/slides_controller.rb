class SlidesController < ApplicationController
  before_filter :require_admin
  # GET /slides
  # GET /slides.json
  def index
    logger.info params.inspect
    if params[:toggle_activation]
      slide = Slide.where(:id => params[:toggle_activation]).first
      logger.info slide
      slide.toggle_visibility!
      slide.save
    end
    if params[:up]
      slide = Slide.where(:position => params[:up]).first
      if slide.position > 1
        other_slide = Slide.where(:position => slide.position-1).first
        other_slide.increment :position
        slide.decrement :position
        other_slide.save
        slide.save
        slide.reorder_positions!
      end
    end
    if params[:down]
      slide = Slide.where(:position => params[:down]).last
      logger.info "found slide #{slide.inspect}"
      if slide.position < Slide.where(:visible => true).count
        other_slide = Slide.where(:position => slide.position+1).first
        other_slide.decrement :position
        slide.increment :position
        other_slide.save
        slide.save
        slide.reorder_positions!
      end
    end

    @slides = Slide.find( :all, :order => "visible DESC, position ASC")
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @slides }
    end
  end

  # GET /slides/1
  # GET /slides/1.json
  def show
    @slide = Slide.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @slide }
    end
  end

  # GET /slides/new
  # GET /slides/new.json
  def new
    @slide = Slide.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @slide }
    end
  end

  # GET /slides/1/edit
  def edit
    @slide = Slide.find(params[:id])
  end

  # POST /slides
  # POST /slides.json
  def create
    @slide = Slide.new(params[:slide])

    respond_to do |format|
      if @slide.save
        format.html { redirect_to @slide, notice: 'Slide was successfully created.' }
        format.json { render json: @slide, status: :created, location: @slide }
      else
        format.html { render action: "new" }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /slides/1
  # PUT /slides/1.json
  def update
    @slide = Slide.find(params[:id])
    @slide.reorder_positions!

    respond_to do |format|
      if @slide.update_attributes(params[:slide])
        format.html { redirect_to @slide, notice: 'Slide was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slides/1
  # DELETE /slides/1.json
  def destroy
    @slide = Slide.find(params[:id])
    @slide.destroy

    respond_to do |format|
      format.html { redirect_to slides_url }
      format.json { head :no_content }
    end
  end
end
