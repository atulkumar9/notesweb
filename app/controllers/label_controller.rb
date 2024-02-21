class LabelController < ApplicationController
  
  layout 'mylayout'
  
  before_action :confirm_logged_in
  before_action :find_note

  def index
    
  end

  def new
    @label = Label.new
  end


  def delete
    @label = Label.find(params[:id])
  end

  def show
    #include(n+1)
    @labels = @note.labels
  end

  def create
    @label = Label.where(label_params).first_or_initialize
    @labels = @note.labels
    if @label.save
      if @labels.include?(@label) == false
        @label.notes << @note 
        flash[:notice] = "label created successfully."
        redirect_to(:controller => 'note')
      else
        redirect_to(:controller => 'note')
      end
    else
      render('new')
    end
  end

  def destroy
    nl = NoteLabel.find_by(note_label_params).destroy
    flash[:notice] = "Label Deleted!"
    redirect_to(:controller => 'note', :action => 'index')
  end

  private

    def label_params
      params.require(:label).permit(:name)
    end

    def note_label_params
      params.require(:note_label).permit(:note_id, :label_id)
    end

    def find_note
      if params[:id]
        @note = Note.find(params[:id])
      end
    end

end
