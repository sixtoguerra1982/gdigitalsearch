class User < ApplicationRecord
    validates :email, presence: :true
    validates :edad, presence: :true
    validates :comentario, presence: :true
    validates :edad, numericality: { greater_than: 1, less_than: 100 }

    scope :find_valid, -> { where("edad < ?", 20) }


    before_save :set_full_name

    def set_full_name
        self.full_name = "#{ self.name } #{ self.last_name }"
    end

    def self.load
        require 'faker'
        20.times do |i|

            User.create(email: Faker::Internet.email,
                        edad: Random.rand(1..99),
                        comentario: Faker::ChuckNorris.fact )

        end
    end

end
