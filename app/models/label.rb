class Label < ActiveRecord::Base

	has_many :note_labels
	has_many :notes, :through => :note_labels

	def del(obj)
		label.destroy
    	flash[:notice] = "Page Deleted!"
    	redirect_to(:controller => 'label', :action => 'show', :id => obj.id)
    end
	
end
