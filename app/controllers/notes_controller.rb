class NotesController < ApplicationController
  #skip_before_filter :verify_authenticity_token
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session
  respond_to :json

  def index
    @notes = Note.all
    respond_with(@notes)
  end

  def show
    respond_with(@note)
  end

  def new
    @note = Note.new
    respond_with(@note)
  end

  def edit
  end

  def create
    @note = Note.new(note_params)
    @note.save
    respond_with(@note)
  end

  def update
    @note.update(note_params)
    respond_with(@note)
  end

  def destroy
    @note.destroy
    respond_with(@note)
  end

  def csrf
    render json: { request_forgery_protection_token => form_authenticity_token }.to_json
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :body)
    end
end
