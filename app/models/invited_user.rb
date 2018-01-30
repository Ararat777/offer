class InvitedUser < ApplicationRecord
  belongs_to :soc_network
  belongs_to :user
  enum :status => [:pending,:confirmed,:unconfirmed]
  validates :link,
            presence: {message: "Поле не должно быть пустым"},
            format: {with: /\A[^А-Яа-я]+\z/,message: "Допускаются только латинские буквы"},
            format: {with: /\Ahttps\:\/\/www\.facebook\.com.+\z/,message: "Ссылка должна быть как в примере"}, if: :soc_network_is_fb?,
            uniqueness: {scope: :link,message: "Такой юзер уже есть"}
  
  def soc_network_is_fb?
    SocNetwork.find(soc_network_id).title == "Facebook"
  end
            
end
