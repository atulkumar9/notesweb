class NoteLabel < ActiveRecord::Base

	belongs_to :note, :foreign_key => 'note_id'
	belongs_to :label, :foreign_key => 'label_id'
	
end
