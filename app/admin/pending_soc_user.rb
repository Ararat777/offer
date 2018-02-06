ActiveAdmin.register SocUserLink,as: "PendingSocUser" do
  menu label: proc{"Ожидающие подтверждения пользователи (#{SocUserLink.where(:status => "pending").size})"}
  batch_action :confirm do |ids|
    batch_action_collection.find(ids).each do |user|
      user.status = 1
      user.save
    end
    redirect_to collection_path, alert: "Статусы обновлены."
  end
  index do
    selectable_column
    id_column
    column :link
    column :status do
    end
    column :soc_network do |pending_user|
      pending_user.soc_network.title
    end
    column :user do |pending_user|
      link_to pending_user.user.username,admin_user_path(pending_user.user_id)
    end
    column :actions do |pending_user|
      link_to "Изменить",  edit_admin_soc_user_link_path(pending_user.id)
    end
  end
  controller do
    def scoped_collection
      super.where(:status => "pending")
    end
  end

end
