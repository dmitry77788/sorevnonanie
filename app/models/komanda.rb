class Komanda < ApplicationRecord
	validates :name, 
						presence: true,           #Проверка на пустоту
						length: { maximum: 14 }  #На длину

	has_many :competition
end