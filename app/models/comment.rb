class Comment < ActiveRecord::Base
	belongs_to :concert
	validates :comment, presence: true

	validates :concert, presence: true


end
