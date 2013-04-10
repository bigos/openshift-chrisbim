class PhotosController < ApplicationController
  before_filter :require_admin, :except => [:index, :show]
  # GET /photos
  # GET /photos.json
  def index

    if params[:tag]
      @photos = Photo.includes(:tags).where(:tags => {:name => params[:tag]}).order('photos.created_at DESC').paginate(:page => params[:page], :per_page => 12)
    else
      @photos = Photo.order('created_at DESC').paginate(:page => params[:page], :per_page => 12) 
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end


  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
    if current_user
      if current_user.username == 'admin'
        if params[:add_tag]
          @photo.tag_with! params[:add_tag]
        end
        if params[:remove_tag]
          @photo.recursively_remove_tag params[:remove_tag]
        end
      else
      flash[:error] = 'Error: Only admin can do that.' 
      end
    else
      flash[:error] = 'Error: You need to log in as admin to do that.' 
    end
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { render :json => [@photo.to_jq_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        #format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render json: {files: [@photo.to_jq_upload] }}
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end
end