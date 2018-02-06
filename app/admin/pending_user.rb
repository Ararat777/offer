ActiveAdmin.register InvitedUser,as: "PendingUser" do
  batch_action :confirm do |ids|
    batch_action_collection.find(ids).each do |user|
      user.status = 1
      user.save
    end
    redirect_to collection_path, alert: "Статусы обновлены."
  end
  menu label: proc{"Приглашенные ожидающие подтверждения (#{InvitedUser.where(:status => "pending").size})"}
  actions :index
  index do
    selectable_column
    id_column
    column :link do |pending_user|
      if pending_user.soc_network.title == "Facebook"
        link_to pending_user.link,pending_user.link
      else
        pending_user.link
      end
    end
    column :status
    column :soc_network do |pending_user|
      pending_user.soc_network.title
    end
    column :user do |pending_user|
      link_to pending_user.user.username,admin_user_path(pending_user.user_id)
    end
    column :actions do |pending_user|
      link_to "Изменить",  edit_admin_invited_user_path(pending_user.id)
    end
  end
  controller do
    def scoped_collection
      super.where(:status => "pending")
    end
  end
end
