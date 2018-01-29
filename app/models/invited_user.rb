class InvitedUser < ApplicationRecord
  belongs_to :soc_network
  belongs_to :user
  enum :status => [:pending,:confirmed,:unconfirmed]
  validates :link,
            presence: {message: "Поле не должно быть пустым"},
            uniqueness: {scope: :link,message: "Такой юзер уже есть"},
            format: {with: /\A[^А-Яа-я]+\z/,message: "Допускаются только латинские буквы"}
    
end
