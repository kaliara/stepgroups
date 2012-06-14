class Admin::SiteConfigsController < ApplicationController
  http_basic_authenticate_with :name => AUTH_CONFIG['username'], :password => AUTH_CONFIG['password'] if AUTH_CONFIG['perform_authentication']

  # GET /site_configs
  # GET /site_configs.json
  def index
    @site_configs = SiteConfig.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @site_configs }
    end
  end

  # GET /site_configs/1
  # GET /site_configs/1.json
  def show
    @site_config = SiteConfig.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site_config }
    end
  end

  # GET /site_configs/new
  # GET /site_configs/new.json
  def new
    @site_config = SiteConfig.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site_config }
    end
  end

  # GET /site_configs/1/edit
  def edit
    @site_config = SiteConfig.find(params[:id])
  end

  # POST /site_configs
  # POST /site_configs.json
  def create
    @site_config = SiteConfig.new(params[:site_config])

    respond_to do |format|
      if @site_config.save
        format.html { redirect_to admin_site_config_path(@site_config), notice: 'SiteConfig was successfully created.' }
        format.json { render json: @site_config, status: :created, location: @site_config }
      else
        format.html { render action: "new" }
        format.json { render json: @site_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /site_configs/1
  # PUT /site_configs/1.json
  def update
    @site_config = SiteConfig.find(params[:id])

    respond_to do |format|
      if @site_config.update_attributes(params[:site_config])
        format.html { redirect_to admin_site_config_path(@site_config), notice: 'SiteConfig was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_configs/1
  # DELETE /site_configs/1.json
  def destroy
    @site_config = SiteConfig.find(params[:id])
    @site_config.destroy

    respond_to do |format|
      format.html { redirect_to admin_site_configs_path }
      format.json { head :no_content }
    end
  end
end
