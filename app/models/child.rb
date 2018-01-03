class Child < ApplicationRecord
	
	belongs_to :user, required: false
	has_many :cards
	accepts_nested_attributes_for :cards

	validates :name, presence: true
	validates_length_of :name, :minimum => 1, :maximum => 15, :allow_blank => false


	def year_check
		self.cards.detect do |check|
			check.years != 0
		end
	end

	
	def latest_card
		if year_check
			oldest = self.cards.maximum("years")
			self.cards.find_by(years: (oldest))
		else 
			oldest = self.cards.maximum("months")
			self.cards.find_by(months: (oldest))
		end
	end

	def ordered
		
				self.cards.order("years ASC", "months ASC")
				
		end

	end

	

