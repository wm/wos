class EntriesController < ApplicationController

  # must be logged in except to view sheep and add sheep. REMEMBER except is safer
  before_filter :login_required, :except => [:new, :create, :index]

  # GET /entries
  # GET /entries.xml
  def index
    logger.info("2 here")
    if params['latest_verified_time'].nil? || params['latest_verified_time'].empty?
      conditions =  ["verified = ?",true]
    else
      conditions =  ["verified = ? AND updated_at > ?",true,params['latest_verified_time']]
    end
    @entries = Entry.all(:order => "updated_at DESC", :conditions => conditions)
        logger.info("1 here")

    # Only display note on first request
    @entries.each do |e| 
      logger.info("updated_at = #{e.updated_at} and note_displayed #{e.note_displayed} and #{Time.now}")
      logger.info("#{e.updated_at} + #{30.seconds} > #{Time.now.utc} = #{e.updated_at + 30.seconds > Time.now}")
      if e.note_displayed && (e.updated_at + 30.seconds < Time.now)
        logger.info("here")
        e.note = ""  # not saved, just wont display
      elsif !e.note_displayed
        logger.info("HERE")
        e.note_displayed = true
        e.save
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entries }
      format.json  { render :json => @entries }
    end
  end

  # GET /entries/unverified
  # GET /entries/unverified.xml
  def unverified
    @unverified_entries = Entry.all(:conditions => ["verified = ?",false])
    @verified_entries = Entry.all(:conditions => ["verified = ?",true])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.xml
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.xml
  def new
    @entry = Entry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
  end

  # POST /entries
  # POST /entries.xml
  def create
    @entry = Entry.new(params[:entry])

    respond_to do |format|
      if @entry.save
        flash[:notice] = 'Once the sheep has been verified by our shepards it will appear here.'
        format.html { redirect_to(entries_url) }
        format.xml  { render :xml => @entry, :status => :created, :location => @entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.xml
  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        if @entry.verified
          flash[:notice] = 'Entry was successfully verified.'
        else
          flash[:notice] = 'Entry was successfully unverified.'
        end
        format.html { redirect_to(unverified_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.xml
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      flash[:notice] = 'Entry was deleted'
      format.html { redirect_to(unverified_path) }
      format.xml  { head :ok }
    end
  end
end
