class Competition < ApplicationRecord
	validates :date, presence: true #Проверка на пустотуу даты
	validates :komanda1_id, presence: true  
	validates :komanda2_id, presence: true     

	has_many :komanda
end