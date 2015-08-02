class Concert < ActiveRecord::Base
	has_many :comments
	validates :band, :venue, :city, :date, :description, presence: true
	validates :price, presence: true
	# , numericality: {greater_than: 0}

	def self.get_events_today
		where("date = ?", Date.today)
	end

	def self.get_concert id
		where("id = ?", id).first
	end

	def self.next_concerts
		where("date > ? and date < ?", DateTime.now, DateTime.now.end_of_month)
	end

end
