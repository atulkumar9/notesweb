class NoteController < ApplicationController
  
  layout 'mylayout'

  
  before_action :confirm_logged_in

  def index
    current_user_id = session[:user_id]
    @notes = Note.sorted_id.where(:user_id => current_user_id)
  end

  def new
    @note = Note.new
  end

  def edit
    @note = Note.find_by_id(params[:id])
  end

  def delete
    @note = Note.find(params[:id])
  end

  def show
    @note = Note.find(params[:id])
    @labels = @note.labels
  end

  def show2
    find_label
    @notes = @label.notes
  end


  def create
    @note = Note.new(note_params)
    @note.user_id = session[:user_id]
    # @note.label_name = params[:label_name]
    if @note.save
      flash[:notice] = "Note created successfully."
      redirect_to(:action => 'show', :id => @note.id)
    else
      render('new')
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(note_params)
      flash[:notice] = "Note Updated!"
      redirect_to(:action => 'show', :id => @note.id)
    else
      render('edit')
    end
  end

  def destroy
    note = Note.find(params[:id]).destroy
    flash[:notice] = "Page Deleted!"
    redirect_to(:action => 'index')
  end

  private

    def note_params
      params.require(:note).permit(:text, :title)
    end

    def find_label
      if params[:id]
        @label = Label.find(params[:id])
      end
    end

end
