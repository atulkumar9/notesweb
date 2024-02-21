class Note < ActiveRecord::Base

	belongs_to :user
	has_many :note_labels
	has_many :labels,  :through => :note_labels
	scope :sorted_id, lambda { order("notes.id ASC") }
	scope :sorted_created_at, lambda { order("notes.created_at DESC") }
	scope :sorted_updated_at, lambda { order("notes.updated_at DESC") }

	def name
	end

end
