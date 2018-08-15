class Competition < ApplicationRecord
	validates :date, presence: true #Проверка на пустотуу даты
	validates :komanda1_id, presence: true  
	validates :komanda2_id, presence: true     

	belongs_to :komanda1, class_name: 'Komanda', foreign_key: :komanda1_id
	belongs_to :komanda2, class_name: 'Komanda', foreign_key: :komanda2_id 
end