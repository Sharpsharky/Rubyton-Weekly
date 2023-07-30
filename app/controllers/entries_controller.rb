class EntriesController < ApplicationController
  before_action :set_entry, only: %i[ show edit update destroy ]

  # GET /entries or /entries.json
  def index
    @entries = Entry.all
    my_entries
    my_entries_for_this_hackathon
  end

  # GET /entries/1 or /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new
    my_entries_for_this_hackathon

  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries or /entries.json
  def create

    if current_user.present?
      @entry = Entry.new(entry_params)
      @entry.user_id = current_user.id
      @entry.hackathon_id = current_hackathon.id

      respond_to do |format|
        if @entry.save
          format.html { redirect_to entry_url(@entry), notice: "Entry was successfully created." }
          format.json { render :show, status: :created, location: @entry }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @entry.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def current_hackathon
    @current_hackathon ||= Hackathon.order(:start_date).last
  end

  # PATCH/PUT /entries/1 or /entries/1.json
  def update
    if @entry.user_id == current_user.id
      respond_to do |format|
        if @entry.update(entry_params)
          format.html { redirect_to entry_url(@entry), notice: "Entry was successfully updated." }
          format.json { render :show, status: :ok, location: @entry }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @entry.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /entries/1 or /entries/1.json
  def destroy

    if @entry.user_id == current_user.id
      @entry.destroy
      respond_to do |format|
        format.html { redirect_to entries_url, notice: "Entry was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:title, :description, :link, :team_name, :user_id, :hackathon_id)
    end

    def my_entries
      if current_user
        @my_entries = Entry.where(user_id: current_user.id)
      else
        @my_entries = []
      end
    end

    def my_entries_for_this_hackathon
      if !my_entries.empty?
        @my_entries_for_this_hackathon = my_entries.where(hackathon_id: current_hackathon.id)
      else
        @my_entries = []
      end
    end  

end
